From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon,  9 Jan 2012 10:32:06 +0100
Subject: [Buildroot] [PATCH] Add pygame package
Message-ID: <1326101526-12889-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/Config.in        |    1 +
 package/pygame/Config.in |   55 ++++++++++++++++++++++++
 package/pygame/pygame.mk |  106 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+), 0 deletions(-)
 create mode 100644 package/pygame/Config.in
 create mode 100644 package/pygame/pygame.mk

diff --git a/package/Config.in b/package/Config.in
index 92b80e6..40a97e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -108,6 +108,7 @@ source "package/fbv/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
+source "package/pygame/Config.in"
 source "package/sawman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
diff --git a/package/pygame/Config.in b/package/pygame/Config.in
new file mode 100644
index 0000000..e6c1d31
--- /dev/null
+++ b/package/pygame/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_PYGAME
+	bool "pygame"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_SDL
+	help
+	  Pygame is a cross-platfrom library designed to make it easy to write
+	  multimedia software, such as games, in Python. Pygame requires the
+	  Python language and SDL multimedia library.
+	  It can also make use of several other popular libraries.
+
+	  http://www.pygame.org/
+
+menu "pygame optional modules selection"
+	depends on BR2_PACKAGE_PYGAME
+
+config BR2_PACKAGE_PYGAME_IMAGE
+	bool "pygame.image"
+	depends on BR2_PACKAGE_SDL_IMAGE_PNG && BR2_PACKAGE_SDL_IMAGE_JPEG
+	help
+	  pygame module for loading, saving and transfering images
+
+comment "pygame.image requires sdl_image with png and jpeg support"
+	depends on !BR2_PACKAGE_SDL_IMAGE_PNG || !BR2_PACKAGE_SDL_IMAGE_JPEG
+
+config BR2_PACKAGE_PYGAME_FONT
+	bool "pygame.font"
+	depends on BR2_PACKAGE_SDL_TTF
+	help
+	  pygame module for loading and rendering fonts
+
+comment "pygame.font requires sdl_ttf"
+	depends on !BR2_PACKAGE_SDL_TTF
+
+config BR2_PACKAGE_PYGAME_MIXER
+	bool "pygame.mixer"
+	depends on BR2_PACKAGE_SDL_MIXER
+	help
+	  pygame module for loading and playing sounds
+
+comment "pygame.mixer requires sdl_mixer"
+	depends on !BR2_PACKAGE_SDL_MIXER
+
+config BR2_PACKAGE_PYGAME_MIXER_MUSIC
+	bool "pygame.mixer.music"
+	depends on BR2_PACKAGE_PYGAME_MIXER
+	help
+	  pygame module for controlling streamed audio
+
+config BR2_PACKAGE_PYGAME_SCRAP
+	bool "pygame.scrap"
+	depends on BR2_PACKAGE_SDL_X11
+	help
+	  pygame module for clipboard support (X11 needed)
+
+endmenu
diff --git a/package/pygame/pygame.mk b/package/pygame/pygame.mk
new file mode 100644
index 0000000..06a7844
--- /dev/null
+++ b/package/pygame/pygame.mk
@@ -0,0 +1,106 @@
+#############################################################
+#
+# Pygame
+#
+#############################################################
+# stable 1.9.1 release requires V4L which has been wiped out of recent Linux
+# kernels, so use latest mercurial revision until next stable release is out.
+PYGAME_VERSION = f0bb4a4b365d
+PYGAME_SITE = https://bitbucket.org/pygame/pygame
+PYGAME_SITE_METHOD = hg
+
+ifeq ($(BR2_PACKAGE_PYGAME_IMAGE),y)
+PYGAME_OPT_DEPENDS += sdl_image
+endif
+
+ifeq ($(BR2_PACKAGE_PYGAME_FONT),y)
+PYGAME_OPT_DEPENDS += sdl_ttf
+endif
+
+ifeq ($(BR2_PACKAGE_PYGAME_MIXER),y)
+PYGAME_OPT_DEPENDS += sdl_mixer
+endif
+
+ifeq ($(BR2_PACKAGE_PYGAME_MOVIE),y)
+PYGAME_OPT_DEPENDS += smpeg
+endif
+
+PYGAME_DEPENDENCIES = python sdl $(PYGAME_OPT_DEPENDS)
+
+ifneq ($(BR2_PACKAGE_PYGAME_IMAGE),y)
+define PYGAME_CONFIGURE_IMAGE
+	$(SED) 's/^imageext/#imageext/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYGAME_FONT),y)
+define PYGAME_CONFIGURE_FONT
+	$(SED) 's/^font/#font/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYGAME_MIXER),y)
+define PYGAME_CONFIGURE_MIXER
+	$(SED) 's/^mixer/#mixer/g' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYGAME_SNDARRAY),y)
+define PYGAME_CONFIGURE_SNDARRAY
+	$(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYGAME_SURFARRAY),y)
+define PYGAME_CONFIGURE_SURFARRAY
+	$(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYGAME_MOVIE),y)
+define PYGAME_CONFIGURE_MOVIE
+	$(SED) 's/^movie/#movie/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYGAME_SCRAP),y)
+define PYGAME_CONFIGURE_SCRAP
+	$(SED) 's/^scrap/#scrap/' $(@D)/Setup
+endef
+endif
+
+PYGAME_SDL_FLAGS = $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
+PYGAME_SDL_FLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)
+
+# Pygame needs a Setup file where options should be commented out if
+# dependencies are not available
+define PYGAME_CONFIGURE_CMDS
+	cp -f $(@D)/Setup.in $(@D)/Setup
+	$(SED) 's<^SDL = <SDL = $(PYGAME_SDL_FLAGS) \n#<' $(@D)/Setup
+	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
+	$(PYGAME_CONFIGURE_IMAGE)
+	$(PYGAME_CONFIGURE_FONT)
+	$(PYGAME_CONFIGURE_MIXER)
+	$(PYGAME_CONFIGURE_SNDARRAY)
+	$(PYGAME_CONFIGURE_SURFARRAY)
+	$(PYGAME_CONFIGURE_MOVIE)
+	$(PYGAME_CONFIGURE_SCRAP)
+endef
+
+define PYGAME_BUILD_CMDS
+	(cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CROSS)gcc -shared" \
+		$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define PYGAME_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr && \
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs && \
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests)
+endef
+
+define PYGAME_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame*
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.5.4
