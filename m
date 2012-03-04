From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  5 Mar 2012 00:16:08 +0100
Subject: [Buildroot] [PATCH] gpsd: dbus interface requires dbus-glib
Message-ID: <1330902968-11886-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gpsd uses dbus-glib as the dbus interface, so it should only be built if
libglib2 has been selected.  To simplify things, build dbus support only
if dbus-glib is selected.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
The select of DBUS_GLIB in Config.in created a circular dependency.  So
I simplified things by looking at DBUS_GLIB instead of DBUS for automatic
enabling of dbus support.

Also added help text to explain this.

 package/gpsd/Config.in |    2 ++
 package/gpsd/gpsd.mk   |    4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index d387abd..16635dc 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_GPSD
 	  making all data on the location/course/velocity of the sensors
 	  available to be queried on TCP port 2947 of the host computer.
 
+	  The D-Bus interface is included if dbus-glib is enabled.
+
 	  http://gpsd.berlios.de/
 
 config BR2_PACKAGE_GPSD_DEVICES
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index be6daeb..94f39aa 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -30,9 +30,9 @@ ifeq ($(BR2_PACKAGE_LIBUSB),y)
 	GPSD_DEPENDENCIES += libusb
 endif
 
-ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
 	GPSD_CONF_OPT += --enable-dbus
-	GPSD_DEPENDENCIES += dbus dbus-glib
+	GPSD_DEPENDENCIES += dbus-glib
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-- 
tg: (15fe220..) t/gpsd (depends on: master)
