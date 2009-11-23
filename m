From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 23:05:23 +0100
Subject: [Buildroot] [git commit master] SDL_image: fix runtime libjpeg
	failure
Message-ID: <20091123221623.321DA777EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=883f066797ae0e7a017fac8e275f6e58659db760
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default SDL_image loads libjpeg at runtime on-demand. The find_lib
routine in the configure script of SDL_image searches the /usr/lib directory
of the host machine to find the file name of the jpeg library.

When the host on which Buildroot is being built contains newer version of
libjpeg (e.g.  libjpeg7), the configure script incorrectly uses its file
name. The result is a runtime failure to load libjpeg.

Fix this by disabling runtime load of libjpeg.

[Peter: disable for png+tiff as well]

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/sdl_image/sdl_image.mk |    3 +++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7580e52..a390c22 100644
--- a/CHANGES
+++ b/CHANGES
@@ -28,7 +28,7 @@
 	libupnp, libuuid, libxml2, lighttpd, ltrace, lua, lzma, magiccube4d,
 	matchbox, mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp,
 	ng-spice-rework, ntfs-3g, openntp, openssl, pcmanfm, php, psmisc,
-	python, quagga, radvd, rpm, rsync, rubix, samba, sawman, sdl,
+	python, quagga, radvd, rpm, rsync, rubix, samba, sawman, sdl, sdl_image,
 	shared-mime-info, sfdisk, spawn-fcgi, speech-tools, sqlite, squashfs,
 	synergy, syslinux, sysklogd, target-binutils, tcpdump, torsmo, u-boot,
 	udpcast, util-linux, valgrind, vsftpd, wipe, wpa-supplicant, x11vnc,
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 127a292..772bb86 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -14,6 +14,9 @@ SDL_IMAGE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-sdltest \
 		--disable-static \
+		--disable-jpg-shared \
+		--disable-png-shared \
+		--disable-tif-shared \
 		--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
 		--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
 		--enable-jpg=$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),yes,no) \
-- 
1.6.3.3
