From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 11:18:43 +0200
Subject: [Buildroot] [PATCH v5 1/5] barebox: support multi-image-build image
	selection
In-Reply-To: <cover.1461489060.git.pieter@boesman.nl>
References: <cover.1461489060.git.pieter@boesman.nl>
Message-ID: <29de37c67b83a26113d4fc7dab6e32832d329df3.1461489060.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support optional selection of the built image filename in a multi-image barebox
build. This makes it possible to specify which image to pick in a multi-image
barebox config such as the am335x_defconfig.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in  | 10 ++++++++++
 boot/barebox/barebox.mk |  6 +++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index a2d800e..db538b3 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -97,6 +97,16 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main Barebox configuration file.
 
+config BR2_TARGET_BAREBOX_IMAGE_FILE
+	string "Barebox image filename"
+	default ""
+	help
+	  Name of the built barebox image filename
+
+	  If left empty, defaults to:
+	  - barebox.bin for barebox versions older than 2012.10.
+	  - barebox-flash-image for later versions.
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7715daf..dbda9a1 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -91,8 +91,12 @@ define BAREBOX_BUILD_CMDS
 	$(BAREBOX_BUILD_CUSTOM_ENV)
 endef
 
+BAREBOX_IMAGE_FILE = $(call qstrip,$(BR2_TARGET_BAREBOX_IMAGE_FILE))
+
 define BAREBOX_INSTALL_IMAGES_CMDS
-	if test -h $(@D)/barebox-flash-image ; then \
+	if test -n "$(BAREBOX_IMAGE_FILE)"; then \
+		cp -L $(@D)/$(BAREBOX_IMAGE_FILE) $(BINARIES_DIR) ; \
+	elif test -h $(@D)/barebox-flash-image ; then \
 		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
 	else \
 		cp $(@D)/barebox.bin $(BINARIES_DIR);\
-- 
2.5.0
