From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:05:48 +0100
Subject: [Buildroot] [git commit] package/lua-std-normalize: new package
Message-ID: <20181230140132.E49BD838CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43780ca1b2c321de7c3c328dcdf58ab9c591b97f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas:
 - add entry to DEVELOPERS file
 - drop useless dependency in Config.in
 - fix path to license file
 - add hash of license file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/lua-std-normalize/Config.in              | 12 ++++++++++++
 package/lua-std-normalize/lua-std-normalize.hash |  3 +++
 package/lua-std-normalize/lua-std-normalize.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e62a445859..fffa21ac6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1001,6 +1001,7 @@ F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
 F:	package/lua-std-debug/
+F:	package/lua-std-normalize/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-jinja2/
diff --git a/package/Config.in b/package/Config.in
index f33aaf91e9..eaf3c046bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -625,6 +625,7 @@ menu "Lua libraries/modules"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-sdl2/Config.in"
 	source "package/lua-std-debug/Config.in"
+	source "package/lua-std-normalize/Config.in"
 	source "package/lua-stdlib/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-utf8/Config.in"
diff --git a/package/lua-std-normalize/Config.in b/package/lua-std-normalize/Config.in
new file mode 100644
index 0000000000..35d0a113a9
--- /dev/null
+++ b/package/lua-std-normalize/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LUA_STD_NORMALIZE
+	bool "lua-std-normalize"
+	select BR2_PACKAGE_LUA_STD_DEBUG # runtime
+	help
+	  This module can inject deterministic versions of core Lua
+	  functions that do not behave identically across all
+	  supported Lua implementations into your module's lexical
+	  environment.  Each function is as thin and fast a version as
+	  is possible in each Lua implementation, evaluating to the
+	  Lua C implementation with no overhead when semantics allow.
+
+	  https://lua-stdlib.github.io/normalize
diff --git a/package/lua-std-normalize/lua-std-normalize.hash b/package/lua-std-normalize/lua-std-normalize.hash
new file mode 100644
index 0000000000..7c11f4914c
--- /dev/null
+++ b/package/lua-std-normalize/lua-std-normalize.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 50baac6fbcbc6bbe72b63ce0871ec36176d75c04dccc6e368590ba6ef107c67a  std.normalize-2.0.2-1.src.rock
+sha256 a6a0a0ddc04f7437806a52cbd637c819144df7626a2e8a496cd3a2e20c8effb3  normalize-2.0.2/LICENSE.md
diff --git a/package/lua-std-normalize/lua-std-normalize.mk b/package/lua-std-normalize/lua-std-normalize.mk
new file mode 100644
index 0000000000..d3a58aa0d4
--- /dev/null
+++ b/package/lua-std-normalize/lua-std-normalize.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-std-normalize
+#
+################################################################################
+
+LUA_STD_NORMALIZE_VERSION_UPSTREAM = 2.0.2
+LUA_STD_NORMALIZE_VERSION = $(LUA_STD_NORMALIZE_VERSION_UPSTREAM)-1
+LUA_STD_NORMALIZE_NAME_UPSTREAM = std.normalize
+LUA_STD_NORMALIZE_SUBDIR = normalize-$(LUA_STD_NORMALIZE_VERSION_UPSTREAM)
+LUA_STD_NORMALIZE_LICENSE = MIT
+LUA_STD_NORMALIZE_LICENSE_FILES = $(LUA_STD_NORMALIZE_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
