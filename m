From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:38:56 +0200
Subject: [Buildroot] [PATCH] lua: refactor with a common template lua.pc.in
Message-ID: <20170820083856.13579-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lua.pc is generated from a common template in the configure step.
install steps are restored like in BR 2017.05

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.2.4/0004-lua-pc.patch | 42 -------------------------------------
 package/lua/5.3.4/0004-lua-pc.patch | 42 -------------------------------------
 package/lua/lua.mk                  | 20 ++++++++++++------
 package/lua/lua.pc.in               | 26 +++++++++++++++++++++++
 4 files changed, 40 insertions(+), 90 deletions(-)
 delete mode 100644 package/lua/5.2.4/0004-lua-pc.patch
 delete mode 100644 package/lua/5.3.4/0004-lua-pc.patch
 create mode 100644 package/lua/lua.pc.in

diff --git a/package/lua/5.2.4/0004-lua-pc.patch b/package/lua/5.2.4/0004-lua-pc.patch
deleted file mode 100644
index 31ff61157..000000000
--- a/package/lua/5.2.4/0004-lua-pc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-add lua.pc
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-[J??rg Krause: add @MYLIBS@]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
-Index: b/etc/lua.pc
-===================================================================
---- /dev/null
-+++ b/etc/lua.pc
-@@ -0,0 +1,31 @@
-+# lua.pc -- pkg-config data for Lua
-+
-+# vars from install Makefile
-+
-+# grep '^V=' ../Makefile
-+V= 5.2
-+# grep '^R=' ../Makefile
-+R= 5.2.3
-+
-+# grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
-+prefix= /usr
-+INSTALL_BIN= ${prefix}/bin
-+INSTALL_INC= ${prefix}/include
-+INSTALL_LIB= ${prefix}/lib
-+INSTALL_MAN= ${prefix}/man/man1
-+INSTALL_LMOD= ${prefix}/share/lua/${V}
-+INSTALL_CMOD= ${prefix}/lib/lua/${V}
-+
-+# canonical vars
-+exec_prefix=${prefix}
-+libdir=${exec_prefix}/lib
-+includedir=${prefix}/include
-+
-+Name: Lua
-+Description: An Extensible Extension Language
-+Version: ${R}
-+Requires: 
-+Libs: -L${libdir} -llua -lm @MYLIBS@
-+Cflags: -I${includedir}
-+
-+# (end of lua.pc)
diff --git a/package/lua/5.3.4/0004-lua-pc.patch b/package/lua/5.3.4/0004-lua-pc.patch
deleted file mode 100644
index 11258329d..000000000
--- a/package/lua/5.3.4/0004-lua-pc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-add lua.pc
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-[J??rg Krause: add @MYLIBS@]
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
-Index: b/etc/lua.pc
-===================================================================
---- /dev/null
-+++ b/etc/lua.pc
-@@ -0,0 +1,31 @@
-+# lua.pc -- pkg-config data for Lua
-+
-+# vars from install Makefile
-+
-+# grep '^V=' ../Makefile
-+V= 5.3
-+# grep '^R=' ../Makefile
-+R= 5.3.4
-+
-+# grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
-+prefix= /usr
-+INSTALL_BIN= ${prefix}/bin
-+INSTALL_INC= ${prefix}/include
-+INSTALL_LIB= ${prefix}/lib
-+INSTALL_MAN= ${prefix}/man/man1
-+INSTALL_LMOD= ${prefix}/share/lua/${V}
-+INSTALL_CMOD= ${prefix}/lib/lua/${V}
-+
-+# canonical vars
-+exec_prefix=${prefix}
-+libdir=${exec_prefix}/lib
-+includedir=${prefix}/include
-+
-+Name: Lua
-+Description: An Extensible Extension Language
-+Version: ${R}
-+Requires:
-+Libs: -L${libdir} -llua -lm @MYLIBS@
-+Cflags: -I${includedir}
-+
-+# (end of lua.pc)
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ee39480dc..16042c68f 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -65,6 +65,16 @@ endif
 HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
+define LUA_CONFIGURE_CMDS
+	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(LUA_MYLIBS)/" \
+		package/lua/lua.pc.in > $(@D)/lua.pc
+endef
+
+define HOST_LUA_CONFIGURE_CMDS
+	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(HOST_LUA_MYLIBS)/" \
+		package/lua/lua.pc.in > $(@D)/lua.pc
+endef
+
 define LUA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
@@ -86,9 +96,8 @@ endef
 
 define LUA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
-	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
-	sed -e "s/@MYLIBS@/$(LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
-		> $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) -m 0644 -D $(@D)/lua.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
 
 define LUA_INSTALL_TARGET_CMDS
@@ -97,9 +106,8 @@ endef
 
 define HOST_LUA_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)" -C $(@D) install
-	mkdir -p $(HOST_DIR)/lib/pkgconfig/
-	sed -e "s/@MYLIBS@/$(HOST_LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
-		> $(HOST_DIR)/lib/pkgconfig/lua.pc
+	$(INSTALL) -m 0644 -D $(@D)/lua.pc \
+		$(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
 
 $(eval $(generic-package))
diff --git a/package/lua/lua.pc.in b/package/lua/lua.pc.in
new file mode 100644
index 000000000..0a61d5e6d
--- /dev/null
+++ b/package/lua/lua.pc.in
@@ -0,0 +1,26 @@
+# lua.pc -- pkg-config data for Lua
+
+V= @ABI@
+R= @VERSION@
+
+prefix= /usr
+INSTALL_BIN= ${prefix}/bin
+INSTALL_INC= ${prefix}/include
+INSTALL_LIB= ${prefix}/lib
+INSTALL_MAN= ${prefix}/man/man1
+INSTALL_LMOD= ${prefix}/share/lua/${V}
+INSTALL_CMOD= ${prefix}/lib/lua/${V}
+
+# canonical vars
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: Lua
+Description: An Extensible Extension Language
+Version: ${R}
+Requires:
+Libs: -L${libdir} -llua -lm @MYLIBS@
+Cflags: -I${includedir}
+
+# (end of lua.pc)
-- 
2.11.0
