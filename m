From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:39 -0600
Subject: [Buildroot] [PATCH v3 3/9] package/collectd: depend on
 luainterpreter for lua support
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-3-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since collectd lua support is compatible with any luainterpreter
implementation we should depend on BR2_PACKAGE_HAS_LUAINTERPRETER
instead of unconditionally selecting BR2_PACKAGE_LUA.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/collectd/Config.in   | 5 ++++-
 package/collectd/collectd.mk | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 188be3c0fb..fc3ee804a2 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -65,11 +65,14 @@ config BR2_PACKAGE_COLLECTD_LOGSTASH
 
 config BR2_PACKAGE_COLLECTD_LUA
 	bool "lua"
-	select BR2_PACKAGE_LUA
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Embeds a Lua interpreter into collectd and provides an
 	  interface to collectd's plugin system.
 
+comment "lua needs a Lua interpreter"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
+
 config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
 	depends on !BR2_STATIC_LIBS # libesmtp
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 24cdad7e1b..37c13c12e7 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -160,7 +160,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
-	$(if $(BR2_PACKAGE_COLLECTD_LUA),lua) \
+	$(if $(BR2_PACKAGE_COLLECTD_LUA),$(if $(BR2_PACKAGE_LUA),lua,luajit)) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MQTT),mosquitto) \
-- 
2.25.1
