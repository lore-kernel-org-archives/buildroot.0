From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jun 2013 23:24:39 +0200
Subject: [Buildroot] [git commit] luaexpatutils: New package
Message-ID: <20130619212701.46E239AF75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b20c1aa33638bdf6cbcddd7a01ce6a78e25a382
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lxp.doc is a module that provides useful features for working with XML
formats in LOM format as used by the LuaExpat project from Kepler.

[Peter: use fixed git revision, github tarball, install -D]
Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/luaexpatutils/Config.in        |    8 ++++++++
 package/luaexpatutils/luaexpatutils.mk |   21 +++++++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 426004b..2d8c936 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -319,6 +319,7 @@ source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
 source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
+source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
 source "package/luasocket/Config.in"
 source "package/lua-ev/Config.in"
diff --git a/package/luaexpatutils/Config.in b/package/luaexpatutils/Config.in
new file mode 100644
index 0000000..cb2887a
--- /dev/null
+++ b/package/luaexpatutils/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUAEXPATUTILS
+	bool "luaexpatutils"
+	select BR2_PACKAGE_LUAEXPAT
+	help
+	  lxp.doc is a module that provides useful features for working with
+	  XML formats in LOM format as used by the LuaExpat project from Kepler.
+
+	  https://github.com/stevedonovan/LuaExpatUtils
diff --git a/package/luaexpatutils/luaexpatutils.mk b/package/luaexpatutils/luaexpatutils.mk
new file mode 100644
index 0000000..79578c0
--- /dev/null
+++ b/package/luaexpatutils/luaexpatutils.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# luaexpatutils
+#
+#############################################################
+
+LUAEXPATUTILS_VERSION = 88c228365b
+LUAEXPATUTILS_SITE = http://github.com/stevedonovan/LuaExpatUtils/tarball/$(LUAEXPATUTILS_VERSION)
+LUAEXPATUTILS_LICENSE = Public Domain
+LUAEXPATUTILS_DEPENDENCIES = luaexpat
+
+define LUAEXPATUTILS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/lua/doc.lua \
+		$(TARGET_DIR)/usr/share/lua/lxp/doc.lua
+endef
+
+define LUAEXPATUTILS_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/share/lua/lxp/doc.lua
+endef
+
+$(eval $(generic-package))
