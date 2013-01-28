From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 28 Jan 2013 21:10:34 +0100
Subject: [Buildroot] [PATCHv2] barebox: Allow to build an environment image
Message-ID: <1359403834-1052-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 boot/barebox/Config.in  |   19 +++++++++++++++++++
 boot/barebox/barebox.mk |   14 ++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index b9e03b3..49d6c2b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -99,4 +99,23 @@ config BR2_TARGET_BAREBOX_BAREBOXENV
 	help
 	  Install bareboxenv tool in target.
 
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
+	  Path to the folder containing the custom barebox
+	  environment. Depending on your setup, it will probably be
+	  either the content of the defaultenv or defaultenv-2 folders
+	  in the barebox source code plus the additions needed. The
+	  output will be an image at the barebox devfs format, stored
+	  in the images directory, with the same name than the folder
+	  given here.
+
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 143338e..5ec47f6 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -67,9 +67,22 @@ define BAREBOX_BUILD_BAREBOXENV_CMDS
 endef
 endif
 
+ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
+BAREBOX_ENV_NAME = $(notdir $(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
+define BAREBOX_BUILD_CUSTOM_ENV
+	$(@D)/scripts/bareboxenv -s \
+		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
+		$(@D)/$(BAREBOX_ENV_NAME)
+endef
+define BAREBOX_INSTALL_CUSTOM_ENV
+	cp $(@D)/$(BAREBOX_ENV_NAME) $(BINARIES_DIR)
+endef
+endif
+
 define BAREBOX_BUILD_CMDS
 	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
 	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
+	$(BAREBOX_BUILD_CUSTOM_ENV)
 endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
@@ -78,6 +91,7 @@ define BAREBOX_INSTALL_IMAGES_CMDS
 	else \
 		cp $(@D)/barebox.bin $(BINARIES_DIR);\
 	fi
+	$(BAREBOX_INSTALL_CUSTOM_ENV)
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-- 
1.7.10.4
