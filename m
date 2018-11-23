From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 21:49:37 +0100
Subject: [Buildroot] [git commit] trinity: fix build with kernel headers >=
 4.19
Message-ID: <20181202071557.96E6D8A3F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0032cfc8148ec8557dab4c26c333fe7889f8dcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Retrieve patch from upstream to fix build with kernel headers >= 4.19
because VIDIOC_RESERVED has been removed since
https://github.com/torvalds/linux/commit/ea8532daee31bc72abfbc9ca7a43cbec0f6c05af

Fixes:
 - http://autobuild.buildroot.org/results/ddf6b1cf4e4727928ffba7387953c4cc9719df49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-Check-if-VIDIOC_RESERVED-is-defined.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch b/package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch
new file mode 100644
index 0000000000..54f8bea63c
--- /dev/null
+++ b/package/trinity/0004-Check-if-VIDIOC_RESERVED-is-defined.patch
@@ -0,0 +1,56 @@
+From a5f32b9714613404e9f4699aaaad720f2bb033b4 Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Thu, 23 Aug 2018 22:28:49 +0000
+Subject: [PATCH] Check if VIDIOC_RESERVED is defined.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+VIDIOC_RESERVED was removed in Linux 4.19.
+
+commit ea8532daee31bc72abfbc9ca7a43cbec0f6c05af
+Author: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
+Date:   Wed May 30 11:07:05 2018 -0400
+
+    media: videodev2: get rid of VIDIOC_RESERVED
+
+    While this ioctl is there at least since Kernel 2.6.12-rc2, it
+    was never used by any upstream driver.
+
+    Get rid of it.
+
+    Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
+
+This patch fixes this build error.
+
+  CC	ioctls/videodev2.o
+In file included from ioctls/videodev2.c:4:
+ioctls/videodev2.c:8:8: error: ???VIDIOC_RESERVED??? undeclared here (not in a function); did you mean ???VIDIOC_G_STD????
+  IOCTL(VIDIOC_RESERVED),
+        ^~~~~~~~~~~~~~~
+include/ioctls.h:53:15: note: in definition of macro ???IOCTL???
+  { .request = _request, .name = #_request, }
+               ^~~~~~~~
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/kernelslacker/trinity/commit/a5f32b9714613404e9f4699aaaad720f2bb033b4]
+---
+ ioctls/videodev2.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ioctls/videodev2.c b/ioctls/videodev2.c
+index f7183f29..67089abf 100644
+--- a/ioctls/videodev2.c
++++ b/ioctls/videodev2.c
+@@ -5,7 +5,9 @@
+ 
+ static const struct ioctl videodev2_ioctls[] = {
+ 	IOCTL(VIDIOC_QUERYCAP),
++#ifdef VIDIOC_RESERVED
+ 	IOCTL(VIDIOC_RESERVED),
++#endif
+ 	IOCTL(VIDIOC_ENUM_FMT),
+ 	IOCTL(VIDIOC_G_FMT),
+ 	IOCTL(VIDIOC_S_FMT),
