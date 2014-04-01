From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue,  1 Apr 2014 18:16:12 +0200
Subject: [Buildroot] [PATCH 2/2] Add supporit for Vivante xdriver
In-Reply-To: <1396368972-8690-1-git-send-email-jezz@sysmic.org>
References: <533A8F6C.1010606@gmail.com>
 <1396368972-8690-1-git-send-email-jezz@sysmic.org>
Message-ID: <1396368972-8690-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/Config.in                            |  1 +
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 22 ++++++
 ...mx-viv-001-Register-autotools-subprojects.patch | 31 +++++++++
 ...driver_xf86-video-imx-viv-002-Fix-compile.patch | 80 ++++++++++++++++++++++
 .../xdriver_xf86-video-imx-viv.mk                  | 17 +++++
 5 files changed, 151 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-001-Register-autotools-subprojects.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-002-Fix-compile.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 8685ca1..73dcc45 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -160,6 +160,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-glide/Config.in
 		source package/x11r7/xdriver_xf86-video-glint/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
+		source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 		source package/x11r7/xdriver_xf86-video-intel/Config.in
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
new file mode 100644
index 0000000..3369d79
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
+       bool "xf86-video-imx-viv"
+       depends on BR2_arm
+       depends on BR2_PACKAGE_GPU_VIV_BIN_MX6Q
+       select BR2_PACKAGE_XPROTO_XPROTO
+       select BR2_PACKAGE_XPROTO_XF86DRIPROTO
+       help
+         X.Org driver for iMX6 GPU (Vivante)
+
+         To use this driver, add correct configuration to your 
+         /etc/X11/xorg.conf:
+
+         Section "Device"
+            [...]
+            Driver          "vivante"
+            Option          "vivante_fbdev" "/dev/fbX"
+         EndSection
+
+         Don't forget to load galcore.ko create /dev/galcore before to 
+         use this driver (else, Xorg will exit with an obscur message 
+         like "Segmentation fault at address 0xc").
+
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-001-Register-autotools-subprojects.patch b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-001-Register-autotools-subprojects.patch
new file mode 100644
index 0000000..12fe96c
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-001-Register-autotools-subprojects.patch
@@ -0,0 +1,31 @@
+--- /dev/null   2013-10-21 17:17:33.000000000 +0000
++++ b/configure.ac       2014-03-21 08:18:39.677026318 +0000
+@@ -0,0 +1,5 @@
++AC_INIT([arm], [1.0])
++AM_INIT_AUTOMAKE([foreign])
++AC_CONFIG_FILES([Makefile])
++AC_CONFIG_SUBDIRS([EXA DRI_1.10.4])
++AC_OUTPUT
+--- /dev/null   2013-10-21 17:17:33.000000000 +0000
++++ b/Makefile.am        2014-03-21 08:18:13.436901930 +0000
+@@ -0,0 +1,1 @@
++SUBDIRS = EXA DRI_1.10.4
+--- /dev/null   2013-10-21 17:17:33.000000000 +0000
++++ b/DRI_1.10.4/m4/.empty        2014-03-21 08:18:13.436901930 +0000
+@@ -0,0 +1,1 @@
++empty
+--- /dev/null   2013-10-21 17:17:33.000000000 +0000
++++ b/EXA/m4/.empty        2014-03-21 08:18:13.436901930 +0000
+@@ -0,0 +1,1 @@
++empty
+--- a/install.sh 2012-11-19 01:58:13.000000000 +0000
++++ /dev/null   2013-10-21 17:17:33.000000000 +0000
+@@ -1,7 +0,0 @@
+-#!/bin/sh -e
+-
+-cd EXA
+-make install
+-cd ../DRI_1.10.4
+-make install
+-cd ..
+
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-002-Fix-compile.patch b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-002-Fix-compile.patch
new file mode 100644
index 0000000..1b13d4f
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv-002-Fix-compile.patch
@@ -0,0 +1,80 @@
+--- a/DRI_1.10.4/src/dri.c	2012-11-19 01:58:13.000000000 +0000
++++ b/DRI_1.10.4/src/dri.c	2014-03-22 09:11:54.257608982 +0000
+@@ -70,7 +70,6 @@
+ #include "mipointer.h"
+ #include "xf86_OSproc.h"
+ #include "inputstr.h"
+-#include "xf86VGAarbiter.h"
+ #include "pixmapstr.h"
+ #include "pixmap.h"
+ #include "vivante_priv.h"
+--- a/DRI_1.10.4/src/xf86dri.c	2012-11-19 01:58:13.000000000 +0000
++++ b/DRI_1.10.4/src/xf86dri.c	2014-03-22 09:12:42.985839910 +0000
+@@ -89,7 +89,6 @@
+ )
+ {
+     xXF86DRIQueryVersionReply rep;
+-    register int n;
+ 
+     REQUEST_SIZE_MATCH(xXF86DRIQueryVersionReq);
+     rep.type = X_Reply;
+@@ -99,11 +98,11 @@
+     rep.minorVersion = SERVER_XF86DRI_MINOR_VERSION;
+     rep.patchVersion = SERVER_XF86DRI_PATCH_VERSION;
+     if (client->swapped) {
+-    	swaps(&rep.sequenceNumber, n);
+-    	swapl(&rep.length, n);
+-	swaps(&rep.majorVersion, n);
+-	swaps(&rep.minorVersion, n);
+-	swapl(&rep.patchVersion, n);
++    	swaps(&rep.sequenceNumber);
++    	swapl(&rep.length);
++	swaps(&rep.majorVersion);
++	swaps(&rep.minorVersion);
++	swapl(&rep.patchVersion);
+     }
+     WriteToClient(client, sizeof(xXF86DRIQueryVersionReply), (char *)&rep);
+     return Success;
+@@ -116,7 +115,6 @@
+ {
+     xXF86DRIQueryDirectRenderingCapableReply	rep;
+     Bool isCapable;
+-    register int n;
+ 
+     REQUEST(xXF86DRIQueryDirectRenderingCapableReq);
+     REQUEST_SIZE_MATCH(xXF86DRIQueryDirectRenderingCapableReq);
+@@ -139,8 +137,8 @@
+ 	rep.isCapable = 0;
+ 
+     if (client->swapped) {
+-    	swaps(&rep.sequenceNumber, n);
+-    	swapl(&rep.length, n);
++    	swaps(&rep.sequenceNumber);
++    	swapl(&rep.length);
+     }
+ 
+     WriteToClient(client,
+@@ -598,9 +596,8 @@
+     register ClientPtr	client
+ )
+ {
+-    register int n;
+     REQUEST(xXF86DRIQueryVersionReq);
+-    swaps(&stuff->length, n);
++    swaps(&stuff->length);
+     return ProcXF86DRIQueryVersion(client);
+ }
+ 
+@@ -609,10 +606,9 @@
+     register ClientPtr client
+ )
+ {
+-    register int n;
+     REQUEST(xXF86DRIQueryDirectRenderingCapableReq);
+-    swaps(&stuff->length, n);
+-    swapl(&stuff->screen, n);
++    swaps(&stuff->length);
++    swapl(&stuff->screen);
+     return ProcXF86DRIQueryDirectRenderingCapable(client);
+ }
+ 
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
new file mode 100644
index 0000000..9fd24bc
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# xdriver_xf86-video-imx-viv
+#
+################################################################################
+
+# FIXME: Use $(FREESCALE_IMX_VERSION)
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 1.1.0
+XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
+XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
+XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = gpu-viv-bin-mx6q xserver_xorg-server \
+	xproto_xproto xlib_libpciaccess xproto_xf86driproto
+XDRIVER_XF86_VIDEO_IMX_VIV_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_IMX_VIV_CONF_ENV += CFLAGS+=" -I../../DRI_1.10.4/src/ -I../../EXA/src/vivante_gal/"
+
+$(eval $(autotools-package))
+
-- 
1.9.1
