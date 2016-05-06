From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  6 May 2016 07:46:04 +0200
Subject: [Buildroot] [PATCH v4] barebox: add an option to embed environment
	image
Message-ID: <1462513564-11289-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Barebox provides an option to embed a custom environment image into
barebox binary. This image will be used, when the environment found
in the environment sector is invalid. Both embedded and external
images can be used together, so having both options at the same
time is justified.

This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH
to user specified path. This way one can use such BR's variables like
BR2_EXTERNAL, TOPDIR etc. to provide paths to custom environment folders.

Cc: Pieter Smith <pieter@boesman.nl>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v4: reword help text (Arnout Vandecappelle)
	    add auxiliary variable holding env path (Arnout Vandecappelle)
	    add notion about having both env images in parallel to commit message (Thomas Petazzoni)

	v3: fix setting boolean option (Arnout Vandecappelle)
	    simplify config by just checking, if path was set (Arnout Vandecappelle)
	    use qstrip for path variable (Arnout Vandecappelle)

	v2: set CONFIG_DEFAULT_ENVIRONMENT too, to enable default env at all

 boot/barebox/barebox-aux/Config.in | 15 +++++++++++++++
 boot/barebox/barebox.mk            |  9 +++++++++
 boot/barebox/barebox/Config.in     | 15 +++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index 35aadc0..dfbe226 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -57,3 +57,18 @@ config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV_PATH
 	  the additions needed. The output will be an image in the
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
+
+config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	help
+	  If this option is not empty, it is the path to a custom
+	  embedded barebox environment. This image will be used when the
+	  environment found in the environment sector is invalid. This
+	  option sets the barebox Kconfig option
+	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This way
+	  it is possible to use Buildroot variables like BR2_EXTERNAL,
+	  TOPDIR etc. to refer to the custom environment.
+
+	  Depending on your setup, the custom embedded environment will
+	  probably be based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code.
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 949fb9f..832297e 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -39,6 +39,8 @@ $(1)_DEPENDENCIES = host-lzop
 $(1)_LICENSE = GPLv2 with exceptions
 $(1)_LICENSE_FILES = COPYING
 
+$(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))
+
 ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define $(1)_APPLY_CUSTOM_PATCHES
 	$$(APPLY_PATCHES) $$(@D) \
@@ -96,6 +98,13 @@ define $(1)_INSTALL_CUSTOM_ENV
 endef
 endif
 
+ifneq ($$($(1)_CUSTOM_EMBEDDED_ENV_PATH),)
+define $(1)_KCONFIG_FIXUP_CMDS
+	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT,$$(@D)/.config)
+	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$($(1)_CUSTOM_EMBEDDED_ENV_PATH)",$$(@D)/.config)
+endef
+endif
+
 define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_BAREBOXENV_CMDS)
 	$$(TARGET_MAKE_ENV) $$(MAKE) $$($(1)_MAKE_FLAGS) -C $$(@D)
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index bf13ea5..2acc696 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -63,3 +63,18 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 	  the additions needed. The output will be an image in the
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
+
+config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	help
+	  If this option is not empty, it is the path to a custom
+	  embedded barebox environment. This image will be used when the
+	  environment found in the environment sector is invalid. This
+	  option sets the barebox Kconfig option
+	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This way
+	  it is possible to use Buildroot variables like BR2_EXTERNAL,
+	  TOPDIR etc. to refer to the custom environment.
+
+	  Depending on your setup, the custom embedded environment will
+	  probably be based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code.
-- 
2.8.1
