From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Nov 2020 23:15:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix static build with uclibc
Message-ID: <20201124221533.1636066-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/b859eb3850c0beb23e18010dc2f07cd0f5c14440

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...don-t-override-LDFLAGS-with-CPPFLAGS.patch | 44 +++++++++++++++++++
 package/kismet/kismet.mk                      |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch

diff --git a/package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch b/package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch
new file mode 100644
index 0000000000..f185333475
--- /dev/null
+++ b/package/kismet/0001-configure.ac-don-t-override-LDFLAGS-with-CPPFLAGS.patch
@@ -0,0 +1,44 @@
+From e70968bcbca86dd448d619c40cdeaae8b7dcee98 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Nov 2020 23:01:55 +0100
+Subject: [PATCH] configure.ac: don't override LDFLAGS with CPPFLAGS
+
+Don't override LDFLAGS with CPPFLAGS to avoid a build failure when
+building statically with uclibc due to -static keyword being lost:
+
+/home/buildroot/autobuild/run/instance-3/output-1/host/bin/xtensa-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o kismet_cap_linux_wifi ../interface_control.c.o ../wifi_ht_channels.c.o linux_wireless_control.c.o linux_netlink_control.c.o linux_nexmon_control.c.o linux_wireless_rfkill.c.o capture_linux_wifi.c.o ../libkismetdatasource.a -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lpcap -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/run/instance-3/output-1/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/.libs -lnl-genl-3 -lnl-3   -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lpthread -lnl-genl-3 -lnl-3 -lpthread   -lpthread -L/home/buildroot/autobuild/run/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib -lprotobuf-c  -lm
+/home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/9.3.0/libgcc.a(unwind-dw2-fde-dip.o): in function `_Unwind_Find_registered_FDE':
+/home/buildroot/autobuild/run/instance-3/output-1/build/host-gcc-final-9.3.0/build/xtensa-buildroot-linux-uclibc/libgcc/../../../libgcc/unwind-dw2-fde.c:1040: undefined reference to `dl_iterate_phdr'
+collect2: error: ld returned 1 exit status
+
+To fix this build failure, just drop OCPPFLAGS and OLDFLAGS which are
+not used anymore
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b859eb3850c0beb23e18010dc2f07cd0f5c14440
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/kismetwireless/kismet/pull/326]
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aab47fb0..4df37a29 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -619,11 +619,6 @@ else
+     AC_MSG_RESULT([no])
+ fi
+ 
+-OCPPFLAGS=$CPPFLAGS
+-CPPFLAGS="$CPPFLAGS"
+-OLDFLAGS=$LDFLAGS
+-LDFLAGS="$CPPFLAGS"
+-
+ # Do we need libm for math functions?
+ AC_MSG_CHECKING([for libm math function in std libs])
+ OCFL="$CFLAGS"
+-- 
+2.29.2
+
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 54d014021f..0a4ae00f08 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -17,6 +17,8 @@ KISMET_DEPENDENCIES = \
 	zlib
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
+# We're patching configure.ac
+KISMET_AUTORECONF = YES
 KISMET_CONF_OPTS = --disable-debuglibs
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.29.2
