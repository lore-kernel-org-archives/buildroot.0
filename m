From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Nov 2009 21:51:46 +0100
Subject: [Buildroot] [git commit master] package/sdl: fix dependencies for
	directfb/qt/x11 support
Message-ID: <20091122210625.6C8A2777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=351b679608e805ed1d6f27a1f6b5e2398eb3a5eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #683

And cleanup Kconfig while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    9 +++++----
 package/sdl/Config.in |   11 ++++++++---
 package/sdl/sdl.mk    |    5 ++++-
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index 37931d8..ab1df38 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,10 +15,10 @@
 	gst-plugins-good, imagemagick, ipkg, iptables, iw, kernel-headers,
 	kismet, libelf, libevent, libglib2, libidn, liblockfile, libmad,
 	libpcap, libupnp, libuuid, lighttpd, ltrace, lua, lzma, mdadm, ncftp,
-	ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php, python,
-	quagga, radvd, rsync, samba, sawman, shared-mime-info, spawn-fcgi,
-	speech-tools, sqlite, squashfs, synergy, syslinux, tcpdump, u-boot,
-	util-linux, valgrind, vsftpd, wipe
+	ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl, php,
+	python, quagga, radvd, rsync, samba, sawman, sdl, shared-mime-info,
+	spawn-fcgi, speech-tools, sqlite, squashfs, synergy, syslinux,
+	tcpdump, u-boot, util-linux, valgrind, vsftpd, wipe
 
 	wpa-supplicant, xdata_xcursor-themes, zlib
 
@@ -44,6 +44,7 @@
 	#657: Bug in imagemagick-clean target
 	#665: [PATCH] Samba package
 	#667: [PATCH] e2fsprogs
+	#683: SDL-dfb does not select directfb
 	#701: make install problem with unstripped binaries
 	#703: [SECURITY] Update openssl package to 0.9.8l
 	#705: Bump spawn-fcgi package to 1.6.3
diff --git a/package/sdl/Config.in b/package/sdl/Config.in
index 7cba524..869173d 100644
--- a/package/sdl/Config.in
+++ b/package/sdl/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_SDL
 	bool "SDL"
 	help
+	  Simple DirectMedia Layer - SDL is a library that allows
+	  programs portable low level access to a video framebuffer,
+	  audio output, mouse, and keyboard.
 
 	  http://www.libsdl.org/
 
-menu "SDL options selection"
-	depends on BR2_PACKAGE_SDL
+if BR2_PACKAGE_SDL
 
 config BR2_PACKAGE_SDL_FBCON
 	bool "SDL framebuffer console video driver"
@@ -13,11 +15,14 @@ config BR2_PACKAGE_SDL_FBCON
 
 config BR2_PACKAGE_SDL_DIRECTFB
 	bool "SDL DirectFB video driver"
+	depends on BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_SDL_QTOPIA
 	bool "SDL Qtopia video driver"
+	depends on BR2_PACKAGE_QT
 
 config BR2_PACKAGE_SDL_X11
 	bool "SDL X11 video driver"
+	depends on BR2_PACKAGE_XORG7
 
-endmenu
+endif
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index e9d6c0c..f66ecc4 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -18,6 +18,7 @@ SDL_FBCON=--enable-video-fbcon=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
+SDL_DEPENDENCIES += directfb
 SDL_DIRECTFB=--enable-video-directfb=yes
 SDL_DIRECTFB_TARGET:=$(STAGING_DIR)/include/directfb
 SDL_DIRECTFB_INCLUDES:=-I$(STAGING_DIR)/usr/include/directfb
@@ -28,12 +29,14 @@ endif
 
 ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
 SDL_QTOPIA=--enable-video-qtopia=yes
+SDL_DEPENDENCIES += qt
 else
 SDL_QTOPIA=--enable-video-qtopia=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
 SDL_X11=--enable-video-x11=yes
+SDL_DEPENDENCIES += xserver_xorg-server
 else
 SDL_X11=--enable-video-x11=no
 endif
@@ -96,7 +99,7 @@ $(TARGET_DIR)/usr/lib/libSDL.so: $(STAGING_DIR)/usr/lib/libSDL.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libSDL.so
 
-SDL sdl: $(TARGET_DIR)/usr/lib/libSDL.so
+SDL sdl: $(SDL_DEPENDENCIES) $(TARGET_DIR)/usr/lib/libSDL.so
 
 sdl-unpacked: $(SDL_DIR)/.unpacked
 
-- 
1.6.3.3
