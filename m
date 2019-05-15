From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 May 2019 22:47:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: add libunwind optional
 dependency
In-Reply-To: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
References: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
Message-ID: <20190515204721.18722-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add libunwind dependency as well as a patch to link with it

Fixes:
 - http://autobuild.buildroot.net/results/dbd64c89815d393a4e28b312d74fd80ee6de92da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...03-configure.ac-checks-for-libunwind.patch | 40 +++++++++++++++++++
 package/mono/mono.mk                          |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 package/mono/0003-configure.ac-checks-for-libunwind.patch

diff --git a/package/mono/0003-configure.ac-checks-for-libunwind.patch b/package/mono/0003-configure.ac-checks-for-libunwind.patch
new file mode 100644
index 0000000000..8ff6b2f5c7
--- /dev/null
+++ b/package/mono/0003-configure.ac-checks-for-libunwind.patch
@@ -0,0 +1,40 @@
+From 4dc1d1fe553f3a8ad00919324419aba54675239e Mon Sep 17 00:00:00 2001
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
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index d724f9e2d27..c3067246f08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2206,6 +2206,11 @@ if test x$host_win32 = xno; then
+ 	dnl *****************************
+ 	AC_CHECK_LIB(socket, socket, LIBS="$LIBS -lsocket")
+ 
++	dnl *****************************
++	dnl *** Checks for libunwind ***
++	dnl ****************************
++	AC_CHECK_LIB(unwind, _Unwind_GetIP, LIBS="$LIBS -lunwind")
++
+ 	case "$host" in
+ 		*-*-*freebsd*)
+ 			dnl *****************************
+-- 
+2.20.1
+
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index bb482a6d5f..53589f4071 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -40,7 +40,9 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MONO_DEPENDENCIES += libiconv
 endif
 
-MONO_DEPENDENCIES += host-mono
+MONO_DEPENDENCIES += \
+	host-mono \
+	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind)
 
 ## Mono managed
 
-- 
2.20.1
