From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 02 Sep 2013 22:07:55 +0200
Subject: [Buildroot] [PATCH 6 of 9 v4] u-boot: add support for custom
	Mercurial repository
In-Reply-To: <patchbomb.1378152469@argentina>
References: <patchbomb.1378152469@argentina>
Message-ID: <cc484ef5946f1b9b0d18.1378152475@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: no changes
v3:
    - add automatic propagation of old->new values
    - fix legacy entries
v2: add Config.in.legacy entries (comment Peter)

 Config.in.legacy     |  30 ++++++++++++++++++++++++++++++
 boot/uboot/Config.in |  23 ++++++++++++++++-------
 boot/uboot/uboot.mk  |   5 ++++-
 3 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,36 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2013.11"
 
+config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
+	string "u-boot: the git repository URL option has been renamed"
+	help
+	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL has
+	  been renamed to
+	  BR2_TARGET_UBOOT_CUSTOM_REPO_URL.
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
+	  been renamed to
+	  BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION.
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
 	default "2013.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
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
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -18,8 +18,11 @@ UBOOT_TARBALL = $(call qstrip,$(BR2_TARG
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
