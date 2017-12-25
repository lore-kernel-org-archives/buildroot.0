From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Dec 2017 22:20:52 +0200
Subject: [Buildroot] [PATCH] libv4l: bump to version 1.12.6
Message-ID: <626caa3a04d1ac3c85578e712eb268e2a30cb59e.1514233252.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use https URL to avoid redirect.

Drop non-LFS compatibility patch; we do not support non-LFS build
anymore.

Add license files hashes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-fixup-lfs-mismatch-in-preload-libraries.patch | 44 ----------------------
 package/libv4l/libv4l.hash                         |  7 +++-
 package/libv4l/libv4l.mk                           |  4 +-
 3 files changed, 8 insertions(+), 47 deletions(-)
 delete mode 100644 package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch

diff --git a/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch b/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
deleted file mode 100644
index f23eb7a35066..000000000000
--- a/package/libv4l/0001-fixup-lfs-mismatch-in-preload-libraries.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e5952b043a71fe83fbc392e498e8f77774fca0d8 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sat, 28 Jun 2014 09:32:53 -0300
-Subject: [PATCH] fixup lfs mismatch in preload libraries
-
-Ensure that the lfs variants are not transparently used instead of the !lfs
-ones so both can be wrapped, independently of any custom CFLAGS/CPPFLAGS.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lib/libv4l1/v4l1compat.c  | 3 +++
- lib/libv4l2/v4l2convert.c | 3 +++
- 2 files changed, 6 insertions(+)
-
-diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
-index e328288..70eb74f 100644
---- a/lib/libv4l1/v4l1compat.c
-+++ b/lib/libv4l1/v4l1compat.c
-@@ -19,6 +19,9 @@
- # Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
-  */
-
-+/* ensure we see *64 variants and they aren't transparently used */
-+#undef _LARGEFILE_SOURCE
-+#undef _FILE_OFFSET_BITS
- #define _LARGEFILE64_SOURCE 1
-
- #include <config.h>
-diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
-index 9b46ab8..bc41056 100644
---- a/lib/libv4l2/v4l2convert.c
-+++ b/lib/libv4l2/v4l2convert.c
-@@ -23,6 +23,9 @@
- /* prevent GCC 4.7 inlining error */
- #undef _FORTIFY_SOURCE
-
-+/* ensure we see *64 variants and they aren't transparently used */
-+#undef _LARGEFILE_SOURCE
-+#undef _FILE_OFFSET_BITS
- #define _LARGEFILE64_SOURCE 1
-
- #include <config.h>
---
-1.9.1
diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index fc7bd1b9af18..909ef73afc8c 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,7 @@
+# Locally calculated after checking signature
+# https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.12.6.tar.bz2.asc
+sha256 74da1040284eaba48277ad051ffe1fca0ee05c5591bb01179d928def6d0a4561  v4l-utils-1.12.6.tar.bz2
 # Locally calculated
-sha256 0618162ddb0b57fe7c45407d4d66ed79e3a134cdbc9e72598d34e61d3359e20d  v4l-utils-1.12.5.tar.bz2
+sha256 391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
+sha256 5a7f623a50e384aaf6d2ced068339ddf93d0a50d3a0ecbe86f125b07804ecc78  COPYING.libv4l
+sha256 37d0f2c8dc3f267d864cb39d54f82c5092a599beb29cb5caa96d50d27e069a44  lib/libv4l1/libv4l1-kernelcode-license.txt
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 9b2b41704363..b24002a0cb8e 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.12.5
+LIBV4L_VERSION = 1.12.6
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
-LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
+LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
 LIBV4L_CONF_OPTS = --disable-doxygen-doc
-- 
2.15.1
