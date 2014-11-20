From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Nov 2014 23:11:58 +0100
Subject: [Buildroot] [git commit] package/mesa3d-demos: Fix build error
Message-ID: <20141120221343.347617F961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=956823ded7df96206a7380096d62dad266d049f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/8f2/8f292f1151089d20f33c599320941cb5435c0199/
http://autobuild.buildroot.net/results/f3d/f3db50d0c5c74fecafd6b4bdd89f97e8e566d820/
http://autobuild.buildroot.net/results/ac0/ac0f22bf87e2b48bd2191de88999404d1c55de9b/
http://autobuild.buildroot.net/results/da8/da87a3e81b19ad038661f5653b544f4c8cfd389d/
http://autobuild.buildroot.net/results/d51/d51d22754a37f790d2de5a4836237b8eea417124/
http://autobuild.buildroot.net/results/347/347b2f79111548ae00f40879c1b5f3c4c1c7091e/
http://autobuild.buildroot.net/results/aef/aef73a3bc770c3784025642f6a2c276944117112/
http://autobuild.buildroot.net/results/901/90152f1cfa09ad4d37700b340204f8b75850c582/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-demos/Config.in       |    2 ++
 package/mesa3d-demos/mesa3d-demos.mk |    8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index e2b2e05..d63c47b 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MESA3D_DEMOS
 	bool "mesa3d-demos"
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
 		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	help
diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index 9b60dc9..2db7f56 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -11,11 +11,11 @@ MESA3D_DEMOS_AUTORECONF = YES
 MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
-ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu
-MESA3D_DEMOS_CONF_OPTS += --enable-gl
+ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
+MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
+MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
 else
-MESA3D_DEMOS_CONF_OPTS += --disable-gl
+MESA3D_DEMOS_CONF_OPTS += --disable-gl --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
