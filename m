From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:50:18 +0100
Subject: [Buildroot] [git commit branch/2018.02.x]
 package/x11r7/xdriver_xf86-video-geode: add upstream commits to fix build
 errors
Message-ID: <20181115071809.8669183715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8188d4680c1a5686cc94dc06873922c3a7c0895e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes
http://autobuild.buildroot.net/results/a9b/a9baf6ecf147f336021edda20bb091b8aa071209/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34743203e1a003d3b713c62293b988f2778037a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Remove-call-to-LoaderGetOS.patch          | 53 ++++++++++++++++++++++
 ...Fix-RANDR-initialization-for-xserver-1.20.patch | 35 ++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch b/package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch
new file mode 100644
index 0000000000..18e4a60da0
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-geode/0001-Remove-call-to-LoaderGetOS.patch
@@ -0,0 +1,53 @@
+From 09aaa3d1fae4aeb099b16e7a046151761bcdea95 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 24 Jan 2017 09:53:06 -0500
+Subject: Remove call to LoaderGetOS
+
+On OSes that don't have a /dev/videox we'll just fail the open() and not
+initialize the Xv adaptor.
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=09aaa3d1fae4aeb099b16e7a046151761bcdea95
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/z4l.c | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/src/z4l.c b/src/z4l.c
+index eccefe8..be0d345 100644
+--- a/src/z4l.c
++++ b/src/z4l.c
+@@ -1709,7 +1709,6 @@ _X_EXPORT XF86ModuleData ztvModuleData = { &z4lVersionRec, z4lSetup, NULL };
+ static pointer
+ z4lSetup(pointer module, pointer opts, int *errmaj, int *errmin)
+ {
+-    const char *osname;
+     static Bool setupDone = FALSE;
+ 
+     if (setupDone != FALSE) {
+@@ -1719,19 +1718,7 @@ z4lSetup(pointer module, pointer opts, int *errmaj, int *errmin)
+     }
+ 
+     setupDone = TRUE;
+-    LoaderGetOS(&osname, NULL, NULL, NULL);
+-
+-    if (osname == NULL || strcmp(osname, "linux") != 0) {
+-        if (errmaj)
+-            *errmaj = LDR_BADOS;
+-        if (errmin)
+-            *errmin = 0;
+-
+-        return NULL;
+-    }
+-
+     xf86AddDriver(&Z4l, module, 0);
+-
+     return (pointer) 1;
+ }
+ 
+-- 
+cgit v1.1
+
diff --git a/package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch b/package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch
new file mode 100644
index 0000000000..37e4a25e76
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-geode/0002-gx-Fix-RANDR-initialization-for-xserver-1.20.patch
@@ -0,0 +1,35 @@
+From 8382e6bb0c76a8029493eae3f2d7a3dbfd0cfc12 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Mon, 5 Mar 2018 10:28:15 -0500
+Subject: gx: Fix RANDR initialization for xserver 1.20
+
+xf86DisableRandR() doesn't exist anymore, and we don't need it anyway,
+the core code will notice that we set up RANDR ourselves.
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=8382e6bb0c76a8029493eae3f2d7a3dbfd0cfc12
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/gx_driver.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gx_driver.c b/src/gx_driver.c
+index ab57df1..4de336e 100644
+--- a/src/gx_driver.c
++++ b/src/gx_driver.c
+@@ -1426,7 +1426,9 @@ GXScreenInit(SCREEN_INIT_ARGS_DECL)
+ 
+     /* Set up RandR */
+ 
++#if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 24
+     xf86DisableRandR();         /* We provide our own RandR goodness */
++#endif
+ 
+     /* Try to set up the shadow FB for rotation */
+ 
+-- 
+cgit v1.1
+
