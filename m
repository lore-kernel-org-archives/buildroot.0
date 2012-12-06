From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  6 Dec 2012 09:44:59 +0100
Subject: [Buildroot] [v2] luajit: complete replacement for lua
Message-ID: <1354783499-20000-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the mutual exclusion is done by a choice

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

see initial discussion, http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/43499

---
 Makefile                                         |    6 ++++++
 package/Config.in                                |    1 -
 package/copas/copas.mk                           |    2 +-
 package/coxpcall/coxpcall.mk                     |    1 -
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 package/lua/Config.in                            |   25 ++++++++++++++++++++++
 package/luacjson/luacjson.mk                     |    2 +-
 package/luaexpat/luaexpat.mk                     |    2 +-
 package/luafilesystem/luafilesystem.mk           |    2 +-
 package/luajit/Config.in                         |   12 -----------
 package/luajit/luajit-05-install-like-lua.patch  |   17 +++++++++++++++
 package/luasocket/luasocket.mk                   |    2 +-
 package/rings/rings.mk                           |    2 +-
 package/xavante/xavante.mk                       |    2 +-
 14 files changed, 56 insertions(+), 22 deletions(-)
 delete mode 100644 package/luajit/Config.in
 create mode 100644 package/luajit/luajit-05-install-like-lua.patch

diff --git a/Makefile b/Makefile
index 4b09437..b5215e0 100644
--- a/Makefile
+++ b/Makefile
@@ -282,6 +282,12 @@ HOSTCC  := $(CCACHE) $(HOSTCC)
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
index 74e439e..e6e294e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -271,7 +271,6 @@ source "package/erlang/Config.in"
 source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
 source "package/lua/Config.in"
-source "package/luajit/Config.in"
 if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT
 menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index c84a6cc..a258927 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -6,7 +6,7 @@
 
 COPAS_VERSION = 1.1.6
 COPAS_SITE = http://github.com/downloads/keplerproject/copas
-COPAS_DEPENDENCIES = lua coxpcall luasocket
+COPAS_DEPENDENCIES = coxpcall luasocket
 COPAS_LICENSE = MIT
 
 define COPAS_INSTALL_TARGET_CMDS
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index e7fb76d..329d6fd 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -6,7 +6,6 @@
 
 COXPCALL_VERSION = 1.13.0
 COXPCALL_SITE = http://luaforge.net/frs/download.php/3406
-COXPCALL_DEPENDENCIES = lua
 COXPCALL_LICENSE = MIT
 
 define COXPCALL_INSTALL_TARGET_CMDS
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
 
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 4166730..d698a25 100644
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
+	  None.
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
 
 choice
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
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 0c1c6f1..7f49f4d 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -6,7 +6,7 @@
 
 XAVANTE_VERSION = 2.2.1
 XAVANTE_SITE = http://github.com/downloads/keplerproject/xavante
-XAVANTE_DEPENDENCIES = cgilua copas coxpcall lua luafilesystem luasocket wsapi
+XAVANTE_DEPENDENCIES = cgilua copas coxpcall luafilesystem luasocket wsapi
 XAVANTE_LICENSE = MIT
 
 define XAVANTE_INSTALL_TARGET_CMDS
-- 
1.7.9.5
