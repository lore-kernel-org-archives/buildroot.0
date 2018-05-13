From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:44:10 +0200
Subject: [Buildroot] [git commit] snort: fix build on sparc v8
Message-ID: <20180513194338.D85718B834@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=766f95d1f0fa352fb60bc49454df4c6544b0feaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to remove -mcpu=v9 before checking sparc architecture

Fixes:
 - http://autobuild.buildroot.net/results/59625daa154e3136171dcb89bdc3b8b31dc85021

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/0005-fix-sparc.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/snort/0005-fix-sparc.patch b/package/snort/0005-fix-sparc.patch
new file mode 100644
index 0000000000..14792d2c59
--- /dev/null
+++ b/package/snort/0005-fix-sparc.patch
@@ -0,0 +1,28 @@
+When checking if the architecture supports the %time register
+instruction, do not force -mcpu to v9 while doing so. Otherwise it's
+like "let's see if this v9 instruction exists when I force the compiler
+to think I'm using v9", which is non-sensical.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Naurp ./snort-2.9.11.1-orig/configure.in snort-2.9.11.1/configure.in
+--- ./snort-2.9.11.1-orig/configure.in	2018-05-10 12:20:19.253510678 +0200
++++ snort-2.9.11.1/configure.in	2018-05-10 12:40:18.547584998 +0200
+@@ -942,8 +942,6 @@ fi
+ 
+ # check for sparc %time register
+ if eval "echo $host_cpu|grep -i sparc >/dev/null"; then
+-    OLD_CFLAGS="$CFLAGS"
+-    CFLAGS="$CFLAGS -mcpu=v9 "
+     AC_MSG_CHECKING([for sparc %time register])
+     AC_RUN_IFELSE(
+     [AC_LANG_PROGRAM(
+@@ -957,8 +955,6 @@ if eval "echo $host_cpu|grep -i sparc >/
+     AC_MSG_RESULT($sparcv9)
+     if test "x$sparcv9" = "xyes"; then
+         AC_DEFINE([SPARCV9],[1],[For sparc v9 with %time register])
+-    else
+-        CFLAGS="$OLD_CFLAGS"
+     fi
+ fi
+ 
