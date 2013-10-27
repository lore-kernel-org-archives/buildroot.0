From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 08:09:01 +0100
Subject: [Buildroot] [git commit] linux/uboot: line-up repository-related
	configuration options
Message-ID: <20131027072650.D99F29BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bff614528a189db82e6388604328c3dfdf4a62c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although the configuration options for custom repository locations and
versions are very similar between the linux and uboot packages, there are
some minor differences. This patch lines up both packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/Config.in |   32 ++++++++++++++++----------------
 linux/Config.in      |    2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8e71886..af9ccab 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -40,10 +40,24 @@ config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
 	string "U-Boot version"
 	depends on BR2_TARGET_UBOOT_CUSTOM_VERSION
 
-if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
 	string "URL of custom U-Boot tarball"
+	depends on BR2_TARGET_UBOOT_CUSTOM_TARBALL
+
+if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
+
+config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
+	string "URL of custom repository"
+	default BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL \
+		if BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL != ""  # legacy
+
+config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
+	string "Custom repository version"
+	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION \
+		if BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION != ""  # legacy
+	help
+	  Revision to use in the typical format used by Git/Mercurial
+	  E.G. a sha id, a tag, branch, ..
 
 endif
 
@@ -65,20 +79,6 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
 
 	  Most users may leave this empty
 
-if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
-
-config BR2_TARGET_UBOOT_CUSTOM_REPO_URL
-	string "URL of custom repository"
-	default BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL \
-		if BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL != ""  # legacy
-
-config BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION
-	string "Custom repository version"
-	default BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION \
-		if BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION != ""  # legacy
-
-endif
-
 choice
 	prompt "U-Boot binary format"
 	default BR2_TARGET_UBOOT_FORMAT_BIN
diff --git a/linux/Config.in b/linux/Config.in
index a12102a..32426a3 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -47,7 +47,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	  specific kernel source tarball
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT
-	bool "Custom Git tree"
+	bool "Custom Git repository"
 	help
 	  This option allows Buildroot to get the Linux kernel source
 	  code from a Git repository.
