From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 15 Nov 2013 14:07:38 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 09/10] lua*: refactor with
	luarocks infrastructure
In-Reply-To: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384520859-3189-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/cgilua.mk                           |   14 ++------
 package/copas/copas.mk                             |   14 ++------
 package/lbase64/lbase64.mk                         |   28 +++------------
 package/lua-cjson/lua-cjson.mk                     |   32 +++--------------
 package/luabitop/luabitop.mk                       |   23 +++----------
 package/luaexpat/luaexpat.mk                       |   36 +++-----------------
 .../luafilesystem-without_large_file.patch         |    8 ++---
 package/luafilesystem/luafilesystem.mk             |   26 ++------------
 package/luasec/luasec.mk                           |   29 ++++------------
 package/luasql-sqlite3/luasql-sqlite3.mk           |   30 +++-------------
 package/orbit/orbit-01-fix-installation.patch      |   26 --------------
 package/orbit/orbit.mk                             |   16 +++------
 package/rings/rings.mk                             |   23 ++-----------
 package/wsapi/wsapi.mk                             |   15 ++------
 package/xavante/xavante.mk                         |   15 ++------
 15 files changed, 50 insertions(+), 285 deletions(-)
 delete mode 100644 package/orbit/orbit-01-fix-installation.patch

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 663cbc4..bdb1411 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -4,17 +4,7 @@
 #
 ################################################################################
 
-CGILUA_VERSION = 5.1.4
-CGILUA_SITE = http://github.com/downloads/keplerproject/cgilua
+CGILUA_VERSION = 5.1.4-1
 CGILUA_LICENSE = MIT
 
-define CGILUA_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
-endef
-
-define CGILUA_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/5.1/cgilua"
-	rm -f "$(TARGET_DIR)/usr/share/lua/5.1/cgilua.lua"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 99aacbc..3021139 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -4,17 +4,7 @@
 #
 ################################################################################
 
-COPAS_VERSION = 1.1.6
-COPAS_SITE = http://github.com/downloads/keplerproject/copas
+COPAS_VERSION = 1.1.6-1
 COPAS_LICENSE = MIT
 
-define COPAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
-		$(TARGET_DIR)/usr/share/lua/5.1/copas.lua
-endef
-
-define COPAS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/share/lua/5.1/copas.lua"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
index b055fdf..4289f58 100644
--- a/package/lbase64/lbase64.mk
+++ b/package/lbase64/lbase64.mk
@@ -4,29 +4,9 @@
 #
 ################################################################################
 
-LBASE64_VERSION = 20100323
-LBASE64_SITE = http://www.tecgraf.puc-rio.br/~lhf/ftp/lua/5.1
-LBASE64_SOURCE = lbase64.tar.gz
+LBASE64_VERSION = 20120820-1
+LBASE64_SUBDIR  = base64
 LBASE64_LICENSE = Public domain
-LBASE64_LICENSE_FILES = README
-LBASE64_DEPENDENCIES = luainterpreter
+LBASE64_LICENSE_FILES = $(LBASE64_SUBDIR)/README
 
-define LBASE64_BUILD_CMDS
-       $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC" so
-endef
-
-define LBASE64_INSTALL_TARGET_CMDS
-       $(INSTALL) -D -m 0755 $(@D)/base64.so \
-		$(TARGET_DIR)/usr/lib/lua/5.1/base64.so
-endef
-
-define LBASE64_UNINSTALL_TARGET_CMDS
-       rm -f $(TARGET_DIR)/usr/lib/lua/5.1/base64.so
-endef
-
-define LBASE64_CLEAN_CMDS
-       $(MAKE) -C $(@D) clean
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index 0969547..16cb974 100644
--- a/package/lua-cjson/lua-cjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -4,31 +4,9 @@
 #
 ################################################################################
 
-LUA_CJSON_VERSION       = 2.1.0
-LUA_CJSON_SITE          = http://www.kyne.com.au/~mark/software/download
-LUA_CJSON_DEPENDENCIES  = luainterpreter
-LUA_CJSON_LICENSE       = MIT
-LUA_CJSON_LICENSE_FILES = LICENSE
+LUA_CJSON_VERSION_UPSTREAM = 2.1.0
+LUA_CJSON_VERSION = $(LUA_CJSON_VERSION_UPSTREAM)-1
+LUA_CJSON_LICENSE = MIT
+LUA_CJSON_LICENSE_FILES = lua-cjson-$(LUA_CJSON_VERSION_UPSTREAM)/LICENSE
 
-define LUA_CJSON_BUILD_CMDS
-	$(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS)"   \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		CC="$(TARGET_CC)"           \
-		LD="$(TARGET_LD)"           \
-		PREFIX=$(STAGING_DIR)/usr
-endef
-
-define LUA_CJSON_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" -C $(@D) install
-endef
-
-define LUA_CJSON_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-define LUA_CJSON_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/5.1/cjson.so
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index 653aacd..4368c94 100644
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -4,23 +4,10 @@
 #
 ################################################################################
 
-LUABITOP_VERSION = 1.0.2
-LUABITOP_SOURCE = LuaBitOp-$(LUABITOP_VERSION).tar.gz
-LUABITOP_SITE = http://bitop.luajit.org/download
+LUABITOP_VERSION_UPSTREAM = 1.0.2
+LUABITOP_VERSION = $(LUABITOP_VERSION_UPSTREAM)-1
+LUABITOP_SUBDIR  = LuaBitOp-$(LUABITOP_VERSION_UPSTREAM)
 LUABITOP_LICENSE = MIT
-LUABITOP_LICENSE_FILES = README
-LUABITOP_DEPENDENCIES = lua
+LUABITOP_LICENSE_FILES = $(LUABITOP_SUBDIR)/README
 
-define LUABITOP_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) INCLUDES="-I$(STAGING_DIR)/usr/include"
-endef
-
-define LUABITOP_INSTALL_TARGET_CMDS
-	$(INSTALL) -p $(@D)/bit.so $(TARGET_DIR)/usr/lib/lua/5.1
-endef
-
-define LUABITOP_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 9c11620..d507c2a 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,36 +4,8 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION      = 1.2.0
-LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
-LUAEXPAT_DEPENDENCIES = luainterpreter expat
-LUAEXPAT_LICENSE      = MIT
+LUAEXPAT_VERSION = 1.2.0-1
+LUAEXPAT_DEPENDENCIES = expat
+LUAEXPAT_LICENSE = MIT
 
-
-LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
-LUAEXPAT_MFLAGS += LUA_INC=$(STAGING_DIR)/usr/include
-LUAEXPAT_MFLAGS += EXPAT_INC=$(STAGING_DIR)/usr/include
-LUAEXPAT_MFLAGS += LIBNAME=lxp.so
-LUAEXPAT_MFLAGS += LIB_OPTION="-shared -fPIC $(TARGET_CFLAGS)"
-LUAEXPAT_MFLAGS += CC="$(TARGET_CC) -fPIC $(TARGET_CFLAGS)"
-
-
-define LUAEXPAT_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS)
-endef
-
-define LUAEXPAT_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/lxp.so $(TARGET_DIR)/usr/lib/lua/5.1/lxp.so
-	$(INSTALL) -D -m 0644 $(@D)/src/lxp/lom.lua $(TARGET_DIR)/usr/share/lua/5.1/lxp/lom.lua
-endef
-
-define LUAEXPAT_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/5.1/lxp.so
-	rm -f $(TARGET_DIR)/usr/share/lua/5.1/lxp/lom.lua
-endef
-
-define LUAEXPAT_CLEAN_CMDS
-	$(MAKE) -C $(@D) $(LUAEXPAT_MFLAGS) clean
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/luafilesystem/luafilesystem-without_large_file.patch b/package/luafilesystem/luafilesystem-without_large_file.patch
index b1f41c0..5b24b99 100644
--- a/package/luafilesystem/luafilesystem-without_large_file.patch
+++ b/package/luafilesystem/luafilesystem-without_large_file.patch
@@ -1,7 +1,7 @@
-diff --git a/src/lfs.c b/src/lfs.c
-index 85f01e3..ed49f50 100644
---- a/src/lfs.c
-+++ b/src/lfs.c
+Index: b/luafilesystem-1.6.2/src/lfs.c
+===================================================================
+--- a/luafilesystem-1.6.2/src/lfs.c
++++ b/luafilesystem-1.6.2/src/lfs.c
 @@ -22,13 +22,13 @@
  
  #ifndef _WIN32
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 06a8199..7943201 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,29 +4,7 @@
 #
 ################################################################################
 
-LUAFILESYSTEM_VERSION = 1.6.2
-LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
-LUAFILESYSTEM_DEPENDENCIES = luainterpreter
+LUAFILESYSTEM_VERSION = 1.6.2-1
 LUAFILESYSTEM_LICENSE = MIT
 
-ifeq ($(BR2_LARGEFILE),y)
-LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
-endif
-
-define LUAFILESYSTEM_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) $(LFS_CFLAGS) -fPIC"
-endef
-
-define LUAFILESYSTEM_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/5.1/lfs.so
-endef
-
-define LUAFILESYSTEM_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/lib/lua/5.1/lfs.so"
-endef
-
-define LUAFILESYSTEM_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 8ae9c02..354e805 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,28 +4,11 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 0.4.1
-LUASEC_SITE = http://www.inf.puc-rio.br/~brunoos/luasec/download/
+LUASEC_VERSION_UPSTREAM = 0.4.1
+LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-2
+LUASEC_SUBDIR  = luasec-luasec-$(LUASEC_VERSION_UPSTREAM)
 LUASEC_LICENSE = MIT
-LUASEC_LICENSE_FILES = LICENSE
-LUASEC_DEPENDENCIES = luainterpreter openssl
+LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
+LUASEC_DEPENDENCIES = openssl
 
-define LUASEC_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
-		LDFLAGS="$(TARGET_LDFLAGS) -shared" linux
-endef
-
-define LUASEC_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) \
-		LUAPATH="$(TARGET_DIR)/usr/share/lua/5.1" \
-		LUACPATH="$(TARGET_DIR)/usr/lib/lua/5.1" install
-endef
-
-define LUASEC_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/lib/lua/5.1/ssl.so
-	rm -rf $(TARGET_DIR)/usr/share/lua/5.1/ssl
-	rm -f $(TARGET_DIR)/usr/share/lua/5.1/ssl.lua
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
index b114f02..0e7ae6a 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.mk
+++ b/package/luasql-sqlite3/luasql-sqlite3.mk
@@ -4,30 +4,10 @@
 #
 ################################################################################
 
-LUASQL_SQLITE3_VERSION = v2.3.0
-LUASQL_SQLITE3_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_SQLITE3_VERSION)
+LUASQL_SQLITE3_VERSION = 2.3.0-1
+LUASQL_SQLITE3_SUBDIR  = luasql
 LUASQL_SQLITE3_LICENSE = MIT
-LUASQL_SQLITE3_LICENSE_FILES = README
-LUASQL_SQLITE3_DEPENDENCIES = luainterpreter sqlite
+LUASQL_SQLITE3_LICENSE_FILES = $(LUASQL_SQLITE3_SUBDIR)/README
+LUASQL_SQLITE3_DEPENDENCIES = sqlite
 
-LUASQL_SQLITE3_MAKE_FLAGS = \
-	CC="$(TARGET_CC)" \
-	LD="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS) -fPIC" \
-	T="sqlite3" \
-	DRIVER_LIBS="-L$(STAGING_DIR)/usr/lib -lsqlite3"
-
-define LUASQL_SQLITE3_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LUASQL_SQLITE3_MAKE_FLAGS)
-endef
-
-define LUASQL_SQLITE3_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LUASQL_SQLITE3_MAKE_FLAGS) \
-		PREFIX="$(TARGET_DIR)/usr" install
-endef
-
-define LUASQL_SQLITE3_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/lib/lua/5.1/luasql
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/orbit/orbit-01-fix-installation.patch b/package/orbit/orbit-01-fix-installation.patch
deleted file mode 100644
index ae50ad9..0000000
--- a/package/orbit/orbit-01-fix-installation.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix installation commands
-
-The installation commands did not match the location of the source
-files within the Orbit source tree.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -11,12 +11,9 @@
- 	mkdir -p $(LUA_DIR)
- 	cp src/orbit.lua $(LUA_DIR)
- 	mkdir -p $(LUA_DIR)/orbit
--	cp src/model.lua $(LUA_DIR)/orbit
--	cp src/cache.lua $(LUA_DIR)/orbit
--	cp src/pages.lua $(LUA_DIR)/orbit
--	cp src/ophandler.lua $(LUA_DIR)/orbit
-+	cp src/orbit/*.lua $(LUA_DIR)/orbit
- 	mkdir -p $(BIN_DIR)
--	cp src/orbit $(BIN_DIR)
-+	cp src/launchers/* $(BIN_DIR)
- 	if [ -f ./wsapi/Makefile ]; then \
- 	  cd wsapi && make install; \
- 	fi
diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 7115896..e5a8676 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,16 +4,10 @@
 #
 ################################################################################
 
-ORBIT_VERSION = 2.2.0
-ORBIT_SITE = http://github.com/downloads/keplerproject/orbit
+ORBIT_VERSION_UPSTREAM = 2.2.0
+ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-2
+ORBIT_SUBDIR  = orbit-$(ORBIT_VERSION_UPSTREAM)
 ORBIT_LICENSE = MIT
-ORBIT_LICENSE_FILES = doc/us/license.md
+ORBIT_LICENSE_FILES = $(ORBIT_SUBDIR)/doc/us/license.md
 
-define ORBIT_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) \
-		LUA_DIR=$(TARGET_DIR)/usr/share/lua/5.1/ \
-		BIN_DIR=$(TARGET_DIR)/usr/bin \
-		install
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index e5f3d4f..c23f879 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -4,26 +4,7 @@
 #
 ################################################################################
 
-RINGS_VERSION = 1.2.3
-RINGS_SITE = http://github.com/downloads/keplerproject/rings
-RINGS_DEPENDENCIES = luainterpreter
+RINGS_VERSION = 1.2.3-2
 RINGS_LICENSE = MIT
 
-define RINGS_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
-endef
-
-define RINGS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)/usr" install
-endef
-
-define RINGS_UNINSTALL_TARGET_CMDS
-	rm -f "$(TARGET_DIR)/usr/lib/lua/5.1/rings.so"
-	rm -f "$(TARGET_DIR)/usr/share/lua/5.1/stable.lua"
-endef
-
-define RINGS_CLEAN_CMDS
-	$(MAKE) -C $(@D) clean
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index 743d4b9..f1ea9b5 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -4,18 +4,7 @@
 #
 ################################################################################
 
-WSAPI_VERSION = 1.5
-WSAPI_SITE = http://github.com/downloads/keplerproject/wsapi
+WSAPI_VERSION = 1.5-1
 WSAPI_LICENSE = MIT
 
-define WSAPI_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/lua/5.1/wsapi
-	$(INSTALL) -m 0644 -D $(@D)/src/wsapi/*.lua \
-		$(TARGET_DIR)/usr/share/lua/5.1/wsapi
-endef
-
-define WSAPI_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/lua/5.1/wsapi"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 069092d..c8d4d93 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,18 +4,7 @@
 #
 ################################################################################
 
-XAVANTE_VERSION = 2.2.1
-XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
+XAVANTE_VERSION = 2.2.0-1
 XAVANTE_LICENSE = MIT
 
-define XAVANTE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)/usr" install
-endef
-
-define XAVANTE_UNINSTALL_TARGET_CMDS
-	rm -rf "$(TARGET_DIR)/usr/share/5.1/xavante"
-	rm -f "$(TARGET_DIR)/usr/share/5.1/xavante.lua"
-	rm -f "$(TARGET_DIR)/usr/share/5.1/sajax.lua"
-endef
-
-$(eval $(generic-package))
+$(eval $(luarocks-package))
-- 
1.7.9.5
