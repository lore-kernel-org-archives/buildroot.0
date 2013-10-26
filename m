From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 01:51:09 +0200
Subject: [Buildroot] [git commit] linux: add support for custom Mercurial
	repository
Message-ID: <20131027072650.CA82D9BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63ecded2e383b2bb7569e70f311580095b166e29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy |   30 ++++++++++++++++++++++++++++++
 linux/Config.in  |   32 +++++++++++++++++++++++---------
 linux/linux.mk   |    5 ++++-
 3 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6cdd4e3..82b9579 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -109,6 +109,36 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 	  The 'module-init-tools' package has been removed, since it
 	  has been depracated upstream and replaced by 'kmod'.
 
+config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
+	string "linux: the git repository URL option has been renamed"
+	help
+	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL has
+	  been renamed to
+	  BR2_LINUX_KERNEL_CUSTOM_REPO_URL.
+
+config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP
+	bool
+	default y if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
+	select BR2_LEGACY
+
+# Note: BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL is still referenced from
+# linux/Config.in
+
+config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
+	string "linux: the git repository version option has been renamed"
+	help
+	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION has
+	  been renamed to
+	  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION.
+
+config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION_WRAP
+	bool
+	default y if BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION != ""
+	select BR2_LEGACY
+
+# Note: BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION is still referenced from
+# linux/Config.in
+
 ###############################################################################
 comment "Legacy options removed in 2013.08"
 
diff --git a/linux/Config.in b/linux/Config.in
index 52291d8..a12102a 100644
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
@@ -62,24 +68,32 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
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
+	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL \
+		if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""  # legacy
+
+config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	default BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION \
+		if BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION != ""  # legacy
 	help
-	  Git revision to use in the format used by git rev-parse,
+	  Revision to use in the typical format used by Git/Mercurial
 	  E.G. a sha id, a tag, branch, ..
 
+endif
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.11.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
-	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
+	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
+		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-	default BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
+	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
+		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
 
 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index 901ce25..29a3fd3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -14,8 +14,11 @@ LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
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
