From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Sep 2020 11:21:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2020-09-R2
Message-ID: <20200919092145.13915-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop all patches (not needed anymore)
- Update help message of Config.in: kismet does not support only WiFi
  but also Bluetooth, SDR ...
- Remove ncurses dependency
- libnl is now optional
- Drop --with-netlink-version (not available anymore)
- Add protobuf, protobuf-c, sqlite and zlib mandatory dependencies
- kismet_client and kismet_drone have been dropped since version 2019-04-R1
- Select libmicrohttpd for kismet_server
- Add optional libusb, lm-sensors and python3 dependencies
- Use --{enable,disable}-{libcap,pcre} options
- Use the new LICENSE file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy                              | 12 +++
 ...meron314-moodycamel-to-fix-gcc-9-2-0.patch | 39 +++++++++
 package/kismet/0001-ncurses.patch             | 11 ---
 package/kismet/0002-nobsd.patch               | 44 -----------
 .../0003-fix-curses-libs-ordering.patch       | 44 -----------
 .../kismet/0004-no-include-host-paths.patch   | 25 ------
 ...don-t-include-linux-if_tun.h-kernel-.patch | 51 ------------
 package/kismet/Config.in                      | 75 +++++++++++++-----
 package/kismet/kismet.hash                    |  4 +-
 package/kismet/kismet.mk                      | 79 +++++++++++--------
 10 files changed, 155 insertions(+), 229 deletions(-)
 create mode 100644 package/kismet/0001-Merge-fix-from-cameron314-moodycamel-to-fix-gcc-9-2-0.patch
 delete mode 100644 package/kismet/0001-ncurses.patch
 delete mode 100644 package/kismet/0002-nobsd.patch
 delete mode 100644 package/kismet/0003-fix-curses-libs-ordering.patch
 delete mode 100644 package/kismet/0004-no-include-host-paths.patch
 delete mode 100644 package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 0bf49943d4..5fdf4c3e75 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -194,6 +194,18 @@ config BR2_GDB_VERSION_8_1
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_PACKAGE_KISMET_CLIENT
+	bool "kismet client support was removed"
+	select BR2_LEGACY
+	help
+	  Kismet client support was removed since version 2019-04-R1.
+
+config BR2_PACKAGE_KISMET_DRONE
+	bool "kismet drone support was removed"
+	select BR2_LEGACY
+	help
+	  Kismet drone support was removed since version 2019-04-R1.
+
 config BR2_PACKAGE_LIBUPNP18
 	bool "libupnp18 package removed"
 	select BR2_LEGACY
diff --git a/package/kismet/0001-Merge-fix-from-cameron314-moodycamel-to-fix-gcc-9-2-0.patch b/package/kismet/0001-Merge-fix-from-cameron314-moodycamel-to-fix-gcc-9-2-0.patch
new file mode 100644
index 0000000000..35cc7186f7
--- /dev/null
+++ b/package/kismet/0001-Merge-fix-from-cameron314-moodycamel-to-fix-gcc-9-2-0.patch
@@ -0,0 +1,39 @@
+From dbac8157372ad0c17f3f4836e70369238c65af86 Mon Sep 17 00:00:00 2001
+From: Mike Kershaw / Dragorn <dragorn@kismetwireless.net>
+Date: Sat, 12 Sep 2020 15:22:37 -0400
+Subject: [PATCH] Merge fix from cameron314/moodycamel to fix gcc 9.2.0 with
+ the concurrent queue
+
+Merge fix from cameron314/moodycamel to fix gcc 9.2.0 with the concurrent queue.
+
+Fixes #300
+
+[Retrieved from:
+https://github.com/kismetwireless/kismet/commit/dbac8157372ad0c17f3f4836e70369238c65af86]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ moodycamel/blockingconcurrentqueue.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/moodycamel/blockingconcurrentqueue.h b/moodycamel/blockingconcurrentqueue.h
+index 9b713396..66579b6c 100644
+--- a/moodycamel/blockingconcurrentqueue.h
++++ b/moodycamel/blockingconcurrentqueue.h
+@@ -56,7 +56,7 @@ class BlockingConcurrentQueue
+ 	// includes making the memory effects of construction visible, possibly with a
+ 	// memory barrier).
+ 	explicit BlockingConcurrentQueue(size_t capacity = 6 * BLOCK_SIZE)
+-		: inner(capacity), sema(create<LightweightSemaphore>(0, (int)Traits::MAX_SEMA_SPINS), &BlockingConcurrentQueue::template destroy<LightweightSemaphore>)
++		: inner(capacity), sema(create<LightweightSemaphore, ssize_t, int>(0, (int)Traits::MAX_SEMA_SPINS), &BlockingConcurrentQueue::template destroy<LightweightSemaphore>)
+ 	{
+ 		assert(reinterpret_cast<ConcurrentQueue*>((BlockingConcurrentQueue*)1) == &((BlockingConcurrentQueue*)1)->inner && "BlockingConcurrentQueue must have ConcurrentQueue as its first member");
+ 		if (!sema) {
+@@ -65,7 +65,7 @@ class BlockingConcurrentQueue
+ 	}
+ 	
+ 	BlockingConcurrentQueue(size_t minCapacity, size_t maxExplicitProducers, size_t maxImplicitProducers)
+-		: inner(minCapacity, maxExplicitProducers, maxImplicitProducers), sema(create<LightweightSemaphore>(0, (int)Traits::MAX_SEMA_SPINS), &BlockingConcurrentQueue::template destroy<LightweightSemaphore>)
++		: inner(minCapacity, maxExplicitProducers, maxImplicitProducers), sema(create<LightweightSemaphore, ssize_t, int>(0, (int)Traits::MAX_SEMA_SPINS), &BlockingConcurrentQueue::template destroy<LightweightSemaphore>)
+ 	{
+ 		assert(reinterpret_cast<ConcurrentQueue*>((BlockingConcurrentQueue*)1) == &((BlockingConcurrentQueue*)1)->inner && "BlockingConcurrentQueue must have ConcurrentQueue as its first member");
+ 		if (!sema) {
diff --git a/package/kismet/0001-ncurses.patch b/package/kismet/0001-ncurses.patch
deleted file mode 100644
index af8fba52b7..0000000000
--- a/package/kismet/0001-ncurses.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- kismet-2009-06-R1/configure	2009-06-12 04:26:32.000000000 +0100
-+++ kismet-2009-06-R1.mod/configure	2009-08-05 11:27:43.000000000 +0100
-@@ -6981,7 +6981,7 @@
- 
- 
- # Add additional cflags since some distros bury panel.h
--CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
-+#CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
- 
- termcontrol="none";
- 
diff --git a/package/kismet/0002-nobsd.patch b/package/kismet/0002-nobsd.patch
deleted file mode 100644
index 451d9ce4a1..0000000000
--- a/package/kismet/0002-nobsd.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-diff -Nura kismet-2009-06-R1/ifcontrol.cc kismet-2009-06-R1-nobsd/ifcontrol.cc
---- kismet-2009-06-R1/ifcontrol.cc	2009-04-08 16:57:44.000000000 -0300
-+++ kismet-2009-06-R1-nobsd/ifcontrol.cc	2009-09-01 12:54:44.000000000 -0300
-@@ -148,7 +148,7 @@
- 	devlinklen = readlink(devlink.c_str(), devlinktarget, 511);
- 	if (devlinklen > 0) {
- 		devlinktarget[devlinklen] = '\0';
--		rind = rindex(devlinktarget, '/');
-+		rind = strrchr(devlinktarget, '/');
- 		// If we found it and not at the end of the line
- 		if (rind != NULL && (rind - devlinktarget) + 1 < devlinklen)
- 			return string(rind + 1);
-diff -Nura kismet-2009-06-R1/iwcontrol.cc kismet-2009-06-R1-nobsd/iwcontrol.cc
---- kismet-2009-06-R1/iwcontrol.cc	2009-04-20 00:22:55.000000000 -0300
-+++ kismet-2009-06-R1-nobsd/iwcontrol.cc	2009-09-01 12:54:44.000000000 -0300
-@@ -697,7 +697,7 @@
- 		return -1;
- 	}
- 
--	bzero(buffer, sizeof(buffer));
-+	memset(buffer, 0, sizeof(buffer));
- 
- 	memset(&wrq, 0, sizeof(struct iwreq));
- 
-@@ -732,7 +732,7 @@
- 		memcpy((char *) &range, buffer, sizeof(iw_range));
- 	} else {
- 		/* Zero unknown fields */
--		bzero((char *) &range, sizeof(struct iw_range));
-+		memset((char *) &range, 0, sizeof(struct iw_range));
- 
- 		/* Initial part unmoved */
- 		memcpy((char *) &range, buffer, iwr15_off(num_channels));
-diff -Nura kismet-2009-06-R1/madwifing_control.cc kismet-2009-06-R1-nobsd/madwifing_control.cc
---- kismet-2009-06-R1/madwifing_control.cc	2009-03-22 23:19:19.000000000 -0300
-+++ kismet-2009-06-R1-nobsd/madwifing_control.cc	2009-09-01 12:54:42.000000000 -0300
-@@ -34,7 +34,6 @@
- #include <stdint.h>
- #include <ctype.h>
- #include <getopt.h>
--#include <err.h>
- #include <dirent.h>
- #include <fcntl.h>
- #include <errno.h>
diff --git a/package/kismet/0003-fix-curses-libs-ordering.patch b/package/kismet/0003-fix-curses-libs-ordering.patch
deleted file mode 100644
index 8d2b911404..0000000000
--- a/package/kismet/0003-fix-curses-libs-ordering.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-configure: fix ordering of ncurses libraries
-
-Says Vicente:
-    [T]he order is very important when doing static builds.
-    Otherwise we will see errors like this one:
-
-    [...]/sysroot/usr/lib/libpanel.a(p_delete.o):
-    In function `del_panel':
-    p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'
-
-Fix the order configure adds libraries: new libraries should be added
-at the *front* of the list, not at the end.
-
-Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[bernd.kuhls at t-online.de: update for 2016-07-R1]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
---- kismet-Kismet-2014-02-R1.orig/configure.ac	2014-02-19 05:37:43.000000000 +0100
-+++ kismet-Kismet-2014-02-R1/configure.ac	2014-12-26 16:46:55.770692349 +0100
-@@ -437,10 +434,10 @@
- 		AC_MSG_ERROR(Failed to find curses.h or ncurses.h.  You probably need to install the curses-devel package from your distribution)
- 	fi
- 
--	LIBS="$LIBS $curseaux"
-+	LIBS="$curseaux $LIBS"
- 	AC_CHECK_LIB([panel], [new_panel],
- 				 AC_DEFINE(HAVE_LIBPANEL, 1, Panel terminal lib)
--				 curseaux="$curseaux -lpanel",
-+				 curseaux="-lpanel $curseaux",
- 				 AC_MSG_ERROR(Failed to find libpanel extension to curses/ncurses.  Install it, or disable building the Kismet client with --disable-client.  Disabling the client is probably not something you want to do normally.))
- 
- 	AC_CHECK_HEADER([panel.h], [foundhpanel=yes])
-@@ -450,7 +447,7 @@
- 
- 	LIBS="$OLIBS"
- 
--	CLIENTCLIBS="$CLIENTCLIBS $curseaux"
-+	CLIENTCLIBS="$curseaux $CLIENTCLIBS"
- fi
- 
- AC_SUBST(CLIBS)
diff --git a/package/kismet/0004-no-include-host-paths.patch b/package/kismet/0004-no-include-host-paths.patch
deleted file mode 100644
index 6819bf425e..0000000000
--- a/package/kismet/0004-no-include-host-paths.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-configure: do not hard-code host paths
-
-configure hard-codes include dirs to contain /usr/include/ncurses.
-Needless to say this does not work well for cross-compilation.
-
-Remove that directory from the include search dirs.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[bernd.kuhls at t-online.de: update for 2016-07-R1]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -durN kismet-Kismet-2014-02-R1.orig/configure.in kismet-Kismet-2014-02-R1/configure.in
---- kismet-Kismet-2014-02-R1.orig/configure.ac	2014-02-19 05:37:43.000000000 +0100
-+++ kismet-Kismet-2014-02-R1/configure.ac	2014-12-26 16:46:55.770692349 +0100
-@@ -406,9 +406,6 @@
- )
- AC_SUBST(wantclient)
- 
--# Add additional cflags since some distros bury panel.h
--CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
--
- termcontrol="none";
- 
- if test "$wantclient" = "yes"; then
diff --git a/package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch b/package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch
deleted file mode 100644
index be694345d2..0000000000
--- a/package/kismet/0005-dumpfile_tuntap-don-t-include-linux-if_tun.h-kernel-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 1466cbbdef835634366b2eb3a284fdff5833338c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 19 Aug 2016 23:30:06 +0200
-Subject: [PATCH] dumpfile_tuntap: don't include linux/if_tun.h kernel header
-
-dumpfile_tuntap.h mixes userspace and kernel headers.
-
-As suggested in the musl wiki [1], remove the linux/include directives
-and copy the required definitions.
-
-[1] http://wiki.musl-libc.org/wiki/FAQ
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- dumpfile_tuntap.h | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/dumpfile_tuntap.h b/dumpfile_tuntap.h
-index 37f50b6..8b23a2a 100644
---- a/dumpfile_tuntap.h
-+++ b/dumpfile_tuntap.h
-@@ -64,17 +64,18 @@
- #include "packetchain.h"
- #include "dumpfile.h"
- 
--#ifdef SYS_LINUX 
--#include <linux/if_tun.h>
-+#ifdef SYS_LINUX
-+/* TUNSETIFF ifr flags */
-+#define IFF_TUN		0x0001
-+#define IFF_TAP		0x0002
-+#define IFF_NO_PI	0x1000
- 
- // Linux IEEE80211 link typ to set
- #define LNX_LINKTYPE_80211		801
--// If the system headers don't have the TUNSETLINK ioctl, define it here,
--// and we'll figure it out at runtime
--#ifndef TUNSETLINK
--#define TUNSETLINK				_IOW('T', 205, int)
--#endif
--
-+/* Ioctl defines */
-+#define TUNSETNOCSUM	_IOW('T', 200, int)
-+#define TUNSETIFF		_IOW('T', 202, int)
-+#define TUNSETLINK		_IOW('T', 205, int)
- #endif
- 
- struct ipc_dft_open {
--- 
-2.5.5
-
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index ab91c0e6fb..4ef84731da 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,42 +1,75 @@
-comment "kismet needs a toolchain w/ threads, C++, dynamic library"
+comment "kismet needs a toolchain w/ threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # dlfcn.h
-	select BR2_PACKAGE_NCURSES
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
 	help
-	  Kismet - 802.11 layer2 wireless network detector, sniffer,
-	  and intrusion detection system.
-
-	  Kismet will work with any wireless card which supports raw
-	  monitoring (rfmon) mode, and can sniff 802.11b, 802.11a, and
-	  802.11g traffic.
+	  Kismet is a wireless network and device detector, sniffer,
+	  wardriving tool, and WIDS (wireless intrusion detection)
+	  framework.
 
-	  Kismet identifies networks by passively collecting packets
-	  and detecting standard named networks, detecting (and given
-	  time, decloaking) hidden networks, and infering the presence
-	  of nonbeaconing networks via data traffic.
+	  Kismet works with Wi-Fi interfaces, Bluetooth interfaces, some
+	  SDR (software defined radio) hardware like the RTLSDR, and
+	  other specialized capture hardware.
 
 	  http://www.kismetwireless.net
 
 if BR2_PACKAGE_KISMET
 
-config BR2_PACKAGE_KISMET_CLIENT
-	bool "Install client"
+config BR2_PACKAGE_KISMET_PYTHON_TOOLS
+	bool "Install python tools"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_PACKAGE_PYTHON3
+	depends on !BR2_STATIC_LIBS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime for RTLAMR and RTLADSB
+	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime for Freaklabs Zigbee
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
+	help
+	  Enable Python and Python-related tools (RTL_433, RTLAMR,
+	  RTLADSB and Freaklabs Zigbee)
+
+comment "python tools needs python3"
+	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
-config BR2_PACKAGE_KISMET_DRONE
-	bool "Install drone"
+comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 
 config BR2_PACKAGE_KISMET_SERVER
 	bool "Install server"
 	default y
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_PROTOBUF
+
+comment "server needs a toolchain w/ dynamic library, gcc >= 4.8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "server needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 endif
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 30780b1cc3..fe51ebdb9b 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bdb21f153311f1ff3b16621bf0d6740f66369bf0982b0a289c9a12af8847e237  kismet-2016-07-R1.tar.xz
-sha256  92b9eae679d8efbcd7514f7ff1346e4c1d42d272cd10bcb724d1511d35e28cd1  debian/copyright
+sha256  ef737fb4801c1d258e575893627625612ac043161a5660d1b30b14879f36ded8  kismet-2020-09-R2.tar.xz
+sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index d3946d65f3..4fd46da699 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,16 +4,20 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2016-07-R1
+KISMET_VERSION = 2020-09-R2
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
-KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
-KISMET_CONF_OPTS += --with-netlink-version=3
+KISMET_DEPENDENCIES = \
+	host-pkgconf \
+	libpcap \
+	$(if $(BR2_PACKAGE_LIBNL),libnl) \
+	$(if $(BR2_PACKAGE_PROTOBUF),protobuf) \
+	protobuf-c \
+	sqlite \
+	zlib
 KISMET_LICENSE = GPL-2.0+
-KISMET_LICENSE_FILES = debian/copyright
-
-# We touch configure.in:
-KISMET_AUTORECONF = YES
+KISMET_LICENSE_FILES = LICENSE
+KISMET_CONF_OPTS = --disable-debuglibs
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
@@ -25,41 +29,54 @@ KISMET_CONF_ENV += CXXFLAGS="$(KISMET_CXXFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 KISMET_DEPENDENCIES += libcap
+KISMET_CONF_OPTS += --enable-libcap
+else
+KISMET_CONF_OPTS += --disable-libcap
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-KISMET_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+KISMET_DEPENDENCIES += libusb
+KISMET_CONF_OPTS += --enable-libusb
+else
+KISMET_CONF_OPTS += --disable-libusb
 endif
 
-ifeq ($(BR2_PACKAGE_KISMET_CLIENT),y)
-KISMET_TARGET_BINARIES += kismet_client
+ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
+KISMET_DEPENDENCIES += lm-sensors
+KISMET_CONF_OPTS += --enable-lmsensors
+else
+KISMET_CONF_OPTS += --disable-lmsensors
 endif
 
-ifeq ($(BR2_PACKAGE_KISMET_SERVER),y)
-KISMET_TARGET_BINARIES += kismet_server
-KISMET_TARGET_CONFIGS += kismet.conf
+ifeq ($(BR2_PACKAGE_PCRE),y)
+KISMET_DEPENDENCIES += pcre
+KISMET_CONF_OPTS += --enable-pcre
+else
+KISMET_CONF_OPTS += --disable-pcre
 endif
 
-ifeq ($(BR2_PACKAGE_KISMET_DRONE),y)
-KISMET_TARGET_BINARIES += kismet_drone
-KISMET_TARGET_CONFIGS += kismet_drone.conf
+ifeq ($(BR2_PACKAGE_KISMET_PYTHON_TOOLS),y)
+KISMET_DEPENDENCIES += python3 python-setuptools
+KISMET_CONF_OPTS += \
+	--enable-python-tools \
+	--with-python-interpreter=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
+else
+KISMET_CONF_OPTS += --disable-python-tools
 endif
 
-ifdef KISMET_TARGET_BINARIES
-define KISMET_INSTALL_TARGET_BINARIES
-	$(INSTALL) -m 755 $(addprefix $(KISMET_DIR)/, $(KISMET_TARGET_BINARIES)) $(TARGET_DIR)/usr/bin
-endef
-endif
+KISMET_INSTALL_TARGET_OPTS += \
+	DESTDIR=$(TARGET_DIR) \
+	INSTUSR=$(shell id -u) \
+	INSTGRP=$(shell id -g) \
+	SUIDGROUP=$(shell id -g)
 
-ifdef KISMET_TARGET_CONFIGS
-define KISMET_INSTALL_TARGET_CONFIGS
-	$(INSTALL) -m 644 $(addprefix $(KISMET_DIR)/conf/, $(KISMET_TARGET_CONFIGS)) $(TARGET_DIR)/etc
-endef
+ifeq ($(BR2_PACKAGE_KISMET_SERVER),y)
+KISMET_DEPENDENCIES += libmicrohttpd
+KISMET_CONF_OPTS += --disable-capture-tools-only
+KISMET_INSTALL_TARGET_OPTS += install
+else
+KISMET_CONF_OPTS += --enable-capture-tools-only
+KISMET_INSTALL_TARGET_OPTS += binsuidinstall
 endif
 
-define KISMET_INSTALL_TARGET_CMDS
-	$(KISMET_INSTALL_TARGET_BINARIES)
-	$(KISMET_INSTALL_TARGET_CONFIGS)
-endef
-
 $(eval $(autotools-package))
-- 
2.28.0
