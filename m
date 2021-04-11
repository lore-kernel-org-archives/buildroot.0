From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Apr 2021 12:10:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/skalibs: fix build with xtensa
Message-ID: <20210411101014.247192-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with xtensa toolchain is broken since bump to version 2.10.0.2 in
commit 4d5587cb56224b2b28f53b0202fb14b2ab32d5fb indeed patch was dropped
assuming that it was included upstream but this assumption was wrong.

The code was just reworked in version 2.10.0.0 and commit
https://github.com/skarnet/skalibs/commit/21e6ea800cc96ba76e94ad8de1dfa58ab1b7ceb6

So add back this patch and send it upstream.

Fixes:
 - http://autobuild.buildroot.org/results/ee58ffa7b2f0be46ef7bc0ba38d3142f26a9bce9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ker-use-dummy-file-when-testing-libs.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch

diff --git a/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
new file mode 100644
index 0000000000..0f150b25b2
--- /dev/null
+++ b/package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch
@@ -0,0 +1,49 @@
+From e1dfda8d03e2152e4dcea51688f38877a9fef5f3 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sun, 11 Apr 2021 11:34:15 +0200
+Subject: [PATCH] Make linker use dummy file when testing libs
+
+For some architectures, like Xtensa or HPPA, ld from binutils requires
+the output file to be a regular file, as mentioned in a bug report on
+the mailing list [1].
+
+So, use a dummy file as output file for ld in trylibs(), instead of
+/dev/null.
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19526
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[Fabrice: update patch for version 2.10.0.0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to Laurent Bercot <ska-skaware@skarnet.org>]
+---
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 2804a2f..923038e 100755
+--- a/configure
++++ b/configure
+@@ -297,16 +297,16 @@ detectlibs () {
+   name=$1
+   shift
+   if $CC_AUTO $CPPFLAGS_AUTO $CPPFLAGS $CPPFLAGS_POST $CFLAGS_AUTO $CFLAGS $CFLAGS_POST -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
+-    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o /dev/null try$name.o $args 2>/dev/null ; do
++    until $CC_AUTO $CFLAGS_AUTO $CFLAGS $CFLAGS_POST $LDFLAGS_AUTO $LDFLAGS $LDFLAGS_POST -o try$name try$name.o $args 2>/dev/null ; do
+       if test -z "$*" ; then
+-        rm -f try$name.o
++        rm -f try$name.o try$name
+         return 1
+       fi
+       args="$args $1"
+       shift
+     done
+     echo ${args# }
+-    rm -f try$name.o
++    rm -f try$name.o try$name
+     return 0
+   else
+     return 1
+-- 
+2.30.2
+
-- 
2.30.2
