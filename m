From: Daniel Price <daniel.price@gmail.com>
Date: Mon, 11 Mar 2013 18:47:11 -0700
Subject: [Buildroot] [PATCH v2] new package: redis
Message-ID: <1363052831-17436-1-git-send-email-daniel.price@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Price <daniel.price@gmail.com>
---
 package/Config.in                    |    1 +
 package/redis/Config.in              |   14 ++++++++++
 package/redis/redis-001-uclibc.patch |   45 ++++++++++++++++++++++++++++++++++
 package/redis/redis-002-lua-AR.patch |   32 ++++++++++++++++++++++++
 package/redis/redis.mk               |   28 +++++++++++++++++++++
 5 files changed, 120 insertions(+), 0 deletions(-)
 create mode 100644 package/redis/Config.in
 create mode 100644 package/redis/redis-001-uclibc.patch
 create mode 100644 package/redis/redis-002-lua-AR.patch
 create mode 100644 package/redis/redis.mk

diff --git a/package/Config.in b/package/Config.in
index e46d7a8..0974b4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -396,6 +396,7 @@ menu "Database"
 source "package/berkeleydb/Config.in"
 source "package/gdbm/Config.in"
 source "package/mysql_client/Config.in"
+source "package/redis/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
 endmenu
diff --git a/package/redis/Config.in b/package/redis/Config.in
new file mode 100644
index 0000000..3128c3f
--- /dev/null
+++ b/package/redis/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_REDIS
+	bool "redis"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	help
+	  Redis is an open source, advanced key-value store. It is often referred
+	  to as a data structure server since keys can contain strings, hashes,
+	  lists, sets and sorted sets.
+
+	  http://www.redis.io
+
+comment "redis needs a toolchain with LARGEFILE and thread support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/redis/redis-001-uclibc.patch b/package/redis/redis-001-uclibc.patch
new file mode 100644
index 0000000..d7fd9c3
--- /dev/null
+++ b/package/redis/redis-001-uclibc.patch
@@ -0,0 +1,45 @@
+redis-001-uclibc.patch: This patch fixes redis so that it can be compiled
+against uclibc.  Patch originates from:
+
+  Support cross-compiling for uClibc targets
+  https://github.com/antirez/redis/pull/537
+  Mike Steinert, mike.steinert at gmail.com
+
+Signed-off-by: Daniel Price <daniel.price@gmail.com>
+
+=========================================================================
+diff -ur old/src/config.h new/src/config.h
+--- old/src/config.h	2012-10-26 07:20:24.000000000 -0700
++++ new/src/config.h	2012-10-31 13:41:51.206309564 -0700
+@@ -1,6 +1,10 @@
+ #ifndef __CONFIG_H
+ #define __CONFIG_H
+ 
++#ifdef __unix
++#include <features.h>
++#endif
++
+ #ifdef __APPLE__
+ #include <AvailabilityMacros.h>
+ #endif
+@@ -25,7 +29,7 @@
+ #endif
+ 
+ /* Test for backtrace() */
+-#if defined(__APPLE__) || defined(__linux__)
++#if (defined(__APPLE__) || defined(__linux__) && !defined(__UCLIBC__))
+ #define HAVE_BACKTRACE 1
+ #endif
+ 
+diff -ur old/src/Makefile new/src/Makefile
+--- old/src/Makefile	2012-10-26 07:20:24.000000000 -0700
++++ new/src/Makefile	2012-10-31 13:40:39.224728830 -0700
+@@ -135,7 +135,7 @@
+ 	echo REDIS_LDFLAGS=$(REDIS_LDFLAGS) >> .make-settings
+ 	echo PREV_FINAL_CFLAGS=$(FINAL_CFLAGS) >> .make-settings
+ 	echo PREV_FINAL_LDFLAGS=$(FINAL_LDFLAGS) >> .make-settings
+-	-(cd ../deps && $(MAKE) $(DEPENDENCY_TARGETS))
++	-(cd ../deps && $(MAKE) CC=$(CC) $(DEPENDENCY_TARGETS))
+ 
+ .PHONY: persist-settings
+ 
diff --git a/package/redis/redis-002-lua-AR.patch b/package/redis/redis-002-lua-AR.patch
new file mode 100644
index 0000000..68ee70c
--- /dev/null
+++ b/package/redis/redis-002-lua-AR.patch
@@ -0,0 +1,32 @@
+
+redis-002-lua-AR.patch: Improve redis Makefiles to handle Lua's unusual
+definition of AR.  Patch originates from:
+
+  Define AR to help with lua cross-compilation
+  https://github.com/antirez/redis/pull/997
+  Daniel Price, daniel.price at gmail.com
+
+Signed-off-by: Daniel Price <daniel.price@gmail.com>
+
+=========================================================================
+diff --git a/deps/Makefile b/deps/Makefile
+index d58ee56..c9d7116 100644
+--- a/deps/Makefile
++++ b/deps/Makefile
+@@ -60,10 +60,15 @@ endif
+ 
+ LUA_CFLAGS+= -O2 -Wall -DLUA_ANSI $(CFLAGS)
+ LUA_LDFLAGS+= $(LDFLAGS)
++# lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
++# challenging to cross-compile lua (and redis).  These defines make it easier
++# to fit redis into cross-compilation environments, which typically set AR.
++AR = ar
++ARFLAGS = rcu
+ 
+ lua: .make-prerequisites
+ 	@printf '%b %b\n' $(MAKECOLOR)MAKE$(ENDCOLOR) $(BINCOLOR)$@$(ENDCOLOR)
+-	cd lua/src && $(MAKE) all CFLAGS="$(LUA_CFLAGS)" MYLDFLAGS="$(LUA_LDFLAGS)"
++	cd lua/src && $(MAKE) all CFLAGS="$(LUA_CFLAGS)" MYLDFLAGS="$(LUA_LDFLAGS)" AR="$(AR) $(ARFLAGS)"
+ 
+ .PHONY: lua
+ 
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
new file mode 100644
index 0000000..1fb16bc
--- /dev/null
+++ b/package/redis/redis.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# redis
+#
+#############################################################
+
+REDIS_VERSION = 2.6.11
+REDIS_SOURCE = redis-$(REDIS_VERSION).tar.gz
+REDIS_SITE = http://redis.googlecode.com/files
+REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
+REDIS_LICENSE_FILES = COPYING
+
+# Redis doesn't support DESTDIR (yet, see
+# https://github.com/antirez/redis/pull/609).  We set PREFIX
+# instead.
+REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
+    PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
+
+define REDIS_BUILD_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
+endef
+
+define REDIS_INSTALL_TARGET_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) \
+	    LDCONFIG=true install
+endef
+
+$(eval $(generic-package))
-- 
1.7.6.5
