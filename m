From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Sep 2009 10:05:15 +0200
Subject: [Buildroot] [git commit master] Add SDL_sound package
Message-ID: <20090920080612.5454A77785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e8354d4dbc6c3325881b840e77906e1d4cd0e1a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #477

Peter: minor tweaks:
 - sdl_snd -> sdl_sound
 - cleaned up help text
 - don't transform binary name
 - add option to keep playsound/playsound_simple - Off by default
 - fix uninstall when BR2_HAVE_DEVFILES isn't enabled

Signed-off-by: Evan Zelkowitz <evan.zelkowitz@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    3 +-
 package/Config.in              |    1 +
 package/sdl_sound/Config.in    |   19 ++++++++++++++++++
 package/sdl_sound/sdl_sound.mk |   42 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+), 1 deletions(-)
 create mode 100644 package/sdl_sound/Config.in
 create mode 100644 package/sdl_sound/sdl_sound.mk

diff --git a/CHANGES b/CHANGES
index ac747d5..daf0d4a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,11 +1,12 @@
 2009.11, Not yet released:
 
-	New packages: divine, libarchive
+	New packages: divine, libarchive, sdl_sound
 
 	Updated/fixed packages: squashfs
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#477: Add sdl_sound package
 	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
 	#565: libevent: Bump version and clean up makefile
diff --git a/package/Config.in b/package/Config.in
index 061838b..619c9bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -309,6 +309,7 @@ source "package/sawman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"
+source "package/sdl_sound/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"
diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
new file mode 100644
index 0000000..08ad754
--- /dev/null
+++ b/package/sdl_sound/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_SDL_SOUND
+	bool "SDL_sound"
+	depends on BR2_PACKAGE_SDL
+	help
+	  SDL_sound is a library that handles the decoding of several
+	  popular sound file formats, such as .WAV and .MP3.
+	  It is meant to make the programmer's sound playback tasks
+	  simpler. The programmer gives SDL_sound a filename, or feeds
+	  it data directly from one of many sources, and then reads the
+	  decoded waveform data back at her leisure.
+
+	  http://icculus.org/SDL_sound/
+
+config BR2_PACKAGE_SDL_SOUND_PLAYSOUND
+	bool "install playsound tool"
+	depends on BR2_PACKAGE_SDL_SOUND
+	help
+	  Enable this option to install the playsound/playsound_simple
+	  tools to target.
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
new file mode 100644
index 0000000..1923257
--- /dev/null
+++ b/package/sdl_sound/sdl_sound.mk
@@ -0,0 +1,42 @@
+#############################################################
+#
+# sdl_sound addon for SDL
+#
+#############################################################
+SDL_SOUND_VERSION:=1.0.3
+SDL_SOUND_SOURCE:=SDL_sound-$(SDL_SOUND_VERSION).tar.gz
+SDL_SOUND_SITE:=http://icculus.org/SDL_sound/downloads/
+SDL_SOUND_LIBTOOL_PATCH:=NO
+SDL_SOUND_INSTALL_STAGING:=YES
+SDL_SOUND_INSTALL_TARGET:=YES
+
+SDL_SOUND_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+		--disable-sdltest \
+		--enable-static \
+		--program-prefix=''
+
+# enable mmx for newer x86's
+ifeq ($(BR2_i386)$(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_pentiumpro)$(BR2_x86_geode),y)
+SDL_SOUND_CONF_OPT += --enable-mmx
+else
+SDL_SOUND_CONF_OPT += --disable-mmx
+endif
+
+$(eval $(call AUTOTARGETS,package,sdl_sound))
+
+ifneq ($(BR2_PACKAGE_SDL_SOUND_PLAYSOUND),y)
+$(SDL_SOUND_HOOK_POST_INSTALL):
+	rm $(addprefix $(TARGET_DIR)/usr/bin/,playsound playsound_simple)
+	touch $@
+endif
+
+# target shared libs doesn't get removed by make uninstall if the .la files
+# are removed (E.G. if BR2_HAVE_DEVFILES isn't set)
+$(SDL_SOUND_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	$(MAKE) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
+	rm -f $(@D)/.stamp_staging_installed
+	$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)/$(SDL_SOUND_SUBDIR)
+	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
+	rm -f $(SDL_SOUND_TARGET_INSTALL_TARGET) $(SDL_SOUND_HOOK_POST_INSTALL)
-- 
1.6.3.3
