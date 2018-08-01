From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  1 Aug 2018 22:16:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix PKG_CONFIG_LIBDIR
Message-ID: <20180801201646.512-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default pkgconf searches "${libdir}/pkgconfig:${datadir}/pkgconfig"
for .pc files:
https://github.com/pkgconf/pkgconf/blob/844f0a66621629a65e3cbf3c3ca47185602e9df5/configure.ac#L41

The new xorgproto package installs .pc files to ${datadir}/pkgconfig
whichs translates to $(STAGING_DIR)/usr/share/pkgconfig, for example
dri3proto:
https://cgit.freedesktop.org/xorg/proto/xorgproto/tree/Makefile.am#n65

whereas the old xproto_ packages installed their .pc files to
${libdir}/pkgconfig:
https://cgit.freedesktop.org/xorg/proto/dri3proto/tree/Makefile.am?id=3937f72040b79c7245b261da880364177cc40a6e#n4

This upstream change is not a problem because pkgconf searches both
directories for .pc files, unless we define PKG_CONFIG_LIBDIR with
something else like we did for the last six years in qt5base ;)
https://github.com/buildroot/buildroot/blame/master/package/qt5/qt5base/qt5base.mk#L280

This patch fixes the incomplete PKG_CONFIG_LIBDIR variable to fix
http://autobuild.buildroot.net/results/061/06159500c27026d56a772fafbb0d956c72dd4e6c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5base/qt5base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9eafd593f1..62199d8cb2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -277,7 +277,7 @@ define QT5BASE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
 		./configure \
-- 
2.18.0
