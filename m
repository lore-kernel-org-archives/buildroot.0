From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  9 Nov 2013 16:59:48 +0100
Subject: [Buildroot] [PATCH 1/2] qt5base: fix rpi/egl support
	(vc_dispmanx_element_change_attributes proto mismatch)
Message-ID: <1384012789-13716-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch from upstream already included in the next 5.2 release

Fixes:
	http://autobuild.buildroot.net/results/347/347577bf1dee0fec3302a45f278eb253118a5b6f/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ate-vc_dispmanx_element_change_attributes.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch

diff --git a/package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch b/package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch
new file mode 100644
index 0000000..417970d
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0006-qeglfshooksrpi-update-vc_dispmanx_element_change_attributes.patch
@@ -0,0 +1,44 @@
+From 90005fae17acc994948aa5a79fc262fd07b69865 Mon Sep 17 00:00:00 2001
+From: Dario Freddi <dario.freddi@ispirata.com>
+Date: Fri, 13 Sep 2013 12:10:03 +0200
+Subject: [PATCH] qeglfshooksrpi: update vc_dispmanx_element_change_attributes
+
+Remove the extern prototype as it's now defined in latest
+firmware headers correctly. Moreover, the signature of the function
+changed. This patch fixes both issues.
+
+Change-Id: I0114b436dbaf5a171e6429a1e3760e292c7152cf
+Reviewed-by: Andy Nichols <andy.nichols@digia.com>
+---
+ .../devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp   |    8 +-------
+ 1 files changed, 1 insertions(+), 7 deletions(-)
+
+diff --git a/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp b/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
+index 9b48113..add96bf 100644
+--- a/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
++++ b/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
+@@ -88,12 +88,6 @@ static EGLNativeWindowType createDispmanxLayer(const QPoint &pos, const QSize &s
+     return eglWindow;
+ }
+ 
+-// this function is not part of debian squeeze headers
+-extern "C" int VCHPOST_ vc_dispmanx_element_change_attributes(DISPMANX_UPDATE_HANDLE_T update,
+-    DISPMANX_ELEMENT_HANDLE_T element, uint32_t change_flags, int32_t layer,
+-    uint8_t opacity, const VC_RECT_T *dest_rect, const VC_RECT_T *src_rect,
+-    DISPMANX_RESOURCE_HANDLE_T mask, VC_IMAGE_TRANSFORM_T transform);
+-
+ // these constants are not in any headers (yet)
+ #define ELEMENT_CHANGE_LAYER          (1<<0)
+ #define ELEMENT_CHANGE_OPACITY        (1<<1)
+@@ -128,7 +122,7 @@ static void moveDispmanxLayer(EGLNativeWindowType window, const QPoint &pos)
+                                           &dst_rect,
+                                           NULL,
+                                           0,
+-                                          (VC_IMAGE_TRANSFORM_T)0);
++                                          (DISPMANX_TRANSFORM_T)0);
+ 
+     vc_dispmanx_update_submit_sync(dispman_update);
+ }
+-- 
+1.7.1
+
-- 
1.8.4.2
