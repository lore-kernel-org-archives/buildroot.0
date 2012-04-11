From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 11 Apr 2012 11:27:11 +0100
Subject: [Buildroot] [PATCH] Patch gpsd-2.95 for avr32
Message-ID: <1334140031-29576-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gpsd does not compile for avr32, due to use of finite() rather than
isfinite(). See, for example, random buildroot test
build b7c357dddd7c1f749813035ddbee731d233c59b8

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/gpsd/gpsd-2.95-c99-math.patch.avr32 |   53 +++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 package/gpsd/gpsd-2.95-c99-math.patch.avr32

diff --git a/package/gpsd/gpsd-2.95-c99-math.patch.avr32 b/package/gpsd/gpsd-2.95-c99-math.patch.avr32
new file mode 100644
index 0000000..54161d5
--- /dev/null
+++ b/package/gpsd/gpsd-2.95-c99-math.patch.avr32
@@ -0,0 +1,53 @@
+Replace calls to finite() with calls to isfinite(), so that gpsd-2.95 will
+compile for avr32.
+
+N.B. It will not be necessary to patch later releases of gpsd, where the
+finite() -> isfinite() replacement has already been made.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+
+diff -Nur a/libgpsd_core.c b/libgpsd_core.c
+--- a/libgpsd_core.c	2010-06-11 20:45:37.000000000 +0100
++++ b/libgpsd_core.c	2012-04-11 11:09:42.154508993 +0100
+@@ -545,18 +545,18 @@
+     gpsd_report(LOG_DATA, "modeling errors: mode=%d, masks=%s\n",
+ 		fix->mode, gpsd_maskdump(session->gpsdata.set));
+     if (fix->mode >= MODE_2D) {
+-	if (isnan(fix->epx) != 0 && finite(session->gpsdata.dop.hdop) != 0)
++	if (isnan(fix->epx) != 0 && isfinite(session->gpsdata.dop.hdop) != 0)
+ 	    fix->epx = session->gpsdata.dop.xdop * h_uere;
+ 
+-	if (isnan(fix->epy) != 0 && finite(session->gpsdata.dop.hdop) != 0)
++	if (isnan(fix->epy) != 0 && isfinite(session->gpsdata.dop.hdop) != 0)
+ 	    fix->epy = session->gpsdata.dop.ydop * h_uere;
+ 
+ 	if ((fix->mode >= MODE_3D)
+-	    && isnan(fix->epv) != 0 && finite(session->gpsdata.dop.vdop) != 0)
++	    && isnan(fix->epv) != 0 && isfinite(session->gpsdata.dop.vdop) != 0)
+ 	    fix->epv = session->gpsdata.dop.vdop * v_uere;
+ 
+ 	if (isnan(session->gpsdata.epe) != 0
+-	    && finite(session->gpsdata.dop.pdop) != 0)
++	    && isfinite(session->gpsdata.dop.pdop) != 0)
+ 	    session->gpsdata.epe = session->gpsdata.dop.pdop * p_uere;
+ 	else
+ 	    session->gpsdata.epe = NAN;
+diff -Nur a/pseudonmea.c b/pseudonmea.c
+--- a/pseudonmea.c	2010-06-02 22:03:02.000000000 +0100
++++ b/pseudonmea.c	2012-04-11 11:09:58.686508257 +0100
+@@ -215,10 +215,10 @@
+ 	nmea_add_checksum(bufp2);
+ 	bufp += strlen(bufp);
+     }
+-    if (finite(session->gpsdata.fix.epx)
+-	&& finite(session->gpsdata.fix.epy)
+-	&& finite(session->gpsdata.fix.epv)
+-	&& finite(session->gpsdata.epe)) {
++    if (isfinite(session->gpsdata.fix.epx)
++	&& isfinite(session->gpsdata.fix.epy)
++	&& isfinite(session->gpsdata.fix.epv)
++	&& isfinite(session->gpsdata.epe)) {
+ 	struct tm tm;
+ 	time_t intfixtime;
+ 
-- 
1.7.5.4
