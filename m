From: Pauli Sundberg <susundberg@gmail.com>
Date: Sun, 27 Mar 2016 20:30:16 +0300
Subject: [Buildroot] [PATCH V3 1/2] Add custom Subversion repository support
	for package uboot
In-Reply-To: <87mvpmdx0i.fsf@dell.be.48ers.dk>
References: <87mvpmdx0i.fsf@dell.be.48ers.dk>
Message-ID: <1459099817-4614-1-git-send-email-susundberg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
---
 boot/uboot/Config.in | 9 ++++++---
 boot/uboot/uboot.mk  | 4 +++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a6b9f17..de6f7aa 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -54,6 +54,9 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
 config BR2_TARGET_UBOOT_CUSTOM_HG
 	bool "Custom Mercurial repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_SVN
+        bool "Custom Subversion repository"
+        
 endchoice
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
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
+	  Revision to use in the typical format used by Git/Mercurial/Subversion
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
index 3c96259..ae98c72 100644
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
