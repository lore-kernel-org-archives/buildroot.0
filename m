From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 10:18:16 -0300
Subject: [Buildroot] [PATCH] collectd: bump to version 5.4.2
Message-ID: <1425388696-2965-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Add hash file
* Add support for: ipvs, modbus, netlink, nginx, postgresql
* Fix threshold support

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in     | 47 +++++++++++++++++++++++++++++++++++++++++-
 package/collectd/collectd.hash |  2 ++
 package/collectd/collectd.mk   | 21 +++++++++++++------
 3 files changed, 63 insertions(+), 7 deletions(-)
 create mode 100644 package/collectd/collectd.hash

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 64f7d58..94c4acd 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -75,7 +75,7 @@ config BR2_PACKAGE_COLLECTD_SYSLOG
 	help
 	  Logs to the standard UNIX logging mechanism.
 
-config BR2_PACKAGE_THRESHOLD
+config BR2_PACKAGE_COLLECTD_THRESHOLD
 	bool "threshold"
 	help
 	  Checks values against configured thresholds and creates notifications
@@ -211,6 +211,15 @@ config BR2_PACKAGE_COLLECTD_IPTABLES
 	help
 	  Gather statistics from iptables packet filter.
 
+config BR2_PACKAGE_COLLECTD_IPVS
+	bool "ipvs"
+	help
+	  Extracts statistics from IP Virtual Server (IPVS), the
+	  transport-layer load-balancer of the LVS project.
+	  It stores traffic and connections history for each of the
+	  Real Servers (RS) behind a local Virtual Server (VS).
+	  Collectd must be run on Directors (in LVS jargon).
+
 config BR2_PACKAGE_COLLECTD_IRQ
 	bool "irq"
 	help
@@ -246,6 +255,12 @@ config BR2_PACKAGE_COLLECTD_MEMORY
 	help
 	  Collects physical memory utilization.
 
+config BR2_PACKAGE_COLLECTD_MODBUS
+	bool "modbus"
+	select BR2_PACKAGE_MODBUS
+	help
+	  Reads register values from a modbus "slave" via Modbus/TCP.
+
 config BR2_PACKAGE_COLLECTD_MYSQL
 	bool "mysql"
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
@@ -255,11 +270,28 @@ config BR2_PACKAGE_COLLECTD_MYSQL
 	help
 	  Connects to a MySQL database and issues a "show status" command.
 
+comment "netlink support needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_COLLECTD_NETLINK
+	bool "netlink"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Get statistics for interfaces, qdiscs, classes, and filters.
+
 config BR2_PACKAGE_COLLECTD_NFS
 	bool "nfs"
 	help
 	  Collects information about the usage of the Network File System.
 
+config BR2_PACKAGE_COLLECTD_NGINX
+	bool "nginx"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Collects the number of requests handled by the nginx daemon
+	  since startup and the number of current connections by state.
+
 config BR2_PACKAGE_COLLECTD_NTPD
 	bool "ntpd"
 	help
@@ -282,6 +314,19 @@ config BR2_PACKAGE_COLLECTD_PING
 	help
 	  Mesures network latency using ICMP "echo requests".
 
+comment "postgresql needs a toolchain w/ glibc"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_COLLECTD_POSTGRESQL
+	bool "postgresql"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_POSTGRESQL
+	help
+	  Connects to and executes SQL statements on a PostgreSQL
+	  database. It then reads back the results and, depending on the
+	  configuration, the returned values are then converted into
+	  collectd ?value lists?.
+
 config BR2_PACKAGE_COLLECTD_PROCESSES
 	bool "processes"
 	help
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
new file mode 100644
index 0000000..723fded
--- /dev/null
+++ b/package/collectd/collectd.hash
@@ -0,0 +1,2 @@
+# From http://collectd.org/download.shtml
+sha256	9789e900c138b5dbe907d3d744143f12b1e30022276cb1d8c65bbabaf0c4e393	collectd-5.4.2.tar.bz2
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index af58aa8..d5802d6 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.4.1
+COLLECTD_VERSION = 5.4.2
 COLLECTD_SITE = http://collectd.org/files
+COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = GPLv2 LGPLv2.1
@@ -14,11 +15,10 @@ COLLECTD_LICENSE_FILES = COPYING
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	amqp apple_sensors aquaero ascent dbi email \
-	gmond hddtemp ipmi ipvs java libvirt lpar lvm madwifi mbmon \
-	modbus multimeter netapp netlink nginx \
-	notify_desktop notify_email numa nut onewire oracle perl pf \
-	pinba postgresql powerdns python redis routeros rrdcached \
-	sigrok tape target_v5upgrade teamspeak2 ted \
+	gmond hddtemp ipmi java libvirt lpar lvm madwifi mbmon \
+	mic multimeter netapp  notify_desktop notify_email numa \
+	nut onewire oracle perl pf pinba powerdns python redis routeros \
+	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant uuid varnish vserver write_mongodb write_redis \
 	xmms zfs_arc
 
@@ -56,6 +56,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
 	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPVS),--enable-ipvs,--disable-ipvs) \
 	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
@@ -63,15 +64,19 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMORY),--enable-memory,--disable-memory) \
+	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),--enable-modbus,--disable-modbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),--enable-mysql,--disable-mysql) \
+	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),--enable-netlink,--disable-netlink) \
 	$(if $(BR2_PACKAGE_COLLECTD_NETWORK),--enable-network,--disable-network) \
 	$(if $(BR2_PACKAGE_COLLECTD_NFS),--enable-nfs,--disable-nfs) \
+	$(if $(BR2_PACKAGE_COLLECTD_NGINX),--enable-nginx,--disable-nginx) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFICATION),--enable-target_notification,--disable-target_notification) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),--enable-notify_email,--disable-notify_email) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENVPN),--enable-openvpn,--disable-openvpn) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),--enable-ping,--disable-ping) \
+	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),--enable-postgresql,--disable-postgresql) \
 	$(if $(BR2_PACKAGE_COLLECTD_PROCESSES),--enable-processes,--disable-processes) \
 	$(if $(BR2_PACKAGE_COLLECTD_PROTOCOLS),--enable-protocols,--disable-protocols) \
 	$(if $(BR2_PACKAGE_COLLECTD_REGEX),--enable-match_regex,--disable-match-regex) \
@@ -111,9 +116,13 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
+	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql) \
+	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
+	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
+	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),postgresql) \
 	$(if $(BR2_PACKAGE_COLLECTD_RIEMANN),protobuf-c) \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SENSORS),lm-sensors) \
-- 
2.0.5
