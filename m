From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Apr 2020 17:27:33 +0200
Subject: [Buildroot] [git commit] package/libva-utils: bump version to 2.7.1
Message-ID: <20200404151744.275478B4D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3d4ed41f0e10e5553fd1ed1c72341a18366ae4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream:
https://github.com/intel/libva-utils/commit/bd01ba5a6b53370ee6465f393051908f9c6ddeba

Switched to github helper, upstream does not provide a tarball for this
release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libva-utils/0001-fix-build-without-x11.patch   | 33 ----------------------
 package/libva-utils/libva-utils.hash               |  4 +--
 package/libva-utils/libva-utils.mk                 |  7 +++--
 3 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/package/libva-utils/0001-fix-build-without-x11.patch b/package/libva-utils/0001-fix-build-without-x11.patch
deleted file mode 100644
index 0cb5030d7c..0000000000
--- a/package/libva-utils/0001-fix-build-without-x11.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0d033c074b63ab0ef0798128b94b364ce33da93a Mon Sep 17 00:00:00 2001
-From: Ed Baker <edward.baker@intel.com>
-Date: Wed, 8 Jan 2020 13:43:38 -0700
-Subject: [PATCH] Ifdef va_x11 in VP sample for usrptr
-
-When updating libva-utils from 2.4.0 to 2.6.0 in Chrome OS I bumped into
-the following error:
-portage/media-video/libva-utils-2.6.0-r1/work/libva-utils-2.6.0/videoprocess/vppscaling_n_out_usrptr.cpp:41:10: fatal error:
-      'va/va_x11.h' file not found
-
-Downloaded from upstream PR:
-https://github.com/intel/libva-utils/pull/185
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Edward Baker <edward.baker@intel.com>
----
- videoprocess/vppscaling_n_out_usrptr.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/videoprocess/vppscaling_n_out_usrptr.cpp b/videoprocess/vppscaling_n_out_usrptr.cpp
-index 4a3a222..a853442 100644
---- a/videoprocess/vppscaling_n_out_usrptr.cpp
-+++ b/videoprocess/vppscaling_n_out_usrptr.cpp
-@@ -38,7 +38,9 @@
- #include <va/va.h>
- #include <va/va_vpp.h>
- #include "va_display.h"
-+#if 0
- #include <va/va_x11.h>
-+#endif
- 
- #define MAX_LEN   1024
- 
diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 881b56fca1..4addb7be3a 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/libva-utils/releases/download/2.6.0/libva-utils-2.6.0.tar.bz2.sha1sum
-sha1 ef6f9abe8954ec94bae0ea3bc82ffd1fa4fc5735  libva-utils-2.6.0.tar.bz2
 # Locally computed
-sha256 2249b5d08bffc3862bbdcc9a6a4827afd504330b8d101564d39fe1a1e7adc426  libva-utils-2.6.0.tar.bz2
+sha256 9cf35b971001e7143dda14207b6891c12619a72a2ab99a9133b3da5b9c4d97dd  libva-utils-2.7.1.tar.gz
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index ad9acb229b..dee29c9891 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.6.0
-LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
-LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_VERSION = 2.7.1
+LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
+# github tarball does not include configure
+LIBVA_UTILS_AUTORECONF = YES
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
 $(eval $(autotools-package))
