From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:32:58 -0000
Subject: [Buildroot] [git commit] collectd: new package
Message-ID: <20120531113256.7251496E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef9f0eae3287e5d6cdfc413ff8ffaa74e4ac76fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/collectd/Config.in   |  382 ++++++++++++++++++++++++++++++++++++++++++
 package/collectd/collectd.mk |  127 ++++++++++++++
 3 files changed, 510 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c34e61a..f91a907 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -472,6 +472,7 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
+source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
new file mode 100644
index 0000000..cb96fbd
--- /dev/null
+++ b/package/collectd/Config.in
@@ -0,0 +1,382 @@
+config BR2_PACKAGE_COLLECTD
+	bool "collectd"
+	help
+	  collectd is a daemon which collects system performance
+	  statistics periodically and provides mechanisms to store
+	  the values in a variety of ways, for example in RRD files.
+
+	  http://collectd.org/
+
+if BR2_PACKAGE_COLLECTD
+
+menu "match plugins"
+
+config BR2_PACKAGE_COLLECTD_EMPTY_COUNTER
+	bool "empty counter"
+	help
+	  Match counter values which are currently zero.
+
+config BR2_PACKAGE_COLLECTD_HASHED
+	bool "hashed"
+	help
+	  Match values using a hash function of the hostname.
+
+config BR2_PACKAGE_COLLECTD_REGEX
+	bool "regex"
+	help
+	  Match values by their identifier based on regular expressions.
+
+config BR2_PACKAGE_COLLECTD_TIMEDIFF
+	bool "timediff"
+	help
+	  Match values with an invalid timestamp.
+
+config BR2_PACKAGE_COLLECTD_VALUE
+	bool "value"
+	help
+	  Select values by their data sources' values.
+endmenu
+
+menu "misc plugins"
+
+config BR2_PACKAGE_COLLECTD_LOGFILE
+	bool "logfile"
+	default y
+	help
+	  Writes log messages to a file or STDOUT/STDERR.
+
+config BR2_PACKAGE_COLLECTD_SYSLOG
+	bool "syslog"
+	default y
+	help
+	  Logs to the standard UNIX logging mechanism.
+
+config BR2_PACKAGE_THRESHOLD
+	bool "threshold"
+	help
+	  Checks values against configured thresholds and creates notifications
+	  if values are out of bounds.
+
+endmenu
+
+menu "read plugins"
+
+comment "Select at least one for collectd to be useful"
+
+config BR2_PACKAGE_COLLECTD_APACHE
+	bool "apache"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Collects Apache's mod_status information.
+
+config BR2_PACKAGE_COLLECTD_APCUPS
+	bool "apcups"
+	help
+	  Collects UPS statistics from apcupsd.
+
+config BR2_PACKAGE_COLLECTD_BATTERY
+	bool "battery"
+	help
+	  Collects the battery's charge, the drawn current and voltage.
+
+config BR2_PACKAGE_COLLECTD_BIND
+	bool "bind"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Collects BIND DNS statistics.
+
+config BR2_PACKAGE_COLLECTD_CONNTRACK
+	bool "conntrack"
+	help
+	  Collects the number of entries in Linux's connection tracking table.
+
+config BR2_PACKAGE_COLLECTD_CONTEXTSWITCH
+	bool "contextswitch"
+	help
+	  Collects the number of context switches done by the operating system.
+
+config BR2_PACKAGE_COLLECTD_CPU
+	bool "cpu"
+	help
+	  Collects the amount of time spent by the CPU in various states.
+
+config BR2_PACKAGE_COLLECTD_CPUFREQ
+	bool "cpufreq"
+	help
+	  Collects the current CPU's frequency.
+
+config BR2_PACKAGE_COLLECTD_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Uses libcurl to read files and then parses them according
+	  to the configuration.
+
+config BR2_PACKAGE_COLLECTD_CURL_JSON
+	bool "curl-json"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_YAJL
+	help
+	  Queries JSON data using the cURL library and parses it
+	  according to the user's configuration using YAJL.
+
+config BR2_PACKAGE_COLLECTD_CURL_XML
+	bool "curl-xml"
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Reads files using libcurl and parses it as XML.
+
+config BR2_PACKAGE_COLLECTD_DF
+	bool "df"
+	help
+	  Collects file system usage information.
+
+config BR2_PACKAGE_COLLECTD_DISK
+	bool "disk"
+	help
+	  Collects performance statistics of hard-disks and partitions.
+
+config BR2_PACKAGE_COLLECTD_DNS
+	bool "dns"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Collects statistics of DNS traffic using libpcap.
+
+config BR2_PACKAGE_COLLECTD_ENTROPY
+	bool "entropy"
+	help
+	  Collects the available entropy on a system.
+
+config BR2_PACKAGE_COLLECTD_ETHSTAT
+	bool "ethstat"
+	help
+	  Collects network interface card statistics.
+
+config BR2_PACKAGE_COLLECTD_EXEC
+	bool "exec"
+	help
+	  Executes scripts and reads values back that are printed
+	  to STDOUT by that program.
+
+config BR2_PACKAGE_COLLECTD_FILECOUNT
+	bool "filecount"
+	help
+	  Counts the number of files in a directory and all its subdirectories.
+
+config BR2_PACKAGE_COLLECTD_FSCACHE
+	bool "fscache"
+	help
+	  Collects information about the file-system based caching
+	  infrastructure for network file-systems and other slow media.
+
+config BR2_PACKAGE_COLLECTD_INTERFACE
+	bool "interface"
+	help
+	  Collects information about the traffic of network interfaces.
+
+config BR2_PACKAGE_COLLECTD_IPTABLES
+	bool "iptables"
+	select BR2_PACKAGE_IPTABLES
+	help
+	  Gather statistics from iptables packet filter.
+
+config BR2_PACKAGE_COLLECTD_IRQ
+	bool "irq"
+	help
+	  Collects the number of interrupts.
+
+config BR2_PACKAGE_COLLECTD_LOAD
+	bool "load"
+	help
+	  Collects the system load.
+
+config BR2_PACKAGE_COLLECTD_MD
+	bool "md"
+	help
+	  Collects software-RAID device information.
+
+config BR2_PACKAGE_COLLECTD_MEMCACHED
+	bool "memcached"
+	help
+	  Collects statistics from a memcached daemon.
+
+config BR2_PACKAGE_COLLECTD_MEMORY
+	bool "memory"
+	help
+	  Collects physical memory utilization.
+
+config BR2_PACKAGE_COLLECTD_MYSQL
+	bool "mysql"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_MYSQL_CLIENT
+	help
+	  Connects to a MySQL database and issues a "show status" command.
+
+config BR2_PACKAGE_COLLECTD_NFS
+	bool "nfs"
+	help
+	  Collects information about the usage of the Network File System.
+
+config BR2_PACKAGE_COLLECTD_NTPD
+	bool "ntpd"
+	help
+	  Queries an NTP server and extracts parameters.
+
+config BR2_PACKAGE_COLLECTD_OLSRD
+	bool "olsrd"
+	help
+	  Reads information about meshed networks from olsrd.
+
+config BR2_PACKAGE_COLLECTD_OPENVPN
+	bool "openvpn"
+	help
+	  Reads the status file of OpenVPN to collect statistics.
+
+config BR2_PACKAGE_COLLECTD_PING
+	bool "ping"
+	depends on BR2_INET_IPV6
+	select BR2_PACKAGE_LIBOPING
+	help
+	  Mesures network latency using ICMP "echo requests".
+
+config BR2_PACKAGE_COLLECTD_PROCESSES
+	bool "processes"
+	help
+	  Collects the number of processes gruped by state.
+
+config BR2_PACKAGE_COLLECTD_PROTOCOLS
+	bool "protocols"
+	help
+	  Collects information about the network protocols.
+
+config BR2_PACKAGE_COLLECTD_SERIAL
+	bool "serial"
+	help
+	  Collects the traffic on serial interfaces.
+
+config BR2_PACKAGE_COLLECTD_SNMP
+	bool "snmp"
+	select BR2_PACKAGE_NETSNMP
+	help
+	  Reads values from SNMP devices.
+
+config BR2_PACKAGE_COLLECTD_SWAP
+	bool "swap"
+	help
+	  Collects the amount of memory currently written to disk.
+
+config BR2_PACKAGE_COLLECTD_TABLE
+	bool "table"
+	help
+	  Parses table-like structured plain-text files.
+
+config BR2_PACKAGE_COLLECTD_TAIL
+	bool "tail"
+	help
+	  Tails log files and each line is given to one or more matches
+	  which test if the line is relevant for any statistics.
+
+config BR2_PACKAGE_COLLECTD_TCPCONNS
+	bool "tcpconns"
+	help
+	  Counts the number of TCP connections to/from a specified port.
+
+config BR2_PACKAGE_COLLECTD_THERMAL
+	bool "thermal"
+	help
+	  Reads ACPI thermal zone information.
+
+config BR2_PACKAGE_COLLECTD_UPTIME
+	bool "uptime"
+	help
+	  Keeps track of the system uptime.
+
+config BR2_PACKAGE_COLLECTD_USERS
+	bool "users"
+	help
+	  Counts the number of users currently logged in.
+
+config BR2_PACKAGE_COLLECTD_VMEM
+	bool "vmem"
+	help
+	  Collects information about the virtual memory subsystem.
+
+config BR2_PACKAGE_COLLECTD_WIRELESS
+	bool "wireless"
+	help
+	  Collects signal quality, power and noise ratio for WLAN cards.
+
+endmenu
+
+menu "target plugins"
+
+config BR2_PACKAGE_COLLECTD_NOTIFICATION
+	bool "notification"
+	help
+	  Create and dispatch a notification.
+
+config BR2_PACKAGE_COLLECTD_REPLACE
+	bool "replace"
+	help
+	  Replace parts of an identifier using regular expressions.
+
+config BR2_PACKAGE_COLLECTD_SCALE
+	bool "scale"
+	help
+	  Scale (multiply) values by an arbitrary number.
+
+config BR2_PACKAGE_COLLECTD_SET
+	bool "set"
+	help
+	  Set (overwrite) entire parts of an identifier.
+
+endmenu
+
+menu "write plugins"
+
+comment "Select at least one for collectd to be useful"
+
+config BR2_PACKAGE_COLLECTD_CSV
+	bool "csv"
+	help
+	  Writes values to a plain-text file in Comma Separated Values format.
+
+config BR2_PACKAGE_COLLECTD_GRAPHITE
+	bool "graphite"
+	help
+	  Writes data collected to Carbon (Graphite's) storage API.
+	  http://graphite.wikidot.com/start
+
+config BR2_PACKAGE_COLLECTD_NETWORK
+	bool "network"
+	depends on BR2_INET_IPV6
+	help
+	  Send/receive values from other instances of collectd.
+
+config BR2_PACKAGE_COLLECTD_RRDTOOL
+	bool "rrdtool"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBART
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_RRDTOOL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Writes values to RRD-files.
+
+config BR2_PACKAGE_COLLECTD_UNIXSOCK
+	bool "unixsock"
+	help
+	  Opens a UNIX domain socket and accepts connections.
+	  One can send commands to the daemon and receive information.
+
+config BR2_PACKAGE_COLLECTD_WRITEHTTP
+	bool "writehttp"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Sends values collected to a web-server using HTTP POST and PUTVAL.
+
+endmenu
+
+endif
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
new file mode 100644
index 0000000..0109f77
--- /dev/null
+++ b/package/collectd/collectd.mk
@@ -0,0 +1,127 @@
+#############################################################
+#
+# collectd
+#
+#############################################################
+
+COLLECTD_VERSION = 5.1.0
+COLLECTD_SITE = http://collectd.org/files
+COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
+COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
+
+# These require unmet dependencies, are fringe, pointless or deprecated
+COLLECTD_PLUGINS_DISABLE = amqp apple_sensors ascent dbi email \
+		gmond hddtemp ipmi ipvs java libvirt lpar madwifi mbmon \
+		memcachec modbus multimeter netapp netlink nginx \
+		notify_desktop notify_email numa nut onewire oracle perl \
+		pinba postgresql powerdns python redis routeros rrdcached \
+		sensors tape target_v5upgrade teamspeak2 ted tokyotyrant \
+		uuid varnish vserver write_mongodb write_redis xmms zfs_arc
+
+COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
+	--localstatedir=/var --with-perl-bindings=no \
+	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
+	$(if $(BR2_PACKAGE_COLLECTD_APACHE),--enable-apache,--disable-apache) \
+	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
+	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
+	$(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
+	$(if $(BR2_PACKAGE_COLLECTD_CONNTRACK),--enable-conntrack,--disable-conntrack) \
+	$(if $(BR2_PACKAGE_COLLECTD_CONTEXTSWITCH),--enable-contextswitch,--disable-contextswitch) \
+	$(if $(BR2_PACKAGE_COLLECTD_CPU),--enable-cpu,--disable-cpu) \
+	$(if $(BR2_PACKAGE_COLLECTD_CPUFREQ),--enable-cpufreq,--disable-cpufreq) \
+	$(if $(BR2_PACKAGE_COLLECTD_CSV),--enable-csv,--disable-csv) \
+	$(if $(BR2_PACKAGE_COLLECTD_CURL),--enable-curl,--disable-curl) \
+	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),--enable-curl_json,--disable-curl_json) \
+	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),--enable-curl_xml,--disable-curl_xml) \
+	$(if $(BR2_PACKAGE_COLLECTD_DF),--enable-df,--disable-df) \
+	$(if $(BR2_PACKAGE_COLLECTD_DISK),--enable-disk,--disable-disk) \
+	$(if $(BR2_PACKAGE_COLLECTD_DNS),--enable-dns,--disable-dns) \
+	$(if $(BR2_PACKAGE_COLLECTD_EMPTY_COUNTER),--enable-match_empty_counter,--disable-match_empty_counter) \
+	$(if $(BR2_PACKAGE_COLLECTD_ENTROPY),--enable-entropy,--disable-entropy) \
+	$(if $(BR2_PACKAGE_COLLECTD_ETHSTAT),--enable-ethstat,--disable-ethstat) \
+	$(if $(BR2_PACKAGE_COLLECTD_EXEC),--enable-exec,--disable-exec) \
+	$(if $(BR2_PACKAGE_COLLECTD_FILECOUNT),--enable-filecount,--disable-filecount) \
+	$(if $(BR2_PACKAGE_COLLECTD_FSCACHE),--enable-fscache,--disable-fscache) \
+	$(if $(BR2_PACKAGE_COLLECTD_GRAPHITE),--enable-write_graphite,--disable-write_graphite) \
+	$(if $(BR2_PACKAGE_COLLECTD_HASHED),--enable-match_hashed,--disable-match_hashed) \
+	$(if $(BR2_PACKAGE_COLLECTD_INTERFACE),--enable-interface,--disable-interface) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),--enable-iptables,--disable-iptables) \
+	$(if $(BR2_PACKAGE_COLLECTD_IRQ),--enable-irq,--disable-irq) \
+	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
+	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
+	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
+	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
+	$(if $(BR2_PACKAGE_COLLECTD_MEMORY),--enable-memory,--disable-memory) \
+	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),--enable-mysql,--disable-mysql) \
+	$(if $(BR2_PACKAGE_COLLECTD_NETWORK),--enable-network,--disable-network) \
+	$(if $(BR2_PACKAGE_COLLECTD_NFS),--enable-nfs,--disable-nfs) \
+	$(if $(BR2_PACKAGE_COLLECTD_NOTIFICATION),--enable-target_notification,--disable-target_notification) \
+	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
+	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
+	$(if $(BR2_PACKAGE_COLLECTD_OPENVPN),--enable-openvpn,--disable-openvpn) \
+	$(if $(BR2_PACKAGE_COLLECTD_PING),--enable-ping,--disable-ping) \
+	$(if $(BR2_PACKAGE_COLLECTD_PROCESSES),--enable-processes,--disable-processes) \
+	$(if $(BR2_PACKAGE_COLLECTD_PROTOCOLS),--enable-protocols,--disable-protocols) \
+	$(if $(BR2_PACKAGE_COLLECTD_REGEX),--enable-match_regex,--disable-match-regex) \
+	$(if $(BR2_PACKAGE_COLLECTD_REPLACE),--enable-target_replace,--disable-target_replace) \
+	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),--enable-rrdtool,--disable-rrdtool) \
+	$(if $(BR2_PACKAGE_COLLECTD_SCALE),--enable-target_scale,--disable-target_scale) \
+	$(if $(BR2_PACKAGE_COLLECTD_SERIAL),--enable-serial,--disable-serial) \
+	$(if $(BR2_PACKAGE_COLLECTD_SET),--enable-target_set,--disable-target_set) \
+	$(if $(BR2_PACKAGE_COLLECTD_SNMP),--enable-snmp,--disable-snmp) \
+	$(if $(BR2_PACKAGE_COLLECTD_SWAP),--enable-swap,--disable-swap) \
+	$(if $(BR2_PACKAGE_COLLECTD_SYSLOG),--enable-syslog,--disable-syslog) \
+	$(if $(BR2_PACKAGE_COLLECTD_TABLE),--enable-table,--disable-table) \
+	$(if $(BR2_PACKAGE_COLLECTD_TAIL),--enable-tail,--disable-tail) \
+	$(if $(BR2_PACKAGE_COLLECTD_TCPCONNS),--enable-tcpconns,--disable-tcpconns) \
+	$(if $(BR2_PACKAGE_COLLECTD_THERMAL),--enable-thermal,--disable-thermal) \
+	$(if $(BR2_PACKAGE_COLLECTD_THRESHOLD),--enable-threshold,--disable-threshold) \
+	$(if $(BR2_PACKAGE_COLLECTD_TIMEDIFF),--enable-match_timediff,--disable-match_timediff) \
+	$(if $(BR2_PACKAGE_COLLECTD_UNIXSOCK),--enable-unixsock,--disable-unixsock) \
+	$(if $(BR2_PACKAGE_COLLECTD_UPTIME),--enable-uptime,--disable-uptime) \
+	$(if $(BR2_PACKAGE_COLLECTD_USERS),--enable-users,--disable-users) \
+	$(if $(BR2_PACKAGE_COLLECTD_VALUE),--enable-match_value,--disable-match_value) \
+	$(if $(BR2_PACKAGE_COLLECTD_VMEM),--enable-vmem,--disable-vmem) \
+	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http)
+
+COLLECTD_DEPENDENCIES = host-pkg-config \
+	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
+	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
+	$(if $(BR2_PACKAGE_COLLECTD_CURL_JSON),libcurl yajl) \
+	$(if $(BR2_PACKAGE_COLLECTD_CURL_XML),libcurl libxml2) \
+	$(if $(BR2_PACKAGE_COLLECTD_DNS),libpcap) \
+	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
+	$(if $(BR2_PACKAGE_COLLECTD_MYSQL),mysql_client) \
+	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
+	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),rrdtool) \
+	$(if $(BR2_PACKAGE_COLLECTD_SNMP),netsnmp) \
+	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),libcurl)
+
+# include/library fixups
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+	COLLECTD_CONF_OPT += --with-libcurl=$(STAGING_DIR)/usr
+endif
+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+	COLLECTD_CONF_OPT += --with-libmysql=$(STAGING_DIR)/usr
+endif
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+	COLLECTD_CONF_OPT += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+endif
+ifeq ($(BR2_PACKAGE_YAJL),y)
+	COLLECTD_CONF_OPT += --with-yajl=$(STAGING_DIR)/usr
+endif
+
+# network can use libgcrypt
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+	COLLECTD_DEPENDENCIES += libgcrypt
+	COLLECTD_CONF_OPT += --with-libgcrypt=$(STAGING_DIR)/usr
+endif
+
+define COLLECTD_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
+	rm -f $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
+endef
+
+$(eval $(call AUTOTARGETS))
