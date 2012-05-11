From: Markos Chandras <markos.chandras@imgtec.com>
Date: Fri, 11 May 2012 11:34:32 +0100
Subject: [Buildroot] [PATCH] gpsd: Replace the deprecated finite function
	with the isfinite macro
Message-ID: <1336732472-13197-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quote from the finite() man page:
"Note that these functions are obsolete. C99 defines macros isfinite(),
isinf(), and isnan() (for all types) replacing them.  Further note that
the C99 isinf() has weaker guarantees on the return value.  See
fpclas-sify(3)."

The finite() function is not supported by recent versions of uClibc

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/gpsd/gpsd-replace-finite.patch |   48 ++++++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/gpsd/gpsd-replace-finite.patch

diff --git a/package/gpsd/gpsd-replace-finite.patch b/package/gpsd/gpsd-replace-finite.patch
new file mode 100644
index 0000000..027715c
--- /dev/null
+++ b/package/gpsd/gpsd-replace-finite.patch
@@ -0,0 +1,48 @@
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: gpsd-2.95/libgpsd_core.c
+===================================================================
+--- gpsd-2.95.orig/libgpsd_core.c
++++ gpsd-2.95/libgpsd_core.c
+@@ -545,18 +545,18 @@ static void gpsd_error_model(struct gps_
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
+Index: gpsd-2.95/pseudonmea.c
+===================================================================
+--- gpsd-2.95.orig/pseudonmea.c
++++ gpsd-2.95/pseudonmea.c
+@@ -215,10 +215,10 @@ static void gpsd_binary_quality_dump(str
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
1.7.1
