From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Mon, 31 Aug 2020 20:50:10 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/multipath-tools: new package
Message-ID: <20200831185010.16556-1-egorenar-dev@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...ath-use-pkg-config-to-get-path-to-he.patch | 59 +++++++++++++++++++
 ...bmpathpersist-depend-on-libmultipath.patch | 30 ++++++++++
 ...3-fix-boolean-value-with-json-c-0.14.patch | 40 +++++++++++++
 ...ools-Makefile-add-install-dependency.patch | 31 ++++++++++
 package/multipath-tools/Config.in             | 30 ++++++++++
 package/multipath-tools/S60multipathd         | 47 +++++++++++++++
 package/multipath-tools/multipath-tools.hash  |  3 +
 package/multipath-tools/multipath-tools.mk    | 31 ++++++++++
 10 files changed, 275 insertions(+)
 create mode 100644 package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
 create mode 100644 package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
 create mode 100644 package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
 create mode 100644 package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch
 create mode 100644 package/multipath-tools/Config.in
 create mode 100644 package/multipath-tools/S60multipathd
 create mode 100644 package/multipath-tools/multipath-tools.hash
 create mode 100644 package/multipath-tools/multipath-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3dcda859..21701ea17c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -137,6 +137,9 @@ F:	package/fastd/
 F:	package/libuecc/
 F:	package/putty/
 
+N:	Alexander Egorenkov <egorenar-dev@posteo.net>
+F:	package/multipath-tools/
+
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
 
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
diff --git a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
new file mode 100644
index 0000000000..e1ab73312d
--- /dev/null
+++ b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
@@ -0,0 +1,59 @@
+From f55b1a37e2c43b67e7fd7f6a39afe2b2316b7cf9 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar-dev@posteo.net>
+Date: Mon, 31 Aug 2020 19:05:46 +0200
+Subject: [PATCH 1/1] kpartx, libmultipath: use pkg-config to get path to
+ headers
+
+Use pkg-config in Makefile to find path to devmapper and udev headers
+to enable cross-compilation.
+
+Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
+---
+ kpartx/Makefile       | 2 +-
+ libmultipath/Makefile | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/kpartx/Makefile b/kpartx/Makefile
+index 2906a984..29573890 100644
+--- a/kpartx/Makefile
++++ b/kpartx/Makefile
+@@ -8,7 +8,7 @@ LDFLAGS += $(BIN_LDFLAGS)
+ 
+ LIBDEPS += -ldevmapper
+ 
+-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
++ifneq ($(call check_func,dm_task_set_cookie,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
+ 	CFLAGS += -DLIBDM_API_COOKIE
+ endif
+ 
+diff --git a/libmultipath/Makefile b/libmultipath/Makefile
+index e5651e49..51ad0193 100644
+--- a/libmultipath/Makefile
++++ b/libmultipath/Makefile
+@@ -20,19 +20,19 @@ ifdef SYSTEMD
+ 	endif
+ endif
+ 
+-ifneq ($(call check_func,dm_task_no_flush,/usr/include/libdevmapper.h),0)
++ifneq ($(call check_func,dm_task_no_flush,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
+ 	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
+ endif
+ 
+-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
++ifneq ($(call check_func,dm_task_set_cookie,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
+ 	CFLAGS += -DLIBDM_API_COOKIE
+ endif
+ 
+-ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,/usr/include/libudev.h),0)
++ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,$(shell $(PKG_CONFIG) --variable=includedir libudev)/libudev.h),0)
+ 	CFLAGS += -DLIBUDEV_API_RECVBUF
+ endif
+ 
+-ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
++ifneq ($(call check_func,dm_task_deferred_remove,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
+ 	CFLAGS += -DLIBDM_API_DEFERRED
+ endif
+ 
+-- 
+2.28.0
+
diff --git a/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch b/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
new file mode 100644
index 0000000000..236d2b7116
--- /dev/null
+++ b/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
@@ -0,0 +1,30 @@
+From 48f537b9fef4f9db761466b8951fb63243f06602 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 6 May 2020 09:35:47 +0200
+Subject: [PATCH 1/1] libmpathpersist: depend on libmultipath
+
+Without this the build fails with:
+
+/usr/bin/ld: cannot find -lmultipath
+
+Signed-off-by: Christian Hesse <mail@eworm.de>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1dee3680..ba1d73ba 100644
+--- a/Makefile
++++ b/Makefile
+@@ -28,7 +28,7 @@ all:	$(BUILDDIRS)
+ $(BUILDDIRS):
+ 	$(MAKE) -C $@
+ 
+-multipath multipathd mpathpersist: libmultipath
++libmpathpersist multipath multipathd mpathpersist: libmultipath
+ mpathpersist:  libmpathpersist
+ 
+ $(BUILDDIRS.clean):
+-- 
+2.28.0
+
diff --git a/package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch b/package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
new file mode 100644
index 0000000000..7f4ad9a1fa
--- /dev/null
+++ b/package/multipath-tools/0003-fix-boolean-value-with-json-c-0.14.patch
@@ -0,0 +1,40 @@
+From 82129852d74785267f95ef598ac483ff9af38a55 Mon Sep 17 00:00:00 2001
+From: "mail at eworm.de" <mail@eworm.de>
+Date: Sat, 25 Apr 2020 21:11:13 +0200
+Subject: [PATCH 1/1] fix boolean value with json-c 0.14
+
+Upstream json-c removed the TRUE and FALSE defines in commit
+0992aac61f8b087efd7094e9ac2b84fa9c040fcd.
+
+[mwilck]: Use stdbool.h, and keep the log message unchanged.
+
+Signed-off-by: Christian Hesse <mail@eworm.de>
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+---
+ libdmmp/libdmmp_private.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
+index ac85b63f..b1a6ddea 100644
+--- a/libdmmp/libdmmp_private.h
++++ b/libdmmp/libdmmp_private.h
+@@ -30,6 +30,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ #include <assert.h>
++#include <stdbool.h>
+ #include <json.h>
+ 
+ #include "libdmmp/libdmmp.h"
+@@ -82,7 +83,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
+ do { \
+ 	json_type j_type = json_type_null; \
+ 	json_object *j_obj_tmp = NULL; \
+-	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
++	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != true) { \
+ 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
+ 		       "key '%s' not found", key); \
+ 		rc = DMMP_ERR_IPC_ERROR; \
+-- 
+2.28.0
+
diff --git a/package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch b/package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch
new file mode 100644
index 0000000000..e19748d85f
--- /dev/null
+++ b/package/multipath-tools/0004-multipath-tools-Makefile-add-install-dependency.patch
@@ -0,0 +1,31 @@
+From ec2b935d2af33651f34de8bd6e428156005c2e3d Mon Sep 17 00:00:00 2001
+From: Martin Wilck <mwilck@suse.com>
+Date: Tue, 12 May 2020 22:13:51 +0200
+Subject: [PATCH 1/1] multipath-tools Makefile: add install dependency
+
+$(libdir) must exist before running "make install" on prioritizer, checker,
+and foreign libraries.
+
+Cc: Christian Hesse <mail@eworm.de>
+---
+ Makefile | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index fec3b73b..8bcaba66 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,6 +32,10 @@ libmultipath libdmmp: libmpathcmd
+ libmpathpersist multipath multipathd: libmultipath
+ mpathpersist multipathd:  libmpathpersist
+ 
++libmultipath/checkers.install \
++	libmultipath/prioritizers.install \
++	libmultipath/foreign.install: libmultipath.install
++
+ $(BUILDDIRS.clean):
+ 	$(MAKE) -C ${@:.clean=} clean
+ 
+-- 
+2.28.0
+
diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
new file mode 100644
index 0000000000..74bfe74964
--- /dev/null
+++ b/package/multipath-tools/Config.in
@@ -0,0 +1,30 @@
+comment "multipath-tools needs a uClibc or glibc toolchain"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_MULTIPATH_TOOLS
+	bool "multipath-tools"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
+	select BR2_PACKAGE_READLINE
+	help
+	  This package provides the following binaries to drive the Device Mapper
+	  multipathing driver:  
+	    * multipath - Device mapper target autoconfig.
+	    * multipathd - Multipath daemon.
+	    * mpathpersist - Manages SCSI persistent reservations on dm multipath devices.
+	    * kpartx - Create device maps from partition tables.
+
+	  https://github.com/openSUSE/multipath-tools
diff --git a/package/multipath-tools/S60multipathd b/package/multipath-tools/S60multipathd
new file mode 100644
index 0000000000..ff995e9378
--- /dev/null
+++ b/package/multipath-tools/S60multipathd
@@ -0,0 +1,47 @@
+#!/bin/sh
+
+DAEMON="multipathd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/sbin/$DAEMON"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
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
index 0000000000..e3b8815597
--- /dev/null
+++ b/package/multipath-tools/multipath-tools.mk
@@ -0,0 +1,31 @@
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
+MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+MULTIPATH_TOOLS_DEPENDENCIES += systemd
+endif
+
+define MULTIPATH_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define MULTIPATH_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install \
+		DESTDIR="$(TARGET_DIR)"
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
