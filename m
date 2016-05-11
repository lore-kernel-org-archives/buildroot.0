From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:14:20 +0200
Subject: [Buildroot] [git commit] package/kodi-screensaver/visualisation-*:
	allow OpenGL build on arm
Message-ID: <20160511141435.2119381F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71664e775c5e6632d0f103c7bd06e3e1d964c9ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kodi depends on egl/gles on arm, our Kconfig option BR2_PACKAGE_KODI_GL
reflects this, it depends on !BR2_arm.

This option is wrongly used in many Kodi addons needing OpenGL, they
can be compiled even if Kodi itself uses egl/gles. This patch changes
the dependency on BR2_PACKAGE_KODI_GL to BR2_PACKAGE_HAS_LIBGL.

Tested using this defconfig:

BR2_arm=y
BR2_cortex_a17=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE=y
BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS=y
BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS=y
BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH=y
BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC=y
BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS=y
BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG=y
BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE=y
BR2_PACKAGE_KODI_SCREENSAVER_PYRO=y
BR2_PACKAGE_KODI_SCREENSAVER_RSXS=y
BR2_PACKAGE_KODI_SCREENSAVER_STARS=y
BR2_PACKAGE_KODI_VISUALISATION_FISHBMC=y
BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN=y
BR2_PACKAGE_KODI_VISUALISATION_GOOM=y
BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY=y
BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM=y
BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE=y
BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y

$ grep PACKAGE_HAS_LIB .config
BR2_PACKAGE_HAS_LIBGL=y
BR2_PACKAGE_HAS_LIBEGL=y
BR2_PACKAGE_HAS_LIBGLES=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-screensaver-asteroids/Config.in    | 4 ++--
 package/kodi-screensaver-asterwave/Config.in    | 4 ++--
 package/kodi-screensaver-biogenesis/Config.in   | 4 ++--
 package/kodi-screensaver-cpblobs/Config.in      | 4 ++--
 package/kodi-screensaver-crystalmorph/Config.in | 4 ++--
 package/kodi-screensaver-greynetic/Config.in    | 4 ++--
 package/kodi-screensaver-matrixtrails/Config.in | 4 ++--
 package/kodi-screensaver-pingpong/Config.in     | 4 ++--
 package/kodi-screensaver-planestate/Config.in   | 4 ++--
 package/kodi-screensaver-pyro/Config.in         | 4 ++--
 package/kodi-screensaver-rsxs/Config.in         | 4 ++--
 package/kodi-screensaver-stars/Config.in        | 4 ++--
 package/kodi-visualisation-fishbmc/Config.in    | 4 ++--
 package/kodi-visualisation-fountain/Config.in   | 4 ++--
 package/kodi-visualisation-goom/Config.in       | 4 ++--
 15 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/Config.in b/package/kodi-screensaver-asteroids/Config.in
index 3aa03fb..ccc2aba 100644
--- a/package/kodi-screensaver-asteroids/Config.in
+++ b/package/kodi-screensaver-asteroids/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS
 	bool "kodi-screensaver-asteroids"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Asteroids screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.asteroids
 
 comment "kodi-screensaver-asteroids needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
index 05ce58a..bd5db73 100644
--- a/package/kodi-screensaver-asterwave/Config.in
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 	bool "kodi-screensaver-asterwave"
-	depends on BR2_PACKAGE_KODI_GL # libsoil
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu, libsoil
 	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBSOIL
 	help
@@ -9,4 +9,4 @@ config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 	  https://github.com/notspiff/screensaver.asterwave
 
 comment "kodi-screensaver-asterwave needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
index f2789a0..cdc2d91 100644
--- a/package/kodi-screensaver-biogenesis/Config.in
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
 	bool "kodi-screensaver-biogenesis"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  BioGenesis screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.biogenesis
 
 comment "kodi-screensaver-biogenesis needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
index aa39f15..e80ea0e 100644
--- a/package/kodi-screensaver-cpblobs/Config.in
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
 	bool "kodi-screensaver-cpblobs"
-	depends on BR2_PACKAGE_KODI_GL # libsoil
+	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
 	select BR2_PACKAGE_LIBSOIL
 	help
 	  CpBlobs screensaver for Kodi
@@ -8,4 +8,4 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
 	  https://github.com/notspiff/screensaver.cpblobs
 
 comment "kodi-screensaver-cpblobs needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-crystalmorph/Config.in b/package/kodi-screensaver-crystalmorph/Config.in
index 75c8845..1303d22 100644
--- a/package/kodi-screensaver-crystalmorph/Config.in
+++ b/package/kodi-screensaver-crystalmorph/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH
 	bool "kodi-screensaver-crystalmorph"
-	depends on BR2_PACKAGE_KODI_GL # libglu
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	help
 	  CrystalMorph screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.crystalmorph
 
 comment "kodi-screensaver-crystalmorph needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
index 611ba51..ce636b8 100644
--- a/package/kodi-screensaver-greynetic/Config.in
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
 	bool "kodi-screensaver-greynetic"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Greynetic screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.greynetic
 
 comment "kodi-screensaver-greynetic needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
index 50629d8..e2d3f71 100644
--- a/package/kodi-screensaver-matrixtrails/Config.in
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
 	bool "kodi-screensaver-matrixtrails"
-	depends on BR2_PACKAGE_KODI_GL # libsoil
+	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
 	select BR2_PACKAGE_LIBSOIL
 	help
 	  Matrix trails screensaver for Kodi
@@ -8,4 +8,4 @@ config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
 	  https://github.com/notspiff/screensaver.matrixtrails
 
 comment "kodi-screensaver-matrixtrails needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
index aea0833..3971052 100644
--- a/package/kodi-screensaver-pingpong/Config.in
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
 	bool "kodi-screensaver-pingpong"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Ping-pong screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.pingpong
 
 comment "kodi-screensaver-pingpong needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-planestate/Config.in b/package/kodi-screensaver-planestate/Config.in
index 2f816b2..b63d70e 100644
--- a/package/kodi-screensaver-planestate/Config.in
+++ b/package/kodi-screensaver-planestate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
 	bool "kodi-screensaver-planestate"
-	depends on BR2_PACKAGE_KODI_GL # libsoil
+	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
 	select BR2_PACKAGE_LIBSOIL
 	help
 	  PlaneState screensaver for Kodi
@@ -8,4 +8,4 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE
 	  https://github.com/notspiff/screensaver.planestate
 
 comment "kodi-screensaver-planestate needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
index 35a2be2..982542d 100644
--- a/package/kodi-screensaver-pyro/Config.in
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
 	bool "kodi-screensaver-pyro"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Pyro screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.pyro
 
 comment "kodi-screensaver-pyro needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index 0698c7d..11546ad 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
-	depends on BR2_PACKAGE_KODI_GL # libglu
+	depends on BR2_PACKAGE_HAS_LIBGL # libglu
 	depends on BR2_PACKAGE_XORG7 # xlib_libXmu
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
@@ -9,4 +9,4 @@ config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	  https://github.com/notspiff/screensavers.rsxs
 
 comment "kodi-screensaver-rsxs depends on X.org and needs OpenGL"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
index 3c14773..bcfb47b 100644
--- a/package/kodi-screensaver-stars/Config.in
+++ b/package/kodi-screensaver-stars/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_SCREENSAVER_STARS
 	bool "kodi-screensaver-stars"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Starfield screensaver for Kodi
 
 	  https://github.com/notspiff/screensaver.stars
 
 comment "kodi-screensaver-stars needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
index 50472a9..9e2eabb 100644
--- a/package/kodi-visualisation-fishbmc/Config.in
+++ b/package/kodi-visualisation-fishbmc/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
 	bool "kodi-visualisation-fishbmc"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  Fische visualiser for Kodi
 
 	  https://github.com/notspiff/visualization.fishbmc
 
 comment "kodi-visualisation-fishbmc needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-visualisation-fountain/Config.in b/package/kodi-visualisation-fountain/Config.in
index 3eeef16..570d169 100644
--- a/package/kodi-visualisation-fountain/Config.in
+++ b/package/kodi-visualisation-fountain/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
 	bool "kodi-visualisation-fountain"
-	depends on BR2_PACKAGE_KODI_GL # libsoil
+	depends on BR2_PACKAGE_HAS_LIBGL # libsoil
 	select BR2_PACKAGE_LIBSOIL
 	help
 	  Fountain visualization for Kodi
@@ -8,4 +8,4 @@ config BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN
 	  https://github.com/notspiff/visualization.fountain
 
 comment "kodi-visualisation-fountain needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-visualisation-goom/Config.in b/package/kodi-visualisation-goom/Config.in
index 8577e61..de4d2ef 100644
--- a/package/kodi-visualisation-goom/Config.in
+++ b/package/kodi-visualisation-goom/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_KODI_VISUALISATION_GOOM
 	bool "kodi-visualisation-goom"
-	depends on BR2_PACKAGE_KODI_GL
+	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  GOOM visualiser for Kodi
 
 	  https://github.com/notspiff/visualization.goom
 
 comment "kodi-visualization-goom needs OpenGL"
-	depends on !BR2_PACKAGE_KODI_GL
+	depends on !BR2_PACKAGE_HAS_LIBGL
