From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:16:18 +0100
Subject: [Buildroot] [git commit] lua*: restore version in module paths
Message-ID: <20140113222141.D29769B94E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccd68a513fc155578b724d629d61f1a9686547ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(like in upstream)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cgilua/cgilua.mk                         |    2 +-
 package/copas/copas.mk                           |    2 +-
 package/coxpcall/coxpcall.mk                     |    2 +-
 package/lbase64/lbase64.mk                       |    2 +-
 package/lua-ev/lua-ev.mk                         |    2 +-
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 package/lua/lua-01-root-path.patch               |   21 ++++-----------------
 package/luabitop/luabitop.mk                     |    5 ++---
 package/luacjson/luacjson.mk                     |    2 +-
 package/luaexpat/luaexpat.mk                     |    6 +++---
 package/luaexpatutils/luaexpatutils.mk           |    2 +-
 package/luafilesystem/luafilesystem.mk           |    2 +-
 package/luajit/luajit-01-root-path.patch         |   22 ----------------------
 package/luaposix/luaposix.mk                     |    2 +-
 package/luasec/luasec.mk                         |    6 ++----
 package/luasocket/luasocket.mk                   |    4 ++--
 package/luasql/luasql.mk                         |    5 ++---
 package/orbit/orbit.mk                           |    2 +-
 package/rings/rings.mk                           |    3 +--
 package/wsapi/wsapi.mk                           |    4 ++--
 package/xavante/xavante.mk                       |    4 +---
 21 files changed, 30 insertions(+), 72 deletions(-)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index bf6ce4e..3dd2d77 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -9,7 +9,7 @@ CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
 CGILUA_LICENSE = MIT
 
 define CGILUA_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install LUA_DIR="$(TARGET_DIR)/usr/share/lua"
+	$(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 61eac58..b8cd425 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -10,7 +10,7 @@ COPAS_LICENSE = MIT
 
 define COPAS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
-		$(TARGET_DIR)/usr/share/lua/copas.lua
+		$(TARGET_DIR)/usr/share/lua/5.1/copas.lua
 endef
 
 $(eval $(generic-package))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 0df7be6..de95461 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -10,7 +10,7 @@ COXPCALL_LICENSE = MIT
 
 define COXPCALL_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/coxpcall.lua \
-		$(TARGET_DIR)/usr/share/lua/coxpcall.lua
+		$(TARGET_DIR)/usr/share/lua/5.1/coxpcall.lua
 endef
 
 $(eval $(generic-package))
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
index 605dcf7..cb8ef17 100644
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -18,7 +18,7 @@ endef
 
 define LBASE64_INSTALL_TARGET_CMDS
        $(INSTALL) -D -m 0755 $(@D)/base64.so \
-		$(TARGET_DIR)/usr/lib/lua/base64.so
+		$(TARGET_DIR)/usr/lib/lua/5.1/base64.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 298bcf2..1236d77 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -9,6 +9,6 @@ LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
-LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua"
+LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua/5.1"
 
 $(eval $(cmake-package))
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 2c1dede..d4547ae 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -15,7 +15,7 @@ define LUA_MSGPACK_NATIVE_BUILD_CMDS
 endef
 
 define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/msgpack.so
+	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/5.1/msgpack.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/lua/lua-01-root-path.patch b/package/lua/lua-01-root-path.patch
index f82c9c5..fd0da6e 100644
--- a/package/lua/lua-01-root-path.patch
+++ b/package/lua/lua-01-root-path.patch
@@ -1,5 +1,4 @@
 Adjust installation location to /usr.
-Remove version in module paths.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
@@ -7,7 +6,7 @@ Index: b/etc/lua.pc
 ===================================================================
 --- a/etc/lua.pc
 +++ b/etc/lua.pc
-@@ -8,13 +8,13 @@
+@@ -8,7 +8,7 @@
  R= 5.1.5
  
  # grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
@@ -16,28 +15,16 @@ Index: b/etc/lua.pc
  INSTALL_BIN= ${prefix}/bin
  INSTALL_INC= ${prefix}/include
  INSTALL_LIB= ${prefix}/lib
- INSTALL_MAN= ${prefix}/man/man1
--INSTALL_LMOD= ${prefix}/share/lua/${V}
--INSTALL_CMOD= ${prefix}/lib/lua/${V}
-+INSTALL_LMOD= ${prefix}/share/lua
-+INSTALL_CMOD= ${prefix}/lib/lua
- 
- # canonical vars
- exec_prefix=${prefix}
 Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -94,9 +94,9 @@
+@@ -94,7 +94,7 @@
  	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"
  
  #else
 -#define LUA_ROOT	"/usr/local/"
--#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
--#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
 +#define LUA_ROOT	"/usr/"
-+#define LUA_LDIR	LUA_ROOT "share/lua/"
-+#define LUA_CDIR	LUA_ROOT "lib/lua/"
+ #define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
+ #define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
  #define LUA_PATH_DEFAULT  \
- 		"./?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?/init.lua;" \
- 		            LUA_CDIR"?.lua;"  LUA_CDIR"?/init.lua"
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index 7addbe6..083be35 100644
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -12,12 +12,11 @@ LUABITOP_LICENSE_FILES = README
 LUABITOP_DEPENDENCIES = lua
 
 define LUABITOP_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) INCLUDES="-I$(STAGING_DIR)/usr/include"
 endef
 
 define LUABITOP_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/lua
-	$(INSTALL) -p $(@D)/bit.so $(TARGET_DIR)/usr/lib/lua
+	$(INSTALL) -p $(@D)/bit.so $(TARGET_DIR)/usr/lib/lua/5.1
 endef
 
 $(eval $(generic-package))
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index fcb8a9a..86be875 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -21,7 +21,7 @@ define LUACJSON_BUILD_CMDS
 endef
 
 define LUACJSON_INSTALL_TARGET_CMDS
-	install -D -m 0644 $(@D)/cjson.so $(TARGET_DIR)/usr/lib/lua/cjson.so
+	$(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 65d4355..734478a 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -11,7 +11,7 @@ LUAEXPAT_LICENSE      = MIT
 
 
 LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
-LUAEXPAT_MFLAGS += LUA_INC=$(STAGING_DIR)/usr/include/lua
+LUAEXPAT_MFLAGS += LUA_INC=$(STAGING_DIR)/usr/include
 LUAEXPAT_MFLAGS += EXPAT_INC=$(STAGING_DIR)/usr/include
 LUAEXPAT_MFLAGS += LIBNAME=lxp.so
 LUAEXPAT_MFLAGS += LIB_OPTION="-shared -fPIC $(TARGET_CFLAGS)"
@@ -23,8 +23,8 @@ define LUAEXPAT_BUILD_CMDS
 endef
 
 define LUAEXPAT_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/lxp.so $(TARGET_DIR)/usr/lib/lua/lxp.so
-	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/lxp/lom.lua
+	$(INSTALL) -D $(@D)/src/lxp.so $(TARGET_DIR)/usr/lib/lua/5.1/lxp.so
+	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/5.1/lxp/lom.lua
 endef
 
 $(eval $(generic-package))
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
index bdbbdd2..93cf621 100644
--- a/package/luaexpatutils/luaexpatutils.mk
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -11,7 +11,7 @@ LUAEXPATUTILS_DEPENDENCIES = luaexpat
 
 define LUAEXPATUTILS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/lua/doc.lua \
-		$(TARGET_DIR)/usr/share/lua/lxp/doc.lua
+		$(TARGET_DIR)/usr/share/lua/5.1/lxp/doc.lua
 endef
 
 $(eval $(generic-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index c928c6e..908d02e 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -18,7 +18,7 @@ define LUAFILESYSTEM_BUILD_CMDS
 endef
 
 define LUAFILESYSTEM_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/lfs.so
+	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/5.1/lfs.so
 endef
 
 $(eval $(generic-package))
diff --git a/package/luajit/luajit-01-root-path.patch b/package/luajit/luajit-01-root-path.patch
deleted file mode 100644
index cc2f04f..0000000
--- a/package/luajit/luajit-01-root-path.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Adjust installation location to /usr
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/luaconf.h
-===================================================================
---- a/src/luaconf.h
-+++ b/src/luaconf.h
-@@ -26,9 +26,9 @@
- ** Note to distribution maintainers: do NOT patch the following line!
- ** Please read ../doc/install.html#distro and pass PREFIX=/usr instead.
- */
--#define LUA_ROOT	"/usr/local/"
--#define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
--#define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
-+#define LUA_ROOT	"/usr/"
-+#define LUA_LDIR	LUA_ROOT "share/lua/"
-+#define LUA_CDIR	LUA_ROOT "lib/lua/"
- #ifdef LUA_XROOT
- #define LUA_JDIR	LUA_XROOT "share/luajit-2.0.0/"
- #define LUA_XPATH \
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index b398c8c..b018995 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -10,7 +10,7 @@ LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
-LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
+LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua/5.1" --datarootdir="/usr/share/lua/5.1"
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
     LUAPOSIX_DEPENDENCIES += ncurses
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index d89f61d..a2a2cc2 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -17,11 +17,9 @@ define LUASEC_BUILD_CMDS
 endef
 
 define LUASEC_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/lua
-	mkdir -p $(TARGET_DIR)/usr/lib/lua
 	$(MAKE) -C $(@D) \
-		LUAPATH="$(TARGET_DIR)/usr/share/lua" \
-		LUACPATH="$(TARGET_DIR)/usr/lib/lua" install
+		LUAPATH="$(TARGET_DIR)/usr/share/lua/5.1" \
+		LUACPATH="$(TARGET_DIR)/usr/lib/lua/5.1" install
 endef
 
 $(eval $(generic-package))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 6a2d4c8..a55fe17 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -18,8 +18,8 @@ endef
 
 define LUASOCKET_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) -f makefile \
-		INSTALL_TOP_SHARE="$(TARGET_DIR)/usr/share/lua" \
-		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
+		INSTALL_TOP_SHARE="$(TARGET_DIR)/usr/share/lua/5.1" \
+		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua/5.1" install
 endef
 
 $(eval $(generic-package))
diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
index 62d0cf8..a1447cc 100644
--- a/package/luasql/luasql.mk
+++ b/package/luasql/luasql.mk
@@ -27,9 +27,8 @@ define LUASQL_BUILD_CMDS
 endef
 
 define LUASQL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LUASQL_MAKE_FLAGS) PREFIX=/usr \
-		LUA_DIR="$(TARGET_DIR)/usr/share/lua" \
-		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
+	$(MAKE) -C $(@D) $(LUASQL_MAKE_FLAGS) \
+		PREFIX="$(TARGET_DIR)/usr" install
 endef
 
 $(eval $(generic-package))
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index ba1142f..7115896 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -11,7 +11,7 @@ ORBIT_LICENSE_FILES = doc/us/license.md
 
 define ORBIT_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) \
-		LUA_DIR=$(TARGET_DIR)/usr/share/lua/ \
+		LUA_DIR=$(TARGET_DIR)/usr/share/lua/5.1/ \
 		BIN_DIR=$(TARGET_DIR)/usr/bin \
 		install
 endef
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 47d25b6..fe1c2b2 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -14,8 +14,7 @@ define RINGS_BUILD_CMDS
 endef
 
 define RINGS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" \
-		LUA_DIR="$(TARGET_DIR)/usr/share/lua" install
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)/usr" install
 endef
 
 $(eval $(generic-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index ba917a6..46baebf 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -9,9 +9,9 @@ WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
 WSAPI_LICENSE = MIT
 
 define WSAPI_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/lua/wsapi
+	mkdir -p $(TARGET_DIR)/usr/share/lua/5.1/wsapi
 	$(INSTALL) -m 0644 -D $(@D)/src/wsapi/*.lua \
-		$(TARGET_DIR)/usr/share/lua/wsapi
+		$(TARGET_DIR)/usr/share/lua/5.1/wsapi
 endef
 
 $(eval $(generic-package))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 9381c02..7c01ee6 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -9,9 +9,7 @@ XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
 XAVANTE_LICENSE = MIT
 
 define XAVANTE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr \
-		LUA_DIR="$(TARGET_DIR)/usr/share/lua" \
-		LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" install
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)/usr" install
 endef
 
 $(eval $(generic-package))
