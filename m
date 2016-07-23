From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Jul 2016 21:48:12 -0300
Subject: [Buildroot] [PATCH] libinput: bump to version 1.4.0
Message-ID: <1469234892-560-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-Add-configure.ac-check-for-static_assert.patch | 34 ----------------------
 package/libinput/libinput.hash                     |  4 +--
 package/libinput/libinput.mk                       |  4 +--
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/libinput/0002-Add-configure.ac-check-for-static_assert.patch

diff --git a/package/libinput/0002-Add-configure.ac-check-for-static_assert.patch b/package/libinput/0002-Add-configure.ac-check-for-static_assert.patch
deleted file mode 100644
index 4df47b9..0000000
--- a/package/libinput/0002-Add-configure.ac-check-for-static_assert.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0df21f54942dc82ddde4095824e7b65efb96d261 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Mon, 16 May 2016 13:32:07 +1000
-Subject: [PATCH] Add configure.ac check for static_assert
-
-Part of C11, defined via assert.h.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: suggested upstream
-(https://lists.freedesktop.org/archives/wayland-devel/2016-May/028881.html)
-
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 602a86026544..28a5197cfa2e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,6 +55,10 @@ AC_CHECK_DECL(TFD_CLOEXEC,[],
- AC_CHECK_DECL(CLOCK_MONOTONIC,[],
- 	      [AC_MSG_ERROR("CLOCK_MONOTONIC is needed to compile libinput")],
- 	      [[#include <time.h>]])
-+AC_CHECK_DECL(static_assert, [],
-+	      [AC_DEFINE(static_assert(...), [/* */], [noop static_assert() replacement]),
-+              AC_MSG_RESULT([no])],
-+	      [[#include <assert.h>]])
- 
- PKG_PROG_PKG_CONFIG()
- PKG_CHECK_MODULES(MTDEV, [mtdev >= 1.1.0])
--- 
-2.8.1
-
diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 764cf71..9f628cc 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,2 +1,2 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2016-June/029680.html
-sha256	30c8edfe47654a38c235ac6b0541d79fd593d010bc18cdda8bd1f6cc6ad8b1ce	libinput-1.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2016-July/030121.html
+sha256	76ef10874519d1a67b57e5c68ede06106b9fbf611a3ecf69c84886107c67b420	libinput-1.4.0.tar.xz
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index b1b4f61..01b6772 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.3.3
+LIBINPUT_VERSION = 1.4.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
@@ -13,8 +13,6 @@ LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = --disable-tests --disable-libwacom
-# Patching configure.ac
-LIBINPUT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += --enable-event-gui
-- 
2.7.3
