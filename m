From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Apr 2020 18:37:56 +0200
Subject: [Buildroot] [PATCH 2/6] package/collectd: remove lvm
In-Reply-To: <20200414163800.2230496-1-fontaine.fabrice@gmail.com>
References: <20200414163800.2230496-1-fontaine.fabrice@gmail.com>
Message-ID: <20200414163800.2230496-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lvm has been removed since version 5.11.0 and
https://github.com/collectd/collectd/commit/0e73c26f5670b2f11eecfdadaf545bcc7f260658

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy             |  6 ++++++
 package/collectd/Config.in   | 13 -------------
 package/collectd/collectd.mk |  2 --
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 95f17b1b31..78b3b81e54 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_COLLECTD_LVM
+	bool "lvm support in collectd was removed"
+	select BR2_LEGACY
+	help
+	  collectd removed LVM plugin, liblvm2app has been deprecated
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174
 	bool "duplicate QCA6174 firmware symbol removed"
 	select BR2_LEGACY
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 4b34ec60eb..1b6b3384c4 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -296,19 +296,6 @@ config BR2_PACKAGE_COLLECTD_LOAD
 	help
 	  Collects the system load.
 
-config BR2_PACKAGE_COLLECTD_LVM
-	bool "lvm"
-	depends on !BR2_TOOLCHAIN_USES_MUSL # lvm2 app library
-	select BR2_PACKAGE_LVM2
-	select BR2_PACKAGE_LVM2_APP_LIBRARY
-	help
-	  Collects the size of logical volumes (LV) and free space
-	  inside a volume group (VG) from Linux' Logical Volume Manager
-	  (LVM).
-
-comment "lvm needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 config BR2_PACKAGE_COLLECTD_MD
 	bool "md"
 	help
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index dda15b0162..24cdad7e1b 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -88,7 +88,6 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),--enable-log_logstash,--disable-log_logstash) \
 	$(if $(BR2_PACKAGE_COLLECTD_LUA),--enable-lua,--disable-lua) \
-	$(if $(BR2_PACKAGE_COLLECTD_LVM),--enable-lvm,--disable-lvm) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHED),--enable-memcached,--disable-memcached) \
@@ -162,7 +161,6 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
 	$(if $(BR2_PACKAGE_COLLECTD_LUA),lua) \
-	$(if $(BR2_PACKAGE_COLLECTD_LVM),lvm2) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MQTT),mosquitto) \
-- 
2.25.1
