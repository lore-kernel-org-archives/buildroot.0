From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] gpsd: new package
Message-ID: <20101104230334.4BDF18DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5e823375330a81d7f40ab3874fbedf82f2d0e6e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                              |    2 +-
 package/Config.in                    |    1 +
 package/gpsd/Config.in               |  238 ++++++++++++++++++++++++++++++++++
 package/gpsd/S50gpsd                 |   40 ++++++
 package/gpsd/gpsd-fix-libgpsmm.patch |   23 ++++
 package/gpsd/gpsd.mk                 |  179 +++++++++++++++++++++++++
 6 files changed, 482 insertions(+), 1 deletions(-)
 create mode 100644 package/gpsd/Config.in
 create mode 100644 package/gpsd/S50gpsd
 create mode 100644 package/gpsd/gpsd-fix-libgpsmm.patch
 create mode 100644 package/gpsd/gpsd.mk

diff --git a/CHANGES b/CHANGES
index d0bc137..57511fd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
-	New packages: gdk-pixbuf, gst-ffmpeg, libmpeg2, librsvg,
+	New packages: gdk-pixbuf, gpsd, gst-ffmpeg, libmpeg2, librsvg,
 	rrdtool, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
diff --git a/package/Config.in b/package/Config.in
index 3b38775..fb415d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -162,6 +162,7 @@ source "package/fis/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/genext2fs/Config.in"
 source "package/genromfs/Config.in"
+source "package/gpsd/Config.in"
 source "package/gvfs/Config.in"
 source "package/hal/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
new file mode 100644
index 0000000..543f205
--- /dev/null
+++ b/package/gpsd/Config.in
@@ -0,0 +1,238 @@
+config BR2_PACKAGE_GPSD
+	bool "gpsd"
+	help
+	 gpsd is a service daemon that monitors one or more GPSes or AIS
+	  receivers attached to a host computer through serial or USB ports,
+	  making all data on the location/course/velocity of the sensors
+	  available to be queried on TCP port 2947 of the host computer.
+
+	  http://gpsd.berlios.de/
+
+config BR2_PACKAGE_GPSD_DEVICES
+	string "Where to look for GPSes"
+	default "/dev/ttyS1"
+	depends on BR2_PACKAGE_GPSD
+
+menu "Features"
+	depends on BR2_PACKAGE_GPSD
+
+config BR2_PACKAGE_GPSD_TIMING
+	bool "latency timing support"
+	default y
+
+config BR2_PACKAGE_GPSD_CLIENT_DEBUG
+	bool "client debugging support"
+	default y
+
+config BR2_PACKAGE_GPSD_OLDSTYLE
+	bool "oldstyle (pre-JSON) protocol support"
+	default y
+
+config BR2_PACKAGE_GPSD_PROFILING
+	bool "profiling support"
+
+config BR2_PACKAGE_GPSD_NTP_SHM
+	bool "NTP time hinting support"
+	default y
+
+config BR2_PACKAGE_GPSD_PPS
+	bool "PPS time syncing support"
+	default y
+
+config BR2_PACKAGE_GPSD_PPS_ON_CTS
+	bool "PPS pulse on CTS rather than DCD"
+	depends on BR2_PACKAGE_GPSD_PPS
+
+config BR2_PACKAGE_GPSD_USER
+	bool "GPSD privilege revocation user"
+config BR2_PACKAGE_GPSD_USER_VALUE
+	string ""
+	default "nobody"
+	depends on BR2_PACKAGE_GPSD_USER
+
+config BR2_PACKAGE_GPSD_GROUP
+	bool "GPSD privilege revocation group"
+config BR2_PACKAGE_GPSD_GROUP_VALUE
+	string ""
+	default "nobody"
+	depends on BR2_PACKAGE_GPSD_GROUP
+
+config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
+	bool "compile with fixed serial port speed"
+config BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE
+	string ""
+	default "9600"
+	depends on BR2_PACKAGE_GPSD_FIXED_PORT_SPEED
+
+config BR2_PACKAGE_GPSD_MAX_CLIENT
+	bool "compile with limited maximum clients"
+config BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE
+	string "compile with limited maximum clients"
+	default "10"
+	depends on BR2_PACKAGE_GPSD_MAX_CLIENT
+
+config BR2_PACKAGE_GPSD_MAX_DEV
+	bool "compile with maximum allowed devices"
+config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
+	string "compile with maximum allowed devices"
+	default "2"
+	depends on BR2_PACKAGE_GPSD_MAX_DEV
+
+config BR2_PACKAGE_GPSD_RECONFIGURE
+	bool "allow gpsd to change device settings"
+	default y
+
+config BR2_PACKAGE_GPSD_CONTROLSEND
+	bool "allow gpsctl/gpsmon to change device settings"
+	default y
+
+config BR2_PACKAGE_GPSD_RAW
+	bool "enable raw measurement processing"
+
+config BR2_PACKAGE_GPSD_SQUELCH
+	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
+
+endmenu
+
+menu "Protocols"
+	depends on BR2_PACKAGE_GPSD
+
+config BR2_PACKAGE_GPSD_ASHTECH
+	bool "Ashtech"
+	default y
+	help
+	  Ashtech support
+
+config BR2_PACKAGE_GPSD_AIVDM
+	bool "Aivdm"
+	default y
+	help
+	  Aivdm support
+
+config BR2_PACKAGE_GPSD_EARTHMATE
+	bool "Earthmate"
+	default y
+	help
+	  DeLorme EarthMate Zodiac support
+
+config BR2_PACKAGE_GPSD_EVERMORE
+	bool "EverMore"
+	default y
+	help
+	  EverMore binary support
+
+config BR2_PACKAGE_GPSD_FV18
+	bool "FV-18"
+	default y
+	help
+	  San Jose Navigation FV-18 support
+
+config BR2_PACKAGE_GPSD_GARMIN
+	bool "Garmin (kernel)"
+	default y
+	help
+	  Garmin kernel driver support
+
+config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
+	bool "Garmin (simple text)"
+	default n
+	help
+	  Garmin Simple Text support
+
+config BR2_PACKAGE_GPSD_GPSCLOCK
+	bool "GPSClock"
+	default y
+	help
+	  GPSClock support
+
+config BR2_PACKAGE_GPSD_ITRAX
+	bool "iTrax"
+	default y
+	help
+	  iTrax support
+
+config BR2_PACKAGE_MTK3301
+	bool "MTK-3301"
+	default y
+	help
+	  Mediatek MTK-3301 support
+
+config BR2_PACKAGE_GPSD_NMEA
+	bool "NMEA"
+	default y
+	help
+	  Generic NMEA support
+
+config BR2_PACKAGE_GPSD_NTRIP
+	bool "NTRIP"
+	default y
+	help
+	  NTRIP support
+
+config BR2_PACKAGE_GPSD_NAVCOM
+	bool "Navcom"
+	default y
+	help
+	  Navcom binary support
+
+config BR2_PACKAGE_GPSD_OCEANSERVER
+	bool "OceanServer"
+	default y
+	help
+	  OceanServer Digital Compass support
+
+config BR2_PACKAGE_GPSD_ONCORE
+	bool "OnCore"
+	default y
+	help
+	  OnCore support
+
+config BR2_PACKAGE_GPSD_RTCM104V2
+	bool "RTCM104 v2"
+	default y
+	help
+	  RTCM104 v2 support
+
+config BR2_PACKAGE_GPSD_RTCM104V3
+	bool "RTCM104 v3"
+	default y
+	help
+	  RTCM104 v3 support
+
+config BR2_PACKAGE_GPSD_SIRF
+	bool "SiRF"
+	default y
+	help
+	  SiRF binary support
+
+config BR2_PACKAGE_GPSD_SUPERSTAR2
+	bool "SuperStarII"
+	default y
+	help
+	  Novatel SuperStarII binary support
+
+config BR2_PACKAGE_GPSD_TRIMBLE_TSIP
+	bool "Trimble TSIP"
+	default y
+	help
+	  Trimble TSIP support
+
+config BR2_PACKAGE_GPSD_TRIPMATE
+	bool "TripMate"
+	default y
+	help
+	  Delorme TripMate support
+
+config BR2_PACKAGE_GPSD_TRUE_NORTH
+	bool "True North Technologies"
+	default n
+	help
+	  True North Technologies support
+
+config BR2_PACKAGE_GPSD_UBX
+	bool "UBX"
+	default y
+	help
+	  uBlox UBX binary support
+
+endmenu
diff --git a/package/gpsd/S50gpsd b/package/gpsd/S50gpsd
new file mode 100644
index 0000000..31727eb
--- /dev/null
+++ b/package/gpsd/S50gpsd
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# Starts the gps daemon.
+#
+
+NAME=gpsd
+DAEMON=/usr/sbin/$NAME
+DEVICES=/dev/ttyS1
+PIDFILE=/var/run/$NAME.pid
+
+start() {
+        echo -n "Starting $NAME: "
+        start-stop-daemon -S -q -p $PIDFILE --exec $DAEMON -- -P $PIDFILE $DEVICES && echo "OK" || echo "Failed"
+}
+stop() {
+        echo -n "Stopping $NAME: "
+        start-stop-daemon -K -q -p $PIDFILE && echo "OK" || echo "Failed"
+        rm -f $PIDFILE
+}
+restart() {
+        stop
+        start
+}
+
+case "$1" in
+  start)
+        start
+        ;;
+  stop)
+        stop
+        ;;
+  restart|reload)
+        restart
+        ;;
+  *)
+        echo $"Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/package/gpsd/gpsd-fix-libgpsmm.patch b/package/gpsd/gpsd-fix-libgpsmm.patch
new file mode 100644
index 0000000..893965e
--- /dev/null
+++ b/package/gpsd/gpsd-fix-libgpsmm.patch
@@ -0,0 +1,23 @@
+diff -Nura gpsd-2.95.orig/Makefile.in gpsd-2.95.x/Makefile.in
+--- gpsd-2.95.orig/Makefile.in	2010-07-13 19:48:24.000000000 -0300
++++ gpsd-2.95.x/Makefile.in	2010-07-27 17:40:28.902568874 -0300
+@@ -546,7 +546,7 @@
+ libgps_VERSION__REVISION = 0
+ libgps_VERSION_AGE = 0
+ libgps_VERSION_NUMBER = $(libgps_VERSION_AGE):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
+-libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE)
++libgps_la_LDFLAGS = -version-number $(libgps_VERSION_CURRENT):$(libgps_VERSION__REVISION):$(libgps_VERSION_AGE) $(LDFLAGS)
+ lib_LTLIBRARIES = libgps.la libgpsd.la
+ libgps_SONAME = $(shell expr $(libgps_VERSION_CURRENT) - $(libgps_VERSION_AGE))
+ libgps_VERSION = $(libgps_SONAME).$(libgps_VERSION_AGE).$(libgps_VERSION__REVISION)
+@@ -612,8 +612,8 @@
+ libgpsd_la_SOURCES = $(libgpsd_c_sources) $(libgpsd_h_sources) \
+ 				driver_rtcm2.h packet_states.h
+ 
+- at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link gcc $(libgps_la_LDFLAGS) -o $@
+- at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link g++ $(libgps_la_LDFLAGS) -o $@
++ at LIBGPSMM_ENABLE_FALSE@libgps_la_LINK = /bin/sh ./libtool --tag=CC --mode=link $(CC) $(libgps_la_LDFLAGS) -o $@
++ at LIBGPSMM_ENABLE_TRUE@libgps_la_LINK = /bin/sh ./libtool --tag=CXX --mode=link $(CXX) $(libgps_la_LDFLAGS) -o $@
+ nodist_libgpsd_la_SOURCES = packet_names.h ais_json.i
+ libgps_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD)
+ libgpsd_la_LIBADD = $(LIBM) $(LIBC) $(LIBNSL) $(LIBSOCKET) $(LIBPTHREAD) $(BLUEZ_LIBS) libgps.la
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
new file mode 100644
index 0000000..71fe89e
--- /dev/null
+++ b/package/gpsd/gpsd.mk
@@ -0,0 +1,179 @@
+#############################################################
+#
+# gpsd
+#
+#############################################################
+
+GPSD_VERSION = 2.95
+GPSD_SITE = http://download.berlios.de/gpsd
+GPSD_INSTALL_STAGING = YES
+GPSD_CONF_OPT = --disable-static
+GPSD_LIBTOOL_PATCH = NO
+GPSD_USE_CONFIG_CACHE = NO
+GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
+
+# Build libgpsmm if we've got C++
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+	GPSD_CONF_OPT += --enable-libgpsmm LDFLAGS="$(TARGET_LDFLAGS) -lstdc++"
+else
+	GPSD_CONF_OPT += --disable-libgpsmm
+endif
+
+# If libusb is available build it before so the package can use it
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+	GPSD_DEPENDENCIES += libusb
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+	GPSD_CONF_OPT += --enable-dbus
+	GPSD_DEPENDENCIES += dbus dbus-glib
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	GPSD_DEPENDENCIES += ncurses
+endif
+
+# Protocol support
+ifneq ($(BR2_PACKAGE_GPSD_ASHTECH),y)
+	GPSD_CONF_OPT += --disable-ashtech
+endif
+ifneq ($(BR2_PACKAGE_GPSD_AIVDM),y)
+	GPSD_CONF_OPT += --disable-aivdm
+endif
+ifneq ($(BR2_PACKAGE_GPSD_EARTHMATE),y)
+	GPSD_CONF_OPT += --disable-earthmate
+endif
+ifneq ($(BR2_PACKAGE_GPSD_EVERMORE),y)
+	GPSD_CONF_OPT += --disable-evermore
+endif
+ifneq ($(BR2_PACKAGE_GPSD_FV18),y)
+	GPSD_CONF_OPT += --disable-fv18
+endif
+ifneq ($(BR2_PACKAGE_GPSD_GARMIN),y)
+	GPSD_CONF_OPT += --disable-garmin
+endif
+ifeq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
+	GPSD_CONF_OPT += --enable-garmintxt
+endif
+ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
+	GPSD_CONF_OPT += --disable-gpsclock
+endif
+ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
+	GPSD_CONF_OPT += --disable-itrax
+endif
+ifneq ($(BR2_PACKAGE_GPSD_MTK3301),y)
+	GPSD_CONF_OPT += --disable-mtk3301
+endif
+ifneq ($(BR2_PACKAGE_GPSD_NMEA),y)
+	GPSD_CONF_OPT += --disable-nmea
+endif
+ifneq ($(BR2_PACKAGE_GPSD_NTRIP),y)
+	GPSD_CONF_OPT += --disable-ntrip
+endif
+ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
+	GPSD_CONF_OPT += --disable-navcom
+endif
+ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
+	GPSD_CONF_OPT += --disable-oceanserver
+endif
+ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
+	GPSD_CONF_OPT += --disable-oncore
+endif
+ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
+	GPSD_CONF_OPT += --disable-rtcm104v2
+endif
+ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
+	GPSD_CONF_OPT += --disable-rtcm104v3
+endif
+ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
+	GPSD_CONF_OPT += --disable-sirf
+endif
+ifneq ($(BR2_PACKAGE_GPSD_SUPERSTAR2),y)
+	GPSD_CONF_OPT += --disable-superstar2
+endif
+ifneq ($(BR2_PACKAGE_GPSD_TRIMBLE_TSIP),y)
+	GPSD_CONF_OPT += --disable-tsip
+endif
+ifneq ($(BR2_PACKAGE_GPSD_TRIPMATE),y)
+	GPSD_CONF_OPT += --disable-tripmate
+endif
+ifeq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
+	GPSD_CONF_OPT += --enable-tnt
+endif
+ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
+	GPSD_CONF_OPT += --disable-ubx
+endif
+
+# Features
+ifneq ($(BR2_PACKAGE_GPSD_NTP_SHM),y)
+	GPSD_CONF_OPT += --disable-ntpshm
+endif
+ifneq ($(BR2_PACKAGE_GPSD_PPS),y)
+	GPSD_CONF_OPT += --disable-pps
+endif
+ifeq ($(BR2_PACKAGE_GPSD_PPS_ON_CTS),y)
+	GPSD_CONF_OPT += --enable-pps-on-cts
+endif
+ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
+	GPSD_CONF_OPT += --enable-squelch
+endif
+ifneq ($(BR2_PACKAGE_GPSD_RECONFIGURE),y)
+	GPSD_CONF_OPT += --disable-reconfigure
+endif
+ifneq ($(BR2_PACKAGE_GPSD_CONTROLSEND),y)
+	GPSD_CONF_OPT += --disable-controlsend
+endif
+ifeq ($(BR2_PACKAGE_GPSD_RAW),y)
+	GPSD_CONF_OPT += --enable-raw
+endif
+ifneq ($(BR2_PACKAGE_GPSD_OLDSTYLE),y)
+	GPSD_CONF_OPT += --disable-oldstyle
+endif
+ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
+	GPSD_CONF_OPT += --enable-profiling
+endif
+ifneq ($(BR2_PACKAGE_GPSD_TIMING),y)
+	GPSD_CONF_OPT += --disable-timing
+endif
+ifneq ($(BR2_PACKAGE_GPSD_CLIENT_DEBUG),y)
+	GPSD_CONF_OPT += --disable-clientdebug
+endif
+ifeq ($(BR2_PACKAGE_GPSD_USER),y)
+	GPSD_CONF_OPT += --enable-gpsd-user=$(BR2_PACKAGE_GPSD_USER_VALUE)
+endif
+ifeq ($(BR2_PACKAGE_GPSD_GROUP),y)
+	GPSD_CONF_OPT += --enable-gpsd-group=$(BR2_PACKAGE_GPSD_GROUP_VALUE)
+endif
+ifeq ($(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED),y)
+	GPSD_CONF_OPT += --enable-fixed-port-speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
+endif
+ifeq ($(BR2_PACKAGE_GPSD_MAX_CLIENT),y)
+	GPSD_CONF_OPT += --enable-max-clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
+endif
+ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
+	GPSD_CONF_OPT += --enable-max-devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
+endif
+
+define GPSD_BUILDS_CMDS
+	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(GPSD_DIR)/libtool
+	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(GPSD_DIR)/libtool
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all libgpsmm
+endef
+
+define GPSD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
+		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
+		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
+	fi
+endef
+
+define GPSD_UNINSTALL_TARGET_CMDS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GPSD_TARGET_BINS))
+	rm -f $(TARGET_DIR)/usr/lib/libgps.*
+	rm -f $(TARGET_DIR)/usr/lib/libgpsd.*
+	rm -f $(TARGET_DIR)/usr/sbin/gpsd
+	rm -f $(TARGET_DIR)/etc/init.d/S50gpsd
+endef
+
+$(eval $(call AUTOTARGETS,package,gpsd))
-- 
1.7.1
