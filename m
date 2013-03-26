From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 26 Mar 2013 19:42:44 +0100
Subject: [Buildroot] [PATCH 2 of 3] u-boot: add support for custom Mercurial
	repository
In-Reply-To: <patchbomb.1364323362@BEANTN0L019720>
References: <patchbomb.1364323362@BEANTN0L019720>
Message-ID: <2e2724d8bb39d79b2a4e.1364323364@BEANTN0L019720>
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
@@ -47,6 +47,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 config BR2_TARGET_UBOOT_CUSTOM_GIT
 	bool "Custom Git repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_HG
+	bool "Custom Mercurial repository"
+
 endchoice
 
 if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -66,7 +69,7 @@ config BR2_TARGET_UBOOT_VERSION
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
+	default $BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
@@ -77,13 +80,13 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
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
@@ -17,8 +17,11 @@ UBOOT_TARBALL = $(call qstrip,$(BR2_TARG
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
