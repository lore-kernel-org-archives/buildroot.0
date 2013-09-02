From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 02 Sep 2013 22:07:56 +0200
Subject: [Buildroot] [PATCH 7 of 9 v4] linux/uboot: line-up
 repository-related configuration options
In-Reply-To: <patchbomb.1378152469@argentina>
References: <patchbomb.1378152469@argentina>
Message-ID: <c84935cb9450d64acb6a.1378152476@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although the configuration options for custom repository locations and
versions are very similar between the linux and uboot packages, there are
some minor differences. This patch lines up both packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: no changes
v3: update after changes in previous patches
v2:
- remove 'HEAD/tip' defaults for repository version (comment Peter)
- replace if/config/endif with config/depends for uboot tarball
- move repo url/version settings before unrelated 'custom patch dir'

Note: one remaining difference is that there are help texts in linux for
options BR2_LINUX_KERNEL_CUSTOM_GIT and BR2_LINUX_KERNEL_CUSTOM_HG. I
didn't add them to uboot because it seems a bit redundant, but if you
prefer we can line this up as well (either add help texts to uboot or
remove them from linux).

 boot/uboot/Config.in |  32 ++++++++++++++++----------------
 linux/Config.in      |   2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -40,10 +40,24 @@ config BR2_TARGET_UBOOT_CUSTOM_VERSION_V
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
