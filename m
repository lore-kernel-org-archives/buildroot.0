From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:56:27 +0200
Subject: [Buildroot] [git commit branch/next] package/freetype: bump version
	to 2.8
Message-ID: <20170531195912.B7E04827F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdabb80e4267f43f112d3c97c4692f5396b5fcf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added md5 & sha1 hashes supplied by sourceforge mirror.

Removed patches applied upstream:

0001-psaux-Better-protect-flex-handling.patch
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=f958c48ee431bef8d4d466b40c9cb2d4dbcb7791

0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=3774fc08b502c3e685afca098b6e8a195aded6a0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-psaux-Better-protect-flex-handling.patch  | 47 ----------------------
 ...sobjs.c-t1_builder_close_contour-Add-safe.patch | 35 ----------------
 package/freetype/freetype.hash                     |  5 ++-
 package/freetype/freetype.mk                       |  2 +-
 4 files changed, 5 insertions(+), 84 deletions(-)

diff --git a/package/freetype/0001-psaux-Better-protect-flex-handling.patch b/package/freetype/0001-psaux-Better-protect-flex-handling.patch
deleted file mode 100644
index a59f5b3..0000000
--- a/package/freetype/0001-psaux-Better-protect-flex-handling.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f958c48ee431bef8d4d466b40c9cb2d4dbcb7791 Mon Sep 17 00:00:00 2001
-From: Werner Lemberg <wl@gnu.org>
-Date: Fri, 24 Mar 2017 09:15:10 +0100
-Subject: [PATCH] [psaux] Better protect `flex' handling.
-
-Reported as
-
-  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=935
-
-* src/psaux/t1decode.c (t1_decoder_parse_charstrings)
-<callothersubr>: Since there is not a single flex operator but a
-series of subroutine calls, malformed fonts can call arbitrary other
-operators after the start of a flex, possibly adding points.  For
-this reason we have to check the available number of points before
-inserting a point.
-
-Fixes CVE-2017-8105
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
-diff --git a/src/psaux/t1decode.c b/src/psaux/t1decode.c
-index af7b465e..7dd45135 100644
---- a/src/psaux/t1decode.c
-+++ b/src/psaux/t1decode.c
-@@ -780,10 +780,19 @@
-             /* point without adding any point to the outline    */
-             idx = decoder->num_flex_vectors++;
-             if ( idx > 0 && idx < 7 )
-+            {
-+              /* in malformed fonts it is possible to have other */
-+              /* opcodes in the middle of a flex (which don't    */
-+              /* increase `num_flex_vectors'); we thus have to   */
-+              /* check whether we can add a point                */
-+              if ( FT_SET_ERROR( t1_builder_check_points( builder, 1 ) ) )
-+                goto Syntax_Error;
-+
-               t1_builder_add_point( builder,
-                                     x,
-                                     y,
-                                     (FT_Byte)( idx == 3 || idx == 6 ) );
-+            }
-           }
-           break;
- 
--- 
-2.11.0
-
diff --git a/package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch b/package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
deleted file mode 100644
index 1b9d90a..0000000
--- a/package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3774fc08b502c3e685afca098b6e8a195aded6a0 Mon Sep 17 00:00:00 2001
-From: Werner Lemberg <wl@gnu.org>
-Date: Sun, 26 Mar 2017 08:32:09 +0200
-Subject: [PATCH] * src/psaux/psobjs.c (t1_builder_close_contour): Add safety
- guard.
-
-Reported as
-
-  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=941
-
-Fixes CVE-2017-8287
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-diff --git a/src/psaux/psobjs.c b/src/psaux/psobjs.c
-index d18e821a..0baf8368 100644
---- a/src/psaux/psobjs.c
-+++ b/src/psaux/psobjs.c
-@@ -1718,6 +1718,14 @@
-     first = outline->n_contours <= 1
-             ? 0 : outline->contours[outline->n_contours - 2] + 1;
- 
-+    /* in malformed fonts it can happen that a contour was started */
-+    /* but no points were added                                    */
-+    if ( outline->n_contours && first == outline->n_points )
-+    {
-+      outline->n_contours--;
-+      return;
-+    }
-+
-     /* We must not include the last point in the path if it */
-     /* is located on the first point.                       */
-     if ( outline->n_points > 1 )
--- 
-2.11.0
-
diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index b2cec04..beff858 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,2 +1,5 @@
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.8/
+md5 2413ac3eaf508ada019c63959ea81a92  freetype-2.8.tar.bz2
+sha1 42c6b1f733fe13a3eba135f5025b22cb68450f91  freetype-2.8.tar.bz2
 # Locally calculated after checking pgp signature
-sha256	3a3bb2c4e15ffb433f2032f50a5b5a92558206822e22bfe8cbe339af4aa82f88	freetype-2.7.1.tar.bz2
+sha256 a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b  freetype-2.8.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 57f9b20..9a98b40 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.7.1
+FREETYPE_VERSION = 2.8
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
