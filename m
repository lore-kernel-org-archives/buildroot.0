From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2013 10:03:02 +0100
Subject: [Buildroot] [git commit] gpsd: backport upstream patches pending
	3.11 release
Message-ID: <20131210091111.EEC719BF98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b6255bf949159c643c36039820b0c013395c45d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 3.11 release of gpsd is imminent; in the meantime, backport some patches
from upstream to fix some of the autobuild failures.

Also bump to the most recent Git snapshot.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gpsd/gpsd-02-sconstruct-disable-rpath.patch    |   16 ++++---
 ...bx_mode-link-error-when-reconfigure-false.patch |   48 ++++++++++++++++++++
 ...4-gpsmon-fix-build-when-reconfigure-false.patch |   46 +++++++++++++++++++
 .../gpsd-05-gpsmon-fix-build-when-nmea-false.patch |   46 +++++++++++++++++++
 package/gpsd/gpsd.mk                               |    2 +-
 5 files changed, 151 insertions(+), 7 deletions(-)

diff --git a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
index 8d2d31e..155542d 100644
--- a/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
+++ b/package/gpsd/gpsd-02-sconstruct-disable-rpath.patch
@@ -1,16 +1,20 @@
 Disable addition of RPATH to the generated libraries
 
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 diff -Nurp a/SConstruct b/SConstruct
 --- a/SConstruct	2013-11-22 13:10:01.000000000 +0000
 +++ b/SConstruct	2013-11-23 11:26:57.698486777 +0000
-@@ -299,8 +299,6 @@ if env["sysroot"]:
- # prefix=/usr/local build want to put our libraries there. Ideally
- # we'd query the default load path here and test against wharever it
- # is, but we haven't found a way to do that.
--if env["shared"] and env["libdir"] not in {"/lib","/usr/lib","/usr/local/lib"}:
--    env.Prepend(RPATH=[installdir('libdir')])
+@@ -299,11 +299,6 @@ if env["sysroot"]:
+ # system default load path. /lib and /usr/lib should always be on
+ # this; listing them explicitly is a fail-safe against this ldconfig
+ # invocation not doing what we expect.
+-if env["shared"]:
+-    sysrpath = Split(_getoutput("ldconfig -v -N -X 2>/dev/null | sed -n -e '/^\//s/://p'"))
+-    if env["libdir"] not in ["/usr/lib", "/lib"] + sysrpath:
+-        announce("Prepending %s to RPATH." % installdir('libdir'))
+-        env.Prepend(RPATH=[installdir('libdir')])
  
  # Give deheader a way to set compiler flags
  if 'MORECFLAGS' in os.environ:
diff --git a/package/gpsd/gpsd-03-Fix-ubx_mode-link-error-when-reconfigure-false.patch b/package/gpsd/gpsd-03-Fix-ubx_mode-link-error-when-reconfigure-false.patch
new file mode 100644
index 0000000..1e216f8
--- /dev/null
+++ b/package/gpsd/gpsd-03-Fix-ubx_mode-link-error-when-reconfigure-false.patch
@@ -0,0 +1,48 @@
+When reconfigure is false, the link step fails as follows.
+
+/scratch/peko/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -o gpsd -pthread --sysroot=/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot gpsd.o ntpshm.o shmexport.o dbusexport.o -L. -L/scratch/peko/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lrt -lbluetooth -ldbus-1 -lgpsd -lusb-1.0 -lbluetooth -lgps -lm -ldbus-1 -lpthread -lrt
+./libgpsd.so: undefined reference to `ubx_mode'
+collect2: error: ld returned 1 exit status
+scons: *** [gpsd] Error 1
+scons: building terminated because of errors.
+
+The problem appears to be a failure to guard a call to ubx_mode with a
+RECONFIGURE_ENABLE ifdef.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+ driver_ubx.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/driver_ubx.c b/driver_ubx.c
+index d75bbf8..9554a96 100644
+--- a/driver_ubx.c
++++ b/driver_ubx.c
+@@ -68,7 +68,9 @@ static gps_mask_t ubx_msg_nav_svinfo(struct gps_device_t *session,
+ 				     unsigned char *buf, size_t data_len);
+ static void ubx_msg_sbas(struct gps_device_t *session, unsigned char *buf);
+ static void ubx_msg_inf(unsigned char *buf, size_t data_len, const int debug);
++#ifdef RECONFIGURE_ENABLE
+ static void ubx_mode(struct gps_device_t *session, int mode);
++#endif /* RECONFIGURE_ENABLE */
+ 
+ /**
+  * Navigation solution message
+@@ -645,12 +647,14 @@ static void ubx_event_hook(struct gps_device_t *session, event_t event)
+ 	(void)ubx_write(session, UBX_CLASS_MON, 0x04, msg, 0);
+ 	/*@ +type @*/
+ 
++#ifdef RECONFIGURE_ENABLE
+ 	/* 
+ 	 * Turn off NMEA output, turn on UBX on this port.
+ 	 */
+ 	if (session->mode == O_OPTIMIZE) {
+ 	    ubx_mode(session, MODE_BINARY);
+ 	}
++#endif /* RECONFIGURE_ENABLE */
+     } else if (event == event_deactivate) {
+ 	/*@ -type @*/
+ 	unsigned char msg[4] = {
+-- 
+1.8.3.2
+
diff --git a/package/gpsd/gpsd-04-gpsmon-fix-build-when-reconfigure-false.patch b/package/gpsd/gpsd-04-gpsmon-fix-build-when-reconfigure-false.patch
new file mode 100644
index 0000000..bbb7cd9
--- /dev/null
+++ b/package/gpsd/gpsd-04-gpsmon-fix-build-when-reconfigure-false.patch
@@ -0,0 +1,46 @@
+When reconfigure is False and ncurses support is enabled, the build fails as
+follows.
+
+gpsmon.o: In function `gpsd_write':
+gpsmon.c:(.text+0xbbc): undefined reference to `monitor_dump_send'
+gpsmon.o: In function `main':
+gpsmon.c:(.text.startup+0xd68): undefined reference to `announce_log'
+collect2: error: ld returned 1 exit status
+scons: *** [gpsmon] Error 1
+scons: building terminated because of errors.
+
+The problem appears to be a failure to protect calls to momnitor_dump_send
+and announce_log with appropriate #ifdef guards.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+ gpsmon.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gpsmon.c b/gpsmon.c
+index 106e080..de1f14b 100644
+--- a/gpsmon.c
++++ b/gpsmon.c
+@@ -632,7 +632,9 @@ ssize_t gpsd_write(struct gps_device_t *session,
+ 		   const size_t len)
+ /* pass low-level data to devices, echoing it to the log window */
+ {
++#if defined(CONTROLSEND_ENABLE) || defined(RECONFIGURE_ENABLE)
+     monitor_dump_send((const char *)buf, len);
++#endif /* defined(CONTROLSEND_ENABLE) || defined(RECONFIGURE_ENABLE) */
+     return gpsd_serial_write(session, buf, len);
+ }
+ 
+@@ -823,7 +825,9 @@ static bool do_command(const char *line)
+ 		context.readonly = !context.readonly;
+ 	    else
+ 		context.readonly = (atoi(line + 1) == 0);
++#ifdef RECONFIGURE_ENABLE
+ 	    announce_log("[probing %sabled]", context.readonly ? "dis" : "en");
++#endif /* RECONFIGURE_ENABLE */
+ 	    if (!context.readonly)
+ 		/* magic - forces a reconfigure */
+ 		session.packet.counter = 0;
+-- 
+1.8.3.2
+
diff --git a/package/gpsd/gpsd-05-gpsmon-fix-build-when-nmea-false.patch b/package/gpsd/gpsd-05-gpsmon-fix-build-when-nmea-false.patch
new file mode 100644
index 0000000..f0f11e8
--- /dev/null
+++ b/package/gpsd/gpsd-05-gpsmon-fix-build-when-nmea-false.patch
@@ -0,0 +1,46 @@
+When nmea is False and ncurses support is enabled, the build fails as
+follows.
+
+gpsmon.o: In function `gpsmon_hook':
+gpsmon.c:(.text+0x974): undefined reference to `driver_nmea0183'
+collect2: error: ld returned 1 exit status
+scons: *** [gpsmon] Error 1
+scons: building terminated because of errors.
+
+The problem appears to be a failure to protect use of the driver_nmea0183
+variable with appropriate #ifdef guards.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+ gpsmon.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gpsmon.c b/gpsmon.c
+index 106e080..c965a3f 100644
+--- a/gpsmon.c
++++ b/gpsmon.c
+@@ -36,7 +36,9 @@ extern struct monitor_object_t garmin_mmt, garmin_bin_ser_mmt;
+ extern struct monitor_object_t italk_mmt, ubx_mmt, superstar2_mmt;
+ extern struct monitor_object_t fv18_mmt, gpsclock_mmt, mtk3301_mmt;
+ extern struct monitor_object_t oncore_mmt, tnt_mmt, aivdm_mmt;
++#ifdef NMEA_ENABLE
+ extern const struct gps_type_t driver_nmea0183;
++#endif /* NMEA_ENABLE */
+ 
+ /* These are public */
+ struct gps_device_t session;
+@@ -477,9 +479,11 @@ static void select_packet_monitor(struct gps_device_t *device)
+      */
+     if (device->packet.type != last_type) {
+ 	const struct gps_type_t *active_type = device->device_type;
++#ifdef NMEA_ENABLE
+ 	if (device->packet.type == NMEA_PACKET
+ 	    && ((device->device_type->flags & DRIVER_STICKY) != 0))
+ 	    active_type = &driver_nmea0183;
++#endif /* NMEA_ENABLE */
+ 	if (!switch_type(active_type))
+ 	    longjmp(terminate, TERM_DRIVER_SWITCH);
+ 	else {
+-- 
+1.8.3.2
+
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 261afde..24b0146 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPSD_VERSION = 327a3ef7c83c1b3b2cf7cdfcddf0c6fd7aaa8963
+GPSD_VERSION = a496a59c81173881900d976be35752787f4ab38c
 GPSD_SITE = git://git.savannah.nongnu.org/gpsd.git
 GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
