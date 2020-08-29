From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 29 Aug 2020 15:03:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/{collectd,
 domoticz}: fix outdated dependencies for mosquitto
Message-ID: <20200829130339.167330-1-titouan.christophe@railnova.eu>
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

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/collectd/Config.in | 1 -
 package/domoticz/Config.in | 3 ---
 2 files changed, 4 deletions(-)

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
index c713ac58b1..a2ad9f1b07 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -1,8 +1,5 @@
 config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
-	depends on BR2_USE_MMU # mosquitto
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
-	depends on !BR2_STATIC_LIBS # mosquitto
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sleep_for
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.25.3
