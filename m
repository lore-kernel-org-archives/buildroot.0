From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:49:55 +0200
Subject: [Buildroot] [git commit] lua-http: new package
Message-ID: <20171011214239.B2A687FAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4db3e5e94bab0682744da709bfe7cdb8f8d42a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |  1 +
 package/lua-http/Config.in     | 18 ++++++++++++++++++
 package/lua-http/lua-http.hash |  2 ++
 package/lua-http/lua-http.mk   | 14 ++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2b05351..aa0f2d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -588,6 +588,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
+	source "package/lua-http/Config.in"
 	source "package/lua-iconv/Config.in"
 	source "package/lua-lpeg-patterns/Config.in"
 	source "package/lua-markdown/Config.in"
diff --git a/package/lua-http/Config.in b/package/lua-http/Config.in
new file mode 100644
index 0000000..247cc40
--- /dev/null
+++ b/package/lua-http/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LUA_HTTP
+	bool "lua-http"
+	depends on BR2_TOOLCHAIN_HAS_THREADS    # luaossl & lua-cqueues
+	# These are runtime dependencies
+	select BR2_PACKAGE_LUA_BASEXX
+	select BR2_PACKAGE_LUA_COMPAT53 if !BR2_PACKAGE_LUA_5_3
+	select BR2_PACKAGE_LUA_CQUEUES
+	select BR2_PACKAGE_LUA_FIFO
+	select BR2_PACKAGE_LUA_LPEG_PATTERNS
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
index 0000000..2346ab9
--- /dev/null
+++ b/package/lua-http/lua-http.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d68591eeeeb60c4187469eae89f5bad02d753a8c0adaa460d453b0734222645a  http-0.2-0.src.rock
diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
new file mode 100644
index 0000000..9bc416b
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
