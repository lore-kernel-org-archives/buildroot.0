From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:09:37 +0100
Subject: [Buildroot] [git commit branch/next] gpsd: enable kpps support
Message-ID: <20151128141002.98990816D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cfc966f431c7c715b3fc11ca0467d47432fca33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

GPSD has the ability to support KPPS. Its enablement is determined
primarily from the existence of `sys/timepps.h`. This file is provided
from the pps-tools package. Adjusting GPSD's Makefile to depend on the
pps-tools package if a developer has included pps-tools as part of a
build.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 87911c3..3055403 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -59,6 +59,12 @@ else
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
