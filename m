From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Wed, 24 Mar 2021 13:44:13 +0800
Subject: [Buildroot] [PATCH 1/1] package/zerotier-one: new package
Message-ID: <20210324054413.1705067-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ZeroTier One lets you join ZeroTier virtual networks and have them
appear as tun/tap ports on your system.

Adapted from:
https://github.com/openwrt/packages/tree/openwrt-21.02/net/zerotier

CC: Moritz Warning <moritzwarning@web.de>
Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/Config.in                             |  1 +
 ...ind-miniupnpc.h-in-staging-directory.patch | 22 ++++++++++++
 package/zerotier-one/0002-remove-pie.patch    | 28 +++++++++++++++
 ...003-remove-arm32-conservative-CFLAGS.patch | 20 +++++++++++
 .../0004-accept-external-linker-flags.patch   | 20 +++++++++++
 package/zerotier-one/0005-link-natpmp.patch   | 20 +++++++++++
 package/zerotier-one/0006-gcc10.patch         | 24 +++++++++++++
 ...0007-add-cerrno-header-for-str-errno.patch | 23 ++++++++++++
 ...x-compilation-for-arm_cortex-a7-neon.patch | 23 ++++++++++++
 package/zerotier-one/0009-auxv.patch          | 11 ++++++
 package/zerotier-one/Config.in                | 14 ++++++++
 package/zerotier-one/zerotier-one.hash        |  3 ++
 package/zerotier-one/zerotier-one.mk          | 35 +++++++++++++++++++
 13 files changed, 244 insertions(+)
 create mode 100644 package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch
 create mode 100644 package/zerotier-one/0002-remove-pie.patch
 create mode 100644 package/zerotier-one/0003-remove-arm32-conservative-CFLAGS.patch
 create mode 100644 package/zerotier-one/0004-accept-external-linker-flags.patch
 create mode 100644 package/zerotier-one/0005-link-natpmp.patch
 create mode 100644 package/zerotier-one/0006-gcc10.patch
 create mode 100644 package/zerotier-one/0007-add-cerrno-header-for-str-errno.patch
 create mode 100644 package/zerotier-one/0008-fix-compilation-for-arm_cortex-a7-neon.patch
 create mode 100644 package/zerotier-one/0009-auxv.patch
 create mode 100644 package/zerotier-one/Config.in
 create mode 100644 package/zerotier-one/zerotier-one.hash
 create mode 100644 package/zerotier-one/zerotier-one.mk

diff --git a/package/Config.in b/package/Config.in
index d278e78b68..4dec62fe24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2323,6 +2323,7 @@ endif
 	source "package/xinetd/Config.in"
 	source "package/xl2tp/Config.in"
 	source "package/xtables-addons/Config.in"
+	source "package/zerotier-one/Config.in"
 	source "package/znc/Config.in"
 
 endmenu
diff --git a/package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch b/package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch
new file mode 100644
index 0000000000..e9724f01d2
--- /dev/null
+++ b/package/zerotier-one/0001-find-miniupnpc.h-in-staging-directory.patch
@@ -0,0 +1,22 @@
+From 552cda1ebff6c5182eecdcb35961fd6b441dfa52 Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Mon, 23 Apr 2018 22:12:31 +0200
+Subject: [PATCH 1/8] find miniupnpc.h in staging directory
+
+---
+ make-linux.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/make-linux.mk
++++ b/make-linux.mk
+@@ -25,8 +25,8 @@ TIMESTAMP=$(shell date +"%Y%m%d%H%M")
+ # otherwise build into binary as done on Mac and Windows.
+ ONE_OBJS+=osdep/PortMapper.o
+ override DEFS+=-DZT_USE_MINIUPNPC
+-MINIUPNPC_IS_NEW_ENOUGH=$(shell grep -sqr '.*define.*MINIUPNPC_VERSION.*"2..*"' /usr/include/miniupnpc/miniupnpc.h && echo 1)
+-#MINIUPNPC_IS_NEW_ENOUGH=$(shell grep -sqr '.*define.*MINIUPNPC_VERSION.*"2.."' /usr/include/miniupnpc/miniupnpc.h && echo 1)
++MINIUPNPC_IS_NEW_ENOUGH=$(shell grep -sqr '.*define.*MINIUPNPC_VERSION.*"2..*"' $(STAGING_DIR)/usr/include/miniupnpc/miniupnpc.h && echo 1)
++#MINIUPNPC_IS_NEW_ENOUGH=$(shell grep -sqr '.*define.*MINIUPNPC_VERSION.*"2.."' $(STAGING_DIR)/usr/include/miniupnpc/miniupnpc.h && echo 1)
+ ifeq ($(MINIUPNPC_IS_NEW_ENOUGH),1)
+ 	override DEFS+=-DZT_USE_SYSTEM_MINIUPNPC
+ 	LDLIBS+=-lminiupnpc
diff --git a/package/zerotier-one/0002-remove-pie.patch b/package/zerotier-one/0002-remove-pie.patch
new file mode 100644
index 0000000000..aa297f85d4
--- /dev/null
+++ b/package/zerotier-one/0002-remove-pie.patch
@@ -0,0 +1,28 @@
+From ef1a75fd1bf271cc5c73d966a861dfcd26d62cd5 Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Mon, 30 Apr 2018 16:14:30 +0200
+Subject: [PATCH 2/8] remove -pie
+
+fixes relocation "against `a local symbol' can not be used
+when making a shared object; recompile with -fPIC" error
+---
+ make-linux.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/make-linux.mk
++++ b/make-linux.mk
+@@ -73,11 +73,11 @@ ifeq ($(ZT_DEBUG),1)
+ 	# C25519 in particular is almost UNUSABLE in -O0 even on a 3ghz box!
+ node/Salsa20.o node/SHA512.o node/C25519.o node/Poly1305.o: CXXFLAGS=-Wall -O2 -g -pthread $(INCLUDES) $(DEFS)
+ else
+-	CFLAGS?=-O3 -fstack-protector -fPIE
++	CFLAGS?=-O3 -fstack-protector
+ 	override CFLAGS+=-Wall -Wno-deprecated -pthread $(INCLUDES) -DNDEBUG $(DEFS)
+-	CXXFLAGS?=-O3 -fstack-protector -fPIE
++	CXXFLAGS?=-O3 -fstack-protector
+ 	override CXXFLAGS+=-Wall -Wno-deprecated -std=c++11 -pthread $(INCLUDES) -DNDEBUG $(DEFS)
+-	LDFLAGS=-pie -Wl,-z,relro,-z,now
++	LDFLAGS=-Wl,-z,relro,-z,now
+ 	STRIP?=strip
+ 	STRIP+=--strip-all
+ endif
diff --git a/package/zerotier-one/0003-remove-arm32-conservative-CFLAGS.patch b/package/zerotier-one/0003-remove-arm32-conservative-CFLAGS.patch
new file mode 100644
index 0000000000..f0ffacf0e7
--- /dev/null
+++ b/package/zerotier-one/0003-remove-arm32-conservative-CFLAGS.patch
@@ -0,0 +1,20 @@
+From 093ec88ff213a5713ad5d3c26ddf5ecdea3c6377 Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Sun, 4 Aug 2019 03:56:37 +0200
+Subject: [PATCH 3/8] remove arm32 conservative CFLAGS
+
+---
+ make-linux.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/make-linux.mk
++++ b/make-linux.mk
+@@ -276,7 +276,7 @@ ifeq ($(ZT_CONTROLLER),1)
+ endif
+ 
+ # ARM32 hell -- use conservative CFLAGS
+-ifeq ($(ZT_ARCHITECTURE),3)
++ifeq (0,3)
+ 	ifeq ($(shell if [ -e /usr/bin/dpkg ]; then dpkg --print-architecture; fi),armel)
+ 		override CFLAGS+=-march=armv5t -mfloat-abi=soft -msoft-float -mno-unaligned-access -marm
+ 		override CXXFLAGS+=-march=armv5t -mfloat-abi=soft -msoft-float -mno-unaligned-access -marm
diff --git a/package/zerotier-one/0004-accept-external-linker-flags.patch b/package/zerotier-one/0004-accept-external-linker-flags.patch
new file mode 100644
index 0000000000..de144d25c7
--- /dev/null
+++ b/package/zerotier-one/0004-accept-external-linker-flags.patch
@@ -0,0 +1,20 @@
+From 1a4ffe62c729f9c4f63cdfd26151e3724bc23f86 Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Wed, 2 May 2018 16:06:46 +0200
+Subject: [PATCH 4/8] accept external linker flags
+
+---
+ make-linux.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/make-linux.mk
++++ b/make-linux.mk
+@@ -77,7 +77,7 @@ else
+ 	override CFLAGS+=-Wall -Wno-deprecated -pthread $(INCLUDES) -DNDEBUG $(DEFS)
+ 	CXXFLAGS?=-O3 -fstack-protector
+ 	override CXXFLAGS+=-Wall -Wno-deprecated -std=c++11 -pthread $(INCLUDES) -DNDEBUG $(DEFS)
+-	LDFLAGS=-Wl,-z,relro,-z,now
++	LDFLAGS+=-Wl,-z,relro,-z,now
+ 	STRIP?=strip
+ 	STRIP+=--strip-all
+ endif
diff --git a/package/zerotier-one/0005-link-natpmp.patch b/package/zerotier-one/0005-link-natpmp.patch
new file mode 100644
index 0000000000..893c10a054
--- /dev/null
+++ b/package/zerotier-one/0005-link-natpmp.patch
@@ -0,0 +1,20 @@
+From de625c51dba36b390c93a1db00b19b6112178764 Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Sat, 21 Nov 2020 17:53:28 +0100
+Subject: [PATCH 5/8] link natpmp
+
+---
+ make-linux.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/make-linux.mk
++++ b/make-linux.mk
+@@ -34,7 +34,7 @@ else
+ 	override DEFS+=-DMINIUPNP_STATICLIB -DMINIUPNPC_SET_SOCKET_TIMEOUT -DMINIUPNPC_GET_SRC_ADDR -D_BSD_SOURCE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DOS_STRING=\"Linux\" -DMINIUPNPC_VERSION_STRING=\"2.0\" -DUPNP_VERSION_STRING=\"UPnP/1.1\" -DENABLE_STRNATPMPERR
+ 	ONE_OBJS+=ext/miniupnpc/connecthostport.o ext/miniupnpc/igd_desc_parse.o ext/miniupnpc/minisoap.o ext/miniupnpc/minissdpc.o ext/miniupnpc/miniupnpc.o ext/miniupnpc/miniwget.o ext/miniupnpc/minixml.o ext/miniupnpc/portlistingparse.o ext/miniupnpc/receivedata.o ext/miniupnpc/upnpcommands.o ext/miniupnpc/upnpdev.o ext/miniupnpc/upnperrors.o ext/miniupnpc/upnpreplyparse.o
+ endif
+-ifeq ($(wildcard /usr/include/natpmp.h),)
++ifeq ($(wildcard $(STAGING_DIR)/usr/include/natpmp.h),)
+ 	ONE_OBJS+=ext/libnatpmp/natpmp.o ext/libnatpmp/getgateway.o
+ else
+ 	LDLIBS+=-lnatpmp
diff --git a/package/zerotier-one/0006-gcc10.patch b/package/zerotier-one/0006-gcc10.patch
new file mode 100644
index 0000000000..9550dfdde4
--- /dev/null
+++ b/package/zerotier-one/0006-gcc10.patch
@@ -0,0 +1,24 @@
+From e0c76c5ccf049d22bc47d723567926346e4d3639 Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Sat, 21 Nov 2020 18:19:21 +0100
+Subject: [PATCH 6/8] gcc10
+
+---
+ osdep/Binder.hpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/osdep/Binder.hpp
++++ b/osdep/Binder.hpp
+@@ -396,9 +396,9 @@ public:
+ 					}
+ #endif // __LINUX__
+ 					if (_bindingCount < ZT_BINDER_MAX_BINDINGS) {
+-						_bindings[_bindingCount].udpSock = udps;
+-						_bindings[_bindingCount].tcpListenSock = tcps;
+-						_bindings[_bindingCount].address = ii->first;
++						_bindings[(unsigned int)_bindingCount].udpSock = udps;
++						_bindings[(unsigned int)_bindingCount].tcpListenSock = tcps;
++						_bindings[(unsigned int)_bindingCount].address = ii->first;
+ 						phy.setIfName(udps,(char*)ii->second.c_str(),(int)ii->second.length());
+ 						++_bindingCount;
+ 					}
diff --git a/package/zerotier-one/0007-add-cerrno-header-for-str-errno.patch b/package/zerotier-one/0007-add-cerrno-header-for-str-errno.patch
new file mode 100644
index 0000000000..d2595f98b6
--- /dev/null
+++ b/package/zerotier-one/0007-add-cerrno-header-for-str-errno.patch
@@ -0,0 +1,23 @@
+From e06177a74f1e4314baf17c52f360dabcb78e69cd Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Sun, 29 Nov 2020 19:45:36 +0100
+Subject: [PATCH 7/8] add cerrno header for (str)errno
+
+Fixes compilation under libcxx.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+---
+ osdep/LinuxNetLink.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/osdep/LinuxNetLink.cpp
++++ b/osdep/LinuxNetLink.cpp
+@@ -22,6 +22,8 @@
+ #include <unistd.h>
+ #include <linux/if_tun.h>
+ 
++#include <cerrno>
++
+ #ifndef IFNAMSIZ
+ #define IFNAMSIZ 16
+ #endif
diff --git a/package/zerotier-one/0008-fix-compilation-for-arm_cortex-a7-neon.patch b/package/zerotier-one/0008-fix-compilation-for-arm_cortex-a7-neon.patch
new file mode 100644
index 0000000000..88b640f704
--- /dev/null
+++ b/package/zerotier-one/0008-fix-compilation-for-arm_cortex-a7-neon.patch
@@ -0,0 +1,23 @@
+From 7ac88ced6cdedf88ccebfc1de12d92b269d4a60a Mon Sep 17 00:00:00 2001
+From: Moritz Warning <moritzwarning@web.de>
+Date: Mon, 30 Nov 2020 12:25:42 +0100
+Subject: [PATCH 8/8] fix compilation for arm_cortex-a7+neon
+
+Fixes "error: 'vrbitq_u8' was not declared in this scope"
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+---
+ node/Constants.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/node/Constants.hpp
++++ b/node/Constants.hpp
+@@ -109,7 +109,7 @@
+ #include <immintrin.h>
+ #endif
+ 
+-#if (defined(__ARM_NEON) || defined(__ARM_NEON__) || defined(ZT_ARCH_ARM_HAS_NEON))
++#if (defined(__aarch64__) || defined(ZT_ARCH_ARM_HAS_NEON))
+ #if (defined(__APPLE__) && !defined(__LP64__)) || (defined(__ANDROID__) && defined(__arm__))
+ #ifdef ZT_ARCH_ARM_HAS_NEON
+ #undef ZT_ARCH_ARM_HAS_NEON
diff --git a/package/zerotier-one/0009-auxv.patch b/package/zerotier-one/0009-auxv.patch
new file mode 100644
index 0000000000..34991688e7
--- /dev/null
+++ b/package/zerotier-one/0009-auxv.patch
@@ -0,0 +1,11 @@
+--- a/node/Utils.cpp
++++ b/node/Utils.cpp
+@@ -28,7 +28,7 @@
+ #include <sys/stat.h>
+ #include <sys/uio.h>
+ #include <dirent.h>
+-#ifdef __LINUX__
++#if 0
+ #include <sys/auxv.h>
+ #endif
+ #endif
diff --git a/package/zerotier-one/Config.in b/package/zerotier-one/Config.in
new file mode 100644
index 0000000000..db4038c557
--- /dev/null
+++ b/package/zerotier-one/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_ZEROTIER_ONE
+	bool "zerotier-one"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBMINIUPNPC
+	select BR2_PACKAGE_LIBNATPMP
+	help
+	  ZeroTier One lets you join ZeroTier virtual networks and have
+	  them appear as tun/tap ports on your system.
+
+	  https://www.zerotier.com/
+
+comment "zerotier-one needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zerotier-one/zerotier-one.hash b/package/zerotier-one/zerotier-one.hash
new file mode 100644
index 0000000000..f6892a0cc2
--- /dev/null
+++ b/package/zerotier-one/zerotier-one.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0f45a4050cdfea1018634c88b6c302cbbfcc3f7f93cb94bed840a15e3ffa55ba  zerotier-one-1.6.4.tar.gz
+sha256  ef3edeecd9fa4fb5eff7a74afe964a02b7d9136bd07c4b4cd3864432d6890515  LICENSE.txt
diff --git a/package/zerotier-one/zerotier-one.mk b/package/zerotier-one/zerotier-one.mk
new file mode 100644
index 0000000000..f7262e875d
--- /dev/null
+++ b/package/zerotier-one/zerotier-one.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# zerotier-one
+#
+################################################################################
+
+ZEROTIER_ONE_VERSION = 1.6.4
+ZEROTIER_ONE_SITE = $(call github,zerotier,ZeroTierOne,$(ZEROTIER_ONE_VERSION))
+ZEROTIER_ONE_DEPENDENCIES = libminiupnpc libnatpmp
+ZEROTIER_ONE_LICENSE = BUSL-1.1
+ZEROTIER_ONE_LICENSE_FILES = LICENSE.txt
+
+define ZEROTIER_ONE_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define ZEROTIER_ONE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define ZEROTIER_ONE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/debian/zerotier-one.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/zerotier-one.service
+endef
+
+define ZEROTIER_ONE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(@D)/debian/zerotier-one.init \
+		$(TARGET_DIR)/etc/init.d/S60zerotier-one
+endef
+
+define ZEROTIER_ONE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1
