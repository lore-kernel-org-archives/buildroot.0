From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Sun, 20 May 2018 22:05:50 -0700
Subject: [Buildroot] [PATCH 4/4] package/collectd: allow the grpc plugin to
 be configured
In-Reply-To: <20180521050550.11898-1-charles.hardin@storagecraft.com>
References: <20180521050550.11898-1-charles.hardin@storagecraft.com>
Message-ID: <20180521050550.11898-4-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

Allow collectd to use the gRPC package since that package
can now be compiled as part of buildroot. This plugin can
be used to push collectd datasets over the network to
other instances as needed.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/collectd/Config.in   | 6 ++++++
 package/collectd/collectd.mk | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ccd3fbe13f..0848e3c343 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -248,6 +248,12 @@ config BR2_PACKAGE_COLLECTD_GPS
 	  Reports the number of sattelites seen by and precision
 	  of a GPS receiver.
 
+config BR2_PACKAGE_COLLECTD_GRPC
+	bool "grpc"
+	select BR2_PACKAGE_GRPC
+	help
+	  Add support for the gRPC plugin for network communication
+
 config BR2_PACKAGE_COLLECTD_HUGEPAGES
 	bool "hugepages"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6c987b2e36..00efee4a18 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -15,7 +15,7 @@ COLLECTD_LICENSE_FILES = COPYING
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond grpc hddtemp intel_rdt ipmi java libvirt lpar lvm \
+	gmond hddtemp intel_rdt ipmi java libvirt lpar lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
@@ -73,6 +73,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),--enable-gps,--disable-gps) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRPC),--enable-grpc,--disable-grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_HUGEPAGES),--enable-hugepages,--disable-hugepages) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
@@ -148,6 +149,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
-- 
2.15.1 (Apple Git-101)
