From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 17:45:28 +0200
Subject: [Buildroot] [PATCH 1/3] package/collectd: add grpc support
Message-ID: <20190610154530.26937-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --with-libgrpc++ option as otherwise collectd will try to find
grpc++.pc which is not available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in   | 17 +++++++++++++++++
 package/collectd/collectd.mk |  7 ++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 990dd44e6d..4ca2204a56 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -549,6 +549,23 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE
 	  Writes data collected to Carbon (Graphite's) storage API.
 	  http://graphite.wikidot.com/start
 
+config BR2_PACKAGE_COLLECTD_GRPC
+	bool "grpc"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
+	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # grpc -> protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # grpc -> protobuf
+	select BR2_PACKAGE_GRPC
+	help
+	  Send/receive values using the gRPC protocol.
+
+comment "grpc needs a toolchain w/ C++, host and target gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_8 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
 config BR2_PACKAGE_COLLECTD_MQTT
 	bool "mqtt"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index ca9a9e7a95..6563668ce0 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,7 +15,7 @@ COLLECTD_LICENSE_FILES = COPYING libltdl/COPYING.LIB
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
+	gmond hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
@@ -75,6 +75,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),--enable-gps,--disable-gps) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRPC),--enable-grpc,--disable-grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_HUGEPAGES),--enable-hugepages,--disable-hugepages) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
@@ -153,6 +154,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
@@ -176,6 +178,9 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),hiredis)
 
 # include/library fixups
+ifeq ($(BR2_PACKAGE_GRPC),y)
+COLLECTD_CONF_OPTS += --with-libgrpc++=$(STAGING_DIR)/usr
+endif
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
 endif
-- 
2.20.1
