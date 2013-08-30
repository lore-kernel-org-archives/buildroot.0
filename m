From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Aug 2013 18:58:43 -0300
Subject: [Buildroot] [PATCH] collectd: bump to version 5.4.0
Message-ID: <1377899923-26257-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in   | 11 +++++++++++
 package/collectd/collectd.mk | 13 ++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index a1d50a4..43571e3 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -105,6 +105,11 @@ config BR2_PACKAGE_COLLECTD_BIND
 	help
 	  Collects BIND DNS statistics.
 
+config BR2_PACKAGE_COLLECTD_CGROUPS
+	bool "cgroups"
+	help
+	  Collects CGroups CPU usage accounting.
+
 config BR2_PACKAGE_COLLECTD_CONNTRACK
 	bool "conntrack"
 	help
@@ -276,6 +281,11 @@ config BR2_PACKAGE_COLLECTD_SERIAL
 	help
 	  Collects the traffic on serial interfaces.
 
+config BR2_PACKAGE_COLLECTD_STATSD
+	bool "StatsD"
+	help
+	  StatsD network protocol to allow clients to report "events".
+
 config BR2_PACKAGE_COLLECTD_SNMP
 	bool "snmp"
 	select BR2_PACKAGE_NETSNMP
@@ -420,3 +430,4 @@ endif
 
 comment "collectd needs a toolchain with IPv6 and thread support"
         depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+	depends on BR2_USE_MMU
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index bead4d4..55a388c 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.3.1
+COLLECTD_VERSION = 5.4.0
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_MAKE_OPT = LDFLAGS="$(TARGET_LDFLAGS) -lm"
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
@@ -13,13 +13,14 @@ COLLECTD_LICENSE = GPLv2 LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 
 # These require unmet dependencies, are fringe, pointless or deprecated
-COLLECTD_PLUGINS_DISABLE = amqp apple_sensors ascent dbi email \
-		gmond hddtemp ipmi ipvs java libvirt lpar madwifi mbmon \
+COLLECTD_PLUGINS_DISABLE = amqp apple_sensors aquaero ascent dbi email \
+		gmond hddtemp ipmi ipvs java libvirt lpar lvm madwifi mbmon \
 		memcachec modbus multimeter netapp netlink nginx \
 		notify_desktop notify_email numa nut onewire oracle perl pf \
 		pinba postgresql powerdns python redis routeros rrdcached \
-		sensors tape target_v5upgrade teamspeak2 ted tokyotyrant \
-		uuid varnish vserver write_mongodb write_redis xmms zfs_arc
+		sensors sigrok tape target_v5upgrade teamspeak2 ted \
+		tokyotyrant uuid varnish vserver write_mongodb write_redis \
+		xmms zfs_arc
 
 COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	--localstatedir=/var --with-perl-bindings=no \
@@ -29,6 +30,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_APCUPS),--enable-apcups,--disable-apcups) \
 	$(if $(BR2_PACKAGE_COLLECTD_BATTERY),--enable-battery,--disable-battery) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),--enable-bind,--disable-bind) \
+	$(if $(BR2_PACKAGE_COLLECTD_CGROUPS),--enable-cgroups,--disable-cgroups) \
 	$(if $(BR2_PACKAGE_COLLECTD_CONNTRACK),--enable-conntrack,--disable-conntrack) \
 	$(if $(BR2_PACKAGE_COLLECTD_CONTEXTSWITCH),--enable-contextswitch,--disable-contextswitch) \
 	$(if $(BR2_PACKAGE_COLLECTD_CPU),--enable-cpu,--disable-cpu) \
@@ -73,6 +75,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_RRDTOOL),--enable-rrdtool,--disable-rrdtool) \
 	$(if $(BR2_PACKAGE_COLLECTD_SCALE),--enable-target_scale,--disable-target_scale) \
 	$(if $(BR2_PACKAGE_COLLECTD_SERIAL),--enable-serial,--disable-serial) \
+	$(if $(BR2_PACKAGE_COLLECTD_STATSD),--enable-statsd,--disable-statsd) \
 	$(if $(BR2_PACKAGE_COLLECTD_SET),--enable-target_set,--disable-target_set) \
 	$(if $(BR2_PACKAGE_COLLECTD_SNMP),--enable-snmp,--disable-snmp) \
 	$(if $(BR2_PACKAGE_COLLECTD_SWAP),--enable-swap,--disable-swap) \
-- 
1.8.1.5
