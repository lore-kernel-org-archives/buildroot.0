From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 May 2017 09:20:14 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] freetype: add upstream
	security fixes for CVE-2017-8105 and CVE-2017-8287
Message-ID: <20170501072636.9F3C2821A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e3e5a9f0a6028d230c757fbac8e8895e31dcc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Add upstream post-2.7.1 commits (except for ChangeLog modifications) fixing
the following security issues:

CVE-2017-8105 - FreeType 2 before 2017-03-24 has an out-of-bounds write
caused by a heap-based buffer overflow related to the
t1_decoder_parse_charstrings function in psaux/t1decode.c.

CVE-2017-8287 - FreeType 2 before 2017-03-26 has an out-of-bounds write
caused by a heap-based buffer overflow related to the
t1_builder_close_contour function in psaux/psobjs.c.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6d557ac0133618fe4fe1d417bf584e21ef208871)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-psaux-Better-protect-flex-handling.patch  | 47 ++++++++++++++++++++++
 ...sobjs.c-t1_builder_close_contour-Add-safe.patch | 35 ++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/package/freetype/0001-psaux-Better-protect-flex-handling.patch b/package/freetype/0001-psaux-Better-protect-flex-handling.patch
new file mode 100644
index 0000000..a59f5b3
--- /dev/null
+++ b/package/freetype/0001-psaux-Better-protect-flex-handling.patch
@@ -0,0 +1,47 @@
+From f958c48ee431bef8d4d466b40c9cb2d4dbcb7791 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Fri, 24 Mar 2017 09:15:10 +0100
+Subject: [PATCH] [psaux] Better protect `flex' handling.
+
+Reported as
+
+  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=935
+
+* src/psaux/t1decode.c (t1_decoder_parse_charstrings)
+<callothersubr>: Since there is not a single flex operator but a
+series of subroutine calls, malformed fonts can call arbitrary other
+operators after the start of a flex, possibly adding points.  For
+this reason we have to check the available number of points before
+inserting a point.
+
+Fixes CVE-2017-8105
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+diff --git a/src/psaux/t1decode.c b/src/psaux/t1decode.c
+index af7b465e..7dd45135 100644
+--- a/src/psaux/t1decode.c
++++ b/src/psaux/t1decode.c
+@@ -780,10 +780,19 @@
+             /* point without adding any point to the outline    */
+             idx = decoder->num_flex_vectors++;
+             if ( idx > 0 && idx < 7 )
++            {
++              /* in malformed fonts it is possible to have other */
++              /* opcodes in the middle of a flex (which don't    */
++              /* increase `num_flex_vectors'); we thus have to   */
++              /* check whether we can add a point                */
++              if ( FT_SET_ERROR( t1_builder_check_points( builder, 1 ) ) )
++                goto Syntax_Error;
++
+               t1_builder_add_point( builder,
+                                     x,
+                                     y,
+                                     (FT_Byte)( idx == 3 || idx == 6 ) );
++            }
+           }
+           break;
+ 
+-- 
+2.11.0
+
diff --git a/package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch b/package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
new file mode 100644
index 0000000..1b9d90a
--- /dev/null
+++ b/package/freetype/0002-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
@@ -0,0 +1,35 @@
+From 3774fc08b502c3e685afca098b6e8a195aded6a0 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sun, 26 Mar 2017 08:32:09 +0200
+Subject: [PATCH] * src/psaux/psobjs.c (t1_builder_close_contour): Add safety
+ guard.
+
+Reported as
+
+  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=941
+
+Fixes CVE-2017-8287
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+diff --git a/src/psaux/psobjs.c b/src/psaux/psobjs.c
+index d18e821a..0baf8368 100644
+--- a/src/psaux/psobjs.c
++++ b/src/psaux/psobjs.c
+@@ -1718,6 +1718,14 @@
+     first = outline->n_contours <= 1
+             ? 0 : outline->contours[outline->n_contours - 2] + 1;
+ 
++    /* in malformed fonts it can happen that a contour was started */
++    /* but no points were added                                    */
++    if ( outline->n_contours && first == outline->n_points )
++    {
++      outline->n_contours--;
++      return;
++    }
++
+     /* We must not include the last point in the path if it */
+     /* is located on the first point.                       */
+     if ( outline->n_points > 1 )
+-- 
+2.11.0
+
