From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Feb 2014 11:52:30 +0100
Subject: [Buildroot] [PATCH] ljlinenoise: new package
Message-ID: <1391251950-19923-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |    1 +
 package/ljlinenoise/Config.in      |   15 +++++++++++++++
 package/ljlinenoise/ljlinenoise.mk |   13 +++++++++++++
 package/luarocks/luarocks.mk       |    1 +
 4 files changed, 30 insertions(+)
 create mode 100644 package/ljlinenoise/Config.in
 create mode 100644 package/ljlinenoise/ljlinenoise.mk

diff --git a/package/Config.in b/package/Config.in
index 631d8b2..ec9086c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -369,6 +369,7 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
+source "package/ljlinenoise/Config.in"
 source "package/ljsyscall/Config.in"
 source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
new file mode 100644
index 0000000..3d2af35
--- /dev/null
+++ b/package/ljlinenoise/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LJLINENOISE
+	bool "ljlinenoise"
+	select BR2_PACKAGE_LJSYSCALL
+	# ljsyscall is specifically for LuaJIT, not Lua.
+	depends on BR2_PACKAGE_LUAJIT
+	# ljsyscall is only available for some target architectures
+	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb
+	help
+	  ljlinenoise is a pure LuaJIT port of linenoise,
+	  a small alternative to readline and libedit.
+
+	  http://fperrad.github.io/ljlinenoise/
+
+comment "ljlinenoise needs LuaJIT"
+	depends on !BR2_PACKAGE_LUAJIT && (BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_arm || BR2_armeb)
diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
new file mode 100644
index 0000000..69f6130
--- /dev/null
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# ljlinenoise
+#
+################################################################################
+
+LJLINENOISE_VERSION_UPSTREAM = 0.1.1
+LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
+LJLINENOISE_SUBDIR  = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
+LJLINENOISE_LICENSE = MIT
+LJLINENOISE_LICENSE_FILES = $(LJLINENOISE_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 88ab22a..86e57d2 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -37,6 +37,7 @@ define HOST_LUAROCKS_INSTALL_CMDS
 	echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"  >> $(LUAROCKS_CONFIG_FILE)
 	echo "gcc_rpath = false"                                >> $(LUAROCKS_CONFIG_FILE)
 	echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"          >> $(LUAROCKS_CONFIG_FILE)
+	echo "wrap_bin_scripts = false"                         >> $(LUAROCKS_CONFIG_FILE)
 endef
 
 $(eval $(host-generic-package))
-- 
1.7.9.5
