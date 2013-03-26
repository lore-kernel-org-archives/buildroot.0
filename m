From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 26 Mar 2013 19:42:43 +0100
Subject: [Buildroot] [PATCH 1 of 3] linux: add support for custom Mercurial
	repository
In-Reply-To: <patchbomb.1364323362@BEANTN0L019720>
References: <patchbomb.1364323362@BEANTN0L019720>
Message-ID: <695cb4c5c9467ce5e300.1364323363@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 linux/Config.in |  27 ++++++++++++++++++---------
 linux/linux.mk  |   5 ++++-
 2 files changed, 22 insertions(+), 10 deletions(-)

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
@@ -62,25 +68,28 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_L
 	string "URL of custom kernel tarball"
 	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
-config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
-	string "URL of custom Git repository"
-	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
 
-config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
-	string "Custom Git version"
-	default "HEAD"
-	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
+	string "URL of custom repository"
+
+config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	default "HEAD" if BR2_LINUX_KERNEL_CUSTOM_GIT
+	default "tip" if BR2_LINUX_KERNEL_CUSTOM_HG
 	help
-	  Git revision to use in the format used by git rev-parse,
+	  Revision to use in the typical format used by Git/Mercurial
 	  E.G. a sha id, a tag, branch, ..
 
+endif
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "3.8.3" if BR2_LINUX_KERNEL_3_8
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
@@ -13,8 +13,11 @@ LINUX_TARBALL = $(call qstrip,$(BR2_LINU
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
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
