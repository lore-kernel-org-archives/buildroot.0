From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  2 Apr 2014 21:46:34 +0200
Subject: [Buildroot] [PATCH v2 20/41] DO NOT COMMIT
	package/x11-video-drivers: do not select, but depends on mesa3d
In-Reply-To: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396468015-1724-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396468015-1724-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

mesa3d is now a full-openGL provider for the virtual package libgl.

It is currently the only provider, but we can safely envision more
providers to be added later: NVidia's binary blob, ATI's fglrx
binary blob... So, forcibly selecting mesa3d would come clashing
with other full-openGL providers.

Also, since mesa3d has implementations for different chips, selecting
mesa3d is not enough. There would still be the need to select the
required galium driver.

So, just transform all instances of 'select mesa3d' to 'depends on
mesa3d'.

To be noted: xf86-video-mach64 already used a 'depends on' rather
than a 'select'.

At the same time, move the intel drivers dependencies to the top.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in        |    5 ++++-
 package/x11r7/xdriver_xf86-video-glint/Config.in      |    5 ++++-
 package/x11r7/xdriver_xf86-video-intel/Config.in      |    7 +++++--
 package/x11r7/xdriver_xf86-video-mach64/Config.in     |    3 +++
 package/x11r7/xdriver_xf86-video-mga/Config.in        |    5 ++++-
 package/x11r7/xdriver_xf86-video-openchrome/Config.in |    5 ++++-
 package/x11r7/xdriver_xf86-video-r128/Config.in       |    5 ++++-
 package/x11r7/xdriver_xf86-video-savage/Config.in     |    5 ++++-
 package/x11r7/xdriver_xf86-video-sis/Config.in        |    5 ++++-
 package/x11r7/xdriver_xf86-video-tdfx/Config.in       |    5 ++++-
 package/x11r7/xdriver_xf86-video-vmware/Config.in     |    5 ++++-
 11 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 3c0cac3..3beee68 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
+	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
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
index 83b714a..8781e1c 100644
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
@@ -7,7 +9,8 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	select BR2_PACKAGE_XLIB_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
-	select BR2_PACKAGE_MESA3D
-	depends on (BR2_i386 || BR2_x86_64)
 	help
 	  Intel video driver
+
+comment "xf86-video-intel needs mesa3d"
+	depends on BR2_PACKAGE_MESA3D
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
-- 
1.7.10.4
