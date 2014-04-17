From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 22:55:33 +0200
Subject: [Buildroot] [git commit] package/x11-video-drivers: do not select,
	but depends on mesa3d
Message-ID: <20140417210125.2B3419C846@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50af49ed64983cd258d02dd018d37da3311ddf2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, X.Org drivers that need mesa3d forcibly select it.

We'll soon switch mesa3d to being a provider of the full OpenGL virtual
package, to come in a later patch.

It is bad practice to select a provider, as it can generate configuration
inconsistencies.

So, switch all X.Org video driver that need mesa3d to actually depend on
it, rather than forcibly select it.

To be noted: xf86-video-mach64 already used a 'depends on' rather
than a 'select'.

At the same time, move the intel drivers dependencies to the top.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in     |    5 ++++-
 package/x11r7/xdriver_xf86-video-glint/Config.in   |    5 ++++-
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    8 ++++++--
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    3 +++
 package/x11r7/xdriver_xf86-video-mga/Config.in     |    5 ++++-
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |    5 ++++-
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    5 ++++-
 package/x11r7/xdriver_xf86-video-savage/Config.in  |    5 ++++-
 package/x11r7/xdriver_xf86-video-sis/Config.in     |    5 ++++-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |    5 ++++-
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    5 ++++-
 11 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index d8bb029..a555fa3 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
@@ -13,3 +13,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  ATI video driver
+
+comment "xf86-video-ati needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index bd92788..acae30b 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
@@ -13,3 +13,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  GLINT/Permedia video driver
+
+comment "xf86-video-glint needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 83b714a..69a9e78 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
+	depends on (BR2_i386 || BR2_x86_64)
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -7,7 +9,9 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
-	select BR2_PACKAGE_MESA3D
-	depends on (BR2_i386 || BR2_x86_64)
 	help
 	  Intel video driver
+
+comment "xf86-video-intel needs mesa3d"
+	depends on (BR2_i386 || BR2_x86_64)
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index 674071c..42535e4 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -9,3 +9,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  mach64 video driver
+
+comment "xf86-video-mach64 needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index 2fc3837..a504ec0 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	bool "xf86-video-mga"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
@@ -12,3 +12,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  Matrox video driver
+
+comment "xf86-video-mga needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 24b74bc..db27eef 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XLIB_LIBXVMC
@@ -14,3 +14,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	help
 	  Openchrome, A free and Open Source video driver for the VIA/S3G
 	  UniChrome and UniChrome Pro graphics chipsets.
+
+comment "xf86-video-openchrome needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 07e3142..647156f 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
-	select BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -8,3 +8,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  R128 video driver
+
+comment "xf86-video-r128 needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index 93a731e..77dde87 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	bool "xf86-video-savage"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -11,3 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  S3 Savage video driver
+
+comment "xf86-video-savage needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index e184505..3c86bd4 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -13,3 +13,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  SiS and XGI video driver
+
+comment "xf86-video-sis needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 811eba2..96a69ba 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	bool "xf86-video-tdfx"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
@@ -11,3 +11,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  3Dfx video driver
+
+comment "xf86-video-tdfx needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index a4d2052..2e6b24d 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	bool "xf86-video-vmware"
-	select BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
@@ -10,3 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  VMware SVGA video driver
+
+comment "xf86-video-vmware needs mesa3d"
+	depends on !BR2_PACKAGE_MESA3D
