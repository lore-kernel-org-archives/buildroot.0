From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 30 Jul 2012 08:31:27 +0200
Subject: [Buildroot] [PATCH 1/4] luajit: complete replacement for lua v2
Message-ID: <1343629890-4657-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the mutual exclusion is done by a choice
---
 Makefile                                        |    6 ++++++
 package/Config.in                               |    1 -
 package/copas/copas.mk                          |    2 +-
 package/coxpcall/coxpcall.mk                    |    1 -
 package/lua/Config.in                           |   25 +++++++++++++++++++++++
 package/luacjson/luacjson.mk                    |    2 +-
 package/luaexpat/luaexpat.mk                    |    2 +-
 package/luafilesystem/luafilesystem.mk          |    2 +-
 package/luajit/Config.in                        |   12 -----------
 package/luajit/luajit-05-install-like-lua.patch |   17 +++++++++++++++
 package/luasocket/luasocket.mk                  |    2 +-
 package/rings/rings.mk                          |    2 +-
 package/xavante/xavante.mk                      |    2 +-
 13 files changed, 55 insertions(+), 21 deletions(-)
 delete mode 100644 package/luajit/Config.in
 create mode 100644 package/luajit/luajit-05-install-like-lua.patch

diff --git a/Makefile b/Makefile
index 639fdaa..479556b 100644
--- a/Makefile
+++ b/Makefile
@@ -283,6 +283,12 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
 
+ifeq ($(BR2_PACKAGE_LUA),y)
+    LUA_INTERPRETER = lua
+else ifeq ($(BR2_PACKAGE_LUAJIT),y)
+    LUA_INTERPRETER = luajit
+endif
+
 #############################################################
 #
 # You should probably leave this stuff alone unless you know
diff --git a/package/Config.in b/package/Config.in
index f664b8e..7e7d8a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -246,7 +246,6 @@ endmenu
 menu "Interpreter languages and scripting"
 source "package/haserl/Config.in"
 source "package/lua/Config.in"
-source "package/luajit/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index cd9ab7a..5ffa190 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -6,7 +6,7 @@
 
 COPAS_VERSION = 1.1.6
 COPAS_SITE = http://github.com/downloads/keplerproject/copas
-COPAS_DEPENDENCIES = lua coxpcall luasocket
+COPAS_DEPENDENCIES = coxpcall luasocket
 
 define COPAS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/copas/copas.lua \
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 94fc16c..9f8d8fa 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -6,7 +6,6 @@
 
 COXPCALL_VERSION = 1.13.0
 COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
-COXPCALL_DEPENDENCIES = lua
 
 define COXPCALL_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/coxpcall.lua \
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 76359c0..06f3046 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,3 +1,13 @@
+
+choice
+	prompt "Lua Interpreter"
+	default BR2_PACKAGE_LUA_NONE
+
+config BR2_PACKAGE_LUA_NONE
+	bool "none"
+	help
+	 Do not compress the tarball.
+
 config BR2_PACKAGE_LUA
 	bool "lua"
 	help
@@ -5,6 +15,21 @@ config BR2_PACKAGE_LUA
 
 	  http://www.lua.org/
 
+config BR2_PACKAGE_LUAJIT
+	bool "luajit"
+	# Luajit is only available for some target architectures, and
+	# has some complexity wrt 32/64. See luajit.mk for details.
+	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
+	help
+	  LuaJIT implements the full set of language features defined
+	  by Lua 5.1. The virtual machine (VM) is API- and
+	  ABI-compatible to the standard Lua interpreter and can be
+	  deployed as a drop-in replacement.
+
+	  http://luajit.org/
+
+endchoice
+
 if BR2_PACKAGE_LUA
 
 config BR2_PACKAGE_LUA_COMPILER
diff --git a/package/luacjson/luacjson.mk b/package/luacjson/luacjson.mk
index fe92f16..64cc4b8 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/luacjson/luacjson.mk
@@ -6,7 +6,7 @@
 LUACJSON_VERSION      = 2.1.0
 LUACJSON_SOURCE       = lua-cjson-$(LUACJSON_VERSION).tar.gz
 LUACJSON_SITE         = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES = lua
+LUACJSON_DEPENDENCIES = $(LUA_INTERPRETER)
 
 define LUACJSON_BUILD_CMDS
 	$(MAKE) -C $(@D) \
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 400d7b4..3f84976 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -6,7 +6,7 @@
 
 LUAEXPAT_VERSION      = 1.2.0
 LUAEXPAT_SITE         = http://matthewwild.co.uk/projects/luaexpat
-LUAEXPAT_DEPENDENCIES = lua expat
+LUAEXPAT_DEPENDENCIES = $(LUA_INTERPRETER) expat
 
 
 LUAEXPAT_MFLAGS += LUA_VERSION_NUM=501
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 17f2bd6..eaac029 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -6,7 +6,7 @@
 
 LUAFILESYSTEM_VERSION = 1.5.0
 LUAFILESYSTEM_SITE = http://github.com/downloads/keplerproject/luafilesystem
-LUAFILESYSTEM_DEPENDENCIES = lua
+LUAFILESYSTEM_DEPENDENCIES = $(LUA_INTERPRETER)
 
 ifeq ($(BR2_LARGEFILE),y)
 LFS_CFLAGS = -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
deleted file mode 100644
index 23b2650..0000000
--- a/package/luajit/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LUAJIT
-	bool "luajit"
-	# Luajit is only available for some target architectures, and
-	# has some complexity wrt 32/64. See luajit.mk for details.
-	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb
-	help
-	  LuaJIT implements the full set of language features defined
-	  by Lua 5.1. The virtual machine (VM) is API- and
-	  ABI-compatible to the standard Lua interpreter and can be
-	  deployed as a drop-in replacement.
-
-	  http://luajit.org/
diff --git a/package/luajit/luajit-05-install-like-lua.patch b/package/luajit/luajit-05-install-like-lua.patch
new file mode 100644
index 0000000..8b91805
--- /dev/null
+++ b/package/luajit/luajit-05-install-like-lua.patch
@@ -0,0 +1,17 @@
+Install includes in /usr/include
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -33,7 +33,7 @@
+ INSTALL_BIN=   $(DPREFIX)/bin
+ INSTALL_LIB=   $(DPREFIX)/lib
+ INSTALL_SHARE= $(DPREFIX)/share
+-INSTALL_INC=   $(DPREFIX)/include/luajit-$(MAJVER).$(MINVER)
++INSTALL_INC=   $(DPREFIX)/include
+ 
+ INSTALL_JITLIB= $(INSTALL_SHARE)/luajit-$(VERSION)/jit
+ INSTALL_LMOD= $(INSTALL_SHARE)/lua/$(ABIVER)
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 755b61a..509b85d 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -6,7 +6,7 @@
 
 LUASOCKET_VERSION = 2.0.2
 LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
-LUASOCKET_DEPENDENCIES = lua
+LUASOCKET_DEPENDENCIES = $(LUA_INTERPRETER)
 
 define LUASOCKET_BUILD_CMDS
 	$(MAKE) -C $(@D) -f makefile \
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index c196d85..c9f99f1 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -6,7 +6,7 @@
 
 RINGS_VERSION = 1.2.3
 RINGS_SITE = http://github.com/downloads/keplerproject/rings
-RINGS_DEPENDENCIES = lua
+RINGS_DEPENDENCIES = $(LUA_INTERPRETER)
 
 define RINGS_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index f885fbd..37773dc 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -6,7 +6,7 @@
 
 XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
-XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
+XAVANTE_DEPENDENCIES = cgilua copas coxpcall luafilesystem luasocket wsapi
 
 define XAVANTE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr \
-- 
1.7.9.5
