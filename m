From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 20 Jun 2017 17:30:00 +0200
Subject: [Buildroot] [PATCH] barebox: support multiple image files
Message-ID: <20170620153000.18263-1-m.niestroj@grinn-global.com>
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
 boot/barebox/barebox-aux/Config.in | 2 +-
 boot/barebox/barebox.mk            | 2 +-
 boot/barebox/barebox/Config.in     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index ec3b97cb8..8f21a0c45 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -32,7 +32,7 @@ config BR2_TARGET_BAREBOX_AUX_CONFIG_FRAGMENT_FILES
 config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE
 	string "Image filename"
 	help
-	  Name of the generated barebox image, which will be copied to
+	  Name of the generated barebox images, which will be copied to
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
index 3d8d01456..d29e742d6 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -33,7 +33,7 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 config BR2_TARGET_BAREBOX_IMAGE_FILE
 	string "Image filename"
 	help
-	  Name of the generated barebox image, which will be copied to
+	  Name of the generated barebox images, which will be copied to
 	  the images directory.
 
 	  If left empty, defaults to:
-- 
2.13.1
