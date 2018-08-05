From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Aug 2018 12:54:51 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: fix PKG_CONFIG_LIBDIR
Message-ID: <20180805104925.B2F098B444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=487775b6e92f878770dc8f60cf614ad5e546625c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Normally this upstream change is not a problem because pkgconf searches
both paths for .pc files, unless we define PKG_CONFIG_LIBDIR with
something else like we did for the last six years ;)
https://github.com/buildroot/buildroot/blame/master/package/qt5/qt5base/qt5base.mk#L280

This patch removes all variables concerning pkgconf paths. At the time
the qt5base package was introduced the pkgconf wrapper did not exist.
Today these variables are not necessary anymore.

Fixes
http://autobuild.buildroot.net/results/061/06159500c27026d56a772fafbb0d956c72dd4e6c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9eafd593f1..ab2b883fc4 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -277,8 +277,6 @@ define QT5BASE_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
 		./configure \
 		-v \
