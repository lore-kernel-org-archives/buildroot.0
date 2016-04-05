From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 22:27:17 +0200
Subject: [Buildroot] [git commit] boot/uboot: Add custom Subversion
	repository support for the package
Message-ID: <20160405203417.7B99F81D67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a807b4a893db66862b00c4ea3d9992af02a76e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pauli Sundberg <susundberg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in | 9 ++++++---
 boot/uboot/uboot.mk  | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a6b9f17..4613dd3 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -54,6 +54,9 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
 config BR2_TARGET_UBOOT_CUSTOM_HG
 	bool "Custom Mercurial repository"
 
+config BR2_TARGET_UBOOT_CUSTOM_SVN
+	bool "Custom Subversion repository"
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
index 3c96259..48f40c3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -24,6 +24,9 @@ UBOOT_SITE_METHOD = git
 else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_HG),y)
 UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
 UBOOT_SITE_METHOD = hg
+else ifeq ($(BR2_TARGET_UBOOT_CUSTOM_SVN),y)
+UBOOT_SITE = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL))
+UBOOT_SITE_METHOD = svn
 else
 # Handle stable official U-Boot versions
 UBOOT_SITE = ftp://ftp.denx.de/pub/u-boot
