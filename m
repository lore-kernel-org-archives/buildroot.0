From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 13:59:21 +0100
Subject: [Buildroot] [git commit] package/collectd: add grpc support
Message-ID: <20191028125708.5AB2488EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=903de16f5fd586a32a7aed7a792a43dce16365eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use --with-libgrpc++ option as otherwise collectd will try to find
grpc++.pc which is not available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 15 +++++++++++++++
 package/collectd/collectd.mk |  7 ++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 3ca33807d7..bda546e67e 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -549,6 +549,21 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE
 	  Writes data collected to Carbon (Graphite's) storage API.
 	  http://graphite.wikidot.com/start
 
+config BR2_PACKAGE_COLLECTD_GRPC
+	bool "grpc"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
+	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # grpc -> protobuf
+	select BR2_PACKAGE_GRPC
+	help
+	  Send/receive values using the gRPC protocol.
+
+comment "grpc needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
 config BR2_PACKAGE_COLLECTD_MQTT
 	bool "mqtt"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mosquitto
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 5d94dec46d..fefd5641b2 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -18,7 +18,7 @@ COLLECTD_AUTORECONF = YES
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp intel_rdt ipmi java lpar lua lvm \
+	gmond hddtemp intel_rdt ipmi java lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
@@ -78,6 +78,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),--enable-gps,--disable-gps) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRPC),--enable-grpc,--disable-grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_HUGEPAGES),--enable-hugepages,--disable-hugepages) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
@@ -156,6 +157,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
@@ -179,6 +181,9 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEREDIS),hiredis)
 
 # include/library fixups
+ifeq ($(BR2_PACKAGE_GRPC),y)
+COLLECTD_CONF_OPTS += --with-libgrpc++=$(STAGING_DIR)/usr
+endif
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
 endif
