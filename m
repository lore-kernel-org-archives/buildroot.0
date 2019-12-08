From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:21:19 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: add mqtt option
Message-ID: <20191208221346.7B29B88F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44dc622941b1dbc23ff0eeafdf4a7bb7fbb6712c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shairport Sync added support for the MQTT protocol in version 3.2. For
full MQTT support Avahi and DBus support are required.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/Config.in         | 17 +++++++++++++++++
 package/shairport-sync/shairport-sync.mk |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 750767e567..528767ba9c 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -52,6 +52,23 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 	  can be heard in some circumstances. Libsoxr allows this
 	  interpolation to be done much more smoothly and subtly.
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_MQTT
+	bool "mqtt support"
+	depends on BR2_USE_MMU # avahi
+	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi
+	depends on !BR2_STATIC_LIBS # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_MOSQUITTO
+	help
+	  Enable support for the MQTT, the Message Queuing Telemetry
+	  Transport protocol.
+
+comment "shairport-sync mqtt support needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+
 endif
 
 comment "shairport-sync needs a toolchain w/ C++, NPTL"
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index a20570f915..880a058909 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -66,6 +66,11 @@ SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
 endif
 
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_MQTT),y)
+SHAIRPORT_SYNC_DEPENDENCIES += avahi dbus mosquitto
+SHAIRPORT_SYNC_CONF_OPTS += --with-mqtt-client
+endif
+
 define SHAIRPORT_SYNC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/shairport-sync \
 		$(TARGET_DIR)/usr/bin/shairport-sync
