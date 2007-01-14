From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun, 14 Jan 2007 15:21:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  hal
Message-ID: <20070114232136.F27D348606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-14 15:21:36 -0800 (Sun, 14 Jan 2007)
New Revision: 17307

Log:
Add new 'hal' package.


Added:
   trunk/buildroot/package/hal/
   trunk/buildroot/package/hal/Config.in
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/hal/hal01-configure-buildroot-cross.patch
   trunk/buildroot/package/hal/hal02-include-ieee80211-fix.patch
   trunk/buildroot/package/hal/hal03-link-dbus.patch
   trunk/buildroot/package/hal/hal04-remove-glib-dbus-headers.patch
   trunk/buildroot/package/hal/hal05-libtool-hack.patch
   trunk/buildroot/package/hal/init-hal


Changeset:
Added: trunk/buildroot/package/hal/Config.in
===================================================================
--- trunk/buildroot/package/hal/Config.in	                        (rev 0)
+++ trunk/buildroot/package/hal/Config.in	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HAL
+	bool "hal"
+	default n
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_UDEV_VOLUME_ID
+	help
+	  The Hardware Abstraction Layer (HAL) suite.

Added: trunk/buildroot/package/hal/hal.mk
===================================================================
--- trunk/buildroot/package/hal/hal.mk	                        (rev 0)
+++ trunk/buildroot/package/hal/hal.mk	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,115 @@
+#############################################################
+#
+# hal
+#
+#############################################################
+HAL_VER:=0.5.8
+HAL_SOURCE:=hal-$(HAL_VER).tar.gz
+HAL_SITE:=http://people.freedesktop.org/~david/dist/
+HAL_DIR:=$(BUILD_DIR)/hal-$(HAL_VER)
+HAL_CAT:=$(ZCAT)
+HAL_BINARY:=hald/hald
+HAL_TARGET_BINARY:=usr/sbin/hald
+
+GLIB_CFLAGS:=-I$(STAGING_DIR)/include/glib-2.0 \
+	     -I$(STAGING_DIR)/lib/glib/include
+GLIB_LIBS:=$(STAGING_DIR)/lib/libglib-2.0.so	\
+	   $(STAGING_DIR)/lib/libgmodule-2.0.so \
+	   $(STAGING_DIR)/lib/libgobject-2.0.so \
+	   $(STAGING_DIR)/lib/libgthread-2.0.so
+DBUS_GLIB_LIBS:=$(STAGING_DIR)/usr/lib/libdbus-glib-1.so
+
+$(DL_DIR)/$(HAL_SOURCE):
+	$(WGET) -P $(DL_DIR) $(HAL_SITE)/$(HAL_SOURCE)
+
+hal-source: $(DL_DIR)/$(HAL_SOURCE)
+
+$(HAL_DIR)/.unpacked: $(DL_DIR)/$(HAL_SOURCE)
+	$(HAL_CAT) $(DL_DIR)/$(HAL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(HAL_DIR) package/hal/ \*.patch
+	touch $(HAL_DIR)/.unpacked
+
+$(HAL_DIR)/.configured: $(HAL_DIR)/.unpacked /usr/bin/pkg-config
+	(cd $(HAL_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/lib/glib-2.0/include" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		GLIB_CFLAGS="$(GLIB_CFLAGS)" \
+		GLIB_LIBS="$(GLIB_LIBS)" \
+		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
+		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
+		VOLUME_ID_CFLAGS="$(TARGET_CFLAGS)" \
+		VOLUME_ID_LIBS="$(STAGING_DIR)/usr/lib/libvolume_id.so" \
+		PKG_CONFIG=/usr/bin/pkg-config \
+		ac_cv_path_LIBUSB_CONFIG= \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--datadir=/usr/share \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--with-hwdata=$(TARGET_DIR)/usr/share/hwdata \
+		--disable-policy-kit \
+		--disable-gtk-doc \
+		--disable-static \
+		--disable-acpi-acpid \
+		--disable-acpi-proc \
+	);
+	touch  $(HAL_DIR)/.configured
+
+$(HAL_DIR)/hald/hald: $(HAL_DIR)/.configured
+	$(MAKE) STAGING_DIR="$(STAGING_DIR)" DESTDIR="$(TARGET_DIR)" DBUS_GLIB_LIBS="$(DBUS_GLIB_LIBS)" -C $(HAL_DIR)
+
+$(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
+	$(MAKE) STAGING_DIR="$(STAGING_DIR)" DESTDIR="$(TARGET_DIR)" -C $(HAL_DIR) install
+	rm -rf $(TARGET_DIR)/usr/share/locale
+	rm -rf $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/usr/share/gtk-doc
+	rm -rf $(TARGET_DIR)/usr/share/hal/device-manager
+	rm -rf $(TARGET_DIR)/usr/lib/pkgconfig
+	rm -rf $(TARGET_DIR)/usr/include
+	rm -rf $(TARGET_DIR)/usr/lib/libhal*.so
+	rm -rf $(TARGET_DIR)/usr/lib/libhal*.la
+	rm -rf $(TARGET_DIR)/usr/lib/hal
+	rm -rf $(TARGET_DIR)/etc/PolicyKit
+	$(INSTALL) -m 0755 -D package/hal/init-hal $(TARGET_DIR)/etc/init.d/S98haldaemon
+	rm -rf $(TARGET_DIR)/etc/rc.d
+	for file in hald-addon-acpi* hald-addon-cpufreq		\
+		    hald-addon-keyboard hald-addon-pmu		\
+		    hald-probe-pc-floppy hald-probe-printer	\
+		    hald-probe-serial hald-probe-smbios		\
+		    hal-storage-eject hal-storage-closetray	\
+		    hal-system-power-pmu hald-probe-input	\
+		    hald-probe-hiddev hald-addon-hid-ups; do	\
+		rm -f $(TARGET_DIR)/usr/libexec/$$file;		\
+	done
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libhal*
+
+hal: uclibc dbus-glib hwdata udev-volume_id $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+
+hal-clean:
+	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
+	rm -rf $(TARGET_DIR)/etc/hal $(TARGET_DIR)/usr/share/hal
+	rm -f $(TARGET_DIR)/etc/init.d/S98haldaemon
+	rm -f $(TARGET_DIR)/etc/udev/rules.d/90-hal.rules
+	rm -f $(TARGET_DIR)/usr/bin/hal-* $(TARGET_DIR)/usr/bin/lshal
+	rm -f $(TARGET_DIR)/usr/sbin/hald
+	rm -f $(TARGET_DIR)/usr/libexec/hald-* $(TARGET_DIR)/usr/libexec/hal-*
+	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/libexec
+	rm -f $(TARGET_DIR)/usr/lib/libhal.so.1*
+	rm -f $(TARGET_DIR)/usr/lib/libhal-storage.so.1*
+	-$(MAKE) -C $(HAL_DIR) clean
+
+hal-dirclean:
+	rm -rf $(HAL_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_HAL)),y)
+TARGETS+=hal
+endif

Added: trunk/buildroot/package/hal/hal01-configure-buildroot-cross.patch
===================================================================
--- trunk/buildroot/package/hal/hal01-configure-buildroot-cross.patch	                        (rev 0)
+++ trunk/buildroot/package/hal/hal01-configure-buildroot-cross.patch	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,10 @@
+diff -ur hal-0.5.8/configure hal-0.5.8-patched/configure
+--- hal-0.5.8/configure	2006-11-15 12:34:03.000000000 -0600
++++ hal-0.5.8-patched/configure	2006-11-15 12:33:36.000000000 -0600
+@@ -22014,7 +22014,7 @@
+ echo "$as_me:$LINENO: result: $ac_cv_lib_expat_XML_ParserCreate" >&5
+ echo "${ECHO_T}$ac_cv_lib_expat_XML_ParserCreate" >&6
+ if test $ac_cv_lib_expat_XML_ParserCreate = yes; then
+-  EXPAT_LIB="-lexpat"
++  EXPAT_LIB="\$(STAGING_DIR)/lib/libexpat.so"
+ fi

Added: trunk/buildroot/package/hal/hal02-include-ieee80211-fix.patch
===================================================================
--- trunk/buildroot/package/hal/hal02-include-ieee80211-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/hal/hal02-include-ieee80211-fix.patch	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,15 @@
+diff -ur hal-0.5.8/hald/linux/classdev.c hal-0.5.8-patched/hald/linux/classdev.c
+--- hal-0.5.8/hald/linux/classdev.c	2006-09-11 18:32:56.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/classdev.c	2007-01-13 22:00:46.896769548 -0600
+@@ -32,7 +32,10 @@
+ #include <ctype.h>
+ #include <limits.h>
+ #include <linux/types.h>
+-#include <net/if_arp.h> /* for ARPHRD_... */
++#include <linux/if_arp.h> /* for ARPHRD_... */
++#ifndef ARPHRD_IEEE80211_RADIOTAP
++# define ARPHRD_IEEE80211_RADIOTAP 803
++#endif
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdint.h>

Added: trunk/buildroot/package/hal/hal03-link-dbus.patch
===================================================================
--- trunk/buildroot/package/hal/hal03-link-dbus.patch	                        (rev 0)
+++ trunk/buildroot/package/hal/hal03-link-dbus.patch	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,60 @@
+diff -urN hal-0.5.8/hald/linux/addons/Makefile.in hal-0.5.8-patched/hald/linux/addons/Makefile.in
+--- hal-0.5.8/hald/linux/addons/Makefile.in	2006-09-11 18:25:31.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/addons/Makefile.in	2006-11-16 10:08:30.000000000 -0600
+@@ -119,7 +119,7 @@
+ 	$(AM_CFLAGS) $(CFLAGS)
+ CCLD = $(CC)
+ LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+-	$(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_LIBS) $(GLIB_LIBS) $(DBUS_GLIB_LIBS) -o $@
+ SOURCES = $(hald_addon_acpi_SOURCES) \
+ 	$(hald_addon_acpi_buttons_toshiba_SOURCES) \
+ 	$(hald_addon_cpufreq_SOURCES) $(hald_addon_hid_ups_SOURCES) \
+diff -urN hal-0.5.8/hald/linux/probing/Makefile.in hal-0.5.8-patched/hald/linux/probing/Makefile.in
+--- hal-0.5.8/hald/linux/probing/Makefile.in	2006-09-11 18:25:31.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/probing/Makefile.in	2006-11-16 10:08:30.000000000 -0600
+@@ -97,7 +97,7 @@
+ 	$(AM_CFLAGS) $(CFLAGS)
+ CCLD = $(CC)
+ LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+-	$(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_LIBS) -o $@
+ SOURCES = $(hald_probe_hiddev_SOURCES) $(hald_probe_input_SOURCES) \
+ 	$(hald_probe_pc_floppy_SOURCES) $(hald_probe_printer_SOURCES) \
+ 	$(hald_probe_serial_SOURCES) $(hald_probe_smbios_SOURCES) \
+diff -urN hal-0.5.8/hald/Makefile.in hal-0.5.8-patched/hald/Makefile.in
+--- hal-0.5.8/hald/Makefile.in	2006-09-11 18:25:30.000000000 -0500
++++ hal-0.5.8-patched/hald/Makefile.in	2006-11-16 10:08:30.000000000 -0600
+@@ -71,7 +71,7 @@
+ 	$(AM_CFLAGS) $(CFLAGS)
+ CCLD = $(CC)
+ LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+-	$(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_GLIB_LIBS) $(GLIB_LIBS) -o $@
+ SOURCES = $(hald_SOURCES)
+ DIST_SOURCES = $(hald_SOURCES)
+ RECURSIVE_TARGETS = all-recursive check-recursive dvi-recursive \
+diff -urN hal-0.5.8/hald-runner/Makefile.in hal-0.5.8-patched/hald-runner/Makefile.in
+--- hal-0.5.8/hald-runner/Makefile.in	2006-09-11 18:25:30.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/Makefile.in	2006-11-16 10:09:06.000000000 -0600
+@@ -64,7 +64,7 @@
+ 	$(AM_CFLAGS) $(CFLAGS)
+ CCLD = $(CC)
+ LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+-	$(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(AM_LDFLAGS) $(LDFLAGS) $(GLIB_LIBS) $(DBUS_GLIB_LIBS) -o $@
+ SOURCES = $(hald_runner_SOURCES)
+ DIST_SOURCES = $(hald_runner_SOURCES)
+ ETAGS = etags
+diff -urN hal-0.5.8/tools/Makefile.in hal-0.5.8-patched/tools/Makefile.in
+--- hal-0.5.8/tools/Makefile.in	2006-09-11 18:25:33.000000000 -0500
++++ hal-0.5.8-patched/tools/Makefile.in	2006-11-16 10:10:14.000000000 -0600
+@@ -133,7 +133,7 @@
+ 	$(AM_CFLAGS) $(CFLAGS)
+ CCLD = $(CC)
+ LINK = $(LIBTOOL) --tag=CC --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+-	$(AM_LDFLAGS) $(LDFLAGS) -o $@
++	$(AM_LDFLAGS) $(LDFLAGS) $(DBUS_LIBS) $(GLIB_LIBS) $(DBUS_GLIB_LIBS) -o $@
+ SOURCES = $(hal_device_SOURCES) $(hal_find_by_capability_SOURCES) \
+ 	$(hal_find_by_property_SOURCES) $(hal_get_property_SOURCES) \
+ 	$(hal_set_property_SOURCES) \

Added: trunk/buildroot/package/hal/hal04-remove-glib-dbus-headers.patch
===================================================================
--- trunk/buildroot/package/hal/hal04-remove-glib-dbus-headers.patch	                        (rev 0)
+++ trunk/buildroot/package/hal/hal04-remove-glib-dbus-headers.patch	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,275 @@
+diff -ur hal-0.5.8/hald/device_info.c hal-0.5.8-patched/hald/device_info.c
+--- hal-0.5.8/hald/device_info.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/device_info.c	2006-11-15 11:52:24.000000000 -0600
+@@ -33,8 +33,6 @@
+ #include <dirent.h>
+ #include <expat.h>
+ #include <assert.h>
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+ #include <math.h>
+ 
+ #include "hald.h"
+diff -ur hal-0.5.8/hald/dummy/osspec.c hal-0.5.8-patched/hald/dummy/osspec.c
+--- hal-0.5.8/hald/dummy/osspec.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/dummy/osspec.c	2006-11-15 11:52:24.000000000 -0600
+@@ -28,8 +28,6 @@
+ #endif
+ 
+ #include <glib.h>
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+ 
+ #include "../osspec.h"
+ #include "../logger.h"
+diff -ur hal-0.5.8/hald/hald.c hal-0.5.8-patched/hald/hald.c
+--- hal-0.5.8/hald/hald.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/hald.c	2006-11-15 11:52:24.000000000 -0600
+@@ -42,10 +42,6 @@
+ #include <grp.h>
+ #include <syslog.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+-
+ /*#include "master_slave.h"*/
+ 
+ #include "logger.h"
+diff -ur hal-0.5.8/hald/hald_dbus.c hal-0.5.8-patched/hald/hald_dbus.c
+--- hal-0.5.8/hald/hald_dbus.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/hald_dbus.c	2006-11-15 11:52:24.000000000 -0600
+@@ -35,9 +35,6 @@
+ #include <stdint.h>
+ #include <sys/time.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+-
+ #include "hald.h"
+ #include "hald_dbus.h"
+ #include "device.h"
+diff -ur hal-0.5.8/hald/hald_runner.c hal-0.5.8-patched/hald/hald_runner.c
+--- hal-0.5.8/hald/hald_runner.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/hald_runner.c	2006-11-15 11:52:24.000000000 -0600
+@@ -31,8 +31,6 @@
+ #include <stdio.h>
+ 
+ #include <glib.h>
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+ 
+ #include "hald.h"
+ #include "util.h"
+diff -ur hal-0.5.8/hald/linux/addons/addon-cpufreq.h hal-0.5.8-patched/hald/linux/addons/addon-cpufreq.h
+--- hal-0.5.8/hald/linux/addons/addon-cpufreq.h	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/addons/addon-cpufreq.h	2006-11-15 11:52:24.000000000 -0600
+@@ -29,8 +29,6 @@
+ #include <config.h>
+ #endif
+ 
+-#include <dbus/dbus-glib.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+ #include <glib.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff -ur hal-0.5.8/hald/linux/addons/addon-macbookpro-backlight.c hal-0.5.8-patched/hald/linux/addons/addon-macbookpro-backlight.c
+--- hal-0.5.8/hald/linux/addons/addon-macbookpro-backlight.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/addons/addon-macbookpro-backlight.c	2006-11-15 11:52:24.000000000 -0600
+@@ -37,8 +37,6 @@
+ #include <unistd.h> 
+ 
+ #include <glib/gmain.h>
+-#include <dbus/dbus-glib.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+ 
+ #include "libhal/libhal.h"
+ #include "../../logger.h"
+diff -ur hal-0.5.8/hald/linux/addons/addon-usb-csr.c hal-0.5.8-patched/hald/linux/addons/addon-usb-csr.c
+--- hal-0.5.8/hald/linux/addons/addon-usb-csr.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/addons/addon-usb-csr.c	2006-11-15 11:52:24.000000000 -0600
+@@ -30,8 +30,6 @@
+ #include <usb.h>
+ 
+ #include <glib/gmain.h>
+-#include <dbus/dbus-glib.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+ 
+ #include "libhal/libhal.h"
+ #include "../../logger.h"
+diff -ur hal-0.5.8/hald/linux/blockdev.c hal-0.5.8-patched/hald/linux/blockdev.c
+--- hal-0.5.8/hald/linux/blockdev.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/blockdev.c	2006-11-15 11:52:24.000000000 -0600
+@@ -37,9 +37,6 @@
+ #include <syslog.h>
+ #include <unistd.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-
+ #include "../device_info.h"
+ #include "../hald.h"
+ #include "../hald_dbus.h"
+diff -ur hal-0.5.8/hald/linux/classdev.c hal-0.5.8-patched/hald/linux/classdev.c
+--- hal-0.5.8/hald/linux/classdev.c	2006-09-11 18:32:56.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/classdev.c	2006-11-15 11:52:24.000000000 -0600
+@@ -39,9 +39,6 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-
+ #include "../device_info.h"
+ #include "../device_store.h"
+ #include "../hald.h"
+diff -ur hal-0.5.8/hald/linux/coldplug.c hal-0.5.8-patched/hald/linux/coldplug.c
+--- hal-0.5.8/hald/linux/coldplug.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/coldplug.c	2006-11-15 11:52:24.000000000 -0600
+@@ -33,9 +33,6 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-
+ #include "../device_info.h"
+ #include "../hald.h"
+ #include "../logger.h"
+diff -ur hal-0.5.8/hald/linux/hotplug.c hal-0.5.8-patched/hald/linux/hotplug.c
+--- hal-0.5.8/hald/linux/hotplug.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/hotplug.c	2006-11-15 11:52:24.000000000 -0600
+@@ -32,9 +32,6 @@
+ #include <string.h>
+ #include <unistd.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-
+ #include "../device_info.h"
+ #include "../hald.h"
+ #include "../logger.h"
+diff -ur hal-0.5.8/hald/linux/ids.c hal-0.5.8-patched/hald/linux/ids.c
+--- hal-0.5.8/hald/linux/ids.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/ids.c	2006-11-15 11:56:11.000000000 -0600
+@@ -33,7 +33,6 @@
+ #include <unistd.h>
+ 
+ #include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+ 
+ #include "../logger.h"
+ 
+diff -ur hal-0.5.8/hald/linux/osspec.c hal-0.5.8-patched/hald/linux/osspec.c
+--- hal-0.5.8/hald/linux/osspec.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/osspec.c	2006-11-15 11:52:24.000000000 -0600
+@@ -44,9 +44,6 @@
+ #include <sys/utsname.h>
+ #include <unistd.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-
+ #include "../device_info.h"
+ #include "../hald.h"
+ #include "../hald_dbus.h"
+diff -ur hal-0.5.8/hald/linux/physdev.c hal-0.5.8-patched/hald/linux/physdev.c
+--- hal-0.5.8/hald/linux/physdev.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/linux/physdev.c	2006-11-15 11:52:24.000000000 -0600
+@@ -31,9 +31,6 @@
+ #include <stdint.h>
+ #include <unistd.h>
+ 
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+-
+ #include "../device_info.h"
+ #include "../hald.h"
+ #include "../logger.h"
+diff -ur hal-0.5.8/hald/util.c hal-0.5.8-patched/hald/util.c
+--- hal-0.5.8/hald/util.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald/util.c	2006-11-15 11:52:24.000000000 -0600
+@@ -42,8 +42,6 @@
+ #include <sys/file.h>
+ 
+ #include <glib.h>
+-#include <dbus/dbus.h>
+-#include <dbus/dbus-glib.h>
+ 
+ #include "osspec.h"
+ #include "logger.h"
+diff -ur hal-0.5.8/hald-runner/main.c hal-0.5.8-patched/hald-runner/main.c
+--- hal-0.5.8/hald-runner/main.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/main.c	2006-11-15 11:52:24.000000000 -0600
+@@ -24,8 +24,6 @@
+  **************************************************************************/
+ #include <stdio.h>
+ #include <stdlib.h>
+-#define DBUS_API_SUBJECT_TO_CHANGE 
+-#include <dbus/dbus-glib-lowlevel.h>
+ 
+ #include <glib.h>
+ #include "utils.h"
+diff -ur hal-0.5.8/hald-runner/runner.c hal-0.5.8-patched/hald-runner/runner.c
+--- hal-0.5.8/hald-runner/runner.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/runner.c	2006-11-15 11:56:42.000000000 -0600
+@@ -31,8 +31,7 @@
+ #include <signal.h>
+ #include <string.h>
+ 
+-#define DBUS_API_SUBJECT_TO_CHANGE 
+-#include <dbus/dbus-glib-lowlevel.h>
++#include <dbus/dbus.h>
+ 
+ #include <glib.h>
+ #include "utils.h"
+diff -ur hal-0.5.8/hald-runner/runner.h hal-0.5.8-patched/hald-runner/runner.h
+--- hal-0.5.8/hald-runner/runner.h	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/runner.h	2006-11-15 11:52:24.000000000 -0600
+@@ -25,9 +25,6 @@
+ #ifndef RUNNER_H
+ #define RUNNER_H
+ 
+-#define DBUS_API_SUBJECT_TO_CHANGE 
+-#include <dbus/dbus-glib-lowlevel.h>
+-
+ #include <glib.h>
+ 
+ typedef struct {
+diff -ur hal-0.5.8/hald-runner/utils.c hal-0.5.8-patched/hald-runner/utils.c
+--- hal-0.5.8/hald-runner/utils.c	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/utils.c	2006-11-15 11:52:24.000000000 -0600
+@@ -24,8 +24,6 @@
+  **************************************************************************/
+ #include <stdio.h>
+ #include <stdlib.h>
+-#define DBUS_API_SUBJECT_TO_CHANGE 
+-#include <dbus/dbus-glib-lowlevel.h>
+ #include <glib.h>
+ 
+ #include "utils.h"
+diff -ur hal-0.5.8/hald-runner/utils.h hal-0.5.8-patched/hald-runner/utils.h
+--- hal-0.5.8/hald-runner/utils.h	2006-09-11 16:56:39.000000000 -0500
++++ hal-0.5.8-patched/hald-runner/utils.h	2006-11-15 11:52:35.000000000 -0600
+@@ -25,8 +25,7 @@
+ #ifndef UTILS_H
+ #define UTILS_H
+ 
+-#define DBUS_API_SUBJECT_TO_CHANGE 
+-#include <dbus/dbus-glib-lowlevel.h>
++#include <dbus/dbus.h>
+ 
+ char **get_string_array(DBusMessageIter *iter, gchar *extra);
+ char **get_string_array_from_fd(int fd);
+diff -ur hal-0.5.8/tools/lshal.c hal-0.5.8-patched/tools/lshal.c
+--- hal-0.5.8/tools/lshal.c	2006-09-11 16:56:40.000000000 -0500
++++ hal-0.5.8-patched/tools/lshal.c	2006-11-15 11:52:24.000000000 -0600
+@@ -36,8 +36,6 @@
+ #include <getopt.h>
+ 
+ #include <glib.h>
+-#include <dbus/dbus-glib-lowlevel.h>
+-#include <dbus/dbus-glib.h>
+ #include <libhal.h>
+ 
+ #ifdef __SUNPRO_C

Added: trunk/buildroot/package/hal/hal05-libtool-hack.patch
===================================================================
--- trunk/buildroot/package/hal/hal05-libtool-hack.patch	                        (rev 0)
+++ trunk/buildroot/package/hal/hal05-libtool-hack.patch	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,13 @@
+diff -ur hal-0.5.8/libhal-storage/Makefile.in hal-0.5.8-patched/libhal-storage/Makefile.in
+--- hal-0.5.8/libhal-storage/Makefile.in	2006-09-11 18:25:32.000000000 -0500
++++ hal-0.5.8-patched/libhal-storage/Makefile.in	2007-01-14 17:17:28.628840792 -0600
+@@ -354,8 +354,7 @@
+ 	@list='$(lib_LTLIBRARIES)'; for p in $$list; do \
+ 	  if test -f $$p; then \
+ 	    f=$(am__strip_dir) \
+-	    echo " $(LIBTOOL) --mode=install $(libLTLIBRARIES_INSTALL) $(INSTALL_STRIP_FLAG) '$$p' '$(DESTDIR)$(libdir)/$$f'"; \
+-	    $(LIBTOOL) --mode=install $(libLTLIBRARIES_INSTALL) $(INSTALL_STRIP_FLAG) "$$p" "$(DESTDIR)$(libdir)/$$f"; \
++	    cp -a "$$p" "$(DESTDIR)$(libdir)/$$f"; \
+ 	  else :; fi; \
+ 	done
+ 

Added: trunk/buildroot/package/hal/init-hal
===================================================================
--- trunk/buildroot/package/hal/init-hal	                        (rev 0)
+++ trunk/buildroot/package/hal/init-hal	2007-01-14 23:21:36 UTC (rev 17307)
@@ -0,0 +1,56 @@
+#!/bin/sh
+#
+# haldaemon:   HAL daemon
+#
+# chkconfig: 345 98 02
+# description:  This is a daemon for collecting and maintaing information \
+#               about hardware from several sources. \
+#               See http://www.freedesktop.org/Software/hal
+#
+# processname: hald
+# pidfile: /var/run/haldaemon.pid
+#
+
+# Sanity checks.
+[ -x /usr/sbin/hald ] || exit 0
+
+RETVAL=0
+
+start() {
+    echo -n "Starting HAL daemon: "
+    hald
+    RETVAL=$?
+    echo "done"
+    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/haldaemon
+}
+
+stop() {
+    echo -n "Stopping HAL daemon: "
+
+    killall hald
+    RETVAL=$?
+    echo "done"
+    if [ $RETVAL -eq 0 ]; then
+        rm -f /var/lock/subsys/haldaemon
+        rm -f /var/run/haldaemon.pid
+    fi
+}
+
+# See how we were called.
+case "$1" in
+    start)
+        start
+        ;;
+    stop)
+        stop
+        ;;
+    restart)
+        stop
+	sleep 3
+        start
+        ;;
+    *)
+        echo $"Usage: $0 {start|stop|restart}"
+        ;;
+esac
+exit $RETVAL


Property changes on: trunk/buildroot/package/hal/init-hal
___________________________________________________________________
Name: svn:executable
   + *
