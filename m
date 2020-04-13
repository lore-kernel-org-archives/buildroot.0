From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 09:20:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-geode:
 bump version to 2.11.20
Message-ID: <20200413072045.349168-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream:
https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=09aaa3d1fae4aeb099b16e7a046151761bcdea95
https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=8382e6bb0c76a8029493eae3f2d7a3dbfd0cfc12

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
The version bump was not announced on the x.org mailinglist, therefore
the sha256 hash of the source tarball had to be computed locally.

 .../0001-Remove-call-to-LoaderGetOS.patch     | 53 -------------------
 ...ANDR-initialization-for-xserver-1.20.patch | 35 ------------
 .../xdriver_xf86-video-geode.hash             |  3 +-
 .../xdriver_xf86-video-geode.mk               |  2 +-
 4 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch

diff --git a/package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch b/package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch
deleted file mode 100644
index 18e4a60da0..0000000000
--- a/package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 09aaa3d1fae4aeb099b16e7a046151761bcdea95 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 24 Jan 2017 09:53:06 -0500
-Subject: Remove call to LoaderGetOS
-
-On OSes that don't have a /dev/videox we'll just fail the open() and not
-initialize the Xv adaptor.
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=09aaa3d1fae4aeb099b16e7a046151761bcdea95
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/z4l.c | 13 -------------
- 1 file changed, 13 deletions(-)
-
-diff --git a/src/z4l.c b/src/z4l.c
-index eccefe8..be0d345 100644
---- a/src/z4l.c
-+++ b/src/z4l.c
-@@ -1709,7 +1709,6 @@ _X_EXPORT XF86ModuleData ztvModuleData = { &z4lVersionRec, z4lSetup, NULL };
- static pointer
- z4lSetup(pointer module, pointer opts, int *errmaj, int *errmin)
- {
--    const char *osname;
-     static Bool setupDone = FALSE;
- 
-     if (setupDone != FALSE) {
-@@ -1719,19 +1718,7 @@ z4lSetup(pointer module, pointer opts, int *errmaj, int *errmin)
-     }
- 
-     setupDone = TRUE;
--    LoaderGetOS(&osname, NULL, NULL, NULL);
--
--    if (osname == NULL || strcmp(osname, "linux") != 0) {
--        if (errmaj)
--            *errmaj = LDR_BADOS;
--        if (errmin)
--            *errmin = 0;
--
--        return NULL;
--    }
--
-     xf86AddDriver(&Z4l, module, 0);
--
-     return (pointer) 1;
- }
- 
--- 
-cgit v1.1
-
diff --git a/package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch b/package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch
deleted file mode 100644
index 37e4a25e76..0000000000
--- a/package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8382e6bb0c76a8029493eae3f2d7a3dbfd0cfc12 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Mon, 5 Mar 2018 10:28:15 -0500
-Subject: gx: Fix RANDR initialization for xserver 1.20
-
-xf86DisableRandR() doesn't exist anymore, and we don't need it anyway,
-the core code will notice that we set up RANDR ourselves.
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=8382e6bb0c76a8029493eae3f2d7a3dbfd0cfc12
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/gx_driver.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/gx_driver.c b/src/gx_driver.c
-index ab57df1..4de336e 100644
---- a/src/gx_driver.c
-+++ b/src/gx_driver.c
-@@ -1426,7 +1426,9 @@ GXScreenInit(SCREEN_INIT_ARGS_DECL)
- 
-     /* Set up RandR */
- 
-+#if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 24
-     xf86DisableRandR();         /* We provide our own RandR goodness */
-+#endif
- 
-     /* Try to set up the shadow FB for rotation */
- 
--- 
-cgit v1.1
-
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index 07e4abf801..7a66c28b52 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,4 +1,3 @@
-# From https://lists.x.org/archives/xorg-announce/2016-December/002750.html
-sha256  c6694c21ee3d9560f6e925925ef1d3818b1988e899b6a0592dbae597c87ac97e  xf86-video-geode-2.11.19.tar.bz2
 # Locally calculated
+sha256  f497d0bfb09f36c72e3467e2d701f57f6b03ab8992c5d570e66582f714f84d64  xf86-video-geode-2.11.20.tar.bz2
 sha256  3994ef7cee54f0935a4b57b1c34efd904da567931dd9e1a2d9390d22c8332ea2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 54616f65fe..dbeae1aa65 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.19
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.20
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
-- 
2.25.0
