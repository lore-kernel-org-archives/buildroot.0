From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jun 2015 18:53:02 -0300
Subject: [Buildroot] [PATCH] collectd: bump to version 5.5.0
Message-ID: <1435269182-4103-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lots of new plugins!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in     | 74 +++++++++++++++++++++++++++++++++++++++++-
 package/collectd/collectd.hash |  2 +-
 package/collectd/collectd.mk   | 27 +++++++++++----
 3 files changed, 95 insertions(+), 8 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index ba290c3..2054978 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -56,6 +56,12 @@ config BR2_PACKAGE_COLLECTD_LOGFILE
 	help
 	  Writes log messages to a file or STDOUT/STDERR.
 
+config BR2_PACKAGE_COLLECTD_LOGSTASH
+	bool "logstash"
+	select BR2_PACKAGE_YAJL
+	help
+	  Writes log messages formatted as logstash JSON events.
+
 config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
 	depends on !BR2_STATIC_LIBS # libesmtp
@@ -109,6 +115,12 @@ config BR2_PACKAGE_COLLECTD_BIND
 	help
 	  Collects BIND DNS statistics.
 
+config BR2_PACKAGE_COLLECTD_CEPH
+	bool "ceph"
+	select BR2_PACKAGE_YAJL
+	help
+	  Statistics from the Ceph distributed storage system.
+
 config BR2_PACKAGE_COLLECTD_CGROUPS
 	bool "cgroups"
 	help
@@ -172,6 +184,11 @@ config BR2_PACKAGE_COLLECTD_DNS
 	help
 	  Collects statistics of DNS traffic using libpcap.
 
+config BR2_PACKAGE_COLLECTD_DRBD
+	bool "drbd"
+	help
+	  Collect individual drbd resource statistics.
+
 config BR2_PACKAGE_COLLECTD_ENTROPY
 	bool "entropy"
 	help
@@ -188,6 +205,11 @@ config BR2_PACKAGE_COLLECTD_EXEC
 	  Executes scripts and reads values back that are printed
 	  to STDOUT by that program.
 
+config BR2_PACKAGE_COLLECTD_FHCOUNT
+	bool "fhcount"
+	help
+	  File handles statistics.
+
 config BR2_PACKAGE_COLLECTD_FILECOUNT
 	bool "filecount"
 	help
@@ -204,6 +226,12 @@ config BR2_PACKAGE_COLLECTD_INTERFACE
 	help
 	  Collects information about the traffic of network interfaces.
 
+config BR2_PACKAGE_COLLECTD_IPC
+	bool "ipc"
+	help
+	  IPC counters: semaphores used, number of allocated segments
+	  in shared memory and more.
+
 config BR2_PACKAGE_COLLECTD_IPTABLES
 	bool "iptables"
 	select BR2_PACKAGE_IPTABLES
@@ -297,6 +325,16 @@ config BR2_PACKAGE_COLLECTD_OLSRD
 	help
 	  Reads information about meshed networks from olsrd.
 
+config BR2_PACKAGE_COLLECTD_OPENLDAP
+	bool "openldap"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  Read monitoring information from OpenLDAP's cn=Monitor subtree.
+
+comment "openldap support needs a toolchain w/ wchar"
+        depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_COLLECTD_OPENVPN
 	bool "openvpn"
 	help
@@ -338,6 +376,17 @@ config BR2_PACKAGE_COLLECTD_SERIAL
 	help
 	  Collects the traffic on serial interfaces.
 
+config BR2_PACKAGE_COLLECTD_SMART
+	bool "SMART"
+	depends on BR2_PACKAGE_HAS_UDEV # libatasmart
+	select BR2_PACKAGE_LIBATASMART
+	help
+	  Collect SMART statistics, notably load cycle count, temperature
+	  and bad sectors.
+
+comment "SMART requires udev to be enabled"
+        depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_COLLECTD_STATSD
 	bool "StatsD"
 	help
@@ -401,6 +450,11 @@ config BR2_PACKAGE_COLLECTD_WIRELESS
 	help
 	  Collects signal quality, power and noise ratio for WLAN cards.
 
+config BR2_PACKAGE_COLLECTD_ZOOKEEPER
+	bool "zookeeper"
+	help
+	  Read data from Zookeeper's MNTR command.
+
 endmenu
 
 menu "target plugins"
@@ -467,6 +521,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	# protobuf-c -> host-protobuf
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_LIBTOOL
 	help
 	  Sends data to Riemann, a stream processing and monitoring system.
 
@@ -477,11 +532,28 @@ config BR2_PACKAGE_COLLECTD_UNIXSOCK
 	  One can send commands to the daemon and receive information.
 
 config BR2_PACKAGE_COLLECTD_WRITEHTTP
-	bool "writehttp"
+	bool "write_http"
 	select BR2_PACKAGE_LIBCURL
 	help
 	  Sends values collected to a web-server using HTTP POST and PUTVAL.
 
+config BR2_PACKAGE_COLLECTD_WRITELOG
+	bool "write_log"
+	help
+	  Writes data to the log.
+
+config BR2_PACKAGE_COLLECTD_WRITESENSU
+	bool "write_sensu"
+	help
+	  Sends data to Sensu, a stream processing and monitoring system,
+	  via the Sensu client local TCP socket.
+
+config BR2_PACKAGE_COLLECTD_WRITETSDB
+	bool "write_tsdb"
+	help
+	  Sends data OpenTSDB, a scalable no master, no shared state time
+	  series database.
+
 endmenu
 
 endif
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 723fded..43bcfdd 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,2 +1,2 @@
 # From http://collectd.org/download.shtml
-sha256	9789e900c138b5dbe907d3d744143f12b1e30022276cb1d8c65bbabaf0c4e393	collectd-5.4.2.tar.bz2
+sha256	847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88	collectd-5.5.0.tar.bz2
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index f02be55..7649f72 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.4.2
+COLLECTD_VERSION = 5.5.0
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
@@ -14,13 +14,13 @@ COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-	amqp apple_sensors aquaero ascent dbi email \
+	amqp apple_sensors aquaero ascent barometer dbi email \
 	gmond hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
 	mic multimeter netapp  notify_desktop notify_email numa \
 	nut onewire oracle perl pf pinba powerdns python redis routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
-	tokyotyrant uuid varnish vserver write_mongodb write_redis \
-	xmms zfs_arc
+	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
+	write_mongodb write_redis xmms zfs_arc
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
@@ -34,6 +34,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
+	$(if $(BR2_PACKAGE_COLLECTD_CEPH),--enable-ceph,--disable-ceph) \
 	$(if $(BR2_PACKAGE_COLLECTD_CGROUPS),--enable-cgroups,--disable-cgroups) \
 	$(if $(BR2_PACKAGE_COLLECTD_CONNTRACK),--enable-conntrack,--disable-conntrack) \
 	$(if $(BR2_PACKAGE_COLLECTD_CONTEXTSWITCH),--enable-contextswitch,--disable-contextswitch) \
@@ -46,20 +47,24 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_DF),--enable-df,--disable-df) \
 	$(if $(BR2_PACKAGE_COLLECTD_DISK),--enable-disk,--disable-disk) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),--enable-dns,--disable-dns) \
+	$(if $(BR2_PACKAGE_COLLECTD_DRBD),--enable-drbd,--disable-drbd) \
 	$(if $(BR2_PACKAGE_COLLECTD_EMPTY_COUNTER),--enable-match_empty_counter,--disable-match_empty_counter) \
 	$(if $(BR2_PACKAGE_COLLECTD_ENTROPY),--enable-entropy,--disable-entropy) \
 	$(if $(BR2_PACKAGE_COLLECTD_ETHSTAT),--enable-ethstat,--disable-ethstat) \
 	$(if $(BR2_PACKAGE_COLLECTD_EXEC),--enable-exec,--disable-exec) \
+	$(if $(BR2_PACKAGE_COLLECTD_FHCOUNT),--enable-fhcount,--disable-fhcount) \
 	$(if $(BR2_PACKAGE_COLLECTD_FILECOUNT),--enable-filecount,--disable-filecount) \
 	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
 	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPC),--enable-ipc,--disable-ipc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPVS),--enable-ipvs,--disable-ipvs) \
 	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
+	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),--enable-log_logstash,--disable-log_logstash) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
@@ -74,6 +79,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),--enable-notify_email,--disable-notify_email) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
+	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),--enable-openldap,--disable-openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENVPN),--enable-openvpn,--disable-openvpn) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),--enable-ping,--disable-ping) \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),--enable-postgresql,--disable-postgresql) \
@@ -88,6 +94,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_SERIAL),--enable-serial,--disable-serial) \
 	$(if $(BR2_PACKAGE_COLLECTD_STATSD),--enable-statsd,--disable-statsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_SET),--enable-target_set,--disable-target_set) \
+	$(if $(BR2_PACKAGE_COLLECTD_SMART),--enable-smart,--disable-smart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),--enable-snmp,--disable-snmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_SWAP),--enable-swap,--disable-swap) \
 	$(if $(BR2_PACKAGE_COLLECTD_SYSLOG),--enable-syslog,--disable-syslog) \
@@ -104,28 +111,36 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_VALUE),--enable-match_value,--disable-match_value) \
 	$(if $(BR2_PACKAGE_COLLECTD_VMEM),--enable-vmem,--disable-vmem) \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
-	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http)
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITELOG),--enable-write_log,--disable-write_log) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITESENSU),--enable-write_sensu,--disable-write_sensu) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITETSDB),--enable-write_tsdb,--disable-write_tsdb) \
+	$(if $(BR2_PACKAGE_COLLECTD_ZOOKEEPER),--enable-zookeeper,--disable-zookeeper)
 
 COLLECTD_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),libcurl libxml2) \
+	$(if $(BR2_PACKAGE_COLLECTD_CEPH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
+	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
+	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),postgresql) \
-	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),protobuf-c) \
+	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),libtool protobuf-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
+	$(if $(BR2_PACKAGE_COLLECTD_SMART),libatasmart) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl)
 
-- 
2.3.6
