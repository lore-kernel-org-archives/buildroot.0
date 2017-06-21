From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 21:40:33 +0200
Subject: [Buildroot] [git commit] barebox: support multiple image files
Message-ID: <20170621194008.5278F81DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c61322c46ef202fe59a2fe6cf7b56ccd30ce3fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for specifying multiple image files in
BR2_TARGET_BAREBOX_IMAGE_FILE config option.

This is useful for boards with several RAM size variants.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Thomas: rename internal variable from $(1)_IMAGE_FILE to
$(1)_IMAGE_FILES.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/barebox-aux/Config.in | 4 ++--
 boot/barebox/barebox.mk            | 6 +++---
 boot/barebox/barebox/Config.in     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index ec3b97c..d39d24f 100644
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
index 1690e8f..b811e32 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -109,11 +109,11 @@ define $(1)_BUILD_CMDS
 	$$($(1)_BUILD_CUSTOM_ENV)
 endef
 
-$(1)_IMAGE_FILE = $$(call qstrip,$$(BR2_TARGET_$(1)_IMAGE_FILE))
+$(1)_IMAGE_FILES = $$(call qstrip,$$(BR2_TARGET_$(1)_IMAGE_FILE))
 
 define $(1)_INSTALL_IMAGES_CMDS
-	if test -n "$$($(1)_IMAGE_FILE)"; then \
-		cp -L $$(@D)/$$($(1)_IMAGE_FILE) $$(BINARIES_DIR) ; \
+	if test -n "$$($(1)_IMAGE_FILES)"; then \
+		cp -L $$(foreach image,$$($(1)_IMAGE_FILES),$$(@D)/$$(image)) $$(BINARIES_DIR) ; \
 	elif test -h $$(@D)/barebox-flash-image ; then \
 		cp -L $$(@D)/barebox-flash-image $$(BINARIES_DIR)/barebox.bin ; \
 	else \
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index 3d8d014..0be26adf 100644
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
