From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:46:04 +0100
Subject: [Buildroot] [git commit] collectd: add write_prometheus plugin
	support
Message-ID: <20161223214640.47EA281765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2db9867da9bc43dad29de4678273e1b508b4c535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add explicit support for the write_prometheus plugin, it requires the
libmicrohttpd and protobuf-c libraries.

[Peter: add note about where dependencies come from]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in   | 14 ++++++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 02c02b7..ab49b71 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -572,6 +572,20 @@ config BR2_PACKAGE_COLLECTD_WRITELOG
 	help
 	  Writes data to the log.
 
+config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
+	bool "write_prometheus"
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
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
