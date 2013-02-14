From: Rafal Fabich <rafal.fabich@gmail.com>
Date: Thu, 14 Feb 2013 10:14:13 +0100
Subject: [Buildroot] [PATCH v2] Added local directory as soure of kernel code
Message-ID: <1360833253-26809-1-git-send-email-rafal.fabich@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the option to use a local directory as the source for
building the Linux kernel, which can be useful during
kernel development.

Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>

---
Changes v1 -> v2 after comments from Arnout Vandecappelle
  - default setting of BR2_LINUX_KERNEL_VERSION changed to "custom"
  - removed ifeq ($(LINUX_VERSION),custom) condition from linux.mk for better consistency

---
 linux/Config.in |   13 +++++++++++++
 linux/linux.mk  |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 3c50acc..53e81ba 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -52,6 +52,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Git repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	bool "Local directory"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a local directory.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -74,6 +80,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	  Git revision to use in the format used by git rev-parse,
 	  E.G. a sha id, a tag, branch, ..
 
+config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
+	string "Path to the local directory"
+	depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
+	help
+	  Path to the local directory with the Linux kernel source code.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.7.6" if BR2_LINUX_KERNEL_3_7
@@ -81,6 +93,7 @@ config BR2_LINUX_KERNEL_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
+	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 91a9f50..494911b 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -8,10 +8,13 @@ LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
-ifeq ($(LINUX_VERSION),custom)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
+LINUX_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
 LINUX_SITE_METHOD = git
-- 
1.7.9.5
