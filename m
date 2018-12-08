From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  8 Dec 2018 09:00:52 +0100
Subject: [Buildroot] [PATCH] luajit: add option compat Lua 5.2
Message-ID: <20181208080052.17618-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/Config.in | 5 +++++
 package/luajit/luajit.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 7e792c53c..33e38e7d4 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -36,6 +36,11 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"
 
+config BR2_PACKAGE_LUAJIT_COMPAT52
+	bool "compat Lua 5.2"
+	help
+	  Compile with LUAJIT_ENABLE_LUA52COMPAT defined.
+
 endif
 
 comment "luajit needs a toolchain w/ dynamic library"
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 939fa660d..1406fbf4c 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -14,6 +14,10 @@ LUAJIT_INSTALL_STAGING = YES
 
 LUAJIT_PROVIDES = luainterpreter
 
+ifeq ($(BR2_PACKAGE_LUAJIT_COMPAT52),y)
+LUAJIT_XCFLAGS+=-DLUAJIT_ENABLE_LUA52COMPAT
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LUAJIT_BUILDMODE = static
 else
@@ -48,6 +52,7 @@ define LUAJIT_BUILD_CMDS
 		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		HOST_LDFLAGS="$(HOST_LDFLAGS)" \
 		BUILDMODE=$(LUAJIT_BUILDMODE) \
+		XCFLAGS=$(LUAJIT_XCFLAGS) \
 		-C $(@D) amalg
 endef
 
@@ -68,6 +73,7 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 define HOST_LUAJIT_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)" BUILDMODE=dynamic \
 		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
+		XCFLAGS=$(LUAJIT_XCFLAGS) \
 		-C $(@D) amalg
 endef
 
-- 
2.17.1
