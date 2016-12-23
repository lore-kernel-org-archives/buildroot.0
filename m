From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:42:09 +0100
Subject: [Buildroot] [git commit] collectd: add gps plugin support
Message-ID: <20161223214640.3DA3981765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0631a385863217ab9b781183264400e553cb2bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add explicit support for the gps plugin that uses libgps from the gpsd
package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
