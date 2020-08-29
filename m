From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 19:51:21 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/{collectd,
 domoticz}: fix outdated dependencies for mosquitto
Message-ID: <20200829174502.6B46682D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7de027bf954362cf35939ed9deb5d84cc7982317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

In 4fc62e1eb6b3adbfc3d3eb7f841275ae8cd1b424, we removed arch/toolchain
dependencies from the mosquitto library (MMU, !STATIC, SYNC4), and moved
them to the mosquitto broker only.

All the packages modified here only need the mosquitto library, so they
shouldn't have those depends anymore; but this was never done before.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
[Peter: leave mmu/!static dependency for domoticz as it uses fork()/looks
	for libmosquitto.so]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8f5a9f597e35e6bc89dc938edbe753004d0201d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 1 -
 package/domoticz/Config.in | 5 ++---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 303b5dc01b..5b194e943c 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -593,7 +593,6 @@ comment "grpc needs a toolchain w/ C++, gcc >= 4.8"
 
 config BR2_PACKAGE_COLLECTD_MQTT
 	bool "mqtt"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
 	select BR2_PACKAGE_MOSQUITTO
 	help
 	  Sends metrics to and/or receives metrics from an MQTT broker.
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index b99e548012..e05861eb4d 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
-	depends on BR2_USE_MMU # mosquitto
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
-	depends on !BR2_STATIC_LIBS # mosquitto
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sleep_for
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
