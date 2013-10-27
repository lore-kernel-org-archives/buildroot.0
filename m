From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 08:08:47 +0100
Subject: [Buildroot] [git commit] u-boot: add support for custom Mercurial
	repository
Message-ID: <20131027072650.D29FF9BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2c2193b0571c2f15a430edf5c179b20914d0a95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy     |   28 ++++++++++++++++++++++++++++
 boot/uboot/Config.in |   23 ++++++++++++++++-------
 boot/uboot/uboot.mk  |    5 ++++-
 3 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 82b9579..588cd8b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -109,6 +109,34 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 	  The 'module-init-tools' package has been removed, since it
 	  has been depracated upstream and replaced by 'kmod'.
 
+config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
+	string "u-boot: the git repository URL option has been renamed"
+	help
+	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL has
+	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_URL.
+
+config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL is still referenced from
+# boot/uboot/Config.in
+
+config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
+	string "u-boot: the git repository version option has been renamed"
+	help
+	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION has
+	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION.
+
+config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION != ""
+	select BR2_LEGACY
+
+# Note: BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION is still referenced from
+# boot/uboot/Config.in
+
 config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 	string "linux: the git repository URL option has been renamed"
 	help
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 88c076d..8e71886 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -31,6 +31,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 config BR2_TARGET_UBOOT_CUSTOM_GIT
 	bool "Custom Git repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_HG
+	bool "Custom Mercurial repository"
+
 endchoice
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
@@ -47,9 +50,11 @@ endif
 config BR2_TARGET_UBOOT_VERSION
 	string
 	default "2013.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
-	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
+	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
+		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
+	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
+		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
@@ -60,13 +65,17 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
-if BR2_TARGET_UBOOT_CUSTOM_GIT
+if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
-config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
-	string "URL of custom Git repository"
+config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
+	string "URL of custom repository"
+	default BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL \
+		if BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL != ""  # legacy
 
-config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
-	string "Custom Git version"
+config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION \
+		if BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION != ""  # legacy
 
 endif
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dc8e26f..06b75ed 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -18,8 +18,11 @@ UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE    = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
 UBOOT_SOURCE  = $(notdir $(UBOOT_TARBALL))
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
-UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL))
+UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = git
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
+UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE_METHOD = hg
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
