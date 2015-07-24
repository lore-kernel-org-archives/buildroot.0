From: kyak <bas@bmail.ru>
Date: Fri, 24 Jul 2015 16:00:43 +0300
Subject: [Buildroot] [PATCH 1/1] ncurses: fix gcc 5 compile issue for real
Message-ID: <1437742843-26270-1-git-send-email-bas@bmail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous patch didn't work in all cases. The new patch is taken from
upstream: http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commit;h=97bb4678dc03e753290b39bbff30ba2825df9517

Fetch from: http://ncurses.scripts.mit.edu/?p=ncurses.git;a=blobdiff;f=ncurses/base/MKlib_gen.sh;h=b91398c740a266f10edbbce19f19c52b9709556f;hp=d8cc3c9751faa157d0c8cb8e16fbe4217703966b;hb=97bb4678dc03e753290b39bbff30ba2825df9517;hpb=762520a7930d7f698d542628d3c04bc201f7dac2

Signed-off-by: Thomas E. Dickey <dickey@invisible-island.net>
Signed-off-by: Mikhail Peselnik <bas@bmail.ru>
---
 package/ncurses/0002-gcc-5.x-MKlib_gen.patch | 60 +++++++++++++---------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/package/ncurses/0002-gcc-5.x-MKlib_gen.patch b/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
index 0771208..fca7624 100644
--- a/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
+++ b/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
@@ -1,33 +1,29 @@
-Fix GCC 5.x preprocessor failure
-
-Building ncurses 5.9 with GCC 5.x fails with a syntax error, caused by
-earlier preprocessing. This failure is more likely when building for
-host (e.g. host-ncurses) that recently updated to GCC 5.x.
-
-This patch is taken from the following link (more information is also
-available here):
-https://groups.google.com/forum/#!topic/sage-trac/U31shviuqzk
-
-Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
-
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
-- 
2.4.6
