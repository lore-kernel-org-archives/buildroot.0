From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 19 Jun 2018 21:57:19 +0200
Subject: [Buildroot] [PATCH] bluez5_utils: bump to version 5.50
Message-ID: <20180619195719.8098-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch and remove `AUTORECONF = YES`.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...all-only-be-build-if-readline-is-pre.patch | 32 -------------------
 package/bluez5_utils/bluez5_utils.hash        |  2 +-
 package/bluez5_utils/bluez5_utils.mk          |  4 +--
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch

diff --git a/package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch b/package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch
deleted file mode 100644
index 394742b680..0000000000
--- a/package/bluez5_utils/0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 654444dd8faf02b46f41d81f3d9c623d57bdd399 Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Fri, 20 Apr 2018 16:04:17 +0200
-Subject: [PATCH] bt_shell APIs shall only be build if readline is present on
- the system since it currently depend on it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Upstream-status: https://marc.info/?l=linux-bluetooth&m=152422938306592&w=2
----
- Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index daf34b6ca..9c3c17139 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -119,7 +119,11 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
- 			src/shared/gatt-server.h src/shared/gatt-server.c \
- 			src/shared/gatt-db.h src/shared/gatt-db.c \
- 			src/shared/gap.h src/shared/gap.c \
--			src/shared/tty.h src/shared/shell.c src/shared/shell.h
-+			src/shared/tty.h
-+
-+if READLINE
-+shared_sources += src/shared/shell.c src/shared/shell.h
-+endif
- 
- src_libshared_glib_la_SOURCES = $(shared_sources) \
- 				src/shared/io-glib.c \
--- 
-2.14.3
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 8d142b755c..b965708559 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  33301d7a514c73d535ee1f91c2aed1af1f2e53efe11d3ac06bcf0d7abed2ce95  bluez-5.49.tar.xz
+sha256  5ffcaae18bbb6155f1591be8c24898dc12f062075a40b538b745bfd477481911  bluez-5.50.tar.xz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index aff1fd9796..0133e1507f 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.49
+BLUEZ5_UTILS_VERSION = 5.50
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
 BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
-# 0001-bt_shell-APIs-shall-only-be-build-if-readline-is-pre.patch
-BLUEZ5_UTILS_AUTORECONF = YES
 
 BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-tools \
-- 
2.17.1
