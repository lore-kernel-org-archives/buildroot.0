From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  3 Dec 2019 11:53:41 +0100
Subject: [Buildroot] [PATCH 5/5] package/shairport-sync: add mqtt option
In-Reply-To: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
References: <20191203105341.1232360-1-joerg.krause@embedded.rocks>
Message-ID: <20191203105341.1232360-5-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shairport Sync added support for the MQTT protocol in version 3.2. For
full MQTT support Avahi and DBus support are required.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/Config.in         | 11 +++++++++++
 package/shairport-sync/shairport-sync.mk |  5 +++++
 2 files changed, 16 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 6325e9d30d..185fb3cff1 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -49,6 +49,17 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 	  can be heard in some circumstances. Libsoxr allows this
 	  interpolation to be done much more smoothly and subtly.
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_MQTT
+	bool "mqtt support"
+	depends on !BR2_STATIC_LIBS # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_MOSQUITTO
+	help
+	  Enable support for the MQTT, the Message Queuing Telemetry
+	  Transport protocol.
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
-- 
2.24.0
