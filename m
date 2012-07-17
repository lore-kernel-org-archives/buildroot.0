From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 21:19:36 +0200
Subject: [Buildroot] [git commit] lua: refactor root path tuning
Message-ID: <20120717213057.7469896A92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=641f5dcb764f63c086a23a2018aca952e83ef666
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a patch rather than sed'ing files in the build process.

Signed-off-by: Francois Perrad <fperrad@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/lua-01-root-path.patch |   24 ++++++++++++++++++++++++
 package/lua/lua.mk                 |    2 --
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua-01-root-path.patch b/package/lua/lua-01-root-path.patch
index c5dbf32..f82c9c5 100644
--- a/package/lua/lua-01-root-path.patch
+++ b/package/lua/lua-01-root-path.patch
@@ -1,5 +1,29 @@
 Adjust installation location to /usr.
+Remove version in module paths.
 
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+Index: b/etc/lua.pc
+===================================================================
+--- a/etc/lua.pc
++++ b/etc/lua.pc
+@@ -8,13 +8,13 @@
+ R= 5.1.5
+ 
+ # grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
+-prefix= /usr/local
++prefix= /usr
+ INSTALL_BIN= ${prefix}/bin
+ INSTALL_INC= ${prefix}/include
+ INSTALL_LIB= ${prefix}/lib
+ INSTALL_MAN= ${prefix}/man/man1
+-INSTALL_LMOD= ${prefix}/share/lua/${V}
+-INSTALL_CMOD= ${prefix}/lib/lua/${V}
++INSTALL_LMOD= ${prefix}/share/lua
++INSTALL_CMOD= ${prefix}/lib/lua
+ 
+ # canonical vars
+ exec_prefix=${prefix}
 Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index b61d6f1..1e52075 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -28,7 +28,6 @@ HOST_LUA_MYLIBS = -ldl
 
 define LUA_BUILD_CMDS
 	sed -i -e 's/-O2//' $(@D)/src/Makefile
-	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
 	$(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
 	MYCFLAGS="$(TARGET_CFLAGS) $(LUA_MYCFLAGS)" \
@@ -38,7 +37,6 @@ endef
 
 define HOST_LUA_BUILD_CMDS
 	sed -i -e 's/-O2//' $(@D)/src/Makefile
-	sed -i -e 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
 	$(MAKE) \
 	MYCFLAGS="$(HOST_LUA_MYCFLAGS)" \
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
