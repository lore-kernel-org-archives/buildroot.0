From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Oct 2011 17:49:13 +0200
Subject: [Buildroot] [git commit] linux: bump default kernel to version 3.1
Message-ID: <20111024205040.427678EC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80d7b68167a5c8893e906ace6b5f0b0166336406
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump default kernel vesion to 3.1 to match headers.
Also implement downloads for 3.x series kernels.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   10 +++++-----
 linux/linux.mk  |    8 +++++---
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5655286..774aaf8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -19,10 +19,10 @@ if BR2_LINUX_KERNEL
 #
 choice
 	prompt "Kernel version"
-	default BR2_LINUX_KERNEL_2_6_39
+	default BR2_LINUX_KERNEL_3_1
 
-config BR2_LINUX_KERNEL_2_6_39
-	bool "2.6.39.4"
+config BR2_LINUX_KERNEL_3_1
+	bool "3.1"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -58,7 +58,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.39.4"
+	default "3.1"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
@@ -74,7 +74,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.39.4" if BR2_LINUX_KERNEL_2_6_39
+	default "3.1" if BR2_LINUX_KERNEL_3_1
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.mk b/linux/linux.mk
index 99f4649..6b6fd5c 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -18,9 +18,11 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
 # to use the $(word) function. We support versions such as 3.1,
 # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
-LINUX_VERSION_MAJOR = $(word 1,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
-LINUX_VERSION_MINOR = $(word 2,$(subst ., ,$(subst -, ,$(LINUX_VERSION))))
-LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(LINUX_VERSION_MAJOR).$(LINUX_VERSION_MINOR)/
+ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
+else
+LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
+endif
 # release candidates are in testing/ subdir
 ifneq ($(findstring -rc,$(LINUX_VERSION)),)
 LINUX_SITE := $(LINUX_SITE)testing/
