From: Richard Braun <rbraun@sceen.net>
Date: Fri,  7 Dec 2012 10:46:44 +0100
Subject: [Buildroot] [PATCH] linux: add option to get sources from custom
	directory
Message-ID: <1354873604-4304-1-git-send-email-rbraun@sceen.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Richard Braun <rbraun@sceen.net>
---
 linux/Config.in |   15 +++++++++++++--
 linux/linux.mk  |    3 +++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ef3b2a1..cafbe59 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -46,6 +46,12 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  This option allows to specify the http or ftp location of a
 	  specific kernel source tarball
 
+config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
+	bool "Custom directory"
+	help
+	  This option allows to specify the path of a specific kernel
+	  source directory.
+
 config BR2_LINUX_KERNEL_CUSTOM_GIT
 	bool "Custom Git tree"
 	help
@@ -56,12 +62,16 @@ endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
-	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
+	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
+config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_PATH
+	string "Path of custom kernel sources"
+	depends on BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
+
 config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 	string "URL of custom Git repository"
 	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
@@ -78,7 +88,8 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.6.9" if BR2_LINUX_KERNEL_3_6
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
-	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
+	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION || \
+		BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
 
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..1898408 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -15,6 +15,9 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_PATH))
+LINUX_SITE_METHOD = local
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
-- 
1.7.2.5
