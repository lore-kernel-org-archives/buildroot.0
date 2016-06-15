From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:48:40 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-imx-viv: bump version
	to 5.0.11-p8.4
Message-ID: <20160615204848.A25F380809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c162e288d9fa5502c0a271bfef875cf4b460a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch.
Add patch from Yocto to not use git for versioning.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/06a0574
https://github.com/Freescale/meta-fsl-arm/commit/076df90

The following xorg.conf was used in order to force the use of the
vivante module:
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-xserver/xserver-xf86-config/mx6/xorg.conf

Note that the X server must be started with the "noreset" option to
avoid crashes when closing X apps.
Tested with:
 # X -noreset &
 # cd /usr/share/examples/viv_samples/vdk/
 # DISPLAY=:0 ./tutorial7

Signed-off-by: Andrew Webster <awebster@arcx.com>
[Thomas: add upstream reference in the patch, as suggested by Gary.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Remove-dix-internal-header-usage.patch    | 31 --------
 ...001-Stop-using-Git-to-write-local-version.patch | 90 ++++++++++++++++++++++
 .../xdriver_xf86-video-imx-viv.hash                |  3 +-
 .../xdriver_xf86-video-imx-viv.mk                  |  2 +-
 4 files changed, 92 insertions(+), 34 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
deleted file mode 100644
index f146ba3..0000000
--- a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Remove-dix-internal-header-usage.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 80c419dddf6483873503d90694c4b4ae34ffa5e4 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Wed, 2 Dec 2015 13:50:57 +0000
-Subject: [PATCH] Remove 'dix' internal header usage
-Organization: O.S. Systems Software LTDA.
-
-The 'swaprep.h' is an internal Xorg header and is not being installed
-anymore. The swap features are provided by the 'misc.h' header now.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- EXA/src/vivante_extension/vivante_ext.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/EXA/src/vivante_extension/vivante_ext.c b/EXA/src/vivante_extension/vivante_ext.c
-index 0d1085b..1ffbb1b 100644
---- a/EXA/src/vivante_extension/vivante_ext.c
-+++ b/EXA/src/vivante_extension/vivante_ext.c
-@@ -40,7 +40,6 @@
- #include "cursorstr.h"
- #include "scrnintstr.h"
- #include "servermd.h"
--#include "swaprep.h"
- #include "drm.h"
- #include "xf86Module.h"
- #include "globals.h"
--- 
-2.1.4
-
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch
new file mode 100644
index 0000000..2117e72
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/0001-Stop-using-Git-to-write-local-version.patch
@@ -0,0 +1,90 @@
+From 69a92f4576a1e789ba2fcf957164d2c4013020c5 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Wed, 2 Dec 2015 13:36:25 +0000
+Subject: [PATCH] Stop using Git to write local version
+Organization: O.S. Systems Software LTDA.
+
+The standard version does not use a Git repository so we should not
+use Git to identify the commit of the build as it can end getting the
+version from a wrong repository and can be misleading.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+[Downloaded from
+https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-driver/xf86-video-imxfb-vivante/Stop-using-Git-to-write-local-version.patch]
+Signed-off-by: Andrew Webster <awebster@arcx.com>
+---
+ EXA/src/makefile.tc         | 6 +++---
+ FslExt/src/makefile.tc      | 6 +++---
+ util/autohdmi/makefile.tc   | 6 +++---
+ util/pandisplay/makefile.tc | 6 +++---
+ 4 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/EXA/src/makefile.tc b/EXA/src/makefile.tc
+index 0b9a9e6..ec6e68d 100644
+--- a/EXA/src/makefile.tc
++++ b/EXA/src/makefile.tc
+@@ -52,8 +52,8 @@ prefix ?= /usr
+ sysroot ?= /
+ 
+ # get git commit number
+-COMMITNR := `git log -n 1 --format=%H`
+-DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
+-LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
++#COMMITNR := `git log -n 1 --format=%H`
++#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
++#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
+ 
+ 
+diff --git a/FslExt/src/makefile.tc b/FslExt/src/makefile.tc
+index 0b9a9e6..ec6e68d 100644
+--- a/FslExt/src/makefile.tc
++++ b/FslExt/src/makefile.tc
+@@ -52,8 +52,8 @@ prefix ?= /usr
+ sysroot ?= /
+ 
+ # get git commit number
+-COMMITNR := `git log -n 1 --format=%H`
+-DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
+-LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
++#COMMITNR := `git log -n 1 --format=%H`
++#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
++#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
+ 
+ 
+diff --git a/util/autohdmi/makefile.tc b/util/autohdmi/makefile.tc
+index c9de0a6..d0a468c 100644
+--- a/util/autohdmi/makefile.tc
++++ b/util/autohdmi/makefile.tc
+@@ -64,8 +64,8 @@ prefix ?= /usr
+ sysroot ?= /
+ 
+ # get git commit number
+-COMMITNR := `git log -n 1 --format=%H`
+-DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
+-LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
++#COMMITNR := `git log -n 1 --format=%H`
++#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
++#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
+ 
+ 
+diff --git a/util/pandisplay/makefile.tc b/util/pandisplay/makefile.tc
+index 28732b9..bf54c20 100644
+--- a/util/pandisplay/makefile.tc
++++ b/util/pandisplay/makefile.tc
+@@ -64,8 +64,8 @@ prefix ?= /usr
+ sysroot ?= /
+ 
+ # get git commit number
+-COMMITNR := `git log -n 1 --format=%H`
+-DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
+-LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
++#COMMITNR := `git log -n 1 --format=%H`
++#DIRTY := `git diff-index --quiet HEAD || echo '-dirty'`
++#LOCAL_CFLAGS += -DCOMMIT="${COMMITNR}${DIRTY}"
+ 
+ 
+-- 
+2.1.4
+
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index 9a16569..2cdf2d0 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1,2 +1 @@
-# locally computed
-sha256	3effaf42bde64da8fad2dfe0dcef12d1cfbbbe189511dbd4612442129fd832cc  xserver-xorg-video-imx-viv-5.0.11.p7.4.tar.gz
+sha256	ddb6de9e00ce0b22f6c905eaf6694424413eade53ef6cd3b36e20ac99dcc0e0f  xserver-xorg-video-imx-viv-5.0.11.p8.4.tar.gz
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
index a1b32b1..9ce08ef 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p7.4
+XDRIVER_XF86_VIDEO_IMX_VIV_VERSION = 5.0.11.p8.4
 XDRIVER_XF86_VIDEO_IMX_VIV_SITE = $(FREESCALE_IMX_SITE)
 XDRIVER_XF86_VIDEO_IMX_VIV_SOURCE = xserver-xorg-video-imx-viv-$(XDRIVER_XF86_VIDEO_IMX_VIV_VERSION).tar.gz
 XDRIVER_XF86_VIDEO_IMX_VIV_DEPENDENCIES = imx-gpu-viv xserver_xorg-server \
