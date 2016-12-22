From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:21 -0300
Subject: [Buildroot] [PATCH 14/14] collectd: add write_prometheus plugin
	support
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-14-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit support for the write_prometheus plugin, it requires the
libmicrohttpd and protobuf-c libraries.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 14 ++++++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 02c02b7..fc60917 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -572,6 +572,20 @@ config BR2_PACKAGE_COLLECTD_WRITELOG
 	help
 	  Writes data to the log.
 
+config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
+	bool "write_prometheus"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	select BR2_PACKAGE_PROTOBUF_C
+	help
+	  Publishes values using an embedded HTTP server, in a format
+	  compatible with Prometheus' collectd_exporter.
+
+comment "write_prometheus needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+
 config BR2_PACKAGE_COLLECTD_WRITESENSU
 	bool "write_sensu"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 520ce1c..50a2e53 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -119,6 +119,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITELOG),--enable-write_log,--disable-write_log) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),--enable-write_prometheus,--disable-write_prometheus) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITESENSU),--enable-write_sensu,--disable-write_sensu) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITETSDB),--enable-write_tsdb,--disable-write_tsdb) \
 	$(if $(BR2_PACKAGE_COLLECTD_ZOOKEEPER),--enable-zookeeper,--disable-zookeeper)
@@ -150,7 +151,8 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
 	$(if $(BR2_PACKAGE_COLLECTD_SMART),libatasmart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
-	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl)
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS),libmicrohttpd protobuf-c)
 
 # include/library fixups
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-- 
2.10.2
