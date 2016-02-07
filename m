From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 12:52:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: update musl patch
Message-ID: <1454845944-17512-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream chose a different fix:
http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1951

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-beaglelogic.h-fix-build-with-musl-libc.patch | 46 +++++++++++-----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch b/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
index e9ecf85..2b20680 100644
--- a/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
+++ b/package/libsigrok/0001-beaglelogic.h-fix-build-with-musl-libc.patch
@@ -1,38 +1,36 @@
-From 1b9ca481b2447154d12a7a94fe90c5b968ddf41c Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 30 Jan 2016 20:01:05 +0100
-Subject: [PATCH 1/1] beaglelogic.h: fix build with musl libc
+From 83bf4762e42a4d4a5c077f48d8f5715c9147d9b8 Mon Sep 17 00:00:00 2001
+From: Aurelien Jacobs <aurel@gnuage.org>
+Date: Mon, 1 Feb 2016 22:37:36 +0100
+Subject: [PATCH] beaglelogic: use standard # operator instead of ugly __STRING
+ macro
 
-This patch fixes a build error seen on the buildroot project:
-http://autobuild.buildroot.net/results/afc/afcea2068d5b0ba707aa90339401550602103ca7/
-
-Patch taken from
-https://github.com/dx9/ceph/commit/4f7bcabca7737c3f48f07ca2b4b1296c29e3358b
-which solved a similar problem.
+Also note that the __ namespace is reserved by POSIX for its private
+usage, so user land software should never rely on any kind of API
+with a __ prefix.
 
+Signed-off-by: Aurelien Jacobs <aurel@gnuage.org>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
-Patch sent upstream:
-http://article.gmane.org/gmane.comp.debugging.sigrok.devel/1948
+Patch downloaded from upstream git:
+http://sigrok.org/gitweb/?p=libsigrok.git;a=commit;h=83bf4762e42a4d4a5c077f48d8f5715c9147d9b8
 
- src/hardware/beaglelogic/beaglelogic.h | 4 ++++
- 1 file changed, 4 insertions(+)
+ src/hardware/beaglelogic/beaglelogic.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/hardware/beaglelogic/beaglelogic.h b/src/hardware/beaglelogic/beaglelogic.h
-index 9015c61..165b386 100644
+index 9015c61..96713ba 100644
 --- a/src/hardware/beaglelogic/beaglelogic.h
 +++ b/src/hardware/beaglelogic/beaglelogic.h
-@@ -28,6 +28,10 @@
- #include <stdlib.h>
- #include <unistd.h>
+@@ -30,8 +30,7 @@
  
-+#ifndef __STRING
-+# define __STRING(x) #x
-+#endif
-+
  /* BeagleLogic device node name */
  #define BEAGLELOGIC_DEV_NODE        "/dev/beaglelogic"
- #define BEAGLELOGIC_SYSFS_ATTR(a)   "/sys/devices/virtual/misc/beaglelogic/"\
+-#define BEAGLELOGIC_SYSFS_ATTR(a)   "/sys/devices/virtual/misc/beaglelogic/"\
+-					__STRING(a)
++#define BEAGLELOGIC_SYSFS_ATTR(a)   "/sys/devices/virtual/misc/beaglelogic/" #a
+ 
+ /* Reproduced verbatim from beaglelogic.h in the kernel tree until the kernel
+  * module hits the mainline. Contains the ABI, so DO NOT TOUCH this section */
 -- 
-2.7.0.rc3
+2.6.2
 
-- 
2.7.0
