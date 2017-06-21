From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 21 Jun 2017 09:03:53 +0200
Subject: [Buildroot] [PATCH v2] barebox: support multiple image files
Message-ID: <20170621070353.16521-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for specifying multiple image files in
BR2_TARGET_BAREBOX_IMAGE_FILE config option.

This is usefull for boards with several RAM size variants.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
Changes v1 -> v2:
 * Improve Config.in description (suggested by Thomas)

 boot/barebox/barebox-aux/Config.in | 4 ++--
 boot/barebox/barebox.mk            | 2 +-
 boot/barebox/barebox/Config.in     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index ec3b97cb8..d39d24f76 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -30,9 +30,9 @@ config BR2_TARGET_BAREBOX_AUX_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main Barebox configuration file.
 
 config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE
-	string "Image filename"
+	string "Image file names"
 	help
-	  Name of the generated barebox image, which will be copied to
+	  Space-separated list of barebox images which will be copied to
 	  the images directory.
 
 	  If left empty, defaults to:
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 1690e8fa5..8bc9594ff 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -113,7 +113,7 @@ $(1)_IMAGE_FILE = $$(call qstrip,$$(BR2_TARGET_$(1)_IMAGE_FILE))
 
 define $(1)_INSTALL_IMAGES_CMDS
 	if test -n "$$($(1)_IMAGE_FILE)"; then \
-		cp -L $$(@D)/$$($(1)_IMAGE_FILE) $$(BINARIES_DIR) ; \
+		cp -L $$(foreach image,$$($(1)_IMAGE_FILE),$$(@D)/$$(image)) $$(BINARIES_DIR) ; \
 	elif test -h $$(@D)/barebox-flash-image ; then \
 		cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/barebox.bin ; \
 	else \
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index 3d8d01456..0be26adf9 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -31,9 +31,9 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 	  that will be merged to the main Barebox configuration file.
 
 config BR2_TARGET_BAREBOX_IMAGE_FILE
-	string "Image filename"
+	string "Image file names"
 	help
-	  Name of the generated barebox image, which will be copied to
+	  Space-separated list of barebox images which will be copied to
 	  the images directory.
 
 	  If left empty, defaults to:
-- 
2.13.1
