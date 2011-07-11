From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 23:46:22 +0200
Subject: [Buildroot] [git commit] u-boot: allow specification of custom Git
	repo as source
Message-ID: <20110711214653.5A70B8A482@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=29679495b8f247171a741f11c666cbb2ae254cd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |   14 ++++++++++++++
 boot/uboot/uboot.mk  |    3 +++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index aada346..dbd4f34 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -34,6 +34,9 @@ config BR2_TARGET_UBOOT_2010_03
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
+config BR2_TARGET_UBOOT_CUSTOM_GIT
+	bool "Custom Git repository"
+
 endchoice
 
 if BR2_TARGET_UBOOT_CUSTOM_TARBALL
@@ -51,6 +54,7 @@ config BR2_TARGET_UBOOT_VERSION
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
+	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 	string "custom patch dir"
@@ -61,6 +65,16 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
+if BR2_TARGET_UBOOT_CUSTOM_GIT
+
+config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
+	string "URL of custom Git repository"
+
+config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
+	string "Custom Git version"
+
+endif
+
 choice
 	prompt "U-Boot binary format"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dfa012a..e87727b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -13,6 +13,9 @@ ifeq ($(UBOOT_VERSION),custom)
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE    = $(dir $(UBOOT_TARBALL))
 UBOOT_SOURCE  = $(notdir $(UBOOT_TARBALL))
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_GIT),y)
+UBOOT_SITE        = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL))
+UBOOT_SITE_METHOD = git
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE    = ftp://ftp.denx.de/pub/u-boot
-- 
1.7.3.4
