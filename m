From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 30 Dec 2016 22:55:10 +0100
Subject: [Buildroot] [PATCH] skalibs: make ld use dummy file when configuring
Message-ID: <1483134910-12507-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some architectures, like Xtensa or HPPA, ld from binutils requires
the output file to be a regular file, as mentioned in a bug report on
the mailing list [1].

So, use a dummy file as output file for ld, instead of /dev/null, when
trying to detect some libraries at configuration time.

Fixes http://autobuild.buildroot.net/results/288/288fc31cd10ffe3cd93371c7be37d79452a91768/

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19526

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...e-linker-use-dummy-file-when-testing-libs.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch

diff --git a/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
new file mode 100644
index 0000000..ef0e173
--- /dev/null
+++ b/package/skalibs/0003-Make-linker-use-dummy-file-when-testing-libs.patch
@@ -0,0 +1,44 @@
+From da293110f429e1206728c1551cf0f6b462b3d8c0 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 29 Dec 2016 19:36:24 +0100
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
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 1579025..12980fb 100755
+--- a/configure
++++ b/configure
+@@ -173,7 +173,7 @@ trylibs () {
+   echo "Checking whether system has $2..." >&3
+   shift 2
+   if $CC_AUTO $CPPFLAGS_AUTO $CFLAGS_AUTO -c -o try$name.o src/sysdeps/try$name.c 2>/dev/null ; then
+-    until $CC_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o /dev/null try$name.o $args 2>/dev/null ; do
++    until $CC_AUTO $CFLAGS_AUTO $LDFLAGS_AUTO -o try$name try$name.o $args 2>/dev/null ; do
+       if test -z "$*" ; then
+         rm -f try$name.o
+         echo
+@@ -189,7 +189,7 @@ trylibs () {
+     else
+       echo "  ... yes, with$args" >&3
+     fi
+-    rm -f try$name.o
++    rm -f try$name.o try$name
+     return 0
+   else
+     echo
+-- 
+2.4.11
+
-- 
2.4.11
