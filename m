From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 22 Feb 2010 23:49:51 +0200
Subject: [Buildroot] [PATCH] Fix GDB BFD test linking
Message-ID: <20100222214951.8779.6936.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling GDB for the same architecture as host it links
wrong BFD library from host OS. This prevents GDB from compiling
support for ELF and thus GDB unusable on target.

Fix this by moving BFD and libiberty directories before CFLAGS, since
"wrong" path comes from CFLAGS.

More about this issue was already posted at:
http://lists.uclibc.org/pipermail/buildroot/2009-March/026585.html

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 .../6.8/700-fix-linking-directory-priority.patch   |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gdb/6.8/700-fix-linking-directory-priority.patch

diff --git a/toolchain/gdb/6.8/700-fix-linking-directory-priority.patch b/toolchain/gdb/6.8/700-fix-linking-directory-priority.patch
new file mode 100644
index 0000000..5dff5aa
--- /dev/null
+++ b/toolchain/gdb/6.8/700-fix-linking-directory-priority.patch
@@ -0,0 +1,13 @@
+--- gdb-6.8/gdb/configure.orig	2008-01-13 14:23:04.000000000 +0200
++++ gdb-6.8/gdb/configure	2009-12-06 18:32:27.065376339 +0200
+@@ -22994,8 +22994,8 @@ esac
+ OLD_CFLAGS=$CFLAGS
+ OLD_LDFLAGS=$LDFLAGS
+ OLD_LIBS=$LIBS
+-CFLAGS="$CFLAGS -I${srcdir}/../include -I../bfd -I${srcdir}/../bfd"
+-LDFLAGS="$LDFLAGS -L../bfd -L../libiberty"
++CFLAGS="-L../bfd -L../libiberty $CFLAGS -I${srcdir}/../include -I../bfd -I${srcdir}/../bfd"
++LDFLAGS="$LDFLAGS"
+ intl=`echo $LIBINTL | sed 's,${top_builddir}/,,g'`
+ LIBS="$LIBS -lbfd -liberty $intl"
+ echo "$as_me:$LINENO: checking for ELF support in BFD" >&5
