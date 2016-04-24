From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 23:15:23 +0200
Subject: [Buildroot] [PATCH v6 1/3] barebox: prepare for auxiliarry build
In-Reply-To: <cover.1461531859.git.pieter@boesman.nl>
References: <cover.1461531859.git.pieter@boesman.nl>
Message-ID: <b6c4ffc91b5a5032205af39e2eaff3f536c7e266.1461531859.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional changes. In preparation for the auxiliary barebox build,
boot/barebox is split into two parts:
1. boot/barebox:
   - The source and patch specification which are to be shared between the
     barebox and barebox-aux packages.
   - The barebox-package function and build logic.
2. boot/barebox/barebox:
   - The package configuration, fragments, barebox env, etc.
   - The actual barebox package make instantiation.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in            | 67 +--------------------------------------
 boot/barebox/barebox.mk           |  3 +-
 boot/barebox/barebox/Config.in    | 65 +++++++++++++++++++++++++++++++++++++
 boot/barebox/barebox/barebox.hash |  1 +
 boot/barebox/barebox/barebox.mk   |  8 +++++
 5 files changed, 76 insertions(+), 68 deletions(-)
 create mode 100644 boot/barebox/barebox/Config.in
 create mode 120000 boot/barebox/barebox/barebox.hash
 create mode 100644 boot/barebox/barebox/barebox.mk

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 0729586..e25b14b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -64,71 +64,6 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
 
 endif
 
-
-choice
-	prompt "Barebox configuration"
-	default BR2_TARGET_BAREBOX_USE_DEFCONFIG
-
-config BR2_TARGET_BAREBOX_USE_DEFCONFIG
-	bool "Using a defconfig"
-
-config BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
-	bool "Using a custom config file"
-
-endchoice
-
-config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
-	string "board defconfig"
-	depends on BR2_TARGET_BAREBOX_USE_DEFCONFIG
-	help
-	  Name of the board for which Barebox should be built, without
-	  the _defconfig suffix.
-
-
-config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
-	string "Configuration file path"
-	depends on BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
-	help
-	  Path to the barebox configuration file
-
-config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
-	string "Additional configuration fragment files"
-	help
-	  A space-separated list of configuration fragment files,
-	  that will be merged to the main Barebox configuration file.
-
-config BR2_TARGET_BAREBOX_IMAGE_FILE
-	string "Image filename"
-	help
-	  Name of the generated barebox image, which will be copied to
-	  the images directory.
-
-	  If left empty, defaults to:
-	  - barebox.bin for barebox versions older than 2012.10.
-	  - barebox-flash-image for later versions.
-
-config BR2_TARGET_BAREBOX_BAREBOXENV
-	bool "bareboxenv tool in target"
-	help
-	  Install bareboxenv tool in target.
-
-config BR2_TARGET_BAREBOX_CUSTOM_ENV
-	bool "Generate an environment image"
-	help
-	  Generate a custom environment image. This environment will
-	  contain the variables and scripts to be used at boot by
-	  barebox.
-
-config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
-	string "Environment path"
-	depends on BR2_TARGET_BAREBOX_CUSTOM_ENV
-	help
-	  Path to the directory containing the custom barebox
-	  environment. Depending on your setup, it will probably be
-	  based on either the content of the defaultenv or
-	  defaultenv-2 directories in the barebox source code, plus
-	  the additions needed. The output will be an image in the
-	  barebox devfs format, stored in the images directory, with
-	  the same name as the directory name given here.
+source boot/barebox/barebox/Config.in
 
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index a5b1b1e..8b83bf2 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -142,5 +142,4 @@ endef
 
 barebox-package=$(call inner-barebox-package,$(call UPPERCASE,$(pkgname)))
 
-# instantiate this barebox package
-$(eval $(barebox-package))
+include boot/barebox/barebox/barebox.mk
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
new file mode 100644
index 0000000..bf13ea5
--- /dev/null
+++ b/boot/barebox/barebox/Config.in
@@ -0,0 +1,65 @@
+choice
+	prompt "Barebox configuration"
+	default BR2_TARGET_BAREBOX_USE_DEFCONFIG
+
+config BR2_TARGET_BAREBOX_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
+	string "board defconfig"
+	depends on BR2_TARGET_BAREBOX_USE_DEFCONFIG
+	help
+	  Name of the board for which Barebox should be built, without
+	  the _defconfig suffix.
+
+
+config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox configuration file
+
+config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main Barebox configuration file.
+
+config BR2_TARGET_BAREBOX_IMAGE_FILE
+	string "Image filename"
+	help
+	  Name of the generated barebox image, which will be copied to
+	  the images directory.
+
+	  If left empty, defaults to:
+	  - barebox.bin for barebox versions older than 2012.10.
+	  - barebox-flash-image for later versions.
+
+config BR2_TARGET_BAREBOX_BAREBOXENV
+	bool "bareboxenv tool in target"
+	help
+	  Install bareboxenv tool in target.
+
+config BR2_TARGET_BAREBOX_CUSTOM_ENV
+	bool "Generate an environment image"
+	help
+	  Generate a custom environment image. This environment will
+	  contain the variables and scripts to be used at boot by
+	  barebox.
+
+config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
+	string "Environment path"
+	depends on BR2_TARGET_BAREBOX_CUSTOM_ENV
+	help
+	  Path to the directory containing the custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed. The output will be an image in the
+	  barebox devfs format, stored in the images directory, with
+	  the same name as the directory name given here.
diff --git a/boot/barebox/barebox/barebox.hash b/boot/barebox/barebox/barebox.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox/barebox.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox/barebox.mk b/boot/barebox/barebox/barebox.mk
new file mode 100644
index 0000000..6a5a80d
--- /dev/null
+++ b/boot/barebox/barebox/barebox.mk
@@ -0,0 +1,8 @@
+################################################################################
+#
+# barebox
+#
+################################################################################
+
+# Instantiate the barebox package
+$(eval $(barebox-package))
-- 
2.5.0
