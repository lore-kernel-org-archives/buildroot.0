From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 17:45:29 +0200
Subject: [Buildroot] [PATCH 2/3] package/collectd: add onewire support
In-Reply-To: <20190610154530.26937-1-fontaine.fabrice@gmail.com>
References: <20190610154530.26937-1-fontaine.fabrice@gmail.com>
Message-ID: <20190610154530.26937-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in   | 7 +++++++
 package/collectd/collectd.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 4ca2204a56..32a7441324 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -359,6 +359,13 @@ config BR2_PACKAGE_COLLECTD_OLSRD
 	help
 	  Reads information about meshed networks from olsrd.
 
+config BR2_PACKAGE_COLLECTD_ONEWIRE
+	bool "onewire"
+	select BR2_PACKAGE_OWFS
+	help
+	  Collects temperature information from sensors connected over
+	  the OneWire bus.
+
 config BR2_PACKAGE_COLLECTD_OPENLDAP
 	bool "openldap"
 	depends on BR2_USE_WCHAR
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6563668ce0..3ff314bb82 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -17,7 +17,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
 	gmond hddtemp intel_rdt ipmi java libvirt lpar lua lvm \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
-	nut onewire oracle perl pf pinba powerdns python routeros \
+	nut oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
@@ -102,6 +102,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_NAGIOS),--enable-notify_nagios,--disable-notify_nagios) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
+	$(if $(BR2_PACKAGE_COLLECTD_ONEWIRE),--enable-onewire,--disable-onewire) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),--enable-openldap,--disable-openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENVPN),--enable-openvpn,--disable-openvpn) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),--enable-ping,--disable-ping) \
@@ -164,6 +165,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
+	$(if $(BR2_PACKAGE_COLLECTD_ONEWIRE),owfs) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
 	$(if $(BR2_PACKAGE_COLLECTD_POSTGRESQL),postgresql) \
-- 
2.20.1
