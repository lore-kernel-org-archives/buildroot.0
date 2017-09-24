From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 18:18:59 +0200
Subject: [Buildroot] [PATCH 6/6] lua-http: new package
In-Reply-To: <20170924161859.10994-1-francois.perrad@gadz.org>
References: <20170924161859.10994-1-francois.perrad@gadz.org>
Message-ID: <20170924161859.10994-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/lua-http/Config.in     | 18 ++++++++++++++++++
 package/lua-http/lua-http.hash |  2 ++
 package/lua-http/lua-http.mk   | 14 ++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/lua-http/Config.in
 create mode 100644 package/lua-http/lua-http.hash
 create mode 100644 package/lua-http/lua-http.mk

diff --git a/package/Config.in b/package/Config.in
index 2e3339a91..6ab9a7541 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -583,6 +583,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
+	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
new file mode 100644
index 000000000..dabeccfcf
--- /dev/null
+++ b/package/lua-http/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LUA_HTTP
+	bool "lua-http"
+	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
+	# These are runtime dependencies
+	select BR2_PACKAGE_LPEG_PATTERNS
+	select BR2_PACKAGE_LUA_BASEXX
+	select BR2_PACKAGE_LUA_COMPAT53 if !BR2_PACKAGE_LUA_5_3
+	select BR2_PACKAGE_LUA_CQUEUES
+	select BR2_PACKAGE_LUA_FIFO
+	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
+	select BR2_PACKAGE_LUAOSSL
+	help
+	  HTTP library for Lua
+
+	  https://daurnimator.github.io/lua-http/
+
+comment "lua-http needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lua-http/lua-http.hash b/package/lua-http/lua-http.hash
new file mode 100644
index 000000000..2346ab97a
--- /dev/null
+++ b/package/lua-http/lua-http.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d68591eeeeb60c4187469eae89f5bad02d753a8c0adaa460d453b0734222645a  http-0.2-0.src.rock
diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
new file mode 100644
index 000000000..9bc416b8a
--- /dev/null
+++ b/package/lua-http/lua-http.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-http
+#
+################################################################################
+
+LUA_HTTP_VERSION_UPSTREAM = 0.2
+LUA_HTTP_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)-0
+LUA_HTTP_NAME_UPSTREAM = http
+LUA_HTTP_SUBDIR = lua-http-$(LUA_HTTP_VERSION_UPSTREAM)
+LUA_HTTP_LICENSE = MIT
+LUA_HTTP_LICENSE_FILES = $(LUA_HTTP_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
-- 
2.11.0
