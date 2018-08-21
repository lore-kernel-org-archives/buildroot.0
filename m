From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:50:55 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: skins2 depends on
 qt5base
Message-ID: <20180821204928.A9CBD8E1F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f68d99a82384dda6ea7801f3f5ec905231c8fd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes

configure: error: The skins2 module depends on the Qt interface. Without
it you will not be able to open any dialog box from the interface, which
makes the skins2 interface rather useless. Install the Qt development
package or alternatively you can also configure with: --disable-qt
--disable-skins2.

http://autobuild.buildroot.net/results/ddb/ddb1ab48adb9705c44ed3d6d800b6d01ad52ac8c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index c77c945a34..b69657d31f 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -473,8 +473,14 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS)$(BR2_PACKAGE_QT5SVG),yy)
 VLC_CONF_OPTS += --enable-qt
 VLC_DEPENDENCIES += qt5base qt5svg
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT)$(BR2_PACKAGE_XLIB_LIBXINERAMA)$(BR2_PACKAGE_XLIB_LIBXPM),yyy)
+VLC_CONF_OPTS += --enable-skins2
+VLC_DEPENDENCIES += xlib_libXext xlib_libXinerama xlib_libXpm
 else
-VLC_CONF_OPTS += --disable-qt
+VLC_CONF_OPTS += --disable-skins2
+endif
+else
+VLC_CONF_OPTS += --disable-qt --disable-skins2
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
@@ -551,13 +557,6 @@ else
 VLC_CONF_OPTS += --without-x
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT)$(BR2_PACKAGE_XLIB_LIBXINERAMA)$(BR2_PACKAGE_XLIB_LIBXPM),yyy)
-VLC_CONF_OPTS += --enable-skins2
-VLC_DEPENDENCIES += xlib_libXext xlib_libXinerama xlib_libXpm
-else
-VLC_CONF_OPTS += --disable-skins2
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 VLC_DEPENDENCIES += zlib
 endif
