From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:53:06 +0100
Subject: [Buildroot] [git commit] lua-bit32: new package
Message-ID: <20170302215348.871B37FAA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=276f4fd56208fc496f5c5739d347fbd05bba7108
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is needed to make luaposix work.

The upstream name is just "bit32", but the luarocks infra doesn't
support an upstream name different from the Buildroot name. We therefore
have to explicitly set all variables and we need custom extract
commands.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Thomas:
 - add entry to DEVELOPERS file
 - remove useless "depends on BR2_PACKAGE_HAS_LUAINTERPRETER" in
   Config.in file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/lua-bit32/Config.in      |  8 ++++++++
 package/lua-bit32/lua-bit32.hash |  2 ++
 package/lua-bit32/lua-bit32.mk   | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bf07c3..678a9a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -106,6 +106,7 @@ N:	Arnout Vandecappelle <arnout@mind.be>
 F:	package/freescale-imx/firmware-imx/
 F:	package/freescale-imx/imx-lib/
 F:	package/gstreamer/gst-fsl-plugins/
+F:	package/lua-bit32/
 F:	package/owfs/
 F:	package/python-bottle/
 F:	package/sqlcipher/
diff --git a/package/Config.in b/package/Config.in
index 69c772b..ff79fdf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -537,6 +537,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-bit32/Config.in"
 	source "package/lua-cjson/Config.in"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
diff --git a/package/lua-bit32/Config.in b/package/lua-bit32/Config.in
new file mode 100644
index 0000000..f896940
--- /dev/null
+++ b/package/lua-bit32/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_BIT32
+	bool "lua-bit32"
+	help
+	  bit32 is the native Lua 5.2 bit manipulation library, in the
+	  version from Lua 5.3; it is compatible with Lua 5.1, 5.2 and
+	  5.3.
+
+	  http://www.lua.org/manual/5.2/manual.html#6.7
diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
new file mode 100644
index 0000000..21dbd05
--- /dev/null
+++ b/package/lua-bit32/lua-bit32.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fe7bc70d1e48183d95ccfb6741e70a676283075173122cb161303d77059b27a6  bit32-5.3.0-1.src.rock
diff --git a/package/lua-bit32/lua-bit32.mk b/package/lua-bit32/lua-bit32.mk
new file mode 100644
index 0000000..8304d6e
--- /dev/null
+++ b/package/lua-bit32/lua-bit32.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# lua-bit32
+#
+################################################################################
+
+LUA_BIT32_VERSION = 5.3.0-1
+LUA_BIT32_SUBDIR = lua-compat-5.2
+LUA_BIT32_ROCKSPEC = bit32-$(LUA_BIT32_VERSION).rockspec
+LUA_BIT32_SOURCE = bit32-$(LUA_BIT32_VERSION).src.rock
+LUA_BIT32_LICENSE = MIT
+LUA_BIT32_LICENSE_FILES = $(LUA_BIT32_SUBDIR)/LICENSE
+
+define LUA_BIT32_EXTRACT_CMDS
+        cd $(LUA_BIT32_DIR) && \
+                $(LUAROCKS_RUN_ENV) $(LUAROCKS_RUN_CMD) unpack --force $(DL_DIR)/$(LUA_BIT32_SOURCE) && \
+		mv bit32-$(LUA_BIT32_VERSION)/* .
+endef
+
+$(eval $(luarocks-package))
