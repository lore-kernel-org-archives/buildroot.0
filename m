From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 May 2016 22:07:36 +0200
Subject: [Buildroot] [git commit] libinput: fix missing static_assert
Message-ID: <20160516200744.B88EE817F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85ef34d35a05a55f2c0bd52377b73ab0175214b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc-ng does not define the C11 static_assert macro. Patch configure.ac to
detect this and define a nop macro.

Fixes:
http://autobuild.buildroot.net/results/3eb/3eb32c19f90a5fd8d45a0c36676e015e8278a469/
http://autobuild.buildroot.net/results/184/1844890c65615f1676a85c6fac78937249eee9f1/
http://autobuild.buildroot.net/results/3a3/3a3f8c5624e8019a6eababbf6e7440fdd668f85f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Add-configure.ac-check-for-static_assert.patch | 34 ++++++++++++++++++++++
 package/libinput/libinput.mk                       |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/package/libinput/0002-Add-configure.ac-check-for-static_assert.patch b/package/libinput/0002-Add-configure.ac-check-for-static_assert.patch
new file mode 100644
index 0000000..4df47b9
--- /dev/null
+++ b/package/libinput/0002-Add-configure.ac-check-for-static_assert.patch
@@ -0,0 +1,34 @@
+From 0df21f54942dc82ddde4095824e7b65efb96d261 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 16 May 2016 13:32:07 +1000
+Subject: [PATCH] Add configure.ac check for static_assert
+
+Part of C11, defined via assert.h.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: suggested upstream
+(https://lists.freedesktop.org/archives/wayland-devel/2016-May/028881.html)
+
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 602a86026544..28a5197cfa2e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,6 +55,10 @@ AC_CHECK_DECL(TFD_CLOEXEC,[],
+ AC_CHECK_DECL(CLOCK_MONOTONIC,[],
+ 	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile libinput")],
+ 	      [[#include <time.h>]])
++AC_CHECK_DECL(static_assert, [],
++	      [AC_DEFINE(static_assert(...), [/* */], [noop static_assert() replacement]),
++              AC_MSG_RESULT([no])],
++	      [[#include <assert.h>]])
+ 
+ PKG_PROG_PKG_CONFIG()
+ PKG_CHECK_MODULES(MTDEV, [mtdev >= 1.1.0])
+-- 
+2.8.1
+
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index de6a81c..bd8fe2c 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -13,6 +13,8 @@ LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = --disable-tests --disable-libwacom
+# Patching configure.ac
+LIBINPUT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += --enable-event-gui
