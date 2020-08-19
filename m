From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Wed, 19 Aug 2020 14:05:06 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/{collectd, domoticz,
 shairport-sync}: fix mosquitto dependencies
In-Reply-To: <20200819120506.137013-1-titouan.christophe@railnova.eu>
References: <20200819120506.137013-1-titouan.christophe@railnova.eu>
Message-ID: <20200819120506.137013-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 4fc62e1eb6b3adbfc3d3eb7f841275ae8cd1b424, we removed arch/toolchain
dependencies from the mosquitto library (MMU, !STATIC, SYNC4), and moved
them to the mosquitto broker only.

All the packages modified here only need the mosquitto library, so they
shouldn't have those depends anymore; but this was never done before.

Moreover, domoticz and shairport-sync both use the mosquitto threaded
API, so we make them dependent on the newly introduced symbol
BR2_PACKAGE_MOSQUITTO_WITH_THREADING.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
Changes v1 -> v2:
* Fix reverse dependencies
---
 package/collectd/Config.in       | 1 -
 package/domoticz/Config.in       | 4 +---
 package/shairport-sync/Config.in | 1 +
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 4f54944cbc..ddf64015bd 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -607,7 +607,6 @@ comment "grpc needs a toolchain w/ C++, gcc >= 4.8"
 
 config BR2_PACKAGE_COLLECTD_MQTT
 	bool "mqtt"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
 	select BR2_PACKAGE_MOSQUITTO
 	help
 	  Sends metrics to and/or receives metrics from an MQTT broker.
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index c713ac58b1..545137a087 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
-	depends on BR2_USE_MMU # mosquitto
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
-	depends on !BR2_STATIC_LIBS # mosquitto
+	depends on BR2_PACKAGE_MOSQUITTO_WITH_THREADING
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sleep_for
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 528767ba9c..df8a39ceb1 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -57,6 +57,7 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_MQTT
 	depends on BR2_USE_MMU # avahi
 	depends on BR2_TOOLCHAIN_HAS_THREADS # avahi
 	depends on !BR2_STATIC_LIBS # avahi
+	depends on BR2_PACKAGE_MOSQUITTO_WITH_THREADING
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	select BR2_PACKAGE_DBUS
-- 
2.25.3
