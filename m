From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:44:50 +0200
Subject: [Buildroot] [git commit] luarocks: allow to work with
	host-luainterpreter
Message-ID: <20140727122851.0B62F9D05C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=513b1b9b7525a4444637210148fd58350a223cc2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

when we embed luajit on target,
we use luarocks with host-luajit instead of host-lua,
in order to use the same interpreter on the both side.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luainterpreter/luainterpreter.mk |    2 ++
 package/luarocks/luarocks.mk             |   18 ++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index 4ef0a45..a6c98ab 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -8,3 +8,5 @@ LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
 $(eval $(virtual-package))
 $(eval $(host-virtual-package))
+
+LUA_RUN = $(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 5f7f395..80b9e9f 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -9,16 +9,22 @@ LUAROCKS_SITE = http://luarocks.org/releases/
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
-HOST_LUAROCKS_DEPENDENCIES = host-lua
+HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter
 
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
@@ -44,4 +50,4 @@ endef
 $(eval $(host-generic-package))
 
 LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	$(HOST_DIR)/usr/bin/lua $(HOST_DIR)/usr/bin/luarocks
+	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
