From: James Knight <james.knight@rockwellcollins.com>
Date: Fri, 27 Nov 2015 11:25:57 -0500
Subject: [Buildroot] [PATCH 1/1] gpsd: enable kpps support
Message-ID: <1448641557-18100-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GPSD has the ability to support KPPS. Its enablement is determined
primarily from the existence of `sys/timepps.h`. This file is provided
from the pps-tools package. Adjusting GPSD's Makefile to depend on the
pps-tools package if a developer has included pps-tools as part of a
build.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/gpsd/gpsd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index aa35053..13c7571 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -65,6 +65,12 @@ else
 GPSD_SCONS_OPTS += bluez=no
 endif
 
+# If pps-tools is available, build it before so the package can use it
+# (HAVE_SYS_TIMEPPS_H).
+ifeq ($(BR2_PACKAGE_PPS_TOOLS),y)
+GPSD_DEPENDENCIES += pps-tools
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
 GPSD_SCONS_OPTS += dbus_export=yes
 GPSD_DEPENDENCIES += dbus-glib
-- 
1.9.5.msysgit.1
