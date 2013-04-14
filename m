From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 23:58:51 +0200
Subject: [Buildroot] [git commit] collectd: bump to version 5.3.0
Message-ID: <20130414215906.F2D939B6AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a000029dbf2b42e702fa17c441395bf122564773
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/Config.in   |   33 +++++++++++++++++++++++++++++++--
 package/collectd/collectd.mk |   10 ++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 74419f6..a1d50a4 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_COLLECTD
 	bool "collectd"
 	# Uses fork()
 	depends on BR2_USE_MMU
+	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  collectd is a daemon which collects system performance
@@ -42,12 +43,27 @@ endmenu
 
 menu "misc plugins"
 
+config BR2_PACKAGE_COLLECTD_AGGREGATION
+	bool "aggregation"
+	help
+	  The Aggregate plugin allows to aggregate multiple values into
+	  a single value using one or several consolidation functions,
+	  e.g. summation and average.
+
 config BR2_PACKAGE_COLLECTD_LOGFILE
 	bool "logfile"
 	default y
 	help
 	  Writes log messages to a file or STDOUT/STDERR.
 
+config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
+	bool "notify_email"
+	select BR2_PACKAGE_LIBESMTP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Send an E-mail with the notification message to the
+	  configured recipients.
+
 config BR2_PACKAGE_COLLECTD_SYSLOG
 	bool "syslog"
 	default y
@@ -282,6 +298,12 @@ config BR2_PACKAGE_COLLECTD_TAIL
 	  Tails log files and each line is given to one or more matches
 	  which test if the line is relevant for any statistics.
 
+config BR2_PACKAGE_COLLECTD_TAIL_CSV
+	bool "tail csv"
+	help
+	  Follows (tails) files in CSV format, parses each line and submits
+	  extracted values.
+
 config BR2_PACKAGE_COLLECTD_TCPCONNS
 	bool "tcpconns"
 	help
@@ -373,6 +395,13 @@ config BR2_PACKAGE_COLLECTD_RRDTOOL
 comment "rrdtool support requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_COLLECTD_RIEMANN
+	bool "riemann"
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	select BR2_PACKAGE_PROTOBUF_C
+	help
+	  Sends data to Riemann, a stream processing and monitoring system.
+
 config BR2_PACKAGE_COLLECTD_UNIXSOCK
 	bool "unixsock"
 	help
@@ -389,5 +418,5 @@ endmenu
 
 endif
 
-comment "collectd needs a toolchain with thread support"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "collectd needs a toolchain with IPv6 and thread support"
+        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6022ab3..4dfa1d1 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-COLLECTD_VERSION = 5.1.3
+COLLECTD_VERSION = 5.3.0
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
@@ -16,7 +16,7 @@ COLLECTD_LICENSE_FILES = COPYING
 COLLECTD_PLUGINS_DISABLE = amqp apple_sensors ascent dbi email \
 		gmond hddtemp ipmi ipvs java libvirt lpar madwifi mbmon \
 		memcachec modbus multimeter netapp netlink nginx \
-		notify_desktop notify_email numa nut onewire oracle perl \
+		notify_desktop notify_email numa nut onewire oracle perl pf \
 		pinba postgresql powerdns python redis routeros rrdcached \
 		sensors tape target_v5upgrade teamspeak2 ted tokyotyrant \
 		uuid varnish vserver write_mongodb write_redis xmms zfs_arc
@@ -24,6 +24,7 @@ COLLECTD_PLUGINS_DISABLE = amqp apple_sensors ascent dbi email \
 COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	--localstatedir=/var --with-perl-bindings=no \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
+	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),--enable-apache,--disable-apache) \
 	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
@@ -59,6 +60,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_NETWORK),--enable-network,--disable-network) \
 	$(if $(BR2_PACKAGE_COLLECTD_NFS),--enable-nfs,--disable-nfs) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFICATION),--enable-target_notification,--disable-target_notification) \
+	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),--enable-notify_email,--disable-notify_email) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENVPN),--enable-openvpn,--disable-openvpn) \
@@ -67,6 +69,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_PROTOCOLS),--enable-protocols,--disable-protocols) \
 	$(if $(BR2_PACKAGE_COLLECTD_REGEX),--enable-match_regex,--disable-match-regex) \
 	$(if $(BR2_PACKAGE_COLLECTD_REPLACE),--enable-target_replace,--disable-target_replace) \
+	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),--enable-write_riemann,--disable-write_riemann) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),--enable-rrdtool,--disable-rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SCALE),--enable-target_scale,--disable-target_scale) \
 	$(if $(BR2_PACKAGE_COLLECTD_SERIAL),--enable-serial,--disable-serial) \
@@ -76,6 +79,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_SYSLOG),--enable-syslog,--disable-syslog) \
 	$(if $(BR2_PACKAGE_COLLECTD_TABLE),--enable-table,--disable-table) \
 	$(if $(BR2_PACKAGE_COLLECTD_TAIL),--enable-tail,--disable-tail) \
+	$(if $(BR2_PACKAGE_COLLECTD_TAIL_CSV),--enable-tail_csv,--disable-tail_csv) \
 	$(if $(BR2_PACKAGE_COLLECTD_TCPCONNS),--enable-tcpconns,--disable-tcpconns) \
 	$(if $(BR2_PACKAGE_COLLECTD_THERMAL),--enable-thermal,--disable-thermal) \
 	$(if $(BR2_PACKAGE_COLLECTD_THRESHOLD),--enable-threshold,--disable-threshold) \
@@ -97,7 +101,9 @@ COLLECTD_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql_client) \
+	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
+	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),protobuf-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl)
