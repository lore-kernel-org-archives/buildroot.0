From: Pauli Sundberg <susundberg@gmail.com>
Date: Thu, 17 Mar 2016 19:07:51 +0200
Subject: [Buildroot] [PATCH v2 1/2] Add SVN repository support for u-boot
In-Reply-To: <1458234472-4741-1-git-send-email-susundberg@gmail.com>
References: <87oaaif6zv.fsf@dell.be.48ers.dk>
 <1458234472-4741-1-git-send-email-susundberg@gmail.com>
Message-ID: <1458234472-4741-2-git-send-email-susundberg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 boot/uboot/Config.in | 9 ++++++---
 boot/uboot/uboot.mk  | 4 +++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0e79734..5800060 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -51,6 +51,9 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 config BR2_TARGET_UBOOT_CUSTOM_GIT
 	bool "Custom Git repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_SVN
+	bool "Custom SVN repository"
+
 config BR2_TARGET_UBOOT_CUSTOM_HG
 	bool "Custom Mercurial repository"
 
@@ -64,7 +67,7 @@ config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 	string "URL of custom U-Boot tarball"
 	depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
-if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
 
 config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
 	string "URL of custom repository"
@@ -76,7 +79,7 @@ config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION != ""  # legacy
 	help
-	  Revision to use in the typical format used by Git/Mercurial
+	  Revision to use in the typical format used by Git/Mercurial/Svn
 	  E.G. a sha id, a tag, branch, ..
 
 endif
@@ -88,7 +91,7 @@ config BR2_TARGET_UBOOT_VERSION
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
-		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
 
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f9a3ff8..e82135c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -3,7 +3,6 @@
 # uboot
 #
 ################################################################################
-
 UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
@@ -24,6 +23,9 @@ UBOOT_SITE_METHOD = git
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
-- 
1.9.1
