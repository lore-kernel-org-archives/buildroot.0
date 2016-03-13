From: Pauli Sundberg <susundberg@gmail.com>
Date: Sun, 13 Mar 2016 20:15:05 +0200
Subject: [Buildroot] [PATCH 1/1] Add SVN support for kernel and u-boot
Message-ID: <CAGC_hNkOAuAHUSMy-KdNpYv65kpfKUGPd1ybsocNe=4iJNMnuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
---
 boot/uboot/Config.in |  7 +++++--
 boot/uboot/uboot.mk  |  4 +++-
 linux/Config.in      | 11 +++++++++--
 linux/linux.mk       |  3 +++
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4a6dc56..888ee38 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -51,6 +51,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 config BR2_TARGET_UBOOT_CUSTOM_GIT
     bool "Custom Git repository"

+config BR2_TARGET_UBOOT_CUSTOM_SVN
+    bool "Custom SVN repository"
+
 config BR2_TARGET_UBOOT_CUSTOM_HG
     bool "Custom Mercurial repository"

@@ -64,7 +67,7 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
     string "URL of custom U-Boot tarball"
     depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL

-if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG ||
BR2_TARGET_UBOOT_CUSTOM_SVN

 config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
     string "URL of custom repository"
@@ -88,7 +91,7 @@ config BR2_TARGET_UBOOT_VERSION
         if BR2_TARGET_UBOOT_CUSTOM_VERSION
     default "custom"    if BR2_TARGET_UBOOT_CUSTOM_TARBALL
     default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
-        if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+        if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
|| BR2_TARGET_UBOOT_CUSTOM_SVN

 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
     string "custom patch dir"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d539b31..b22db1c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -3,7 +3,6 @@
 # uboot
 #
 ################################################################################
-
 UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))

@@ -21,6 +20,9 @@ BR_NO_CHECK_HASH_FOR += $(UBOOT_SOURCE)
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE_METHOD = svn
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
diff --git a/linux/Config.in b/linux/Config.in
index 6dfc9fe..3cd3c70 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -69,8 +69,15 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL
       This option allows Buildroot to get the Linux kernel source
       code from a local directory.

+config BR2_LINUX_KERNEL_CUSTOM_SVN
+    bool "Custom SVN repository"
+    help
+      This option allows Buildroot to get the Linux kernel source
+      code from a SVN repository.
+
 endchoice

+
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
     string "Kernel version"
     depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
@@ -79,7 +86,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
     string "URL of custom kernel tarball"
     depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL

-if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG ||
BR2_LINUX_KERNEL_CUSTOM_SVN

 config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
     string "URL of custom repository"
@@ -109,7 +116,7 @@ config BR2_LINUX_KERNEL_VERSION
         if BR2_LINUX_KERNEL_CUSTOM_VERSION
     default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
     default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
-        if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+        if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
|| BR2_LINUX_KERNEL_CUSTOM_SVN
     default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL

 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 7e20255..1479903 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -20,6 +20,9 @@ LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_SITE_METHOD = svn
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = hg
-- 
1.9.1
