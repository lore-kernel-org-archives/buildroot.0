From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 09:06:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: always pass --with-platforms
In-Reply-To: <20170617070615.27686-1-bernd.kuhls@t-online.de>
References: <20170617070615.27686-1-bernd.kuhls@t-online.de>
Message-ID: <20170617070615.27686-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If --with-platforms is not used mesa3d defaults to x11:
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.1#n1641
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=17.1#n1659

This will break configure when x11 is not needed because the defconfig
has no mesa3d drivers enabled. To solve the problem we always pass
--with-platforms, even with empty values.

Fixes
http://autobuild.buildroot.net/results/d16/d16b39d16b5bee5c09b1e996941a275a4337c3c1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ac27b0f07..693e8a5f2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -161,13 +161,15 @@ MESA3D_PLATFORMS += x11
 endif
 MESA3D_CONF_OPTS += \
 	--enable-gbm \
-	--enable-egl \
-	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
+	--enable-egl
 else
 MESA3D_CONF_OPTS += \
 	--disable-egl
 endif
 
+MESA3D_CONF_OPTS += \
+	--with-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
+
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
 MESA3D_PROVIDES += libgles
 MESA3D_CONF_OPTS += --enable-gles1 --enable-gles2
-- 
2.11.0
