From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 24 Jul 2013 09:23:00 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
	Mercurial repository
In-Reply-To: <patchbomb.1374650577@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
Message-ID: <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: add Config.in.legacy entries (comment Peter)

 Config.in.legacy |  18 ++++++++++++++++++
 linux/Config.in  |  24 ++++++++++++++++--------
 linux/linux.mk   |   5 ++++-
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -59,6 +59,24 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2013.08"
 
+config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP
+	bool "linux: the git repository URL option has been renamed"
+	default y if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
+	select BR2_LEGACY
+	help
+	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL has
+	  been renamed to
+	  BR2_LINUX_KERNEL_CUSTOM_REPO_URL.
+
+config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION_WRAP
+	bool "linux: the git repository version option has been renamed"
+	default y if BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION != ""
+	select BR2_LEGACY
+	help
+	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION has
+	  been renamed to
+	  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION.
+
 config BR2_PACKAGE_DOSFSTOOLS_DOSFSCK
 	bool "dosfstools dosfsck renamed to fsck.fat"
 	select BR2_LEGACY
diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -52,6 +52,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Git repository.
 
+config BR2_LINUX_KERNEL_CUSTOM_HG
+	bool "Custom Mercurial repository"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a Mercurial repository.
+
 endchoice
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
@@ -62,24 +68,26 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_L
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
-config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
-	string "URL of custom Git repository"
-	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
 
-config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
-	string "Custom Git version"
-	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
+	string "Custom repository version"
 	help
-	  Git revision to use in the format used by git rev-parse,
+	  Revision to use in the typical format used by Git/Mercurial
 	  E.G. a sha id, a tag, branch, ..
 
+endif
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.10.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
+	default $BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION if BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_GIT
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -14,8 +14,11 @@ LINUX_TARBALL = $(call qstrip,$(BR2_LINU
 LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
-LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = git
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
+LINUX_SITE_METHOD = hg
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
