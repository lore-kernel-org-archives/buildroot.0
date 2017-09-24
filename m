From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:29 +0200
Subject: [Buildroot] [PATCH 6/9] lbase64: restore generic-package
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with a small patch, this allows to support all Lua versions.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../lbase64/0001-retro-compatible-with-Lua-5.1.patch | 20 ++++++++++++++++++++
 package/lbase64/Config.in                            |  7 +------
 package/lbase64/lbase64.hash                         |  2 +-
 package/lbase64/lbase64.mk                           | 19 +++++++++++++++----
 4 files changed, 37 insertions(+), 11 deletions(-)
 create mode 100644 package/lbase64/0001-retro-compatible-with-Lua-5.1.patch

diff --git a/package/lbase64/0001-retro-compatible-with-Lua-5.1.patch b/package/lbase64/0001-retro-compatible-with-Lua-5.1.patch
new file mode 100644
index 000000000..12acf4483
--- /dev/null
+++ b/package/lbase64/0001-retro-compatible-with-Lua-5.1.patch
@@ -0,0 +1,20 @@
+retro compatible with Lua 5.1 C/API
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/lbase64.c
+===================================================================
+--- a/lbase64.c
++++ b/lbase64.c
+@@ -111,7 +111,11 @@
+ 
+ LUALIB_API int luaopen_base64(lua_State *L)
+ {
++#if LUA_VERSION_NUM >= 502
+  luaL_newlib(L,R);
++#else
++ luaL_register(L,MYNAME,R);
++#endif
+  lua_pushliteral(L,"version");			/** version */
+  lua_pushliteral(L,MYVERSION);
+  lua_settable(L,-3);
diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
index 5ef91bf30..34ef943aa 100644
--- a/package/lbase64/Config.in
+++ b/package/lbase64/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LBASE64
 	bool "lbase64"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
 	  A base64 library for Lua
 
-	  http://luaforge.net/projects/lbase64/
-
-comment "lbase64 needs a Lua 5.1 interpreter"
-	depends on !BR2_PACKAGE_LUA_5_1
-	depends on !BR2_PACKAGE_LUAJIT
+	  http://webserver2.tecgraf.puc-rio.br/~lhf/ftp/lua/#lbase64
diff --git a/package/lbase64/lbase64.hash b/package/lbase64/lbase64.hash
index 080609037..d835d40b2 100644
--- a/package/lbase64/lbase64.hash
+++ b/package/lbase64/lbase64.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7326658d48a70382b496eb88220b0c398c19ed712e39863939330fec0533362a  lbase64-20120820-1.src.rock
+sha256 b83dbc87330a322e5222cd891a6e258b533f5b6c46e8f3c18fc0265e4c991aaa  lbase64.tar.gz
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
index 80e880079..fd78a6ccd 100644
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -4,9 +4,20 @@
 #
 ################################################################################
 
-LBASE64_VERSION = 20120820-1
-LBASE64_SUBDIR = base64
+LBASE64_VERSION = 20120820
+LBASE64_SITE = http://webserver2.tecgraf.puc-rio.br/~lhf/ftp/lua/5.3
+LBASE64_SOURCE = lbase64.tar.gz
 LBASE64_LICENSE = Public domain
-LBASE64_LICENSE_FILES = $(LBASE64_SUBDIR)/README
+LBASE64_LICENSE_FILES = README
+LBASE64_DEPENDENCIES = luainterpreter
 
-$(eval $(luarocks-package))
+define LBASE64_BUILD_CMDS
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) so
+endef
+
+define LBASE64_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/base64.so \
+		$(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/base64.so
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
