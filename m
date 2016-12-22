From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:15 -0300
Subject: [Buildroot] [PATCH 08/14] collectd: add mqtt plugin support
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-8-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit support for the mqtt (mosquitto) plugin.
Place it under the write category even though it can read as well, since
it will normally be used to write (publish) rather than read
(subscribe).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 6 ++++++
 package/collectd/collectd.mk | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d1b85aa..b17abe8 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -512,6 +512,12 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE
 	  Writes data collected to Carbon (Graphite's) storage API.
 	  http://graphite.wikidot.com/start
 
+config BR2_PACKAGE_COLLECTD_MQTT
+	bool "mqtt"
+	select BR2_PACKAGE_MOSQUITTO
+	help
+	  Sends metrics to and/or receives metrics from an MQTT broker.
+
 config BR2_PACKAGE_COLLECTD_NETWORK
 	bool "network"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index d8b2576..97e2e98 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -72,6 +72,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMORY),--enable-memory,--disable-memory) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),--enable-modbus,--disable-modbus) \
+	$(if $(BR2_PACKAGE_COLLECTD_MQTT),--enable-mqtt,--disable-mqtt) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),--enable-mysql,--disable-mysql) \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),--enable-netlink,--disable-netlink) \
 	$(if $(BR2_PACKAGE_COLLECTD_NETWORK),--enable-network,--disable-network) \
@@ -133,6 +134,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
+	$(if $(BR2_PACKAGE_COLLECTD_MQTT),mosquitto) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
-- 
2.10.2
