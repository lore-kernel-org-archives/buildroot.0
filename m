From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 13:02:01 +0200
Subject: [Buildroot] [git commit] json-c: add patch to make sure the library
	is linked against libm when needed
Message-ID: <20150501110216.5478A81D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e99abc47511c2f0bc3b5a7da9e877aba6a84b9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On uClibc, a number of symbols such as isnan() are in libm and not
libc, so we might need to link against libm. This commit adds a patch
to json-c that does this.

Fixes:

  http://autobuild.buildroot.net/results/94d/94dd7f38ae105e7cd2f342d718e27a65edcf3a3d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-don-t-threat-warnings-as-errors.patch     |    8 ++--
 .../0002-Link-against-libm-when-needed.patch       |   53 ++++++++++++++++++++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/package/json-c/0001-don-t-threat-warnings-as-errors.patch b/package/json-c/0001-don-t-threat-warnings-as-errors.patch
index f18bf92..804fb2c 100644
--- a/package/json-c/0001-don-t-threat-warnings-as-errors.patch
+++ b/package/json-c/0001-don-t-threat-warnings-as-errors.patch
@@ -1,7 +1,7 @@
-From e81a30a35107643323950ef6803eddebecb33344 Mon Sep 17 00:00:00 2001
+From 2b4a43a94fb988e344f2d7edc74d6a4a5f64571d Mon Sep 17 00:00:00 2001
 From: Sagaert Johan <sagaert.johan@proximus.be>
 Date: Wed, 15 Apr 2015 00:40:46 +0200
-Subject: [PATCH 1/1] don't threat warnings as errors
+Subject: [PATCH] don't threat warnings as errors
 
 Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Sagaert Johan <sagaert.johan@proximus.be>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am.inc b/Makefile.am.inc
-index fec591b..61db1d2 100644
+index fec591b..5eb461e 100644
 --- a/Makefile.am.inc
 +++ b/Makefile.am.inc
 @@ -1,2 +1,2 @@
@@ -17,5 +17,5 @@ index fec591b..61db1d2 100644
 +AM_CFLAGS = -Wall -Wno-error=deprecated-declarations -Wextra -Wwrite-strings -std=gnu99 -D_GNU_SOURCE -D_REENTRANT
  
 -- 
-2.3.3
+2.1.0
 
diff --git a/package/json-c/0002-Link-against-libm-when-needed.patch b/package/json-c/0002-Link-against-libm-when-needed.patch
new file mode 100644
index 0000000..305b782
--- /dev/null
+++ b/package/json-c/0002-Link-against-libm-when-needed.patch
@@ -0,0 +1,53 @@
+From ccb15ee3d7e8c925cb3af9ea805feea2863c4f81 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 1 May 2015 12:52:18 +0200
+Subject: [PATCH] Link against libm when needed
+
+In certain C libraries (e.g uClibc), isnan() and related functions are
+implemented in libm, so json-c needs to link against it. This commit
+therefore adds an AC_TRY_LINK() test to check whether a program
+calling isnan() can be properly linked with no special flags. If not,
+we assume linking against libm is needed.
+
+The json-c.pc.in file is also adjusted so that in the case of static
+linking against json-c, -lm is also used.
+
+Submitted upstream: https://github.com/json-c/json-c/pull/182
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 4 ++++
+ json-c.pc.in | 3 ++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 99660a4..2a14ccf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -50,6 +50,10 @@ AC_CHECK_DECLS([isinf], [], [], [[#include <math.h>]])
+ AC_CHECK_DECLS([_isnan], [], [], [[#include <float.h>]])
+ AC_CHECK_DECLS([_finite], [], [], [[#include <float.h>]])
+ 
++if test "$ac_cv_have_decl_isnan" = "yes" ; then
++   AC_TRY_LINK([#include <math.h>], [float f = 0.0; return isnan(f)], [], [LIBS="$LIBS -lm"])
++fi
++
+ #check if .section.gnu.warning accepts long strings (for __warn_references)
+ AC_LANG_PUSH([C])
+ 
+diff --git a/json-c.pc.in b/json-c.pc.in
+index 037739d..05bfbc8 100644
+--- a/json-c.pc.in
++++ b/json-c.pc.in
+@@ -6,6 +6,7 @@ includedir=@includedir@
+ Name: json-c
+ Description: JSON implementation in C
+ Version: @VERSION@
+-Requires: 
++Requires:
++Libs.private: @LIBS@
+ Libs:  -L${libdir} -ljson-c
+ Cflags: -I${includedir}/json-c
+-- 
+2.1.0
+
