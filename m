From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sun, 12 Oct 2014 11:19:08 +0200
Subject: [Buildroot] [PATCH] linux-headers: allow use of headers from kernel
	"package" selected
Message-ID: <1413105548-13590-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Karoly Kasza <kaszak@gmail.com>

This is a re-work of http://patchwork.ozlabs.org/patch/346823/

In buildroot kernel headers used for building toolchain come from upstream
kernel sources (even though user may specify version, but not origin).

This change makes it possible to use exactly the same sources for both
headers during toolchain building and for kernel building itself.

Moreover if "kernel" is selected to be built by defaut its sources will
be used for kernel headers on toolchain build.

That way user might be sure that ABI mismatch won't happen between toolchain
and kernel.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Karoly Kasza <kaszak@gmail.com>

Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/Config.in.host   | 8 ++++++++
 package/linux-headers/linux-headers.mk | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 101136a..64d4b9e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -5,6 +5,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
+	default BR2_KERNEL_HEADERS_SAME_AS_KERNEL if BR2_LINUX_KERNEL
 	default BR2_KERNEL_HEADERS_3_17
 	help
 	  Select the version of kernel header files you wish to use.
@@ -69,6 +70,13 @@ choice
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
+
+	config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
+		bool "Use Linux kernel specified for target"
+		depends on BR2_LINUX_KERNEL
+		help
+		  Use the Linux kernel specified for the target in
+		  the Kernel menu.
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index d770927..29a9b38 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,6 +7,12 @@
 # This package is used to provide Linux kernel headers for the
 # internal toolchain backend.
 
+ifeq ($(BR2_KERNEL_HEADERS_SAME_AS_KERNEL),y)
+LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_HEADERS_SOURCE = $(LINUX_SOURCE)
+LINUX_HEADERS_SITE = $(LINUX_SITE)
+LINUX_HEADERS_SITE_METHOD = $(LINUX_SITE_METHOD)
+else
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
@@ -14,6 +20,7 @@ else
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+endif
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
-- 
1.9.3
