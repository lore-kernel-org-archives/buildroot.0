From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 19 Jul 2013 13:27:13 +0200
Subject: [Buildroot] [PATCH 2 of 3] u-boot: add support for custom Mercurial
	repository
In-Reply-To: <patchbomb.1374233231@BEANTN0L019720>
References: <patchbomb.1374233231@BEANTN0L019720>
Message-ID: <21dda5e59e1c88ea78ef.1374233233@BEANTN0L019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 boot/uboot/Config.in |  15 +++++++++------
 boot/uboot/uboot.mk  |   5 ++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

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
@@ -49,7 +52,7 @@ config BR2_TARGET_UBOOT_VERSION
 	default "2013.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
+	default $BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
@@ -60,13 +63,13 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
-if BR2_TARGET_UBOOT_CUSTOM_GIT
+if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
-config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
-	string "URL of custom Git repository"
+config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
+	string "URL of custom repository"
 
-config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
-	string "Custom Git version"
+config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
+	string "Custom repository version"
 
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
