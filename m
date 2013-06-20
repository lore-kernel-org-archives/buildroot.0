From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jun 2013 12:04:39 +0200
Subject: [Buildroot] [git commit] luaposix: New package
Message-ID: <20130620125535.8BA559AF47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6618ab94361a978dbbf0545c2ac5cac5be8f64ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Luaposix is a Lua frontend to posix functions.

Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/luaposix/Config.in                         |   11 +++++++++++
 .../luaposix-remove-lua-header-check.patch         |   16 ++++++++++++++++
 package/luaposix/luaposix.mk                       |   15 +++++++++++++++
 4 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2d8c936..0eb6a9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -321,6 +321,7 @@ source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
 source "package/luafilesystem/Config.in"
+source "package/luaposix/Config.in"
 source "package/luasocket/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
new file mode 100644
index 0000000..412e07f
--- /dev/null
+++ b/package/luaposix/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LUAPOSIX
+	bool "luaposix"
+	help
+	  luaposix is a POSIX binding, including curses, for Lua 5.1
+	  and 5.2; Like most libraries it simply binds to C APIs on
+	  the underlying system, so it won't work on a non-POSIX
+	  system. However, it does try to detect the level of POSIX
+	  conformance of the underlying system and bind only available
+	  APIs
+
+	  https://github.com/luaposix/luaposix
diff --git a/package/luaposix/luaposix-remove-lua-header-check.patch b/package/luaposix/luaposix-remove-lua-header-check.patch
new file mode 100644
index 0000000..7909b91
--- /dev/null
+++ b/package/luaposix/luaposix-remove-lua-header-check.patch
@@ -0,0 +1,16 @@
+Checking the Lua version inside the headers requires compiling a small
+C program. However, autoconf will raise an error when attempting to do so
+while cross-compiling. Hence, this specific test is removed.
+
+Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
+--- a/configure.ac	2013-06-20 07:23:27.943091833 +0300
++++ b/configure.ac	2013-06-20 07:23:30.644441710 +0300
+@@ -105,7 +105,7 @@
+ 
+ dnl Lua 5.1 or 5.2
+ AX_PROG_LUA(501, 503)
+ AX_LUA_HEADERS
+-AX_LUA_HEADERS_VERSION(501, 503)
++#AX_LUA_HEADERS_VERSION(501, 503)
+ AC_SUBST(LUA)
+ AC_SUBST(LUA_INCLUDE)
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
new file mode 100644
index 0000000..1d1ee6a
--- /dev/null
+++ b/package/luaposix/luaposix.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# luaposix
+#
+################################################################################
+
+LUAPOSIX_VERSION = 5.1.20
+LUAPOSIX_SITE = https://github.com/downloads/luaposix/luaposix
+LUAPOSIX_LICENSE = MIT
+LUAPOSIX_LICENSE_FILES = COPYING
+LUAPOSIX_DEPENDENCIES = lua host-lua
+LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
+LUAPOSIX_AUTORECONF = YES
+
+$(eval $(autotools-package))
