From: Karoly Kasza <kaszak@gmail.com>
Date: Wed,  7 May 2014 23:16:35 +0200
Subject: [Buildroot] [PATCH 1/1] BR2_KERNEL_HEADERS_SAME_AS_KERNEL
Message-ID: <1399497395-20994-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Allows the usage of the custom target kernel as headers for
 the internal toolchain.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---

Originally by Magnus Edenhill & Thomas Petazzoni.

 package/linux-headers/Config.in.host   |   10 +++++++++-
 package/linux-headers/linux-headers.mk |    7 +++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 177f0c2..7e711b8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -58,6 +58,14 @@ choice
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Manually specified Linux version"
+
+	config BR2_KERNEL_HEADERS_SAME_AS_KERNEL
+		bool "Use Linux kernel specified for target"
+		depends on BR2_LINUX_KERNEL
+		help
+		  Use the Linux kernel specified for the target in
+		  the Kernel menu.
+
 endchoice
 
 config BR2_DEFAULT_KERNEL_VERSION
@@ -69,7 +77,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 choice
 	bool "Custom kernel headers series"
-	depends on BR2_KERNEL_HEADERS_VERSION
+	depends on BR2_KERNEL_HEADERS_VERSION || BR2_KERNEL_HEADERS_SAME_AS_KERNEL
 	default BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
 	help
 	  Set to the kernel headers series you manually set above.
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 7b3edf4..f63632c 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -7,6 +7,12 @@
 # This package is used to provide Linux kernel headers for the
 # internal toolchain backend.
 
+ifeq ($(BR2_KERNEL_HEADERS_SAME_AS_KERNEL),y)
+LINUX_HEADERS_VERSION = $(BR2_LINUX_KERNEL_VERSION)
+LINUX_HEADERS_SOURCE = $(LINUX_SOURCE)
+LINUX_HEADERS_SITE = $(LINUX_SITE)
+LINUX_HEADERS_SITE_METHOD = $(LINUX_SITE_METHOD)
+else
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))
 ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
@@ -14,6 +20,7 @@ else
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+endif
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
-- 
1.7.10.4
