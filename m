From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 15:30:48 +0200
Subject: [Buildroot] [git commit] package/collectd: add write_redis support
Message-ID: <20190610133150.1F8858E8C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f7264c2ff8d2e49c533676dd527a6329f88262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/collectd/Config.in   | 6 ++++++
 package/collectd/collectd.mk | 6 ++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 7979410871..990dd44e6d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -616,6 +616,12 @@ comment "write_prometheus needs a toolchain w/ C++, host gcc >= 4.8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
+config BR2_PACKAGE_COLLECTD_WRITEREDIS
+	bool "write_redis"
+	select BR2_PACKAGE_HIREDIS
+	help
+	  Sends data to Redis.
+
 config BR2_PACKAGE_COLLECTD_WRITESENSU
 	bool "write_sensu"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ddafd06190..ca9a9e7a95 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -20,7 +20,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	nut onewire oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
-	write_mongodb write_redis xencpu xmms zfs_arc zone
+	write_mongodb xencpu xmms zfs_arc zone
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
@@ -137,6 +137,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITELOG),--enable-write_log,--disable-write_log) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),--enable-write_prometheus,--disable-write_prometheus) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),--enable-write_redis,--disable-write_redis) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITESENSU),--enable-write_sensu,--disable-write_sensu) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITETSDB),--enable-write_tsdb,--disable-write_tsdb) \
 	$(if $(BR2_PACKAGE_COLLECTD_ZOOKEEPER),--enable-zookeeper,--disable-zookeeper)
@@ -171,7 +172,8 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_SMART),libatasmart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl) \
-	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),libmicrohttpd protobuf-c)
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),libmicrohttpd protobuf-c) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),hiredis)
 
 # include/library fixups
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
