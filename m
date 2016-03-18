From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:18:15 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-imx-viv: bump to
	version 5.0.11 p7.4
Message-ID: <20160318223205.50B1980800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d136caad35cada63feb34f8ce951023e5c20afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- License changed to MIT.
- Fix GCC5.2 build.

Also add a patch pulled from Yocto for the following reason:
The 'swaprep.h' is an internal Xorg header and is not being installed
anymore. The swap features are provided by the 'misc.h' header now.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/19935f57
https://github.com/Freescale/meta-fsl-arm/commit/277cef92

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Note that the X server must be started with the "noreset" option to
avoid crashes when closing X apps.
 # X -noreset

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-dix-internal-header-usage.patch    | 31 ++++++++++++++++++++++
 .../xdriver_xf86-video-imx-viv.hash                |  2 +-
 .../xdriver_xf86-video-imx-viv.mk                  |  6 ++---
 3 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
new file mode 100644
index 0000000..f146ba3
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
@@ -0,0 +1,31 @@
+From 80c419dddf6483873503d90694c4b4ae34ffa5e4 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 2 Dec 2015 13:50:57 +0000
+Subject: [PATCH] Remove 'dix' internal header usage
+Organization: O.S. Systems Software LTDA.
+
+The 'swaprep.h' is an internal Xorg header and is not being installed
+anymore. The swap features are provided by the 'misc.h' header now.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ EXA/src/vivante_extension/vivante_ext.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/EXA/src/vivante_extension/vivante_ext.c b/EXA/src/vivante_extension/vivante_ext.c
+index 0d1085b..1ffbb1b 100644
+--- a/EXA/src/vivante_extension/vivante_ext.c
++++ b/EXA/src/vivante_extension/vivante_ext.c
+@@ -40,7 +40,6 @@
+ #include "cursorstr.h"
+ #include "scrnintstr.h"
+ #include "servermd.h"
+-#include "swaprep.h"
+ #include "drm.h"
+ #include "xf86Module.h"
+ #include "globals.h"
+-- 
+2.1.4
+
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index 72608dd..9a16569 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	ab6a896cafba324105d26f52b7dad2c41d04d75cc9e48b66e8041a95660a04ee  xserver-xorg-video-imx-viv-5.0.11.p7.1.tar.gz
+sha256	3effaf42bde64da8fad2dfe0dcef12d1cfbbbe189511dbd4612442129fd832cc  xserver-xorg-video-imx-viv-5.0.11.p7.4.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index 884b30e..a1b32b1 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p7.1
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p7.4
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
 	xproto_xproto xproto_xf86driproto libdrm
-XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = GPLv2+
-XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE_FILES = COPYING-GPL-2
+XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE = MIT
+XDRIVER_XF86_VIDEO_IMX_VIV_LICENSE_FILES = COPYING-MIT
 XDRIVER_XF86_VIDEO_IMX_VIV_INSTALL_STAGING = YES
 XDRIVER_XF86_VIDEO_IMX_VIV_MAKE_CMD = $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/EXA/src -f makefile.linux
 
