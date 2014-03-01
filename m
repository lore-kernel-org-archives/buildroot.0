From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 18:23:07 +0100
Subject: [Buildroot] [lua V3 6/8] luarocks: allow to work with
	host-luainterpreter
In-Reply-To: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393694590-29945-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when we embed luajit on target, we use luarocks with host-luajit (instead of host-lua)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luainterpreter/luainterpreter.mk |    2 ++
 package/luarocks/luarocks.mk             |   18 ++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 976fec8..d5b95db 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -12,3 +12,5 @@ LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
+
+LUA_RUN = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 86e57d2..0b99de6 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -9,16 +9,22 @@ LUAROCKS_SITE = http://luarocks.org/releases/
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
-HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
+HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter luainterpreter
 
 LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 
+HOST_LUAROCKS_CONF_OPT = \
+	--prefix=$(HOST_DIR)/usr \
+	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
+	--with-lua=$(HOST_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+HOST_LUAROCKS_CONF_OPT += --lua-suffix=jit
+endif
+
 define HOST_LUAROCKS_CONFIGURE_CMDS
-	cd $(@D) && ./configure \
-		--prefix=$(HOST_DIR)/usr \
-		--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
-		--with-lua=$(HOST_DIR)/usr
+	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPT)
 endef
 
 define HOST_LUAROCKS_INSTALL_CMDS
@@ -43,4 +49,4 @@ endef
 $(eval $(host-generic-package))
 
 LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	$(HOST_DIR)/usr/bin/lua $(HOST_DIR)/usr/bin/luarocks
+	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
-- 
1.7.9.5
