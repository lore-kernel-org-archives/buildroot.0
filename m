From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:30:59 +0200
Subject: [Buildroot] [git commit] package/collectd: depend on luainterpreter
 for lua support
Message-ID: <20200727203323.3E79F7FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=911a9bf5739d94545cc482c765f876a9ff73e304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since collectd lua support is compatible with any luainterpreter
implementation we should depend on BR2_PACKAGE_HAS_LUAINTERPRETER
instead of unconditionally selecting BR2_PACKAGE_LUA.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr: use luainterpreter as dependency]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectd/Config.in   | 5 ++++-
 package/collectd/collectd.mk | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 188be3c0fb..276ad17329 100644
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
 
+comment "lua support needs a Lua interpreter"
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER
+
 config BR2_PACKAGE_COLLECTD_NOTIFY_EMAIL
 	bool "notify_email"
 	depends on !BR2_STATIC_LIBS # libesmtp
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 24cdad7e1b..6d084dbe42 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -160,7 +160,7 @@ COLLECTD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_COLLECTD_GRPC),grpc) \
 	$(if $(BR2_PACKAGE_COLLECTD_IPTABLES),iptables) \
 	$(if $(BR2_PACKAGE_COLLECTD_LOGSTASH),yajl) \
-	$(if $(BR2_PACKAGE_COLLECTD_LUA),lua) \
+	$(if $(BR2_PACKAGE_COLLECTD_LUA),luainterpreter) \
 	$(if $(BR2_PACKAGE_COLLECTD_MEMCACHEC),libmemcached) \
 	$(if $(BR2_PACKAGE_COLLECTD_MODBUS),libmodbus) \
 	$(if $(BR2_PACKAGE_COLLECTD_MQTT),mosquitto) \
