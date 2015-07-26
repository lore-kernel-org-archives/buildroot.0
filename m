From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:46:33 +0200
Subject: [Buildroot] [git commit branch/next] ncurses: fix gcc 5 compile
	issue for real
Message-ID: <20150808105642.3C7E07FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b432660c2aaafe4061075f8be86a04b462bfd97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The previous patch didn't work in all cases. The new patch is taken from
upstream: http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=97bb4678dc03e753290b39bbff30ba2825df9517

Fetch from: http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2

[Thomas:
  - removed Signed-off-by in the Buildroot commit from the ncurses
    author: the ncurses author never submitted this patch to
    Buildroot.
  - fixed the Author of the Buildroot commit, it was still "kyak"
  - added a description + Signed-off-by in the patch itself.]

Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
Acked-by: Jaap Crezee <jaap@jcz.nl>
Tested-by: Jaap Crezee <jaap@jcz.nl>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/0002-gcc-5.x-MKlib_gen.patch |   66 +++++++++++++++-----------
 1 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/package/ncurses/0002-gcc-5.x-MKlib_gen.patch b/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
index 0771208..25c2bd0 100644
--- a/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
+++ b/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
@@ -1,33 +1,43 @@
-Fix GCC 5.x preprocessor failure
+Fix gcc 5.x build failure
 
-Building ncurses 5.9 with GCC 5.x fails with a syntax error, caused by
-earlier preprocessing. This failure is more likely when building for
-host (e.g. host-ncurses) that recently updated to GCC 5.x.
+Extracted from upstream commit
+http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=97bb4678dc03e753290b39bbff30ba2825df9517.
 
-This patch is taken from the following link (more information is also
-available here):
-https://groups.google.com/forum/#!topic/sage-trac/U31shviuqzk
++ modify MKlib_gen.sh to work around change in development version of
+  gcc introduced here:
+  https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02185.html
+  https://gcc.gnu.org/ml/gcc-patches/2014-07/msg00236.html
+  (reports by Marcus Shawcroft, Maohui Lei).
 
-Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+Original author: Thomas E. Dickey <dickey@invisible-island.net>
+Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
 
-Index: b/ncurses/base/MKlib_gen.sh
-===================================================================
---- a/ncurses/base/MKlib_gen.sh
-+++ b/ncurses/base/MKlib_gen.sh
-@@ -62,7 +62,15 @@ if test "${LC_MESSAGES+set}" = set; then
- if test "${LC_CTYPE+set}"    = set; then LC_CTYPE=C;    export LC_CTYPE;    fi
- if test "${LC_COLLATE+set}"  = set; then LC_COLLATE=C;  export LC_COLLATE;  fi
- 
--preprocessor="$1 -DNCURSES_INTERNALS -I../include"
-+# Work around "unexpected" output of GCC 5.1.0's cpp w.r.t. #line directives
-+# by simply suppressing them:
-+case `$1 -dumpversion 2>/dev/null` in
-+	5.[01].*)  # assume a "broken" one
-+		preprocessor="$1 -P -DNCURSES_INTERNALS -I../include"
-+		;;
-+	*)
-+		preprocessor="$1 -DNCURSES_INTERNALS -I../include"
-+esac
- AWK="$2"
- USE="$3"
+--- a/ncurses/base/MKlib_gen.sh.orig	2015-07-23 21:52:32.239481505 +0300
++++ b/ncurses/base/MKlib_gen.sh	2015-07-23 21:53:20.772966587 +0300
+@@ -437,11 +437,22 @@
+ 	-e 's/gen_$//' \
+ 	-e 's/  / /g' >>$TMP
  
++cat >$ED1 <<EOF
++s/  / /g
++s/^ //
++s/ $//
++s/P_NCURSES_BOOL/NCURSES_BOOL/g
++EOF
++
++# A patch discussed here:
++#       https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02185.html
++# introduces spurious #line markers.  Work around that by ignoring the system's
++# attempt to define "bool" and using our own symbol here.
++sed -e 's/bool/P_NCURSES_BOOL/g' $TMP > $ED2
++cat $ED2 >$TMP
++
+ $preprocessor $TMP 2>/dev/null \
+-| sed \
+-	-e 's/  / /g' \
+-	-e 's/^ //' \
+-	-e 's/_Bool/NCURSES_BOOL/g' \
++| sed -f $ED1 \
+ | $AWK -f $AW2 \
+ | sed -f $ED3 \
+ | sed \
