From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 22:59:20 -0300
Subject: [Buildroot] [PATCH 13/14] collectd: add gps plugin support
In-Reply-To: <20161222015921.6832-1-gustavo@zacarias.com.ar>
References: <20161222015921.6832-1-gustavo@zacarias.com.ar>
Message-ID: <20161222015921.6832-13-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add explicit support for the gps plugin that uses libgps from the gpsd
package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 7 +++++++
 package/collectd/collectd.mk | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 7cd6397..02c02b7 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -237,6 +237,13 @@ config BR2_PACKAGE_COLLECTD_FSCACHE
 	  Collects information about the file-system based caching
 	  infrastructure for network file-systems and other slow media.
 
+config BR2_PACKAGE_COLLECTD_GPS
+	bool "gps"
+	select BR2_PACKAGE_GPSD
+	help
+	  Reports the number of sattelites seen by and precision
+	  of a GPS receiver.
+
 config BR2_PACKAGE_COLLECTD_HUGEPAGES
 	bool "hugepages"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index b105e90..520ce1c 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -57,6 +57,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_FHCOUNT),--enable-fhcount,--disable-fhcount) \
 	$(if $(BR2_PACKAGE_COLLECTD_FILECOUNT),--enable-filecount,--disable-filecount) \
 	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
+	$(if $(BR2_PACKAGE_COLLECTD_GPS),--enable-gps,--disable-gps) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_HUGEPAGES),--enable-hugepages,--disable-hugepages) \
@@ -131,6 +132,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
+	$(if $(BR2_PACKAGE_COLLECTD_GPS),gpsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
-- 
2.10.2
