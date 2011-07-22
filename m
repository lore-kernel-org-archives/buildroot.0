From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Jul 2011 09:08:36 +0200
Subject: [Buildroot] [git commit] kernel-headers: add 3.0
Message-ID: <20110722071021.B64A685758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d58aab892ec95b9a4bdb48a15440212cd7f23d77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in         |    6 +++++-
 toolchain/kernel-headers/kernel-headers.mk |    4 ++++
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 774810f..bc8a024 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_39
+	default BR2_KERNEL_HEADERS_3_0
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -30,6 +30,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_39
 		bool "Linux 2.6.39.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_0
+		bool "Linux 3.0.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -51,5 +54,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.3"	if BR2_KERNEL_HEADERS_2_6_39
+	default "3.0"		if BR2_KERNEL_HEADERS_3_0
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 079497a..ce70cab 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -26,7 +26,11 @@ SUBLEVEL:=$(if $(SUBLEVEL),.$(SUBLEVEL),)
 EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
 
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL)$(SUBLEVEL)$(EXTRAVERSION)
+ifeq ($(findstring x2.6.,x$(DEFAULT_KERNEL_HEADERS)),x2.6.)
 LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+else
+LINUX_HEADERS_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/v3.0/
+endif
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
-- 
1.7.3.4
