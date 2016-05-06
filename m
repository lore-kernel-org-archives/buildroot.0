From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 May 2016 15:48:01 +0200
Subject: [Buildroot] [git commit] barebox: add an option to embed
	environment image
Message-ID: <20160506134823.86AC781F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f80735ce39165762f33e06d2a54c1d1db5206e12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Barebox provides an option to embed a custom environment image into
barebox binary. This image will be used, when the environment found in
the environment sector is invalid. Both embedded and external images
can be used together, so having both options at the same time is
justified.

This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH
to user specified path. This way one can use such BR's variables like
BR2_EXTERNAL, TOPDIR etc. to provide paths to custom environment
folders.

Cc: Pieter Smith <pieter@boesman.nl>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox-aux/Config.in | 17 +++++++++++++++++
 boot/barebox/barebox.mk            |  9 +++++++++
 boot/barebox/barebox/Config.in     | 17 +++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index 35aadc0..315e1a3 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -57,3 +57,20 @@ config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV_PATH
 	  the additions needed. The output will be an image in the
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
+
+config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	help
+	  If this option is not empty, it is the path to a custom
+	  embedded barebox environment. This image will be used when
+	  the environment found in the environment sector is
+	  invalid. This option sets the barebox Kconfig option
+	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This
+	  way it is possible to use Buildroot variables like
+	  BR2_EXTERNAL, TOPDIR etc. to refer to the custom
+	  environment.
+
+	  Depending on your setup, the custom embedded environment
+	  will probably be based on either the content of the
+	  defaultenv or defaultenv-2 directories in the barebox source
+	  code.
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
index bf13ea5..f5e3bae 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -63,3 +63,20 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 	  the additions needed. The output will be an image in the
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
+
+config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	help
+	  If this option is not empty, it is the path to a custom
+	  embedded barebox environment. This image will be used when
+	  the environment found in the environment sector is
+	  invalid. This option sets the barebox Kconfig option
+	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This
+	  way it is possible to use Buildroot variables like
+	  BR2_EXTERNAL, TOPDIR etc. to refer to the custom
+	  environment.
+
+	  Depending on your setup, the custom embedded environment
+	  will probably be based on either the content of the
+	  defaultenv or defaultenv-2 directories in the barebox source
+	  code.
