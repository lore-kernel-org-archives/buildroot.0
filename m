From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 11:14:20 +0100
Subject: [Buildroot] [git commit] kobs-ng: test kernel version for redefines
Message-ID: <20131027101616.65FA29BAB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb995444b9b2ce3a38fbb1723151e9a923835da9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kobs-ng failed to build with 2.6.36, because enum tested with #ifndef

mtd.c: In function 'mtd_open':
mtd.c:696:42: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in this
function)
mtd.c:696:42: note: each undeclared identifier is reported only once for each
function it appears in
mtd.c: In function 'mtd_set_ecc_mode':
mtd.c:896:43: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in this
function)
mtd.c:914:43: error: 'MTD_FILE_MODE_RAW' undeclared (first use in this
function)

Do kernel version test before enum redefines.

Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch b/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
index 39d7474..3ffba71 100644
--- a/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
+++ b/package/kobs-ng/kobs-ng-0001-fix-mtd-defines.patch
@@ -3,6 +3,7 @@ MEMSETOOBSEL. Allow code to work with both older and newer kernel
 versions.
 
 Signed-off-by: Paul B. Henson <henson@acm.org>
+Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
 
 diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.c kobs-ng-3.0.35-4.0.0/src/mtd.c
 --- kobs-ng-3.0.35-4.0.0-orig/src/mtd.c	2012-12-17 22:37:40.000000000 -0800
@@ -56,16 +57,15 @@ diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.c kobs-ng-3.0.35-4.0.0/src/mtd.c
 diff -u -r kobs-ng-3.0.35-4.0.0-orig/src/mtd.h kobs-ng-3.0.35-4.0.0/src/mtd.h
 --- kobs-ng-3.0.35-4.0.0-orig/src/mtd.h	2012-12-17 22:37:40.000000000 -0800
 +++ kobs-ng-3.0.35-4.0.0/src/mtd.h	2013-07-28 19:33:57.000000000 -0700
-@@ -31,6 +31,14 @@
+@@ -31,6 +31,13 @@
  #include "BootControlBlocks.h"
  #include "rom_nand_hamming_code_ecc.h"
  
 +// Newer kernel headers renamed define
-+#ifndef MTD_MODE_NORMAL
-+#define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
-+#endif
-+#ifndef MTD_MODE_RAW
-+#define MTD_MODE_RAW MTD_FILE_MODE_RAW
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 2, 0)
++# define MTD_MODE_NORMAL MTD_FILE_MODE_NORMAL
++# define MTD_MODE_RAW MTD_FILE_MODE_RAW
 +#endif
 +
  //------------------------------------------------------------------------------
