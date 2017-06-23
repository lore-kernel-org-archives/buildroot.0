From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 Jun 2017 10:28:10 -0300
Subject: [Buildroot] [PATCH] glmark2: Bump to the latest version
Message-ID: <1498224490-13161-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The two patches are no longer needed with the latest upstream version,
so bump to the latest one.

Tested on imx6.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...NativeStateDRM-add-imx-drm-driver-support.patch | 25 -------------------
 ...eStateDRM-use-fixed-event-context-version.patch | 28 ----------------------
 package/glmark2/glmark2.hash                       |  2 +-
 package/glmark2/glmark2.mk                         |  2 +-
 4 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
 delete mode 100644 package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch

diff --git a/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch b/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
deleted file mode 100644
index 8eff81e..0000000
--- a/package/glmark2/0001-NativeStateDRM-add-imx-drm-driver-support.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 05ec5e4411fe3188f72305050b11513cb153c5ff Mon Sep 17 00:00:00 2001
-From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Tue, 14 Feb 2017 09:39:02 +0100
-Subject: [PATCH] NativeStateDRM: add imx-drm driver support
-
-Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
----
- src/native-state-drm.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
-index 4df75ec..454a24d 100644
---- a/src/native-state-drm.cpp
-+++ b/src/native-state-drm.cpp
-@@ -201,6 +201,7 @@ NativeStateDRM::init()
-     // driver (udev?).
-     static const char* drm_modules[] = {
-         "i915",
-+        "imx-drm",
-         "nouveau",
-         "radeon",
-         "vmgfx",
--- 
-2.11.0
-
diff --git a/package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch b/package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch
deleted file mode 100644
index c66f409..0000000
--- a/package/glmark2/0002-NativeStateDRM-use-fixed-event-context-version.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From: Lucas Stach <l.stach@pengutronix.de>
-Date: Wed, 31 May 2017 13:01:00 +0200
-Subject: [PATCH] NativeStateDRM: use fixed event context version
-
-Using the latest version is not a good idea, as the context content may
-change between versions.
-
-Fixes a segfault with new kernel and libdrm.
-
-Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- src/native-state-drm.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
-index 454a24d898ff..b9af996667dc 100644
---- a/src/native-state-drm.cpp
-+++ b/src/native-state-drm.cpp
-@@ -106,7 +106,7 @@ NativeStateDRM::flip()
-     FD_ZERO(&fds);
-     FD_SET(fd_, &fds);
-     drmEventContext evCtx;
--    evCtx.version = DRM_EVENT_CONTEXT_VERSION;
-+    evCtx.version = 2;
-     evCtx.page_flip_handler = page_flip_handler;
- 
-     while (waiting) {
diff --git a/package/glmark2/glmark2.hash b/package/glmark2/glmark2.hash
index 92c53e5..aeb8a78 100644
--- a/package/glmark2/glmark2.hash
+++ b/package/glmark2/glmark2.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 ea59bd267a88e2c773423eec43f7cb90b0ca1c369762e836dec575ebdcdcc012 glmark2-7215c0f337dae0b232535549c37fca441747a891.tar.gz
+sha256 8800f3cab0575df217adc166b181930e1f881efb6f764f35872993ee78dea5f0 glmark2-9b1070fe9c5cf908f323909d3c8cbed08022abe8.tar.gz
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index 4edc713..4eeaec7 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLMARK2_VERSION = 7215c0f337dae0b232535549c37fca441747a891
+GLMARK2_VERSION = 9b1070fe9c5cf908f323909d3c8cbed08022abe8
 GLMARK2_SITE = $(call github,glmark2,glmark2,$(GLMARK2_VERSION))
 GLMARK2_LICENSE = GPL-3.0+, SGIv1
 GLMARK2_LICENSE_FILES = COPYING COPYING.SGI
-- 
2.7.4
