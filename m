From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 21:03:16 +0200
Subject: [Buildroot] [PATCH] package/libselinmux: fix build with musl
Message-ID: <1437937396-23254-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl does not define glibcisms, so we ar emissing some macros.

Define what we need in case the macro is missing. We're using a dumb
implementation, which is rather slow, to avoid copying from glibc, to
avoid propagating the LGPL to libselinux, which is Public Domain.

Fixes a buncha autobuild failures:
    http://autobuild.buildroot.org/results/d4d/d4d209719d1ce5219f84719ad72fcb6a0c684007/
    http://autobuild.buildroot.org/results/1a6/1a65cc3d2c23a3c17c605788be62dbd18cbdaf76/
    http://autobuild.buildroot.org/results/0d0/0d0e4713833182d0f634b9b39b2c56f2bc0adcac/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/libselinux/0002-fix-musl-build.patch | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libselinux/0002-fix-musl-build.patch

diff --git a/package/libselinux/0002-fix-musl-build.patch b/package/libselinux/0002-fix-musl-build.patch
new file mode 100644
index 0000000..9e6b734
--- /dev/null
+++ b/package/libselinux/0002-fix-musl-build.patch
@@ -0,0 +1,30 @@
+fix undefined macros in musl
+
+musl does not define glibc-specific macros, so use a simple version of
+the macro when it is not defined.
+
+This is very inefficient, however, but copying the code from glibc is
+not really possible because it is LGPL while libselinux in Public
+Domain, and we want to avoid license propaation, so this macro is
+completely written from scratch, and non-optimal.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN libselinux-2.1.13.orig/src/booleans.c libselinux-2.1.13/src/booleans.c
+--- libselinux-2.1.13.orig/src/booleans.c	2013-02-06 02:43:22.000000000 +0100
++++ libselinux-2.1.13/src/booleans.c	2015-07-26 20:40:41.311801914 +0200
+@@ -62,6 +62,14 @@
+ 		goto bad;
+ 	}
+ 
++/* Simple (but inefficient) version of _D_ALLOC_NAMLEN when
++ * building with a C library that misses it (e.g. musl).
++ * Note: glibc does a strlen on (d)->d_name, so assume it is safe.
++ */
++#ifndef _D_ALLOC_NAMLEN
++#define _D_ALLOC_NAMLEN(d) (strlen((d)->d_name)+1)
++#endif
++
+ 	for (i = 0; i < *len; i++) {
+ 		n[i] = (char *)malloc(_D_ALLOC_NAMLEN(namelist[i]));
+ 		if (!n[i]) {
-- 
1.9.1
