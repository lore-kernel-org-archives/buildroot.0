From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:31:53 +0200
Subject: [Buildroot] [git commit] luaposix: bump to version 31
Message-ID: <20130919193857.DF4A19B433@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55b081505528e63566ed29d3e61becc40c8a920a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Releases are no longer named 5.1.X, just the X portion remains now.

Fixes autoreconf issues with the automake bump, however since the patch
is no longer required that's not an issue now.

[Peter: now needs IPv6]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luaposix/Config.in                         |    4 ++++
 .../luaposix-remove-lua-header-check.patch         |   16 ----------------
 package/luaposix/luaposix.mk                       |    6 +++---
 3 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 412e07f..5829282 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
+	depends on BR2_INET_IPV6
 	help
 	  luaposix is a POSIX binding, including curses, for Lua 5.1
 	  and 5.2; Like most libraries it simply binds to C APIs on
@@ -9,3 +10,6 @@ config BR2_PACKAGE_LUAPOSIX
 	  APIs
 
 	  https://github.com/luaposix/luaposix
+
+comment "luaposix requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/luaposix/luaposix-remove-lua-header-check.patch b/package/luaposix/luaposix-remove-lua-header-check.patch
deleted file mode 100644
index 7909b91..0000000
--- a/package/luaposix/luaposix-remove-lua-header-check.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Checking the Lua version inside the headers requires compiling a small
-C program. However, autoconf will raise an error when attempting to do so
-while cross-compiling. Hence, this specific test is removed.
-
-Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---- a/configure.ac	2013-06-20 07:23:27.943091833 +0300
-+++ b/configure.ac	2013-06-20 07:23:30.644441710 +0300
-@@ -105,7 +105,7 @@
- 
- dnl Lua 5.1 or 5.2
- AX_PROG_LUA(501, 503)
- AX_LUA_HEADERS
--AX_LUA_HEADERS_VERSION(501, 503)
-+#AX_LUA_HEADERS_VERSION(501, 503)
- AC_SUBST(LUA)
- AC_SUBST(LUA_INCLUDE)
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 1d1ee6a..ff99127 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 5.1.20
-LUAPOSIX_SITE = https://github.com/downloads/luaposix/luaposix
+LUAPOSIX_VERSION = 31
+LUAPOSIX_SITE = https://github.com/luaposix/luaposix/archive
+LUAPOSIX_SOURCE = release-v$(LUAPOSIX_VERSION).tar.gz
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = lua host-lua
 LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
-LUAPOSIX_AUTORECONF = YES
 
 $(eval $(autotools-package))
