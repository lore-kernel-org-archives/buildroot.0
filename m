From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 00:51:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/collectd: add redis support
Message-ID: <20190609225119.31631-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in   | 6 ++++++
 package/collectd/collectd.mk | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 3110363429..7979410871 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -404,6 +404,12 @@ config BR2_PACKAGE_COLLECTD_PROTOCOLS
 	help
 	  Collects information about the network protocols.
 
+config BR2_PACKAGE_COLLECTD_REDIS
+	bool "redis"
+	select BR2_PACKAGE_HIREDIS
+	help
+	  Connects to one or more instances of Redis.
+
 config BR2_PACKAGE_COLLECTD_SENSORS
 	bool "sensors"
 	select BR2_PACKAGE_LM_SENSORS
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 531b824b26..ddafd06190 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -17,7 +17,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
 	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
-	nut onewire oracle perl pf pinba powerdns python redis routeros \
+	nut onewire oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
 	write_mongodb write_redis xencpu xmms zfs_arc zone
@@ -107,6 +107,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),--enable-postgresql,--disable-postgresql) \
 	$(if $(BR2_PACKAGE_COLLECTD_PROCESSES),--enable-processes,--disable-processes) \
 	$(if $(BR2_PACKAGE_COLLECTD_PROTOCOLS),--enable-protocols,--disable-protocols) \
+	$(if $(BR2_PACKAGE_COLLECTD_REDIS),--enable-redis,--disable-redis) \
 	$(if $(BR2_PACKAGE_COLLECTD_REGEX),--enable-match_regex,--disable-match-regex) \
 	$(if $(BR2_PACKAGE_COLLECTD_REPLACE),--enable-target_replace,--disable-target_replace) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),--enable-write_riemann,--disable-write_riemann) \
@@ -163,6 +164,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),postgresql) \
+	$(if $(BR2_PACKAGE_COLLECTD_REDIS),hiredis) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool riemann-c-client) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
-- 
2.20.1
