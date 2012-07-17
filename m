From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Jul 2012 10:18:28 +0200
Subject: [Buildroot] [PATCH 2/2] lua: refactor root path
In-Reply-To: <1342513108-27075-1-git-send-email-francois.perrad@gadz.org>
References: <1342513108-27075-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1342513108-27075-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index baa459c..71e98d6 100644
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
-- 
1.7.9.5
