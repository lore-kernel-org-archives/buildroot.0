From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:38:50 +0100
Subject: [Buildroot] [git commit] package/lua: remove 5.2.x version
Message-ID: <20181209201557.77C178B686@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=297613f1c7e28efc389665bfb70d147f2cdcffa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At this time :
- Lua 5.3.5 will be the last one of its serie.
- Lua 5.4 is up coming (lua-5.4.0-work2 is already available).
- Lua 5.2.4 was released on 2015.
For various reasons in the Lua ecosystem, the Lua 5.1 will stay.
On BR, Lua 5.3 is the default version since 2016.02.

So, the serie which could be removed is the 5.2.x.
We could wait some days for other user feedback.

Note: see discussion when 5.3.x was introduced :
http://lists.busybox.net/pipermail/buildroot/2015-January/117638.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                 |  9 +++
 package/domoticz/Config.in                       |  6 +-
 package/lrandom/lrandom.mk                       |  2 +-
 package/lua/5.2.4/0001-root-path.patch           | 17 ------
 package/lua/5.2.4/0002-shared-libs-for-lua.patch | 78 ------------------------
 package/lua/5.2.4/0011-linenoise.patch           | 26 --------
 package/lua/Config.in                            |  4 --
 package/lua/lua.hash                             |  3 -
 package/lua/lua.mk                               | 10 +--
 package/mpv/mpv.mk                               |  2 +-
 package/wireshark/wireshark.mk                   |  2 +-
 11 files changed, 16 insertions(+), 143 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 02321c88ae..37119d7e58 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,15 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2019.02"
+
+config BR2_PACKAGE_LUA_5_2
+	bool "Lua 5.2.x version removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LUA_5_3
+	help
+	  The Lua 5.2.x version was removed.
+
 comment "Legacy options removed in 2018.11"
 
 config BR2_TARGET_XLOADER
diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 4c5338df0a..b99e548012 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA_5_3
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_DATE_TIME
@@ -28,14 +28,14 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!(BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3)
+		!BR2_PACKAGE_LUA_5_3
 
 comment "domoticz needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/lrandom/lrandom.mk b/package/lrandom/lrandom.mk
index 09b62c94a5..2fe5fdb5ae 100644
--- a/package/lrandom/lrandom.mk
+++ b/package/lrandom/lrandom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LRANDOM_VERSION = 20120430.52-1
 else
 LRANDOM_VERSION = 20120430.51-1
diff --git a/package/lua/5.2.4/0001-root-path.patch b/package/lua/5.2.4/0001-root-path.patch
deleted file mode 100644
index c6f242c20e..0000000000
--- a/package/lua/5.2.4/0001-root-path.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Adjust installation location to /usr.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/src/luaconf.h
-===================================================================
---- a/src/luaconf.h
-+++ b/src/luaconf.h
-@@ -100,7 +100,7 @@
- #else			/* }{ */
- 
- #define LUA_VDIR	LUA_VERSION_MAJOR "." LUA_VERSION_MINOR "/"
--#define LUA_ROOT	"/usr/local/"
-+#define LUA_ROOT	"/usr/"
- #define LUA_LDIR	LUA_ROOT "share/lua/" LUA_VDIR
- #define LUA_CDIR	LUA_ROOT "lib/lua/" LUA_VDIR
- #define LUA_PATH_DEFAULT  \
diff --git a/package/lua/5.2.4/0002-shared-libs-for-lua.patch b/package/lua/5.2.4/0002-shared-libs-for-lua.patch
deleted file mode 100644
index 3cf3b24848..0000000000
--- a/package/lua/5.2.4/0002-shared-libs-for-lua.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Add the compilation of a shared library.
-Compile the lua binary with the shared library.
-And install the shared library.
-The variable BUILDMODE allows to switch between static and dynamic mode.
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -42,6 +42,7 @@
- TO_BIN= lua luac
- TO_INC= lua.h luaconf.h lualib.h lauxlib.h lua.hpp
- TO_LIB= liblua.a
-+TO_SOLIB = liblua.so.$(R)
- TO_MAN= lua.1 luac.1
- 
- # Lua version and release.
-@@ -60,6 +61,8 @@
- install: dummy
- 	cd src && $(MKDIR) $(INSTALL_BIN) $(INSTALL_INC) $(INSTALL_LIB) $(INSTALL_MAN) $(INSTALL_LMOD) $(INSTALL_CMOD)
- 	cd src && $(INSTALL_EXEC) $(TO_BIN) $(INSTALL_BIN)
-+	test -f src/$(TO_SOLIB) && cd src && $(INSTALL_EXEC) $(TO_SOLIB) $(INSTALL_LIB) || :
-+	test -f src/$(TO_SOLIB) && ln -sf $(TO_SOLIB) $(INSTALL_LIB)/liblua.so || :
- 	cd src && $(INSTALL_DATA) $(TO_INC) $(INSTALL_INC)
- 	cd src && $(INSTALL_DATA) $(TO_LIB) $(INSTALL_LIB)
- 	cd doc && $(INSTALL_DATA) $(TO_MAN) $(INSTALL_MAN)
-Index: b/src/Makefile
-===================================================================
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -29,6 +29,7 @@
- PLATS= aix ansi bsd freebsd generic linux macosx mingw posix solaris
- 
- LUA_A=	liblua.a
-+LUA_SO=	liblua.so
- CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o \
- 	lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o \
- 	ltm.o lundump.o lvm.o lzio.o
-@@ -43,8 +44,13 @@
- LUAC_O=	luac.o
- 
- ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
-+ifneq (dynamic,$(BUILDMODE))
- ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
-+else
-+ALL_T= $(LUA_A) $(LUA_SO) $(LUA_T) $(LUAC_T)
-+endif
- ALL_A= $(LUA_A)
-+ALL_SO= $(LUA_SO)
- 
- # Targets start here.
- default: $(PLAT)
-@@ -55,12 +61,23 @@
- 
- a:	$(ALL_A)
- 
-+so:	$(ALL_SO)
-+
- $(LUA_A): $(BASE_O)
- 	$(AR) $@ $(BASE_O)
- 	$(RANLIB) $@
- 
-+$(LUA_SO): $(CORE_O) $(LIB_O)
-+	$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
-+	ln -fs $@.$(PKG_VERSION) $@
-+
-+ifneq (dynamic,$(BUILDMODE))
- $(LUA_T): $(LUA_O) $(LUA_A)
- 	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)
-+else
-+$(LUA_T): $(LUA_O) $(LUA_SO)
-+	$(CC) -o $@ -L. $(LDFLAGS) $(LUA_O) -llua $(LIBS)
-+endif
- 
- $(LUAC_T): $(LUAC_O) $(LUA_A)
- 	$(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)
diff --git a/package/lua/5.2.4/0011-linenoise.patch b/package/lua/5.2.4/0011-linenoise.patch
deleted file mode 100644
index b1f228cd49..0000000000
--- a/package/lua/5.2.4/0011-linenoise.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Add support of linenoise (replace readline)
-
-see discussion, http://lua-users.org/lists/lua-l/2010-03/msg00879.html
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/src/lua.c
-===================================================================
---- a/src/lua.c
-+++ b/src/lua.c
-@@ -72,6 +72,15 @@
-           add_history(lua_tostring(L, idx));  /* add it to history */
- #define lua_freeline(L,b)	((void)L, free(b))
- 
-+#elif defined(LUA_USE_LINENOISE)
-+
-+#include <linenoise.h>
-+#define lua_readline(L,b,p)	((void)L, ((b)=linenoise(p)) != NULL)
-+#define lua_saveline(L,idx) \
-+	if (lua_rawlen(L,idx) > 0)  /* non-empty line? */ \
-+	  linenoiseHistoryAdd(lua_tostring(L, idx));  /* add it to history */
-+#define lua_freeline(L,b)	((void)L, free(b))
-+
- #elif !defined(lua_readline)
- 
- #define lua_readline(L,b,p) \
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 4d2f0e90fa..ce2e439f63 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -21,9 +21,6 @@ choice
 config BR2_PACKAGE_LUA_5_1
 	bool "Lua 5.1.x"
 
-config BR2_PACKAGE_LUA_5_2
-	bool "Lua 5.2.x"
-
 config BR2_PACKAGE_LUA_5_3
 	bool "Lua 5.3.x"
 
@@ -31,7 +28,6 @@ endchoice
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"	if BR2_PACKAGE_LUA_5_1
-	default "5.2"	if BR2_PACKAGE_LUA_5_2
 	default "5.3"	if BR2_PACKAGE_LUA_5_3
 
 if BR2_PACKAGE_LUA_5_3
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index 43f5be275e..ba57304d0f 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -2,8 +2,5 @@
 md5 4f4b4f323fd3514a68e0ab3da8ce3455           lua-5.3.5.tar.gz
 sha1 112eb10ff04d1b4c9898e121d6bdf54a81482447  lua-5.3.5.tar.gz
 
-md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
-sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
-
 md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
 sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 22643c4c8c..8a5f9258a0 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -7,16 +7,12 @@
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.5
 else
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-LUA_VERSION = 5.2.4
-else
 LUA_VERSION = 5.1.5
 endif
-endif
 LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 LUA_LICENSE = MIT
-ifeq ($(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUA_5_3),y)
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_LICENSE_FILES = doc/readme.html
 else
 LUA_LICENSE_FILES = COPYRIGHT
@@ -26,10 +22,6 @@ LUA_PROVIDES = luainterpreter
 
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
 
-ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-LUA_CFLAGS += -DLUA_COMPAT_ALL
-endif
-
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index b8260213b7..3ab2673774 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -132,7 +132,7 @@ endif
 
 # LUA support, only for lua51/lua52/luajit
 # This enables the controller (OSD) together with libass
-ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2)$(BR2_PACKAGE_LUAJIT),y)
+ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
 MPV_CONF_OPTS += --enable-lua
 MPV_DEPENDENCIES += luainterpreter
 else
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 4720960e59..3b83389c19 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -107,7 +107,7 @@ WIRESHARK_CONF_OPTS += --without-libxml2
 endif
 
 # no support for lua53 yet
-ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2),y)
+ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 WIRESHARK_CONF_OPTS += --with-lua
 WIRESHARK_DEPENDENCIES += lua
 else
