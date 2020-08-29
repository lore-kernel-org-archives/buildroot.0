From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 29 Aug 2020 10:26:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: new package
Message-ID: <20200829082632.27414-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 package/Config.in                             |  1 +
 .../0001-Cross-compilation-fixes.patch        | 45 +++++++++++++++++
 .../0002-Fix-parallel-make.patch              | 49 +++++++++++++++++++
 .../multipath-tools/0003-systemd-fix.patch    | 28 +++++++++++
 .../0004-udev-rules-path.patch                | 13 +++++
 ...005-libdmmp_private.h-add-TRUE-FALSE.patch | 17 +++++++
 package/multipath-tools/Config.in             | 12 +++++
 package/multipath-tools/S60multipathd         | 39 +++++++++++++++
 package/multipath-tools/multipath-tools.hash  |  3 ++
 package/multipath-tools/multipath-tools.mk    | 34 +++++++++++++
 10 files changed, 241 insertions(+)
 create mode 100644 package/multipath-tools/0001-Cross-compilation-fixes.patch
 create mode 100644 package/multipath-tools/0002-Fix-parallel-make.patch
 create mode 100644 package/multipath-tools/0003-systemd-fix.patch
 create mode 100644 package/multipath-tools/0004-udev-rules-path.patch
 create mode 100644 package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch
 create mode 100644 package/multipath-tools/Config.in
 create mode 100644 package/multipath-tools/S60multipathd
 create mode 100644 package/multipath-tools/multipath-tools.hash
 create mode 100644 package/multipath-tools/multipath-tools.mk

diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..9044829696 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2378,6 +2378,7 @@ menu "System tools"
 	source "package/mender-grubenv/Config.in"
 	source "package/mfoc/Config.in"
 	source "package/monit/Config.in"
+	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/multipath-tools/0001-Cross-compilation-fixes.patch b/package/multipath-tools/0001-Cross-compilation-fixes.patch
new file mode 100644
index 0000000000..8914b3bae7
--- /dev/null
+++ b/package/multipath-tools/0001-Cross-compilation-fixes.patch
@@ -0,0 +1,45 @@
+Index: multipath-tools-0.8.4/libmultipath/Makefile
+===================================================================
+--- multipath-tools-0.8.4.orig/libmultipath/Makefile
++++ multipath-tools-0.8.4/libmultipath/Makefile
+@@ -20,21 +20,10 @@ ifdef SYSTEMD
+ 	endif
+ endif
+ 
+-ifneq ($(call check_func,dm_task_no_flush,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
+-endif
+-
+-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_COOKIE
+-endif
+-
+-ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,/usr/include/libudev.h),0)
+-	CFLAGS += -DLIBUDEV_API_RECVBUF
+-endif
+-
+-ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_DEFERRED
+-endif
++CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
++CFLAGS += -DLIBDM_API_COOKIE
++CFLAGS += -DLIBUDEV_API_RECVBUF
++CFLAGS += -DLIBDM_API_DEFERRED
+ 
+ OBJS = memory.o parser.o vector.o devmapper.o callout.o \
+ 	hwtable.o blacklist.o util.o dmparser.o config.o \
+Index: multipath-tools-0.8.4/kpartx/Makefile
+===================================================================
+--- multipath-tools-0.8.4.orig/kpartx/Makefile
++++ multipath-tools-0.8.4/kpartx/Makefile
+@@ -8,9 +8,7 @@ LDFLAGS += $(BIN_LDFLAGS)
+ 
+ LIBDEPS += -ldevmapper
+ 
+-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
+-	CFLAGS += -DLIBDM_API_COOKIE
+-endif
++CFLAGS += -DLIBDM_API_COOKIE
+ 
+ OBJS = bsd.o dos.o kpartx.o solaris.o unixware.o dasd.o sun.o \
+ 	gpt.o mac.o ps3.o crc32.o lopart.o xstrncpy.o devmapper.o
diff --git a/package/multipath-tools/0002-Fix-parallel-make.patch b/package/multipath-tools/0002-Fix-parallel-make.patch
new file mode 100644
index 0000000000..8d493659bd
--- /dev/null
+++ b/package/multipath-tools/0002-Fix-parallel-make.patch
@@ -0,0 +1,49 @@
+Index: multipath-tools-0.8.4/Makefile
+===================================================================
+--- multipath-tools-0.8.4.orig/Makefile
++++ multipath-tools-0.8.4/Makefile
+@@ -28,7 +28,7 @@ all:	$(BUILDDIRS)
+ $(BUILDDIRS):
+ 	$(MAKE) -C $@
+ 
+-multipath multipathd mpathpersist: libmultipath
++multipath multipathd mpathpersist libmpathpersist: libmultipath
+ mpathpersist:  libmpathpersist
+ 
+ $(BUILDDIRS.clean):
+Index: multipath-tools-0.8.4/libmultipath/checkers/Makefile
+===================================================================
+--- multipath-tools-0.8.4.orig/libmultipath/checkers/Makefile
++++ multipath-tools-0.8.4/libmultipath/checkers/Makefile
+@@ -24,6 +24,7 @@ libcheck%.so: libsg.o %.o
+ 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
+ 
+ install:
++	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
+ 	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(libdir)
+ 
+ uninstall:
+Index: multipath-tools-0.8.4/libmultipath/foreign/Makefile
+===================================================================
+--- multipath-tools-0.8.4.orig/libmultipath/foreign/Makefile
++++ multipath-tools-0.8.4/libmultipath/foreign/Makefile
+@@ -14,6 +14,7 @@ libforeign-%.so: %.o
+ 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
+ 
+ install:
++	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
+ 	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(libdir)
+ 
+ uninstall:
+Index: multipath-tools-0.8.4/libmultipath/prioritizers/Makefile
+===================================================================
+--- multipath-tools-0.8.4.orig/libmultipath/prioritizers/Makefile
++++ multipath-tools-0.8.4/libmultipath/prioritizers/Makefile
+@@ -35,6 +35,7 @@ libprio%.so: %.o
+ 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
+ 
+ install: $(LIBS)
++	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
+ 	$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
+ 
+ uninstall:
diff --git a/package/multipath-tools/0003-systemd-fix.patch b/package/multipath-tools/0003-systemd-fix.patch
new file mode 100644
index 0000000000..15e708b2ca
--- /dev/null
+++ b/package/multipath-tools/0003-systemd-fix.patch
@@ -0,0 +1,28 @@
+Index: multipath-tools-0.8.4/Makefile.inc
+===================================================================
+--- multipath-tools-0.8.4.orig/Makefile.inc
++++ multipath-tools-0.8.4/Makefile.inc
+@@ -36,13 +36,8 @@ ifndef RUN
+ endif
+ 
+ ifndef SYSTEMD
+-	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
+-		SYSTEMD = $(shell pkg-config --modversion libsystemd)
+-	else
+-		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
+-			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
+-				sed -n 's/systemd \([0-9]*\).*/\1/p')
+-		endif
++	ifeq ($(shell $(PKG_CONFIG) --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
++		SYSTEMD = $(shell $(PKG_CONFIG) --modversion libsystemd)
+ 	endif
+ endif
+ 
+@@ -76,6 +71,7 @@ GZIP		= gzip -9 -c
+ RM		= rm -f
+ LN		= ln -sf
+ INSTALL_PROGRAM	= install
++PKG_CONFIG     ?= pkg-config
+ 
+ # $(call TEST_CC_OPTION,option,fallback)
+ # Test if the C compiler supports the option.
diff --git a/package/multipath-tools/0004-udev-rules-path.patch b/package/multipath-tools/0004-udev-rules-path.patch
new file mode 100644
index 0000000000..a53be4004c
--- /dev/null
+++ b/package/multipath-tools/0004-udev-rules-path.patch
@@ -0,0 +1,13 @@
+Index: multipath-tools-0.8.4/Makefile.inc
+===================================================================
+--- multipath-tools-0.8.4.orig/Makefile.inc
++++ multipath-tools-0.8.4/Makefile.inc
+@@ -49,7 +49,7 @@ prefix		=
+ exec_prefix	= $(prefix)
+ usr_prefix	= $(prefix)
+ bindir		= $(exec_prefix)/sbin
+-libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
++libudevdir	= $(prefix)/lib/udev
+ udevrulesdir	= $(libudevdir)/rules.d
+ multipathdir	= $(TOPDIR)/libmultipath
+ man8dir		= $(prefix)/usr/share/man/man8
diff --git a/package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch b/package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch
new file mode 100644
index 0000000000..4d6f71cb86
--- /dev/null
+++ b/package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch
@@ -0,0 +1,17 @@
+--- a/libdmmp/libdmmp_private.h	2020-06-29 08:29:04.308560526 +0200
++++ b/libdmmp/libdmmp_private.h	2020-06-29 08:29:12.196605583 +0200
+@@ -34,6 +34,14 @@
+ 
+ #include "libdmmp/libdmmp.h"
+ 
++#ifndef FALSE
++#define FALSE   (0)
++#endif
++
++#ifndef TRUE
++#define TRUE    (!FALSE)
++#endif
++
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
new file mode 100644
index 0000000000..54f670089c
--- /dev/null
+++ b/package/multipath-tools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MULTIPATH_TOOLS
+	bool "multipath-tools"
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
+	help
+	  Makes a small dumpfile of kdump.
diff --git a/package/multipath-tools/S60multipathd b/package/multipath-tools/S60multipathd
new file mode 100644
index 0000000000..1c687901c7
--- /dev/null
+++ b/package/multipath-tools/S60multipathd
@@ -0,0 +1,39 @@
+#!/bin/sh
+#
+# Starts multipathd.
+#
+
+start() {
+    printf "Starting multipathd: "
+    umask 077
+
+    start-stop-daemon -S -q -p /var/run/multipathd.pid \
+		      --exec /sbin/multipathd
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+    printf "Stopping multipathd: "
+    start-stop-daemon -K -q -p /var/run/multipathd.pid
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+    stop
+    start
+}
+
+case "$1" in
+    start)
+	start
+	;;
+    stop)
+	stop
+	;;
+    restart|reload)
+	restart
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
new file mode 100644
index 0000000000..7eaf246094
--- /dev/null
+++ b/package/multipath-tools/multipath-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  ccd73bf67621161d9e42d1a770c3a7efff6e252433e8b8ed5f64a88cb5e7151d  multipath-tools-0.8.4.tar.gz
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
new file mode 100644
index 0000000000..2572172895
--- /dev/null
+++ b/package/multipath-tools/multipath-tools.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# multipath-tools
+#
+################################################################################
+
+MULTIPATH_TOOLS_VERSION = 0.8.4
+MULTIPATH_TOOLS_SITE = $(call github,openSUSE,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
+MULTIPATH_TOOLS_LICENSE = LGPL-2.0
+MULTIPATH_TOOLS_LICENSE_FILES = COPYING
+MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev
+
+MULTIPATH_TOOLS_MAKE_FLAGS =
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MULTIPATH_TOOLS_DEPENDENCIES += systemd
+endif
+
+define MULTIPATH_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+		OPTFLAGS="$(TARGET_CFLAGS)"
+endef
+
+define MULTIPATH_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) install \
+		DESTDIR="$(TARGET_DIR)" $(MULTIPATH_TOOLS_MAKE_FLAGS)
+endef
+
+define MULTIPATH_TOOLS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/multipath-tools/S60multipathd \
+		$(TARGET_DIR)/etc/init.d/S60multipathd
+endef
+
+$(eval $(generic-package))
-- 
2.28.0
