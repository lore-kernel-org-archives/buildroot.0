From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Jul 2011 23:06:29 +0200
Subject: [Buildroot] [git commit] package: remove hal
Message-ID: <20110725210934.2F25B8B496@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c663498aac2a82e73e8cc3d604a1637502a49e21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hal is deprecated upstream, our package has not seen any significant
work since it was added in 2007, nothing depends on it and it's blocking
a long-overdue udev update.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                |    1 -
 package/gvfs/gvfs.mk                             |    8 +-
 package/hal/Config.in                            |   19 --
 package/hal/S98haldaemon                         |   56 -----
 package/hal/hal-include-fix.patch                |   35 ---
 package/hal/hal.mk                               |  107 ---------
 package/hal/hal02-include-ieee80211-fix.patch    |   15 --
 package/hal/hal03-link-dbus.patch                |   60 -----
 package/hal/hal04-remove-glib-dbus-headers.patch |  275 ----------------------
 package/hal/hal05-libtool-hack.patch             |   13 -
 package/hal/hal06-libintl.patch                  |   24 --
 11 files changed, 1 insertions(+), 612 deletions(-)
 delete mode 100644 package/hal/Config.in
 delete mode 100755 package/hal/S98haldaemon
 delete mode 100644 package/hal/hal-include-fix.patch
 delete mode 100644 package/hal/hal.mk
 delete mode 100644 package/hal/hal02-include-ieee80211-fix.patch
 delete mode 100644 package/hal/hal03-link-dbus.patch
 delete mode 100644 package/hal/hal04-remove-glib-dbus-headers.patch
 delete mode 100644 package/hal/hal05-libtool-hack.patch
 delete mode 100644 package/hal/hal06-libintl.patch

diff --git a/package/Config.in b/package/Config.in
index dfa6e35..812a730 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,7 +170,6 @@ source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
 source "package/gpsd/Config.in"
 source "package/gvfs/Config.in"
-source "package/hal/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/hdparm/Config.in"
 endif
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b0fcf3d..37b4acc 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -20,6 +20,7 @@ GVFS_CONF_OPT = \
 	--disable-gphoto2		\
 	--disable-keyring		\
 	--disable-bash-completion	\
+	--disable-hal
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 GVFS_DEPENDENCIES += avahi
@@ -28,13 +29,6 @@ else
 GVFS_CONF_OPT += --disable-avahi
 endif
 
-ifeq ($(BR2_PACKAGE_HAL),y)
-GVFS_DEPENDENCIES += hal
-GVFS_CONF_OPT += --enable-hal
-else
-GVFS_CONF_OPT += --disable-hal
-endif
-
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 GVFS_DEPENDENCIES += libarchive
 GVFS_CONF_OPT += --enable-archive
diff --git a/package/hal/Config.in b/package/hal/Config.in
deleted file mode 100644
index 1951c9d..0000000
--- a/package/hal/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_HAL
-	bool "hal"
-	depends on BR2_USE_WCHAR # glib2
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_DBUS
-	select BR2_DBUS_EXPAT
-	select BR2_PACKAGE_DBUS_GLIB
-	select BR2_PACKAGE_HWDATA
-	select BR2_PACKAGE_UDEV
-	select BR2_PACKAGE_UDEV_VOLUME_ID
-	help
-	  The Hardware Abstraction Layer (HAL) suite.
-
-comment "hal requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
diff --git a/package/hal/S98haldaemon b/package/hal/S98haldaemon
deleted file mode 100755
index 40ea0f4..0000000
--- a/package/hal/S98haldaemon
+++ /dev/null
@@ -1,56 +0,0 @@
-#!/bin/sh
-#
-# haldaemon:   HAL daemon
-#
-# chkconfig: 345 98 02
-# description:  This is a daemon for collecting and maintaing information \
-#               about hardware from several sources. \
-#               See http://www.freedesktop.org/Software/hal
-#
-# processname: hald
-# pidfile: /var/run/haldaemon.pid
-#
-
-# Sanity checks.
-[ -x /usr/sbin/hald ] || exit 0
-
-RETVAL=0
-
-start() {
-    echo -n "Starting HAL daemon: "
-    hald
-    RETVAL=$?
-    echo "done"
-    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/haldaemon
-}
-
-stop() {
-    echo -n "Stopping HAL daemon: "
-
-    killall hald
-    RETVAL=$?
-    echo "done"
-    if [ $RETVAL -eq 0 ]; then
-        rm -f /var/lock/subsys/haldaemon
-        rm -f /var/run/haldaemon.pid
-    fi
-}
-
-# See how we were called.
-case "$1" in
-    start)
-        start
-        ;;
-    stop)
-        stop
-        ;;
-    restart)
-        stop
-	sleep 3
-        start
-        ;;
-    *)
-        echo $"Usage: $0 {start|stop|restart}"
-        ;;
-esac
-exit $RETVAL
diff --git a/package/hal/hal-include-fix.patch b/package/hal/hal-include-fix.patch
deleted file mode 100644
index af2a7fe..0000000
--- a/package/hal/hal-include-fix.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-[PATCH] hal: add missing includes
-
-- hald/linux/classdev.c needs sys/socket.h for struct sockaddr
-- hald/linux/addons/addon-storage.c needs limits.h for INT_MAX
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- hald/linux/addons/addon-storage.c |    1 +
- hald/linux/classdev.c             |    1 +
- 2 files changed, 2 insertions(+)
-
-Index: hal-0.5.8/hald/linux/addons/addon-storage.c
-===================================================================
---- hal-0.5.8.orig/hald/linux/addons/addon-storage.c
-+++ hal-0.5.8/hald/linux/addons/addon-storage.c
-@@ -29,6 +29,7 @@
- 
- #include <errno.h>
- #include <fcntl.h>
-+#include <limits.h>
- #include <linux/cdrom.h>
- #include <linux/fs.h>
- #include <mntent.h>
-Index: hal-0.5.8/hald/linux/classdev.c
-===================================================================
---- hal-0.5.8.orig/hald/linux/classdev.c
-+++ hal-0.5.8/hald/linux/classdev.c
-@@ -31,6 +31,7 @@
- 
- #include <ctype.h>
- #include <limits.h>
-+#include <sys/socket.h>
- #include <linux/types.h>
- #include <net/if_arp.h> /* for ARPHRD_... */
- #include <stdlib.h>
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
deleted file mode 100644
index 801fe92..0000000
--- a/package/hal/hal.mk
+++ /dev/null
@@ -1,107 +0,0 @@
-#############################################################
-#
-# hal
-#
-#############################################################
-HAL_VERSION:=0.5.8
-HAL_SOURCE:=hal-$(HAL_VERSION).tar.gz
-HAL_SITE:=http://people.freedesktop.org/~david/dist/
-HAL_DIR:=$(BUILD_DIR)/hal-$(HAL_VERSION)
-HAL_CAT:=$(ZCAT)
-HAL_BINARY:=hald/hald
-HAL_TARGET_BINARY:=usr/sbin/hald
-
-GLIB_CFLAGS:=-I$(STAGING_DIR)/usr/include/glib-2.0 \
-	     -I$(STAGING_DIR)/usr/lib/glib-2.0/include
-GLIB_LIBS:=$(STAGING_DIR)/usr/lib/libglib-2.0.so \
-	   $(STAGING_DIR)/usr/lib/libgmodule-2.0.so \
-	   $(STAGING_DIR)/usr/lib/libgobject-2.0.so \
-	   $(STAGING_DIR)/usr/lib/libgthread-2.0.so
-DBUS_GLIB_LIBS:=$(STAGING_DIR)/usr/lib/libdbus-glib-1.so
-
-$(DL_DIR)/$(HAL_SOURCE):
-	$(call DOWNLOAD,$(HAL_SITE),$(HAL_SOURCE))
-
-hal-source: $(DL_DIR)/$(HAL_SOURCE)
-
-$(HAL_DIR)/.unpacked: $(DL_DIR)/$(HAL_SOURCE)
-	$(HAL_CAT) $(DL_DIR)/$(HAL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HAL_DIR) package/hal/ \*.patch
-	touch $(HAL_DIR)/.unpacked
-
-$(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked
-	(cd $(HAL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/lib/glib-2.0/include" \
-		GLIB_CFLAGS="$(GLIB_CFLAGS)" \
-		GLIB_LIBS="$(GLIB_LIBS)" \
-		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
-		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
-		VOLUME_ID_CFLAGS="$(TARGET_CFLAGS)" \
-		VOLUME_ID_LIBS="$(STAGING_DIR)/lib/libvolume_id.so" \
-		ac_cv_path_LIBUSB_CONFIG= \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--with-hwdata=$(TARGET_DIR)/usr/share/hwdata \
-		--with-expat=$(STAGING_DIR)/usr/ \
-		--disable-policy-kit \
-		--disable-gtk-doc \
-		--disable-static \
-		--disable-acpi-acpid \
-		--disable-acpi-proc \
-	)
-	touch $(HAL_DIR)/.configured
-
-$(HAL_DIR)/hald/hald: $(HAL_DIR)/.configured
-	$(MAKE) STAGING_DIR="$(STAGING_DIR)" DESTDIR="$(TARGET_DIR)" DBUS_GLIB_LIBS="$(DBUS_GLIB_LIBS)" -C $(HAL_DIR)
-
-$(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
-	$(MAKE) STAGING_DIR="$(STAGING_DIR)" DESTDIR="$(TARGET_DIR)" -C $(HAL_DIR) install
-	rm -rf $(TARGET_DIR)/usr/share/hal/device-manager
-	rm -rf $(TARGET_DIR)/usr/lib/libhal*.so
-	rm -rf $(TARGET_DIR)/usr/lib/hal
-	rm -rf $(TARGET_DIR)/etc/PolicyKit
-	$(INSTALL) -m 0755 -D package/hal/S98haldaemon $(TARGET_DIR)/etc/init.d
-	for file in hald-addon-acpi* hald-addon-cpufreq \
-		hald-addon-keyboard hald-addon-pmu \
-		hald-probe-pc-floppy hald-probe-printer \
-		hald-probe-serial hald-probe-smbios \
-		hal-storage-eject hal-storage-closetray \
-		hal-system-power-pmu hald-probe-input \
-		hald-probe-hiddev hald-addon-hid-ups; \
-	do \
-		rm -f $(TARGET_DIR)/usr/libexec/$$file; \
-	done
-
-hal: host-pkg-config host-libxml-parser-perl dbus-glib hwdata udev $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) $(TARGET_DIR)/$(HAL_TARGET_BINARY)
-
-hal-clean:
-	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
-	rm -rf $(TARGET_DIR)/etc/hal $(TARGET_DIR)/usr/share/hal
-	rm -f $(TARGET_DIR)/etc/init.d/S98haldaemon
-	rm -f $(TARGET_DIR)/etc/udev/rules.d/90-hal.rules
-	rm -f $(TARGET_DIR)/usr/bin/hal-* $(TARGET_DIR)/usr/bin/lshal
-	rm -f $(TARGET_DIR)/usr/sbin/hald
-	rm -f $(TARGET_DIR)/usr/libexec/hald-* $(TARGET_DIR)/usr/libexec/hal-*
-	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/libexec
-	rm -f $(TARGET_DIR)/usr/lib/libhal.so.1*
-	rm -f $(TARGET_DIR)/usr/lib/libhal-storage.so.1*
-	-$(MAKE) -C $(HAL_DIR) clean
-
-hal-dirclean:
-	rm -rf $(HAL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_HAL),y)
-TARGETS+=hal
-endif
diff --git a/package/hal/hal02-include-ieee80211-fix.patch b/package/hal/hal02-include-ieee80211-fix.patch
deleted file mode 100644
index 9e7b5e2..0000000
--- a/package/hal/hal02-include-ieee80211-fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -ur hal-0.5.8/hald/linux/classdev.c hal-0.5.8-patched/hald/linux/classdev.c
---- hal-0.5.8/hald/linux/classdev.c	2006-09-11 18:32:56.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/classdev.c	2007-01-13 22:00:46.896769548 -0600
-@@ -32,7 +32,10 @@
- #include <ctype.h>
- #include <limits.h>
- #include <linux/types.h>
--#include <net/if_arp.h> /* for ARPHRD_... */
-+#include <linux/if_arp.h> /* for ARPHRD_... */
-+#ifndef ARPHRD_IEEE80211_RADIOTAP
-+# define ARPHRD_IEEE80211_RADIOTAP 803
-+#endif
- #include <stdlib.h>
- #include <string.h>
- #include <stdint.h>
diff --git a/package/hal/hal03-link-dbus.patch b/package/hal/hal03-link-dbus.patch
deleted file mode 100644
index d522b85..0000000
--- a/package/hal/hal03-link-dbus.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-diff -urN hal-0.5.8/hald/linux/addons/Makefile.in hal-0.5.8-patched/hald/linux/addons/Makefile.in
---- hal-0.5.8/hald/linux/addons/Makefile.in	2006-09-11 18:25:31.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/addons/Makefile.in	2006-11-16 10:08:30.000000000 -0600
-@@ -119,7 +119,7 @@
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
--	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_LIBS) $(GLIB_LIBS) $(DBUS_GLIB_LIBS) -o $@
- SOURCES = $(hald_addon_acpi_SOURCES) \
- 	$(hald_addon_acpi_buttons_toshiba_SOURCES) \
- 	$(hald_addon_cpufreq_SOURCES) $(hald_addon_hid_ups_SOURCES) \
-diff -urN hal-0.5.8/hald/linux/probing/Makefile.in hal-0.5.8-patched/hald/linux/probing/Makefile.in
---- hal-0.5.8/hald/linux/probing/Makefile.in	2006-09-11 18:25:31.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/probing/Makefile.in	2006-11-16 10:08:30.000000000 -0600
-@@ -97,7 +97,7 @@
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
--	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_LIBS) -o $@
- SOURCES = $(hald_probe_hiddev_SOURCES) $(hald_probe_input_SOURCES) \
- 	$(hald_probe_pc_floppy_SOURCES) $(hald_probe_printer_SOURCES) \
- 	$(hald_probe_serial_SOURCES) $(hald_probe_smbios_SOURCES) \
-diff -urN hal-0.5.8/hald/Makefile.in hal-0.5.8-patched/hald/Makefile.in
---- hal-0.5.8/hald/Makefile.in	2006-09-11 18:25:30.000000000 -0500
-+++ hal-0.5.8-patched/hald/Makefile.in	2006-11-16 10:08:30.000000000 -0600
-@@ -71,7 +71,7 @@
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
--	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_GLIB_LIBS) $(GLIB_LIBS) -o $@
- SOURCES = $(hald_SOURCES)
- DIST_SOURCES = $(hald_SOURCES)
- RECURSIVE_TARGETS = all-recursive check-recursive dvi-recursive \
-diff -urN hal-0.5.8/hald-runner/Makefile.in hal-0.5.8-patched/hald-runner/Makefile.in
---- hal-0.5.8/hald-runner/Makefile.in	2006-09-11 18:25:30.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/Makefile.in	2006-11-16 10:09:06.000000000 -0600
-@@ -64,7 +64,7 @@
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
--	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+	$(AM_LDFLAGS) $(LDFLAGS) $(GLIB_LIBS) $(DBUS_GLIB_LIBS) -o $@
- SOURCES = $(hald_runner_SOURCES)
- DIST_SOURCES = $(hald_runner_SOURCES)
- ETAGS = etags
-diff -urN hal-0.5.8/tools/Makefile.in hal-0.5.8-patched/tools/Makefile.in
---- hal-0.5.8/tools/Makefile.in	2006-09-11 18:25:33.000000000 -0500
-+++ hal-0.5.8-patched/tools/Makefile.in	2006-11-16 10:10:14.000000000 -0600
-@@ -133,7 +133,7 @@
- 	$(AM_CFLAGS) $(CFLAGS)
- CCLD = $(CC)
- LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
--	$(AM_LDFLAGS) $(LDFLAGS) -o $@
-+	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_LIBS) $(GLIB_LIBS) $(DBUS_GLIB_LIBS) -o $@
- SOURCES = $(hal_device_SOURCES) $(hal_find_by_capability_SOURCES) \
- 	$(hal_find_by_property_SOURCES) $(hal_get_property_SOURCES) \
- 	$(hal_set_property_SOURCES) \
diff --git a/package/hal/hal04-remove-glib-dbus-headers.patch b/package/hal/hal04-remove-glib-dbus-headers.patch
deleted file mode 100644
index fd83bd2..0000000
--- a/package/hal/hal04-remove-glib-dbus-headers.patch
+++ /dev/null
@@ -1,275 +0,0 @@
-diff -ur hal-0.5.8/hald/device_info.c hal-0.5.8-patched/hald/device_info.c
---- hal-0.5.8/hald/device_info.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/device_info.c	2006-11-15 11:52:24.000000000 -0600
-@@ -33,8 +33,6 @@
- #include <dirent.h>
- #include <expat.h>
- #include <assert.h>
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
- #include <math.h>
- 
- #include "hald.h"
-diff -ur hal-0.5.8/hald/dummy/osspec.c hal-0.5.8-patched/hald/dummy/osspec.c
---- hal-0.5.8/hald/dummy/osspec.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/dummy/osspec.c	2006-11-15 11:52:24.000000000 -0600
-@@ -28,8 +28,6 @@
- #endif
- 
- #include <glib.h>
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
- 
- #include "../osspec.h"
- #include "../logger.h"
-diff -ur hal-0.5.8/hald/hald.c hal-0.5.8-patched/hald/hald.c
---- hal-0.5.8/hald/hald.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/hald.c	2006-11-15 11:52:24.000000000 -0600
-@@ -42,10 +42,6 @@
- #include <grp.h>
- #include <syslog.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--#include <dbus/dbus-glib-lowlevel.h>
--
- /*#include "master_slave.h"*/
- 
- #include "logger.h"
-diff -ur hal-0.5.8/hald/hald_dbus.c hal-0.5.8-patched/hald/hald_dbus.c
---- hal-0.5.8/hald/hald_dbus.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/hald_dbus.c	2006-11-15 11:52:24.000000000 -0600
-@@ -35,9 +35,6 @@
- #include <stdint.h>
- #include <sys/time.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib-lowlevel.h>
--
- #include "hald.h"
- #include "hald_dbus.h"
- #include "device.h"
-diff -ur hal-0.5.8/hald/hald_runner.c hal-0.5.8-patched/hald/hald_runner.c
---- hal-0.5.8/hald/hald_runner.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/hald_runner.c	2006-11-15 11:52:24.000000000 -0600
-@@ -31,8 +31,6 @@
- #include <stdio.h>
- 
- #include <glib.h>
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib-lowlevel.h>
- 
- #include "hald.h"
- #include "util.h"
-diff -ur hal-0.5.8/hald/linux/addons/addon-cpufreq.h hal-0.5.8-patched/hald/linux/addons/addon-cpufreq.h
---- hal-0.5.8/hald/linux/addons/addon-cpufreq.h	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/addons/addon-cpufreq.h	2006-11-15 11:52:24.000000000 -0600
-@@ -29,8 +29,6 @@
- #include <config.h>
- #endif
- 
--#include <dbus/dbus-glib.h>
--#include <dbus/dbus-glib-lowlevel.h>
- #include <glib.h>
- #include <stdio.h>
- #include <stdlib.h>
-diff -ur hal-0.5.8/hald/linux/addons/addon-macbookpro-backlight.c hal-0.5.8-patched/hald/linux/addons/addon-macbookpro-backlight.c
---- hal-0.5.8/hald/linux/addons/addon-macbookpro-backlight.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/addons/addon-macbookpro-backlight.c	2006-11-15 11:52:24.000000000 -0600
-@@ -37,8 +37,6 @@
- #include <unistd.h> 
- 
- #include <glib/gmain.h>
--#include <dbus/dbus-glib.h>
--#include <dbus/dbus-glib-lowlevel.h>
- 
- #include "libhal/libhal.h"
- #include "../../logger.h"
-diff -ur hal-0.5.8/hald/linux/addons/addon-usb-csr.c hal-0.5.8-patched/hald/linux/addons/addon-usb-csr.c
---- hal-0.5.8/hald/linux/addons/addon-usb-csr.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/addons/addon-usb-csr.c	2006-11-15 11:52:24.000000000 -0600
-@@ -30,8 +30,6 @@
- #include <usb.h>
- 
- #include <glib/gmain.h>
--#include <dbus/dbus-glib.h>
--#include <dbus/dbus-glib-lowlevel.h>
- 
- #include "libhal/libhal.h"
- #include "../../logger.h"
-diff -ur hal-0.5.8/hald/linux/blockdev.c hal-0.5.8-patched/hald/linux/blockdev.c
---- hal-0.5.8/hald/linux/blockdev.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/blockdev.c	2006-11-15 11:52:24.000000000 -0600
-@@ -37,9 +37,6 @@
- #include <syslog.h>
- #include <unistd.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--
- #include "../device_info.h"
- #include "../hald.h"
- #include "../hald_dbus.h"
-diff -ur hal-0.5.8/hald/linux/classdev.c hal-0.5.8-patched/hald/linux/classdev.c
---- hal-0.5.8/hald/linux/classdev.c	2006-09-11 18:32:56.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/classdev.c	2006-11-15 11:52:24.000000000 -0600
-@@ -39,9 +39,6 @@
- #include <sys/stat.h>
- #include <unistd.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--
- #include "../device_info.h"
- #include "../device_store.h"
- #include "../hald.h"
-diff -ur hal-0.5.8/hald/linux/coldplug.c hal-0.5.8-patched/hald/linux/coldplug.c
---- hal-0.5.8/hald/linux/coldplug.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/coldplug.c	2006-11-15 11:52:24.000000000 -0600
-@@ -33,9 +33,6 @@
- #include <sys/stat.h>
- #include <unistd.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--
- #include "../device_info.h"
- #include "../hald.h"
- #include "../logger.h"
-diff -ur hal-0.5.8/hald/linux/hotplug.c hal-0.5.8-patched/hald/linux/hotplug.c
---- hal-0.5.8/hald/linux/hotplug.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/hotplug.c	2006-11-15 11:52:24.000000000 -0600
-@@ -32,9 +32,6 @@
- #include <string.h>
- #include <unistd.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--
- #include "../device_info.h"
- #include "../hald.h"
- #include "../logger.h"
-diff -ur hal-0.5.8/hald/linux/ids.c hal-0.5.8-patched/hald/linux/ids.c
---- hal-0.5.8/hald/linux/ids.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/ids.c	2006-11-15 11:56:11.000000000 -0600
-@@ -33,7 +33,6 @@
- #include <unistd.h>
- 
- #include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
- 
- #include "../logger.h"
- 
-diff -ur hal-0.5.8/hald/linux/osspec.c hal-0.5.8-patched/hald/linux/osspec.c
---- hal-0.5.8/hald/linux/osspec.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/osspec.c	2006-11-15 11:52:24.000000000 -0600
-@@ -44,9 +44,6 @@
- #include <sys/utsname.h>
- #include <unistd.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--
- #include "../device_info.h"
- #include "../hald.h"
- #include "../hald_dbus.h"
-diff -ur hal-0.5.8/hald/linux/physdev.c hal-0.5.8-patched/hald/linux/physdev.c
---- hal-0.5.8/hald/linux/physdev.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/linux/physdev.c	2006-11-15 11:52:24.000000000 -0600
-@@ -31,9 +31,6 @@
- #include <stdint.h>
- #include <unistd.h>
- 
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
--
- #include "../device_info.h"
- #include "../hald.h"
- #include "../logger.h"
-diff -ur hal-0.5.8/hald/util.c hal-0.5.8-patched/hald/util.c
---- hal-0.5.8/hald/util.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald/util.c	2006-11-15 11:52:24.000000000 -0600
-@@ -42,8 +42,6 @@
- #include <sys/file.h>
- 
- #include <glib.h>
--#include <dbus/dbus.h>
--#include <dbus/dbus-glib.h>
- 
- #include "osspec.h"
- #include "logger.h"
-diff -ur hal-0.5.8/hald-runner/main.c hal-0.5.8-patched/hald-runner/main.c
---- hal-0.5.8/hald-runner/main.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/main.c	2006-11-15 11:52:24.000000000 -0600
-@@ -24,8 +24,6 @@
-  **************************************************************************/
- #include <stdio.h>
- #include <stdlib.h>
--#define DBUS_API_SUBJECT_TO_CHANGE 
--#include <dbus/dbus-glib-lowlevel.h>
- 
- #include <glib.h>
- #include "utils.h"
-diff -ur hal-0.5.8/hald-runner/runner.c hal-0.5.8-patched/hald-runner/runner.c
---- hal-0.5.8/hald-runner/runner.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/runner.c	2006-11-15 11:56:42.000000000 -0600
-@@ -31,8 +31,7 @@
- #include <signal.h>
- #include <string.h>
- 
--#define DBUS_API_SUBJECT_TO_CHANGE 
--#include <dbus/dbus-glib-lowlevel.h>
-+#include <dbus/dbus.h>
- 
- #include <glib.h>
- #include "utils.h"
-diff -ur hal-0.5.8/hald-runner/runner.h hal-0.5.8-patched/hald-runner/runner.h
---- hal-0.5.8/hald-runner/runner.h	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/runner.h	2006-11-15 11:52:24.000000000 -0600
-@@ -25,9 +25,6 @@
- #ifndef RUNNER_H
- #define RUNNER_H
- 
--#define DBUS_API_SUBJECT_TO_CHANGE 
--#include <dbus/dbus-glib-lowlevel.h>
--
- #include <glib.h>
- 
- typedef struct {
-diff -ur hal-0.5.8/hald-runner/utils.c hal-0.5.8-patched/hald-runner/utils.c
---- hal-0.5.8/hald-runner/utils.c	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/utils.c	2006-11-15 11:52:24.000000000 -0600
-@@ -24,8 +24,6 @@
-  **************************************************************************/
- #include <stdio.h>
- #include <stdlib.h>
--#define DBUS_API_SUBJECT_TO_CHANGE 
--#include <dbus/dbus-glib-lowlevel.h>
- #include <glib.h>
- 
- #include "utils.h"
-diff -ur hal-0.5.8/hald-runner/utils.h hal-0.5.8-patched/hald-runner/utils.h
---- hal-0.5.8/hald-runner/utils.h	2006-09-11 16:56:39.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/utils.h	2006-11-15 11:52:35.000000000 -0600
-@@ -25,8 +25,7 @@
- #ifndef UTILS_H
- #define UTILS_H
- 
--#define DBUS_API_SUBJECT_TO_CHANGE 
--#include <dbus/dbus-glib-lowlevel.h>
-+#include <dbus/dbus.h>
- 
- char **get_string_array(DBusMessageIter *iter, gchar *extra);
- char **get_string_array_from_fd(int fd);
-diff -ur hal-0.5.8/tools/lshal.c hal-0.5.8-patched/tools/lshal.c
---- hal-0.5.8/tools/lshal.c	2006-09-11 16:56:40.000000000 -0500
-+++ hal-0.5.8-patched/tools/lshal.c	2006-11-15 11:52:24.000000000 -0600
-@@ -36,8 +36,6 @@
- #include <getopt.h>
- 
- #include <glib.h>
--#include <dbus/dbus-glib-lowlevel.h>
--#include <dbus/dbus-glib.h>
- #include <libhal.h>
- 
- #ifdef __SUNPRO_C
diff --git a/package/hal/hal05-libtool-hack.patch b/package/hal/hal05-libtool-hack.patch
deleted file mode 100644
index 1b7e112..0000000
--- a/package/hal/hal05-libtool-hack.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -ur hal-0.5.8/libhal-storage/Makefile.in hal-0.5.8-patched/libhal-storage/Makefile.in
---- hal-0.5.8/libhal-storage/Makefile.in	2006-09-11 18:25:32.000000000 -0500
-+++ hal-0.5.8-patched/libhal-storage/Makefile.in	2007-01-14 17:17:28.628840792 -0600
-@@ -354,8 +354,7 @@
- 	@list='$(lib_LTLIBRARIES)'; for p in $$list; do \
- 	  if test -f $$p; then \
- 	    f=$(am__strip_dir) \
--	    echo " $(LIBTOOL) --mode=install $(libLTLIBRARIES_INSTALL) $(INSTALL_STRIP_FLAG) '$$p' '$(DESTDIR)$(libdir)/$$f'"; \
--	    $(LIBTOOL) --mode=install $(libLTLIBRARIES_INSTALL) $(INSTALL_STRIP_FLAG) "$$p" "$(DESTDIR)$(libdir)/$$f"; \
-+	    cp -a "$$p" "$(DESTDIR)$(libdir)/$$f"; \
- 	  else :; fi; \
- 	done
- 
diff --git a/package/hal/hal06-libintl.patch b/package/hal/hal06-libintl.patch
deleted file mode 100644
index d38124e..0000000
--- a/package/hal/hal06-libintl.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -ur hal-0.5.8/hald/Makefile.in hal-0.5.8-patched/hald/Makefile.in
---- hal-0.5.8/hald/Makefile.in	2006-09-11 18:25:30.000000000 -0500
-+++ hal-0.5.8-patched/hald/Makefile.in	2007-01-17 08:54:04.000000000 -0600
-@@ -336,7 +336,7 @@
- 	osspec.h							\
- 	property.h			property.c			
- 
--hald_LDADD = @GLIB_LIBS@ @DBUS_LIBS@ -lm @EXPAT_LIB@ $(top_builddir)/hald/$(HALD_BACKEND)/libhald_$(HALD_BACKEND).la
-+hald_LDADD = @GLIB_LIBS@ @DBUS_LIBS@ -lm @EXPAT_LIB@ @INTLLIBS@ $(top_builddir)/hald/$(HALD_BACKEND)/libhald_$(HALD_BACKEND).la
- 
- #### Init scripts fun
- SCRIPT_IN_FILES = haldaemon.in
-diff -ur hal-0.5.8/hald-runner/Makefile.in hal-0.5.8-patched/hald-runner/Makefile.in
---- hal-0.5.8/hald-runner/Makefile.in	2006-09-11 18:25:30.000000000 -0500
-+++ hal-0.5.8-patched/hald-runner/Makefile.in	2007-01-17 08:54:18.000000000 -0600
-@@ -303,7 +303,7 @@
- 	@DBUS_CFLAGS@ @GLIB_CFLAGS@
- 
- hald_runner_SOURCES = main.c runner.c runner.h utils.h utils.c
--hald_runner_LDADD = @GLIB_LIBS@ @DBUS_LIBS@
-+hald_runner_LDADD = @GLIB_LIBS@ @DBUS_LIBS@ @INTLLIBS@
- all: all-am
- 
- .SUFFIXES:
-- 
1.7.3.4
