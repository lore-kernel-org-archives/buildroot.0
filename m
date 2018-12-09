From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:06:35 +0100
Subject: [Buildroot] [git commit] package/luajit: add option to enable Lua
 5.2 compatibility
Message-ID: <20181209160252.DB3308434B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c2bc94547db8737929794b39d61f8d0a3fd709e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: formatting tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/Config.in | 5 +++++
 package/luajit/luajit.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 7e792c53c4..88c5bcbf28 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -36,6 +36,11 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"
 
+config BR2_PACKAGE_LUAJIT_COMPAT52
+	bool "Lua 5.2 compatibility"
+	help
+	  Compile with Lua 5.2 compatibility.
+
 endif
 
 comment "luajit needs a toolchain w/ dynamic library"
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 939fa660d8..5b08a42d98 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -14,6 +14,10 @@ LUAJIT_INSTALL_STAGING = YES
 
 LUAJIT_PROVIDES = luainterpreter
 
+ifeq ($(BR2_PACKAGE_LUAJIT_COMPAT52),y)
+LUAJIT_XCFLAGS += -DLUAJIT_ENABLE_LUA52COMPAT
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
 
