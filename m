From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 11 Jan 2012 12:06:49 +0100
Subject: [Buildroot] [PATCH v4] Add pygame package
Message-ID: <1326280009-20515-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>


Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 Changes since v3:
 - Better cross-compiling configuration to prevent pygame to look at python includes
   in Host directory (-> build fail on 64bits host)

 Changes since v2:
 As requested by Peter Korsgaard:
 - autoselect sdl_* libs instead of depending of them
 - removed movie/sndarray/surfarray config check (will be re-added when
   smpeg/numpy are integrated in BR)
 - remove doc only if !BR2_HAVE_DOCUMENTATION
 Other:
 - renamed PYTHON_PYGAME_CONFIGURE_* in PYTHON_PYGAME_UNCONFIGURE_* to better
   understand that we remove modules from default build config if dependancies
   are not available

 Changes since v1:
 - moved pygame to package/python-pygame and to "external python modules" menu
   as requested by Yegor Yefremov

 package/Config.in                      |    1 +
 package/python-pygame/Config.in        |   51 +++++++++++++++
 package/python-pygame/python-pygame.mk |  111 ++++++++++++++++++++++++++++++++
 3 files changed, 163 insertions(+), 0 deletions(-)
 create mode 100644 package/python-pygame/Config.in
 create mode 100644 package/python-pygame/python-pygame.mk

diff --git a/package/Config.in b/package/Config.in
index a82c658..c45cf56 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,6 +242,7 @@ menu "external python modules"
 source "package/python-dpkt/Config.in"
 source "package/python-mad/Config.in"
 source "package/python-netifaces/Config.in"
+source "package/python-pygame/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 endmenu
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
new file mode 100644
index 0000000..8320ab5
--- /dev/null
+++ b/package/python-pygame/Config.in
@@ -0,0 +1,51 @@
+config BR2_PACKAGE_PYTHON_PYGAME
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
+	depends on BR2_PACKAGE_PYTHON_PYGAME
+
+config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
+	bool "pygame.image"
+	select BR2_PACKAGE_SDL_IMAGE
+	select BR2_PACKAGE_SDL_IMAGE_PNG
+	select BR2_PACKAGE_SDL_IMAGE_JPEG
+	help
+	  pygame module for loading, saving and transfering images.
+	  Will autoselect sdl_image with png and jpeg support.
+
+config BR2_PACKAGE_PYTHON_PYGAME_FONT
+	bool "pygame.font"
+	select BR2_PACKAGE_SDL_TTF
+	help
+	  pygame module for loading and rendering fonts.
+	  Will autoselect sdl_ttf.
+
+config BR2_PACKAGE_PYTHON_PYGAME_MIXER
+	bool "pygame.mixer"
+	select BR2_PACKAGE_SDL_MIXER
+	help
+	  pygame module for loading and playing sounds.
+	  Will autoselect sdl_mixer.
+
+config BR2_PACKAGE_PYTHON_PYGAME_MIXER_MUSIC
+	bool "pygame.mixer.music"
+	depends on BR2_PACKAGE_PYTHON_PYGAME_MIXER
+	help
+	  pygame module for controlling streamed audio
+
+config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
+	bool "pygame.scrap"
+	depends on BR2_PACKAGE_SDL_X11
+	help
+	  pygame module for clipboard support (X11 needed)
+
+endmenu
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
new file mode 100644
index 0000000..f5603b6
--- /dev/null
+++ b/package/python-pygame/python-pygame.mk
@@ -0,0 +1,111 @@
+#############################################################
+#
+# Pygame
+#
+#############################################################
+# stable 1.9.1 release requires V4L which has been wiped out of recent Linux
+# kernels, so use latest mercurial revision until next stable release is out.
+PYTHON_PYGAME_VERSION = f0bb4a4b365d
+PYTHON_PYGAME_SOURCE  = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
+PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
+PYTHON_PYGAME_SITE_METHOD = hg
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
+PYTHON_PYGAME_OPT_DEPENDS += sdl_image
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
+PYTHON_PYGAME_OPT_DEPENDS += sdl_ttf
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
+PYTHON_PYGAME_OPT_DEPENDS += sdl_mixer
+endif
+
+PYTHON_PYGAME_DEPENDENCIES = python sdl $(PYTHON_PYGAME_OPT_DEPENDS)
+
+ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
+define PYTHON_PYGAME_UNCONFIGURE_IMAGE
+	$(SED) 's/^imageext/#imageext/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
+define PYTHON_PYGAME_UNCONFIGURE_FONT
+	$(SED) 's/^font/#font/' $(@D)/Setup
+endef
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
+define PYTHON_PYGAME_UNCONFIGURE_MIXER
+	$(SED) 's/^mixer/#mixer/g' $(@D)/Setup
+endef
+endif
+
+# Both require numpy or numeric python module
+define PYTHON_PYGAME_UNCONFIGURE_SNDARRAY
+	$(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
+endef
+
+define PYTHON_PYGAME_UNCONFIGURE_SURFARRAY
+	$(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
+endef
+
+# Requires smpeg
+define PYTHON_PYGAME_UNCONFIGURE_MOVIE
+	$(SED) 's/^movie/#movie/' $(@D)/Setup
+endef
+
+ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)
+define PYTHON_PYGAME_UNCONFIGURE_SCRAP
+	$(SED) 's/^scrap/#scrap/' $(@D)/Setup
+endef
+endif
+
+PYTHON_PYGAME_SDL_FLAGS = $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
+PYTHON_PYGAME_SDL_FLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)
+
+# Pygame needs a Setup file where options should be commented out if
+# dependencies are not available
+define PYTHON_PYGAME_CONFIGURE_CMDS
+	cp -f $(@D)/Setup.in $(@D)/Setup
+	$(SED) 's~^SDL = ~SDL = $(PYTHON_PYGAME_SDL_FLAGS) \n#~' $(@D)/Setup
+	$(SED) 's/^pypm/#pypm/' $(@D)/Setup
+	$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
+	$(PYTHON_PYGAME_UNCONFIGURE_FONT)
+	$(PYTHON_PYGAME_UNCONFIGURE_MIXER)
+	$(PYTHON_PYGAME_UNCONFIGURE_SNDARRAY)
+	$(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
+	$(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
+	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
+endef
+
+define PYTHON_PYGAME_BUILD_CMDS
+	(cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDSHARED="$(TARGET_CROSS)gcc -shared" \
+		CROSS_COMPILING=yes \
+		_python_sysroot=$(STAGING_DIR) \
+		_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
+		_python_prefix=/usr \
+		_python_exec_prefix=/usr \
+		$(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+define PYTHON_PYGAME_REMOVE_DOC
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
+endef
+endif
+
+define PYTHON_PYGAME_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install \
+		--prefix=$(TARGET_DIR)/usr)
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
+	$(PYTHON_PYGAME_REMOVE_DOC)
+endef
+
+define PYTHON_PYGAME_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame*
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.5.4
