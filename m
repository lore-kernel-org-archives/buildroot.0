From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:05:04 +0100
Subject: [Buildroot] [git commit] package/mesa3d-demos: add glut support
Message-ID: <20151218210522.842AD81D35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f239e783fb9828f2c5014ff563d6f81f008894a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d-demos/mesa3d-demos.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 094239c..cbc15c3 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -12,7 +12,6 @@ MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
 MESA3D_DEMOS_CONF_OPTS += \
-	--without-glut \
 	--disable-osmesa \
 	--disable-gles1
 
@@ -58,6 +57,19 @@ else
 MESA3D_DEMOS_CONF_OPTS += --disable-freetype2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
+MESA3D_DEMOS_DEPENDENCIES += libfreeglut
+MESA3D_DEMOS_CONF_OPTS += --with-glut=$(STAGING_DIR)/usr
+# osmesa support depends on glut
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+MESA3D_DEMOS_CONF_OPTS += --enable-osmesa
+else
+MESA3D_DEMOS_CONF_OPTS += --disable-osmesa
+endif
+else
+MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
+endif
+
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEMOS_DEPENDENCIES += wayland
 MESA3D_DEMOS_CONF_OPTS += --enable-wayland
