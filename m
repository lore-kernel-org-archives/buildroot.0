From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:43 +0100
Subject: [Buildroot] [PATCH 07/24] luarocks: allow to work with host-luajit
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-8-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

when we use luajit on target

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luainterpreter/luainterpreter.mk |    4 ++++
 package/luarocks/luarocks.mk             |   18 ++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index c37d621..d5b95db 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -5,8 +5,12 @@
 #############################################################
 
 LUAINTERPRETER_SOURCE =
+HOST_LUAINTERPRETER_SOURCE =
 LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
 
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
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
