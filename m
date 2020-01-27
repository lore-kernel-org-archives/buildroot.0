From: Tom Marcuzzi <tom.marcuzzi@orolia.com>
Date: Mon, 27 Jan 2020 17:28:15 +0000
Subject: [Buildroot] [PATCH] package/collectd: add config option for lua
Message-ID: <20200127172740.11610-1-tom.marcuzzi@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tom Marcuzzi <tom.marcuzzi@orolia.com>
---
 package/collectd/Config.in   | 7 +++++++
 package/collectd/collectd.mk | 9 ++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 402de219f4..303b5dc01b 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -63,6 +63,13 @@ config BR2_PACKAGE_COLLECTD_LOGSTASH
 	help
 	  Writes log messages formatted as logstash JSON events.
 
+config BR2_PACKAGE_COLLECTD_LUA
+	bool "lua"
+	select BR2_PACKAGE_LUA
+	help
+	  Embeds a Lua interpreter into collectd and provides an
+	  interface to collectd's plugin system.
+
 config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
 	depends on !BR2_STATIC_LIBS # libesmtp
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 0cd86adbd4..9258977613 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -89,6 +89,7 @@ COLLECTD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_COLLECTD_LOAD),--enable-load,--disable-load) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGFILE),--enable-logfile,--disable-logfile) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),--enable-log_logstash,--disable-log_logstash) \
+	$(if $(BR2_PACKAGE_COLLECTD_LUA),--enable-lua,--disable-lua) \
 	$(if $(BR2_PACKAGE_COLLECTD_LVM),--enable-lvm,--disable-lvm) \
 	$(if $(BR2_PACKAGE_COLLECTD_MD),--enable-md,--disable-md) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),--enable-memcachec,--disable-memcachec) \
@@ -162,6 +163,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
+	$(if $(BR2_PACKAGE_COLLECTD_LUA),lua) \
 	$(if $(BR2_PACKAGE_COLLECTD_LVM),lvm2) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
@@ -213,13 +215,6 @@ else
 COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
 
-ifeq ($(BR2_PACKAGE_LUA),y)
-COLLECTD_DEPENDENCIES += lua
-COLLECTD_CONF_OPTS += --enable-lua
-else
-COLLECTD_CONF_OPTS += --disable-lua
-endif
-
 define COLLECTD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 	rm -f $(TARGET_DIR)/usr/bin/collectd-nagios
-- 
2.17.1
