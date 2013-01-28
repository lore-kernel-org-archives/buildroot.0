From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:15:53 +0100
Subject: [Buildroot] [git commit] barebox: Allow to build an environment
	image
Message-ID: <20130128221548.B30EA9A7FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18b04970a2c0bf9db72d7c052d1fe4252d94267b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Tweaked help text]
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in  |   19 +++++++++++++++++++
 boot/barebox/barebox.mk |   14 ++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index b9e03b3..1ffe596 100644
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
+	  Path to the directory containing the custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed. The output will be an image in the
+	  barebox devfs format, stored in the images directory, with
+	  the same name as the directory name given here.
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
