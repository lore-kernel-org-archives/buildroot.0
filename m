From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Jan 2021 18:54:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/mono: fix build with libunwind
Message-ID: <20210120175443.157316-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4be06fa8aa054e59d97866dc5568f4e10762e353 wrongly removed this
patch which was rejected by upstream (and so not merged). Moreover,
there is no way to disable unwind backtrace on mono. An interested party
could try to send this patch again or work with upstream to add an
option to disable backtrace.

Fixes:
 - http://autobuild.buildroot.org/results/17f1282abda00aedaea1f3edbcae1b216b70552a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-configure-ac-checks-for-libunwind.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/mono/0001-configure-ac-checks-for-libunwind.patch

diff --git a/package/mono/0001-configure-ac-checks-for-libunwind.patch b/package/mono/0001-configure-ac-checks-for-libunwind.patch
new file mode 100644
index 0000000000..3d9d8a249f
--- /dev/null
+++ b/package/mono/0001-configure-ac-checks-for-libunwind.patch
@@ -0,0 +1,38 @@
+From 05c9f2d51e74e847ebfa1efdd495d2b146803a07 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 May 2019 22:30:01 +0200
+Subject: [PATCH] configure.ac: checks for libunwind
+
+_Unwind_GetIP is used in build_stack_trace however this function can be
+provided by libunwind so check for it to avoid the following build
+failure:
+
+/home/buildroot/autobuild/run/instance-1/output/host/lib/gcc/arm-buildroot-linux-musleabihf/7.4.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: ./.libs/libmini.a(libmini_la-mini-exceptions.o): in function `build_stack_trace':
+/home/buildroot/autobuild/run/instance-1/output/build/mono-5.20.1.27/mono/mini/mini-exceptions.c:365: undefined reference to `_Unwind_GetIP'
+collect2: error: ld returned 1 exit status
+
+Fixes:
+ - http://autobuild.buildroot.net/results/dbd64c89815d393a4e28b312d74fd80ee6de92da
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: rejected (https://github.com/mono/mono/pull/18648)]
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d724f9e2d27d..b323ca1b14bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2206,6 +2206,11 @@ if test x$host_win32 = xno; then
+ 	dnl *****************************
+ 	AC_CHECK_LIB(socket, socket, LIBS="$LIBS -lsocket")
+ 
++	dnl *****************************
++	dnl *** Checks for libunwind  ***
++	dnl *****************************
++	AC_CHECK_LIB(unwind, _Unwind_GetIP, LIBS="$LIBS -lunwind")
++
+ 	case "$host" in
+ 		*-*-*freebsd*)
+ 			dnl *****************************
-- 
2.29.2
