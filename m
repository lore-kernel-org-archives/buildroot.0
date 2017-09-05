From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:48:11 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] lua: fix pkg-config file
Message-ID: <20170905220138.DE28E80466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a11ca9c6d3a062dadcdf0b7faad43ae2d92f35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

When Lua is linked with additional libraries, these libraries should go
into the pkg-config file as well.

Otherwise, linking swupdate with the lua library fails:

```
/home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlopen'
/home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlclose'
/home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlerror'
/home/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/liblua.so: undefined reference to `dlsym'
```

Fixes http://autobuild.buildroot.net/results/1c3/1c349cc5904868e4def292b9fbfa164828e46156

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8d845683e37640d33c186c0091ccce6ae3ef0777)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.2.4/0004-lua-pc.patch | 4 +++-
 package/lua/5.3.4/0004-lua-pc.patch | 4 +++-
 package/lua/lua.mk                  | 8 ++++----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/lua/5.2.4/0004-lua-pc.patch b/package/lua/5.2.4/0004-lua-pc.patch
index 62acb20..31ff611 100644
--- a/package/lua/5.2.4/0004-lua-pc.patch
+++ b/package/lua/5.2.4/0004-lua-pc.patch
@@ -1,6 +1,8 @@
 add lua.pc
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[J??rg Krause: add @MYLIBS@]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
 
 Index: b/etc/lua.pc
 ===================================================================
@@ -34,7 +36,7 @@ Index: b/etc/lua.pc
 +Description: An Extensible Extension Language
 +Version: ${R}
 +Requires: 
-+Libs: -L${libdir} -llua -lm
++Libs: -L${libdir} -llua -lm @MYLIBS@
 +Cflags: -I${includedir}
 +
 +# (end of lua.pc)
diff --git a/package/lua/5.3.4/0004-lua-pc.patch b/package/lua/5.3.4/0004-lua-pc.patch
index 615a7db..1125832 100644
--- a/package/lua/5.3.4/0004-lua-pc.patch
+++ b/package/lua/5.3.4/0004-lua-pc.patch
@@ -1,6 +1,8 @@
 add lua.pc
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[J??rg Krause: add @MYLIBS@]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
 
 Index: b/etc/lua.pc
 ===================================================================
@@ -34,7 +36,7 @@ Index: b/etc/lua.pc
 +Description: An Extensible Extension Language
 +Version: ${R}
 +Requires:
-+Libs: -L${libdir} -llua -lm
++Libs: -L${libdir} -llua -lm @MYLIBS@
 +Cflags: -I${includedir}
 +
 +# (end of lua.pc)
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index bc0a9d4..3d0796e 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -86,8 +86,8 @@ endef
 
 define LUA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) INSTALL_TOP="$(STAGING_DIR)/usr" -C $(@D) install
-	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
+	sed -e "s/@MYLIBS@/$(LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
+		> $(STAGING_DIR)/usr/lib/pkgconfig/lua.pc
 endef
 
 define LUA_INSTALL_TARGET_CMDS
@@ -96,8 +96,8 @@ endef
 
 define HOST_LUA_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) INSTALL_TOP="$(HOST_DIR)/usr" -C $(@D) install
-	$(INSTALL) -m 0644 -D $(@D)/etc/lua.pc \
-		$(HOST_DIR)/usr/lib/pkgconfig/lua.pc
+	sed -e "s/@MYLIBS@/$(HOST_LUA_MYLIBS)/g" $(@D)/etc/lua.pc \
+		> $(HOST_DIR)/lib/pkgconfig/lua.pc
 endef
 
 $(eval $(generic-package))
