From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  4 May 2016 13:14:59 +0200
Subject: [Buildroot] [PATCH v3] barebox: add an option to embed environment
	image
Message-ID: <1462360499-29955-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Barebox provides an option to embed a custom environment image into
barebox binary. This image will be used, when the environment found
in the environment sector is invalid.

This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH
to user specified path. This way one can use such BR's variables like
BR2_EXTERNAL, TOPDIR etc. to provide paths to custom environment folders.

Cc: Pieter Smith <pieter@boesman.nl>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v3: fix setting boolean option (Arnout Vandecappelle)
	    simplify config by just checking, if path was set (Arnout Vandecappelle)
	    use qstrip for path variable (Arnout Vandecappelle)

	v2: set CONFIG_DEFAULT_ENVIRONMENT too, to enable default env at all
 boot/barebox/barebox-aux/Config.in | 14 ++++++++++++++
 boot/barebox/barebox.mk            |  7 +++++++
 boot/barebox/barebox/Config.in     | 14 ++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index 35aadc0..e381d10 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -57,3 +57,17 @@ config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV_PATH
 	  the additions needed. The output will be an image in the
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
+
+config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	help
+	  Embed a custom environment image into barebox binary. If this
+	  path is provided both barebox internal CONFIG_DEFAULT_ENVIRONMENT
+	  and CONFIG_DEFAULT_ENVIRONMENT_PATH will be configured.
+
+	  Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
+	  will be set to the path containing custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed.
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 949fb9f..6ed072f 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -96,6 +96,13 @@ define $(1)_INSTALL_CUSTOM_ENV
 endef
 endif
 
+ifneq ($$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH)),)
+define $(1)_KCONFIG_FIXUP_CMDS
+	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT,$$(@D)/.config)
+	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))",$$(@D)/.config)
+endef
+endif
+
 define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_BAREBOXENV_CMDS)
 	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index bf13ea5..a95b123 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -63,3 +63,17 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 	  the additions needed. The output will be an image in the
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
+
+config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	help
+	  Embed a custom environment image into barebox binary. If this
+	  path is provided both barebox internal CONFIG_DEFAULT_ENVIRONMENT
+	  and CONFIG_DEFAULT_ENVIRONMENT_PATH will be configured.
+
+	  Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
+	  will be set to the path containing custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed.
-- 
2.8.1
