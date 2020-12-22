From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 22 Dec 2020 17:46:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2020-12-R3
Message-ID: <20201222164626.1867883-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version) and so autoreconf
- libmicrohttpd is not a dependency since version 2020-12-R1 and
  https://github.com/kismetwireless/kismet/commit/a78a0ddc72f9916c4da54480c97b3040796c1047
- libwebsockets is an optional dependency since version 2020-12-R1 and
  https://github.com/kismetwireless/kismet/commit/77b5809ae35e3f8d91f349c618e593d67b50f279

https://www.kismetwireless.net/release/kismet-2020-12-R1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...don-t-override-LDFLAGS-with-CPPFLAGS.patch | 44 -------------------
 package/kismet/Config.in                      |  1 -
 package/kismet/kismet.hash                    |  2 +-
 package/kismet/kismet.mk                      | 12 +++--
 4 files changed, 9 insertions(+), 50 deletions(-)
 delete mode 100644 package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch

diff --git a/package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch b/package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch
deleted file mode 100644
index e2c28a2ebd..0000000000
--- a/package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e70968bcbca86dd448d619c40cdeaae8b7dcee98 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 24 Nov 2020 23:01:55 +0100
-Subject: [PATCH] configure.ac: don't override LDFLAGS with CPPFLAGS
-
-Don't override LDFLAGS with CPPFLAGS to avoid a build failure when
-building statically with uclibc due to -static keyword being lost:
-
-/home/buildroot/autobuild/run/instance-3/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o kismet_cap_linux_wifi ../interface_control.c.o ../wifi_ht_channels.c.o linux_wireless_control.c.o linux_netlink_control.c.o linux_nexmon_control.c.o linux_wireless_rfkill.c.o capture_linux_wifi.c.o ../libkismetdatasource.a -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lpcap -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/.libs -lnl-genl-3 -lnl-3   -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lpthread -lnl-genl-3 -lnl-3 -lpthread   -lpthread -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lprotobuf-c  -lm
-/home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
-/home/buildroot/autobuild/run/instance-3/output-1/build/host-gcc-final-9.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1040: undefined reference to `dl_iterate_phdr'
-collect2: error: ld returned 1 exit status
-
-To fix this build failure, just drop OCPPFLAGS and OLDFLAGS which are
-not used anymore
-
-Fixes:
- - http://autobuild.buildroot.org/results/b859eb3850c0beb23e18010dc2f07cd0f5c14440
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/kismetwireless/kismet/pull/326 (merged)]
----
- configure.ac | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index aab47fb0..4df37a29 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -619,11 +619,6 @@ else
-     AC_MSG_RESULT([no])
- fi
- 
--OCPPFLAGS=$CPPFLAGS
--CPPFLAGS="$CPPFLAGS"
--OLDFLAGS=$LDFLAGS
--LDFLAGS="$CPPFLAGS"
--
- # Do we need libm for math functions?
- AC_MSG_CHECKING([for libm math function in std libs])
- OCFL="$CFLAGS"
--- 
-2.29.2
-
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 4ef84731da..02046e7efb 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -61,7 +61,6 @@ config BR2_PACKAGE_KISMET_SERVER
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
-	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF
 
 comment "server needs a toolchain w/ dynamic library, gcc >= 4.8"
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index c55e31ef96..2b0baa1009 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79c9c343cc055523ec1c8607bf63f26bb826d8ffaccc1e6e033c945c8ada664d  kismet-2020-09-R4.tar.xz
+sha256  52a8eddd560688693552bcd8ff033f662a1a57b47650d6434c5e2c6d83e2bb33  kismet-2020-12-R3.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 0a4ae00f08..b39b58d81b 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2020-09-R4
+KISMET_VERSION = 2020-12-R3
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
@@ -17,8 +17,6 @@ KISMET_DEPENDENCIES = \
 	zlib
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
-# We're patching configure.ac
-KISMET_AUTORECONF = YES
 KISMET_CONF_OPTS = --disable-debuglibs
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
@@ -47,6 +45,13 @@ else
 KISMET_CONF_OPTS += --disable-libusb
 endif
 
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+KISMET_DEPENDENCIES += libwebsockets
+KISMET_CONF_OPTS += --enable-libwebsockets
+else
+KISMET_CONF_OPTS += --disable-libwebsockets
+endif
+
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 KISMET_DEPENDENCIES += lm-sensors
 KISMET_CONF_OPTS += --enable-lmsensors
@@ -77,7 +82,6 @@ KISMET_INSTALL_TARGET_OPTS += \
 	SUIDGROUP=$(shell id -g)
 
 ifeq ($(BR2_PACKAGE_KISMET_SERVER),y)
-KISMET_DEPENDENCIES += libmicrohttpd
 KISMET_CONF_OPTS += --disable-capture-tools-only
 KISMET_INSTALL_TARGET_OPTS += install
 else
-- 
2.29.2
