From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 22:32:23 +0200
Subject: [Buildroot] [git commit] package/ncurses: Fix GCC 5.x preprocessor
	failure
Message-ID: <20150531205220.688B480417@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4297e7298edbef6dde75d8bf468441c6a242da5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building ncurses 5.9 with GCC 5.x fails with a syntax error, caused by
earlier preprocessing. This failure is more likely when building for
host (e.g. host-ncurses) that recently updated to GCC 5.x.

This patch is taken from the following link (more information is also
available here):
https://groups.google.com/forum/#!topic/sage-trac/U31shviuqzk

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Acked-by: Jaap Crezee <jaap@jcz.nl>
Tested-by: Jaap Crezee <jaap@jcz.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/0002-gcc-5.x-MKlib_gen.patch |   33 ++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/0002-gcc-5.x-MKlib_gen.patch b/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
new file mode 100644
index 0000000..0771208
--- /dev/null
+++ b/package/ncurses/0002-gcc-5.x-MKlib_gen.patch
@@ -0,0 +1,33 @@
+Fix GCC 5.x preprocessor failure
+
+Building ncurses 5.9 with GCC 5.x fails with a syntax error, caused by
+earlier preprocessing. This failure is more likely when building for
+host (e.g. host-ncurses) that recently updated to GCC 5.x.
+
+This patch is taken from the following link (more information is also
+available here):
+https://groups.google.com/forum/#!topic/sage-trac/U31shviuqzk
+
+Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
+
+Index: b/ncurses/base/MKlib_gen.sh
+===================================================================
+--- a/ncurses/base/MKlib_gen.sh
++++ b/ncurses/base/MKlib_gen.sh
+@@ -62,7 +62,15 @@ if test "${LC_MESSAGES+set}" = set; then
+ if test "${LC_CTYPE+set}"    = set; then LC_CTYPE=C;    export LC_CTYPE;    fi
+ if test "${LC_COLLATE+set}"  = set; then LC_COLLATE=C;  export LC_COLLATE;  fi
+ 
+-preprocessor="$1 -DNCURSES_INTERNALS -I../include"
++# Work around "unexpected" output of GCC 5.1.0's cpp w.r.t. #line directives
++# by simply suppressing them:
++case `$1 -dumpversion 2>/dev/null` in
++	5.[01].*)  # assume a "broken" one
++		preprocessor="$1 -P -DNCURSES_INTERNALS -I../include"
++		;;
++	*)
++		preprocessor="$1 -DNCURSES_INTERNALS -I../include"
++esac
+ AWK="$2"
+ USE="$3"
+ 
