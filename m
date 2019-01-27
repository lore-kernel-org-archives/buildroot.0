From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 27 Jan 2019 16:59:37 -0200
Subject: [Buildroot] [PATCH 2/8] package/sdl_sound: actually use the
 optional CONF_OPTS
In-Reply-To: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
Message-ID: <20190127185943.1136-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since "57ace26b6c package/sdl_sound: add optional support for
libmodplug" from 2016, optional CONF_OPTS are added but they do not
really take effect because there is an unconditional override below the
conditional append.

Currently this does not cause build failures, but it can lead to wrong
detection of dependencies because many explicit --enable/--disable are
not passed to configure.

Fix this by moving the unconditional code to the top.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
On current master (f6843a75fe), test-pkg with this config:
BR2_PACKAGE_SDL=y
BR2_PACKAGE_SDL_SOUND=y
results in:
6 builds, 0 skipped, 0 build failed, 0 legal-info failed
After this patch, the same result:
6 builds, 0 skipped, 0 build failed, 0 legal-info failed

After running test-pkg I diffed this file between the output of master
and the output after this patch:
br-arm-full/build/sdl_sound-1.0.3/config.status
Following flags are added, result of this patch:
'--disable-flac' '--disable-modplug' '--disable-ogg' '--disable-speex' '--disable-physfs'

On current master (f6843a75fe), test-pkg with this config:
BR2_PACKAGE_FLAC=y
BR2_PACKAGE_SDL=y
BR2_PACKAGE_SDL_SOUND=y
BR2_PACKAGE_SDL_SOUND_PLAYSOUND=y
BR2_PACKAGE_LIBMODPLUG=y
BR2_PACKAGE_LIBVORBIS=y
BR2_PACKAGE_SPEEX=y
BR2_PACKAGE_PHYSFS=y
results in:
6 builds, 0 skipped, 0 build failed, 0 legal-info failed
After this patch, the same result:
6 builds, 0 skipped, 0 build failed, 0 legal-info failed

After running test-pkg I diffed this file between the output of master
and the output after this patch:
br-arm-full/build/sdl_sound-1.0.3/config.status
Following flags are added, result of this patch:
'--enable-flac' '--enable-modplug' '--enable-ogg' '--enable-speex' '--enable-physfs'
---
 package/sdl_sound/sdl_sound.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 2544b598e9..c6028e7910 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -1,29 +1,34 @@
 ################################################################################
 #
 # sdl_sound
 #
 ################################################################################
 
 SDL_SOUND_VERSION = 1.0.3
 SDL_SOUND_SOURCE = SDL_sound-$(SDL_SOUND_VERSION).tar.gz
 SDL_SOUND_SITE = http://icculus.org/SDL_sound/downloads
 SDL_SOUND_LICENSE = LGPL-2.1+
 SDL_SOUND_LICENSE_FILES = COPYING
 SDL_SOUND_INSTALL_STAGING = YES
 SDL_SOUND_DEPENDENCIES = sdl
+SDL_SOUND_CONF_OPTS = \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-sdltest \
+	--enable-static
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 SDL_SOUND_DEPENDENCIES += libiconv
 endif
 
 # optional dependencies
 ifeq ($(BR2_PACKAGE_FLAC)$(BR2_PACKAGE_LIBOGG),yy)
 SDL_SOUND_CONF_OPTS += --enable-flac
 SDL_SOUND_DEPENDENCIES += flac libogg
 else
 SDL_SOUND_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
 SDL_SOUND_CONF_OPTS += --enable-modplug
 SDL_SOUND_DEPENDENCIES += libmodplug
@@ -39,37 +44,31 @@ SDL_SOUND_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 SDL_SOUND_CONF_OPTS += --enable-speex
 SDL_SOUND_DEPENDENCIES += speex
 else
 SDL_SOUND_CONF_OPTS += --disable-speex
 endif
 
 ifeq ($(BR2_PACKAGE_PHYSFS),y)
 SDL_SOUND_CONF_OPTS += --enable-physfs
 SDL_SOUND_DEPENDENCIES += physfs
 else
 SDL_SOUND_CONF_OPTS += --disable-physfs
 endif
 
-SDL_SOUND_CONF_OPTS = \
-	--with-sdl-prefix=$(STAGING_DIR)/usr \
-	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-	--disable-sdltest \
-	--enable-static
-
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 SDL_SOUND_CONF_OPTS += --enable-mmx
 else
 SDL_SOUND_CONF_OPTS += --disable-mmx
 endif
 
 define SDL_SOUND_REMOVE_PLAYSOUND
 	rm $(addprefix $(TARGET_DIR)/usr/bin/,playsound playsound_simple)
 endef
 
 ifneq ($(BR2_PACKAGE_SDL_SOUND_PLAYSOUND),y)
 SDL_SOUND_POST_INSTALL_TARGET_HOOKS += SDL_SOUND_REMOVE_PLAYSOUND
 endif
 
 $(eval $(autotools-package))
-- 
2.17.1
