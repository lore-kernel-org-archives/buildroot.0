From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Aug 2020 10:56:43 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/collectd: add nut support
In-Reply-To: <20200822085643.922674-1-bernd.kuhls@t-online.de>
References: <20200822085643.922674-1-bernd.kuhls@t-online.de>
Message-ID: <20200822085643.922674-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The NUT plugin has status "supported":
https://collectd.org/wiki/index.php/Plugin:NUT

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/collectd/Config.in   | 11 +++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index cd5d876e80..a21f230294 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -364,6 +364,17 @@ config BR2_PACKAGE_COLLECTD_NTPD
 	help
 	  Queries an NTP server and extracts parameters.
 
+config BR2_PACKAGE_COLLECTD_NUT
+	bool "nut"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_NUT
+	help
+	  The NUT plugin collects uninterruptible power supply (UPS)
+	  statistics using the Network UPS Tools (NUT).
+
+comment "nut needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_COLLECTD_OLSRD
 	bool "olsrd"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6d084dbe42..e74dafaa2e 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -18,7 +18,7 @@ COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
 	gmond hddtemp intel_rdt ipmi java lpar \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
-	nut oracle perl pf pinba powerdns python routeros \
+	oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
 	tokyotyrant turbostat uuid varnish virt vserver write_kafka \
 	write_mongodb xencpu xmms zfs_arc zone
@@ -103,6 +103,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),--enable-notify_email,--disable-notify_email) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_NAGIOS),--enable-notify_nagios,--disable-notify_nagios) \
 	$(if $(BR2_PACKAGE_COLLECTD_NTPD),--enable-ntpd,--disable-ntpd) \
+	$(if $(BR2_PACKAGE_COLLECTD_NUT),--enable-nut,--disable-nut) \
 	$(if $(BR2_PACKAGE_COLLECTD_OLSRD),--enable-olsrd,--disable-olsrd) \
 	$(if $(BR2_PACKAGE_COLLECTD_ONEWIRE),--enable-onewire,--disable-onewire) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),--enable-openldap,--disable-openldap) \
@@ -168,6 +169,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_NETLINK),libmnl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NGINX),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL),libesmtp) \
+	$(if $(BR2_PACKAGE_COLLECTD_NUT),nut) \
 	$(if $(BR2_PACKAGE_COLLECTD_ONEWIRE),owfs) \
 	$(if $(BR2_PACKAGE_COLLECTD_OPENLDAP),openldap) \
 	$(if $(BR2_PACKAGE_COLLECTD_PING),liboping) \
-- 
2.27.0
