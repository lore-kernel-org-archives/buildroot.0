From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 15 Dec 2012 10:33:22 +0100
Subject: [Buildroot] [PATCH 2/2] luajit: allow to build Lua extensions
	without lua
In-Reply-To: <1355564002-14490-1-git-send-email-francois.perrad@gadz.org>
References: <1355564002-14490-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1355564002-14490-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Makefile.in                              |    6 ++++++
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 package/luacjson/luacjson.mk                     |    2 +-
 package/luaexpat/luaexpat.mk                     |    2 +-
 package/luafilesystem/luafilesystem.mk           |    2 +-
 package/luajit/luajit.mk                         |   11 ++++++++++-
 package/luasocket/luasocket.mk                   |    2 +-
 package/rings/rings.mk                           |    2 +-
 8 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 8dea51e..c19887b 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -307,6 +307,12 @@ else
 SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+LUA_INTERPRETER = lua
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+LUA_INTERPRETER = luajit
+endif
+
 include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 97ce83c..5387f53 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -5,7 +5,7 @@
 #############################################################
 LUA_MSGPACK_NATIVE_VERSION = g41cce91
 LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/master
-LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
+LUA_MSGPACK_NATIVE_DEPENDENCIES = $(LUA_INTERPRETER)
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
 
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index 1f79d5d..de79e9f 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -6,7 +6,7 @@
 LUACJSON_VERSION       = 2.1.0
 LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
 LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES  = lua
+LUACJSON_DEPENDENCIES  = $(LUA_INTERPRETER)
 LUACJSON_LICENSE       = MIT
 LUACJSON_LICENSE_FILES = LICENSE
 
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 2d4c517..435eb8e 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -6,7 +6,7 @@
 
 LUAEXPAT_VERSION      = 1.2.0
 LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
-LUAEXPAT_DEPENDENCIES = lua expat
+LUAEXPAT_DEPENDENCIES = $(LUA_INTERPRETER) expat
 LUAEXPAT_LICENSE      = MIT
 
 
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 8553212..5e964af 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -6,7 +6,7 @@
 
 LUAFILESYSTEM_VERSION = 1.5.0
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
-LUAFILESYSTEM_DEPENDENCIES = lua
+LUAFILESYSTEM_DEPENDENCIES = $(LUA_INTERPRETER)
 LUAFILESYSTEM_LICENSE = MIT
 
 ifeq ($(BR2_LARGEFILE),y)
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 844122e..d7e5d4d 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,10 @@
 #
 #############################################################
 
-LUAJIT_VERSION = 2.0.0
+LUAJIT_MAJVER=  2
+LUAJIT_MINVER=  0
+LUAJIT_RELVER=  0
+LUAJIT_VERSION = $(LUAJIT_MAJVER).$(LUAJIT_MINVER).$(LUAJIT_RELVER)
 LUAJIT_SOURCE  = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE    = http://luajit.org/download
 LUAJIT_LICENSE = MIT
@@ -47,8 +50,14 @@ define LUAJIT_BUILD_CMDS
 		-C $(@D) amalg
 endef
 
+LUAJIT_FILES_INC= lua.h lualib.h lauxlib.h luaconf.h lua.hpp
+
 define LUAJIT_INSTALL_STAGING_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
+	for i in $(LUAJIT_FILES_INC); do \
+		ln -sf $(STAGING_DIR)/usr/include/luajit-$(LUAJIT_MAJVER).$(LUAJIT_MINVER)/$$i \
+		       $(STAGING_DIR)/usr/include/$$i; \
+	done
 endef
 
 define LUAJIT_INSTALL_TARGET_CMDS
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 45fb9a3..3126ea3 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -6,7 +6,7 @@
 
 LUASOCKET_VERSION = 2.0.2
 LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
-LUASOCKET_DEPENDENCIES = lua
+LUASOCKET_DEPENDENCIES = $(LUA_INTERPRETER)
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = LICENSE
 
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index e2a2bd7..791cf5e 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -6,7 +6,7 @@
 
 RINGS_VERSION = 1.2.3
 RINGS_SITE = http://github.com/downloads/keplerproject/rings
-RINGS_DEPENDENCIES = lua
+RINGS_DEPENDENCIES = $(LUA_INTERPRETER)
 RINGS_LICENSE = MIT
 
 define RINGS_BUILD_CMDS
-- 
1.7.9.5
