From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Oct 2017 22:05:04 +0200
Subject: [Buildroot] [git commit] lua: refactor with a common template
	lua.pc.in
Message-ID: <20171012195746.BFA9C80359@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4b8299df3cb7a508843ca6698812171d1592eae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua.pc is generated from a common template in the build step.
install steps are restored like in BR 2017.05

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/5.2.4/0004-lua-pc.patch | 42 -------------------------------------
 package/lua/5.3.4/0004-lua-pc.patch | 42 -------------------------------------
 package/lua/lua.mk                  | 14 +++++++------
 package/lua/lua.pc.in               | 26 +++++++++++++++++++++++
 4 files changed, 34 insertions(+), 90 deletions(-)

diff --git a/package/lua/5.2.4/0004-lua-pc.patch b/package/lua/5.2.4/0004-lua-pc.patch
deleted file mode 100644
index 31ff611..0000000
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
index 1125832..0000000
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
index ee39480..0ac2e0e 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -73,6 +73,8 @@ define LUA_BUILD_CMDS
 	MYLDFLAGS="$(TARGET_LDFLAGS)" \
 	BUILDMODE=$(LUA_BUILDMODE) \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
+	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(LUA_MYLIBS)/" \
+		package/lua/lua.pc.in > $(@D)/lua.pc
 endef
 
 define HOST_LUA_BUILD_CMDS
@@ -82,13 +84,14 @@ define HOST_LUA_BUILD_CMDS
 	MYLIBS="$(HOST_LUA_MYLIBS)" \
 	BUILDMODE=static \
 	PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
+	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(HOST_LUA_MYLIBS)/" \
+		package/lua/lua.pc.in > $(@D)/lua.pc
 endef
 
 define LUA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
-	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
-	sed -e "s/@MYLIBS@/$(LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
-		> $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
+	$(INSTALL) -m 0644 -D $(@D)/lua.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
 
 define LUA_INSTALL_TARGET_CMDS
@@ -97,9 +100,8 @@ endef
 
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
index 0000000..0a61d5e
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
