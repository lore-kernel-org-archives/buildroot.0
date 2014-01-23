From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jan 2014 09:28:33 +0100
Subject: [Buildroot] [PATCH 4/4] luarocks: allow to work with host-luajit
In-Reply-To: <1390465713-12600-1-git-send-email-francois.perrad@gadz.org>
References: <1390465713-12600-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1390465713-12600-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luainterpreter/luainterpreter.mk |    4 ++++
 package/luarocks/luarocks.mk             |    4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

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
index 88ab22a..1e56bc9 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -9,7 +9,7 @@ LUAROCKS_SITE = http://luarocks.org/releases/
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
-HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
+HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter luainterpreter
 
 LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
@@ -42,4 +42,4 @@ endef
 $(eval $(host-generic-package))
 
 LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
-	$(HOST_DIR)/usr/bin/lua $(HOST_DIR)/usr/bin/luarocks
+	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
-- 
1.7.9.5
