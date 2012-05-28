From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 28 May 2012 11:23:46 +0100
Subject: [Buildroot] [PATCH resend] Bump gpsd from version 2.95 to version
	3.5
Message-ID: <1338200626-3945-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/Config.in                     |   17 +--
 package/gpsd/gpsd-fix-compile-errors.patch |   14 +++
 package/gpsd/gpsd-fix-libgpsmm.patch       |   23 ----
 package/gpsd/gpsd-navcom.patch             |   47 ---------
 package/gpsd/gpsd.mk                       |  156 +++++++++++++++-------------
 5 files changed, 107 insertions(+), 150 deletions(-)
 create mode 100644 package/gpsd/gpsd-fix-compile-errors.patch
 delete mode 100644 package/gpsd/gpsd-fix-libgpsmm.patch
 delete mode 100644 package/gpsd/gpsd-navcom.patch

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 16635dc..10ce010 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -38,10 +38,6 @@ config BR2_PACKAGE_GPSD_NTP_SHM
 config BR2_PACKAGE_GPSD_PPS
 	bool "PPS time syncing support"
 
-config BR2_PACKAGE_GPSD_PPS_ON_CTS
-	bool "PPS pulse on CTS rather than DCD"
-	depends on BR2_PACKAGE_GPSD_PPS
-
 config BR2_PACKAGE_GPSD_USER
 	bool "GPSD privilege revocation user"
 config BR2_PACKAGE_GPSD_USER_VALUE
@@ -85,9 +81,6 @@ config BR2_PACKAGE_GPSD_CONTROLSEND
 	bool "allow gpsctl/gpsmon to change device settings"
 	default y
 
-config BR2_PACKAGE_GPSD_RAW
-	bool "enable raw measurement processing"
-
 config BR2_PACKAGE_GPSD_SQUELCH
 	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
 
@@ -116,6 +109,11 @@ config BR2_PACKAGE_GPSD_EVERMORE
 	help
 	  EverMore binary support
 
+config BR2_PACKAGE_GPSD_FURY
+	bool "Fury"
+	help
+	  Jackson Labs Fury and Firefly support
+
 config BR2_PACKAGE_GPSD_FV18
 	bool "FV-18"
 	help
@@ -131,6 +129,11 @@ config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
 	help
 	  Garmin Simple Text support
 
+config BR2_PACKAGE_GPSD_GEOSTAR
+	bool "Geostar"
+	help
+	  Geostar Protocol support
+
 config BR2_PACKAGE_GPSD_GPSCLOCK
 	bool "GPSClock"
 	help
diff --git a/package/gpsd/gpsd-fix-compile-errors.patch b/package/gpsd/gpsd-fix-compile-errors.patch
new file mode 100644
index 0000000..804df72
--- /dev/null
+++ b/package/gpsd/gpsd-fix-compile-errors.patch
@@ -0,0 +1,14 @@
+The build falls over because the CLOCK_REALTIME symbol is undefined.
+
+diff -Nur a/gpsutils.c b/gpsutils.c
+--- a/gpsutils.c	2012-04-06 20:36:44.000000000 +0100
++++ b/gpsutils.c	2012-04-20 16:07:42.570742457 +0100
+@@ -6,7 +6,7 @@
+ 
+ /* The strptime prototype is not provided unless explicitly requested.
+  *  So add the define that POSIX says to to avoid: */
+-#define _XOPEN_SOURCE
++//#define _XOPEN_SOURCE
+ 
+ #include <stdio.h>
+ #include <time.h>
diff --git a/package/gpsd/gpsd-fix-libgpsmm.patch b/package/gpsd/gpsd-fix-libgpsmm.patch
deleted file mode 100644
index 893965e..0000000
--- a/package/gpsd/gpsd-fix-libgpsmm.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-diff -Nura gpsd-2.95.orig/Makefile.in gpsd-2.95.x/Makefile.in
---- gpsd-2.95.orig/Makefile.in	2010-07-13 19:48:24.000000000 -0300
-+++ gpsd-2.95.x/Makefile.in	2010-07-27 17:40:28.902568874 -0300
-@@ -546,7 +546,7 @@
- libgps_VERSION__REVISION = 0
- libgps_VERSION_AGE = 0
- libgps_VERSION_NUMBER = $(libgps_VERSION_AGE):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
--libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
-+libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE) $(LDFLAGS)
- lib_LTLIBRARIES = libgps.la libgpsd.la
- libgps_SONAME = $(shell expr $(libgps_VERSION_CURRENT) - $(libgps_VERSION_AGE))
- libgps_VERSION = $(libgps_SONAME).$(libgps_VERSION_AGE).$(libgps_VERSION__REVISION)
-@@ -612,8 +612,8 @@
- libgpsd_la_SOURCES = $(libgpsd_c_sources) $(libgpsd_h_sources) \
- 				driver_rtcm2.h packet_states.h
- 
-- at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
-- at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
-+ at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link $(CC) $(libgps_la_LDFLAGS) -o $@
-+ at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link $(CXX) $(libgps_la_LDFLAGS) -o $@
- nodist_libgpsd_la_SOURCES = packet_names.h ais_json.i
- libgps_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD)
- libgpsd_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD) $(BLUEZ_LIBS) libgps.la
diff --git a/package/gpsd/gpsd-navcom.patch b/package/gpsd/gpsd-navcom.patch
deleted file mode 100644
index 659cea1..0000000
--- a/package/gpsd/gpsd-navcom.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-[PATCH] Navcom needs binary support
-
-Enable binary support when navcom driver is enabled, otherwise the build
-errors out with:
-
-./libgpsd.so: undefined reference to `navcom_binary'
-
-If no other drivers needing binary support are enabled.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- driver_navcom.c |    4 ++--
- gpsd.h-tail     |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-Index: gpsd-2.95/driver_navcom.c
-===================================================================
---- gpsd-2.95.orig/driver_navcom.c
-+++ gpsd-2.95/driver_navcom.c
-@@ -44,7 +44,7 @@
- #include <stdio.h>
- #include "gpsd.h"
- 
--#if defined(NAVCOM_ENABLE) && defined(BINARY_ENABLE)
-+#if defined(NAVCOM_ENABLE)
- #include "bits.h"
- 
- /* Have data which is 24 bits long */
-@@ -1339,4 +1339,4 @@
- };
- /* *INDENT-ON* */
- 
--#endif /* defined(NAVCOM_ENABLE) && defined(BINARY_ENABLE) */
-+#endif /* defined(NAVCOM_ENABLE) */
-Index: gpsd-2.95/gpsd.h-tail
-===================================================================
---- gpsd-2.95.orig/gpsd.h-tail
-+++ gpsd-2.95/gpsd.h-tail
-@@ -30,7 +30,7 @@
- #ifdef EARTHMATE_ENABLE
- #define ZODIAC_ENABLE	
- #endif
--#if defined(ZODIAC_ENABLE) || defined(SIRF_ENABLE) || defined(GARMIN_ENABLE) || defined(TSIP_ENABLE) || defined(EVERMORE_ENABLE) || defined(ITRAX_ENABLE) || defined(UBX_ENABLE) || defined(SUPERSTAR2_ENABLE) || defined(ONCORE_ENABLE)
-+#if defined(ZODIAC_ENABLE) || defined(SIRF_ENABLE) || defined(GARMIN_ENABLE) || defined(TSIP_ENABLE) || defined(EVERMORE_ENABLE) || defined(ITRAX_ENABLE) || defined(UBX_ENABLE) || defined(SUPERSTAR2_ENABLE) || defined(ONCORE_ENABLE) || defined(NAVCOM_ENABLE)
- #define BINARY_ENABLE	
- #endif
- #if defined(TRIPMATE_ENABLE) || defined(BINARY_ENABLE)
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 94f39aa..073dad5 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -3,183 +3,193 @@
 # gpsd
 #
 #############################################################
-
-GPSD_VERSION = 2.95
-GPSD_SITE = http://download.berlios.de/gpsd
+GPSD_VERSION = 3.5
+GPSD_SITE = http://download-mirror.savannah.gnu.org/releases/gpsd/
 GPSD_INSTALL_STAGING = YES
-GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
+
+GPSD_DEPENDENCIES = host-scons
+
+HOST_SCONS = $(HOST_DIR)/usr/bin/scons
+
+GPSD_SCONS_ENV = \
+	$(TARGET_CONFIGURE_OPTS)
+
+GPSD_SCONS_OPTS = \
+	prefix=$(TARGET_DIR)/usr \
+	ncurses=no \
+	python=no
+
+# Disable IPv6, if we don't support it
+ifneq ($(BR2_INET_IPV6),y)
+	GPSD_SCONS_OPTS += ipv6=no
+endif
 
 # Build libgpsmm if we've got C++
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	GPSD_CONF_OPT += --enable-libgpsmm LDFLAGS="$(TARGET_LDFLAGS) -lstdc++"
+	GPSD_SCONS_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lstdc++"
 else
-	GPSD_CONF_OPT += --disable-libgpsmm
+	GPSD_SCONS_OPTS += libgpsmm=no
 endif
 
 # Enable or disable Qt binding
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-	GPSD_CONF_ENV += QMAKE="$(QT_QMAKE)"
-	GPSD_CONF_OPT += --enable-libQgpsmm
+	GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
 	GPSD_DEPENDENCIES += qt host-pkg-config
 else
-	GPSD_CONF_OPT += --disable-libQgpsmm
+	GPSD_SCONS_OPTS += libQgpsmm=no
 endif
 
 # If libusb is available build it before so the package can use it
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 	GPSD_DEPENDENCIES += libusb
+else
+	GPSD_SCONS_OPTS += usb=no
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
-	GPSD_CONF_OPT += --enable-dbus
+	GPSD_SCONS_OPTS += dbus_export=yes
 	GPSD_DEPENDENCIES += dbus-glib
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-	GPSD_DEPENDENCIES += ncurses
-endif
-
 # Protocol support
 ifneq ($(BR2_PACKAGE_GPSD_ASHTECH),y)
-	GPSD_CONF_OPT += --disable-ashtech
+	GPSD_SCONS_OPTS += ashtech=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_AIVDM),y)
-	GPSD_CONF_OPT += --disable-aivdm
+	GPSD_SCONS_OPTS += aivdm=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_EARTHMATE),y)
-	GPSD_CONF_OPT += --disable-earthmate
+	GPSD_SCONS_OPTS += earthmate=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_EVERMORE),y)
-	GPSD_CONF_OPT += --disable-evermore
+	GPSD_SCONS_OPTS += evermore=no
+endif
+ifneq ($(BR2_PACKAGE_GPSD_FURY),y)
+	GPSD_SCONS_OPTS += fury=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_FV18),y)
-	GPSD_CONF_OPT += --disable-fv18
+	GPSD_SCONS_OPTS += fv18=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GARMIN),y)
-	GPSD_CONF_OPT += --disable-garmin
+	GPSD_SCONS_OPTS += garmin=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
-	GPSD_CONF_OPT += --disable-garmintxt
+	GPSD_SCONS_OPTS += garmintxt=no
+endif
+ifneq ($(BR2_PACKAGE_GPSD_GEOSTAR),y)
+	GPSD_SCONS_OPTS += geostar=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
-	GPSD_CONF_OPT += --disable-gpsclock
+	GPSD_SCONS_OPTS += gpsclock=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
-	GPSD_CONF_OPT += --disable-itrax
+	GPSD_SCONS_OPTS += itrax=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_MTK3301),y)
-	GPSD_CONF_OPT += --disable-mtk3301
+	GPSD_SCONS_OPTS += mtk3301=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NMEA),y)
-	GPSD_CONF_OPT += --disable-nmea
+	GPSD_SCONS_OPTS += nmea=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NTRIP),y)
-	GPSD_CONF_OPT += --disable-ntrip
+	GPSD_SCONS_OPTS += ntrip=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
-	GPSD_CONF_OPT += --disable-navcom
+	GPSD_SCONS_OPTS += navcom=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
-	GPSD_CONF_OPT += --disable-oceanserver
+	GPSD_SCONS_OPTS += oceanserver=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
-	GPSD_CONF_OPT += --disable-oncore
+	GPSD_SCONS_OPTS += oncore=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
-	GPSD_CONF_OPT += --disable-rtcm104v2
+	GPSD_SCONS_OPTS += rtcm104v2=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
-	GPSD_CONF_OPT += --disable-rtcm104v3
+	GPSD_SCONS_OPTS += rtcm104v3=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
-	GPSD_CONF_OPT += --disable-sirf
+	GPSD_SCONS_OPTS += sirf=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_SUPERSTAR2),y)
-	GPSD_CONF_OPT += --disable-superstar2
+	GPSD_SCONS_OPTS += superstar2=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_TRIMBLE_TSIP),y)
-	GPSD_CONF_OPT += --disable-tsip
+	GPSD_SCONS_OPTS += tsip=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_TRIPMATE),y)
-	GPSD_CONF_OPT += --disable-tripmate
+	GPSD_SCONS_OPTS += tripmate=no
 endif
-ifeq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
-	GPSD_CONF_OPT += --enable-tnt
+ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
+	GPSD_SCONS_OPTS += tnt=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
-	GPSD_CONF_OPT += --disable-ubx
+	GPSD_SCONS_OPTS += ubx=no
 endif
 
 # Features
 ifneq ($(BR2_PACKAGE_GPSD_NTP_SHM),y)
-	GPSD_CONF_OPT += --disable-ntpshm
+	GPSD_SCONS_OPTS += ntpshm=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_PPS),y)
-	GPSD_CONF_OPT += --disable-pps
-endif
-ifeq ($(BR2_PACKAGE_GPSD_PPS_ON_CTS),y)
-	GPSD_CONF_OPT += --enable-pps-on-cts
+	GPSD_SCONS_OPTS += pps=no
 endif
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
-	GPSD_CONF_OPT += --enable-squelch
+	GPSD_SCONS_OPTS += squelch=yes
 endif
 ifneq ($(BR2_PACKAGE_GPSD_RECONFIGURE),y)
-	GPSD_CONF_OPT += --disable-reconfigure
+	GPSD_SCONS_OPTS += reconfigure=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_CONTROLSEND),y)
-	GPSD_CONF_OPT += --disable-controlsend
-endif
-ifeq ($(BR2_PACKAGE_GPSD_RAW),y)
-	GPSD_CONF_OPT += --enable-raw
+	GPSD_SCONS_OPTS += controlsend=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_OLDSTYLE),y)
-	GPSD_CONF_OPT += --disable-oldstyle
+	GPSD_SCONS_OPTS += oldstyle=no
 endif
 ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
-	GPSD_CONF_OPT += --enable-profiling
+	GPSD_SCONS_OPTS += profiling=yes
 endif
-ifneq ($(BR2_PACKAGE_GPSD_TIMING),y)
-	GPSD_CONF_OPT += --disable-timing
+ifeq ($(BR2_PACKAGE_GPSD_TIMING),y)
+	GPSD_SCONS_OPTS += timing=yes
 endif
 ifneq ($(BR2_PACKAGE_GPSD_CLIENT_DEBUG),y)
-	GPSD_CONF_OPT += --disable-clientdebug
+	GPSD_SCONS_OPTS += clientdebug=no
 endif
 ifeq ($(BR2_PACKAGE_GPSD_USER),y)
-	GPSD_CONF_OPT += --enable-gpsd-user=$(BR2_PACKAGE_GPSD_USER_VALUE)
+	GPSD_SCONS_OPTS += gpsd_user=$(BR2_PACKAGE_GPSD_USER_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_GROUP),y)
-	GPSD_CONF_OPT += --enable-gpsd-group=$(BR2_PACKAGE_GPSD_GROUP_VALUE)
+	GPSD_SCONS_OPTS += gpsd_group=$(BR2_PACKAGE_GPSD_GROUP_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED),y)
-	GPSD_CONF_OPT += --enable-fixed-port-speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
+	GPSD_SCONS_OPTS += fixed_port_speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_CLIENT),y)
-	GPSD_CONF_OPT += --enable-max-clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
+	GPSD_SCONS_OPTS += limited_max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
-	GPSD_CONF_OPT += --enable-max-devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
+	GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
-define GPSD_BUILDS_CMDS
-	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(GPSD_DIR)/libtool
-	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(GPSD_DIR)/libtool
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all libgpsmm
+define GPSD_BUILD_CMDS
+	(cd $(@D); \
+		$(GPSD_SCONS_ENV) \
+		$(HOST_SCONS) \
+		$(GPSD_SCONS_OPTS))
 endef
 
 define GPSD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	(cd $(@D); \
+		$(GPSD_SCONS_ENV) \
+		$(HOST_SCONS) \
+		$(GPSD_SCONS_OPTS) \
+		destdir=$(TARGET_DIR) \
+		install)
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
 		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
 		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
 	fi
 endef
 
-define GPSD_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GPSD_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/lib/libgps.*
-	rm -f $(TARGET_DIR)/usr/lib/libgpsd.*
-	rm -f $(TARGET_DIR)/usr/sbin/gpsd
-	rm -f $(TARGET_DIR)/etc/init.d/S50gpsd
-endef
-
-$(eval $(call AUTOTARGETS))
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
