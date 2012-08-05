From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sun,  5 Aug 2012 23:01:37 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_lua-msgpack-native=3A_new_packa?=
	=?utf-8?q?ge?=
In-Reply-To: <1344200497-24124-1-git-send-email-wzab01@gmail.com>
References: <1344200497-24124-1-git-send-email-wzab01@gmail.com>
Message-ID: <1344200497-24124-2-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Wojciech M. Zabolotny" <wzab01@gmail.com>

I needed to add the fast msgpack implementation of msgpack library for Lua
I've choosen the lua-msgpack-native implementation available at:
https://github.com/kengonakajima/lua-msgpack-native

The original sources come with Makefile creating dependences on another
software. Therefore I've replaced the original Makefile with
seriously simplified makefile, sufficient to compile the original
source mp.c for buildroot.

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/Config.in                                  |    1 +
 package/lua-msgpack-native/Config.in               |    8 +++
 .../lua-msgpack-native-41cce91ab6-0001.patch       |   61 ++++++++++++++++++++
 package/lua-msgpack-native/lua-msgpack-native.mk   |   35 +++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 package/lua-msgpack-native/Config.in
 create mode 100644 package/lua-msgpack-native/lua-msgpack-native-41cce91ab6-0001.patch
 create mode 100644 package/lua-msgpack-native/lua-msgpack-native.mk

diff --git a/package/Config.in b/package/Config.in
index f308de7..f05f5f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -257,6 +257,7 @@ source "package/luacjson/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
+source "package/lua-msgpack-native/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
new file mode 100644
index 0000000..3ef794d
--- /dev/null
+++ b/package/lua-msgpack-native/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_MSGPACK_NATIVE
+	bool "lua-msgpack-native"
+	help
+	  This is a native, C language implementation of msgpack (http://msgpack.org)
+	  library/protocol for Lua language
+
+	  https://github.com/kengonakajima/lua-msgpack-native
+	  
diff --git a/package/lua-msgpack-native/lua-msgpack-native-41cce91ab6-0001.patch b/package/lua-msgpack-native/lua-msgpack-native-41cce91ab6-0001.patch
new file mode 100644
index 0000000..1dc8909
--- /dev/null
+++ b/package/lua-msgpack-native/lua-msgpack-native-41cce91ab6-0001.patch
@@ -0,0 +1,61 @@
+diff -u -r -N lua-msgpack-native-41cce91ab6.orig/makefile lua-msgpack-native-41cce91ab6/makefile
+--- lua-msgpack-native-41cce91ab6.orig/makefile	1970-01-01 01:00:00.000000000 +0100
++++ lua-msgpack-native-41cce91ab6/makefile	2012-08-05 22:13:04.000000000 +0200
+@@ -0,0 +1,6 @@
++all: msgpack.so
++msgpack.so: mp.c
++	$(CC) $(CFLAGS) -I /usr/local/include -shared -o msgpack.so mp.c
++install: msgpack.so
++	mkdir -p $(INSTALL_TOP_LIB)
++	cp msgpack.so $(INSTALL_TOP_LIB)
+\ Brak znaku nowej linii na ko?cu pliku
+diff -u -r -N lua-msgpack-native-41cce91ab6.orig/Makefile lua-msgpack-native-41cce91ab6/Makefile
+--- lua-msgpack-native-41cce91ab6.orig/Makefile	2012-07-25 04:34:43.000000000 +0200
++++ lua-msgpack-native-41cce91ab6/Makefile	1970-01-01 01:00:00.000000000 +0100
+@@ -1,46 +0,0 @@
+-
+-LUVIT=deps/luvit/build/luvit
+-
+-
+-ifeq ($(shell uname -sm | sed -e s,x86_64,i386,),Darwin i386)
+-#osx
+-export CC=gcc #-arch i386
+-CFLAGS=$(shell $(LUVIT) --cflags) -g -O3 -I./deps/luvit/deps/luajit/src
+-LIBS=$(shell $(LUVIT) --libs)
+-LDFLAGS=
+-else
+-# linux
+-CFLAGS=$(shell $(LUVIT) --cflags) -g -O3 -I./deps/luvit/deps/luajit/src -fno-strict-aliasing
+-LIBS=$(shell $(LUVIT) --libs) -lm -ldl
+-LDFLAGS=
+-endif
+-
+-# workaround for luvit build script bug: bad symlink to luajit have to be a directory for gcc
+-LUAJITBIN=deps/luvit/include/luvit/luajit
+-
+-
+-
+-all:  test
+-
+-
+-mp.o: mp.c
+-	echo $(LUVITCONFIG)
+-	$(CC) -c mp.c $(CFLAGS)
+-
+-msgpack.luvit: mp.o
+-	echo $(LIBS)
+-	$(CC) -o msgpack.luvit mp.o $(LIBS)
+-
+-test: $(LUVIT) msgpack.luvit
+-	$(LUVIT) test.lua
+-
+-$(LUVIT) :
+-	git submodule init
+-	git submodule update
+-	cd deps/luvit; ./configure; make
+-	rm $(LUAJITBIN)
+-
+-
+-clean:
+-	rm -rf *.o *.luvit deps/luvit/build/*
+-
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
new file mode 100644
index 0000000..f166d2e
--- /dev/null
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# lua-msgpack-native
+#
+#############################################################
+LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6
+LUA_MSGPACK_NATIVE_SITE = git://github.com/kengonakajima/lua-msgpack-native.git
+LUA_MSGPACK_NATIVE_METHOD = git
+LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
+
+#LUA_MSGPACK_NATIVE_INSTALL_STAGING = YES
+LUA_MSGPACK_NATIVE_INSTALL_TARGET=YES
+
+define LUA_MSGPACK_NATIVE_BUILD_CMDS
+	$(MAKE) -C $(@D) -f makefile \
+		CC="$(TARGET_CC)" LD="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC"
+endef
+
+define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -f makefile \
+		INSTALL_TOP_SHARE="$(TARGET_DIR)/usr/share/lua" \
+		INSTALL_TOP_LIB="$(TARGET_DIR)/usr/lib/lua" install
+endef
+
+define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
+	rm -rf "$(TARGET_DIR)/usr/lib/lua/msgpack.so"
+endef
+
+define LUA_MSGPACK_NATIVE_CLEAN_CMDS
+	$(MAKE) -C $(@D) -f makefile clean
+endef
+
+
+$(eval $(generic-package))
-- 
1.7.10.4
