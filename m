From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 17 Feb 2016 09:42:53 +0100
Subject: [Buildroot] [PATCH v2] barebox: add an option to embed environment
	image
Message-ID: <1455698573-6480-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Barebox provides an option to embed a custom environment image into
barebox.bin. This image will be used, when the environment found in
the environment sector is invalid.

This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH to user
specified path. This way one can use BR's variables like BR2_EXTERNAL, TOPDIR
etc. to provide paths to custom environment folders.

Cc: Pieter Smith <pieter@boesman.nl>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: - remove qstrip
	    - add detailed patch description
	    - improve help texts

 boot/barebox/Config.in  | 19 +++++++++++++++++++
 boot/barebox/barebox.mk |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 39cb5d2..ae52b2a 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -121,4 +121,23 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
 
+config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
+	bool "Embed custom environment"
+	help
+	  Embed a custom environment image into barebox.bin. In order
+	  to use this option you need to enable CONFIG_DEFAULT_ENVIRONMENT
+	  and setup desired compression type for embedded images in barebox
+	  itself.
+
+config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
+	string "Embedded environment path"
+	depends on BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
+	help
+	  Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
+	  will be set to the path containing custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed.
+
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7715daf..49adba0 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -72,6 +72,12 @@ define BAREBOX_BUILD_BAREBOXENV_CMDS
 endef
 endif
 
+ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV),y)
+define BAREBOX_KCONFIG_FIXUP_CMDS
+	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,$(BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH),$(@D)/.config)
+endef
+endif
+
 ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
 BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
 	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
-- 
2.1.4
