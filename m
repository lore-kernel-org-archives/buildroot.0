From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 23:50:56 +0100
Subject: [Buildroot] [PATCH] gpsd: fix build with dbus but no libglib2
Message-ID: <1330901456-31931-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gpsd uses dbus-glib as the dbus interface, so it should only be built if
libglib2 has been selected.

Also add the select of dbus-glib.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/gpsd/Config.in |    2 ++
 package/gpsd/gpsd.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index d387abd..d9f54e2 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_GPSD
 	bool "gpsd"
 	# Uses fork()
 	depends on BR2_USE_MMU
+	# .mk file adds dependency on dbus-glib if dbus and glib are selected
+	select BR2_PACKAGE_DBUS_GLIB if (BR2_PACKAGE_DBUS && BR2_PACKAGE_LIBGLIB2)
 	help
 	  gpsd is a service daemon that monitors one or more GPSes or AIS
 	  receivers attached to a host computer through serial or USB ports,
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index be6daeb..245da1b 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -30,7 +30,7 @@ ifeq ($(BR2_PACKAGE_LIBUSB),y)
 	GPSD_DEPENDENCIES += libusb
 endif
 
-ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yy)
 	GPSD_CONF_OPT += --enable-dbus
 	GPSD_DEPENDENCIES += dbus dbus-glib
 endif
-- 
tg: (15fe220..) t/gpsd (depends on: master)
