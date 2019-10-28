From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 13:59:21 +0100
Subject: [Buildroot] [git commit] package/collectd: add lvm support
Message-ID: <20191028125708.75C0B8B635@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cad40006ef3cfc08c6771dd536e05848ff6436cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in   | 13 +++++++++++++
 package/collectd/collectd.mk |  4 +++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 4fa4074a51..402de219f4 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -289,6 +289,19 @@ config BR2_PACKAGE_COLLECTD_LOAD
 	help
 	  Collects the system load.
 
+config BR2_PACKAGE_COLLECTD_LVM
+	bool "lvm"
+	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2 app library
+	select BR2_PACKAGE_LVM2
+	select BR2_PACKAGE_LVM2_APP_LIBRARY
+	help
+	  Collects the size of logical volumes (LV) and free space
+	  inside a volume group (VG) from Linux' Logical Volume Manager
+	  (LVM).
+
+comment "lvm needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_COLLECTD_MD
 	bool "md"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 31f7340d98..50425e89ac 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -18,7 +18,7 @@ COLLECTD_AUTORECONF = YES
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
 	apple_sensors aquaero ascent barometer dbi dpdkstat email \
-	gmond hddtemp intel_rdt ipmi java lpar lua lvm \
+	gmond hddtemp intel_rdt ipmi java lpar lua \
 	madwifi mbmon mic multimeter netapp notify_desktop numa \
 	nut oracle perl pf pinba powerdns python routeros \
 	rrdcached sigrok tape target_v5upgrade teamspeak2 ted \
@@ -89,6 +89,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),--enable-log_logstash,--disable-log_logstash) \
+	$(if $(BR2_PACKAGE_COLLECTD_LVM),--enable-lvm,--disable-lvm) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
@@ -161,6 +162,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
+	$(if $(BR2_PACKAGE_COLLECTD_LVM),lvm2) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MQTT),mosquitto) \
