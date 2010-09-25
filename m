From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Sep 2010 23:52:07 +0200
Subject: [Buildroot] [git commit master 1/1] sdl_mixer: disable plugins not
	available in BR, add optional mp3/ogg support
Message-ID: <20100925215348.105CD8B5F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e6e63e53782a3814fafe8b1834aa575e7b0c81f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2521

Disable plugins with dependencies we don't have in BR / aren't enabled, so
the configure script doesn't get confused if they are installed on the
host. Also enable ogg/libmad support if enabled in BR.

Notice: flac support is disabled for now as the sdl_mixer configure script
doesn't work when cross compiling.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    8 +++++---
 package/sdl_mixer/sdl_mixer.mk |   22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index c7be667..54ddd74 100644
--- a/CHANGES
+++ b/CHANGES
@@ -26,9 +26,10 @@
 	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
 	mysql_client, nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp,
 	openntpd, openssh, openvpn, oprofile, pango, pcre, php,
-	prboom, radvd, qt, samba, sdl_sound, shared-mime-info, speex,
-	sqlite,	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
-	udpcast, usbmount, usbutils, which, xlib_libX11, zlib
+	prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
+	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
+	tcpdump, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	which, xlib_libX11, zlib
 
 	Deprecated packages: lzma
 
@@ -37,6 +38,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#2521: Can't compile sdl_mixer, mikmod.h can't be found
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
 
 2010.08: Released August 31th, 2010:
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 8033495..c7135ba 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -10,7 +10,27 @@ SDL_MIXER_SITE:=http://www.libsdl.org/projects/SDL_mixer/release/
 SDL_MIXER_LIBTOOL_PATCH = NO
 SDL_MIXER_INSTALL_STAGING = YES
 SDL_MIXER_DEPENDENCIES = sdl
-SDL_MIXER_CONF_OPT = --without-x --with-sdl-prefix=$(STAGING_DIR)/usr
+SDL_MIXER_CONF_OPT = \
+	--without-x \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--disable-music-midi \
+	--disable-music-mod \
+	--disable-music-mp3 \
+	--disable-music-flac # configure script fails when cross compiling
+
+ifeq ($(BR2_PACKAGE_LIBMAD),y)
+SDL_MIXER_CONF_OPT += --enable-music-mp3-mad-gpl
+SDL_MIXER_DEPENDENCIES += libmad
+else
+SDL_MIXER_CONF_OPT += --disable-music-mp3-mad-gpl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+SDL_MIXER_CONF_OPT += --enable-music-ogg
+SDL_MIXER_DEPENDENCIES += libvorbis
+else
+SDL_MIXER_CONF_OPT += --disable-music-ogg
+endif
 
 define SDL_MIXER_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_mixer*.so* $(TARGET_DIR)/usr/lib/
-- 
1.7.1
