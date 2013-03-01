From: Daniel Price <daniel.price@gmail.com>
Date: Fri,  1 Mar 2013 15:03:19 -0800
Subject: [Buildroot] [PATCH V2] new package: redis
In-Reply-To: <1362178612-16168-1-git-send-email-daniel.price@gmail.com>
References: <1362178612-16168-1-git-send-email-daniel.price@gmail.com>
Message-ID: <1362178999-16577-1-git-send-email-daniel.price@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Price <daniel.price@gmail.com>
---
 package/Config.in                           |    1 +
 package/redis/Config.in                     |   11 +++++++
 package/redis/redis-2.6.10-001-uclibc.patch |   43 +++++++++++++++++++++++++++
 package/redis/redis.mk                      |   28 +++++++++++++++++
 4 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 package/redis/Config.in
 create mode 100644 package/redis/redis-2.6.10-001-uclibc.patch
 create mode 100644 package/redis/redis.mk

diff --git a/package/Config.in b/package/Config.in
index a169505..cc08713 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ menu "Database"
 source "package/berkeleydb/Config.in"
 source "package/gdbm/Config.in"
 source "package/mysql_client/Config.in"
+source "package/redis/Config.in"
 source "package/sqlcipher/Config.in"
 source "package/sqlite/Config.in"
 endmenu
diff --git a/package/redis/Config.in b/package/redis/Config.in
new file mode 100644
index 0000000..05dacc7
--- /dev/null
+++ b/package/redis/Config.in
@@ -0,0 +1,11 @@
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
diff --git a/package/redis/redis-2.6.10-001-uclibc.patch b/package/redis/redis-2.6.10-001-uclibc.patch
new file mode 100644
index 0000000..22206eb
--- /dev/null
+++ b/package/redis/redis-2.6.10-001-uclibc.patch
@@ -0,0 +1,43 @@
+redis-2.6.2-uclibc.patch: This patch fixes redis so that it can be
+compiled against uclibc.  Patch originates from:
+
+  https://github.com/antirez/redis/pull/537
+  Mike Steinert, mike.steinert at gmail.com
+
+Signed-off-by: Daniel Price <daniel.price@gmail.com>
+
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
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
new file mode 100644
index 0000000..04738ec
--- /dev/null
+++ b/package/redis/redis.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# redis
+#
+#############################################################
+
+REDIS_VERSION = 2.6.10
+REDIS_SOURCE = redis-$(REDIS_VERSION).tar.gz
+REDIS_SITE = http://redis.googlecode.com/files
+REDIS_LICENSE = BSD-3c
+REDIS_LICENSE_FILES = COPYING
+
+# Redis doesn't support DESTDIR (yet, see
+# https://github.com/antirez/redis/pull/609).  We set PREFIX
+# instead.
+REDIS_BUILDOPTS = MALLOC=libc CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+    PREFIX=$(TARGET_DIR)/usr
+
+define REDIS_BUILD_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(REDIS_BUILDOPTS)
+endef
+
+define REDIS_INSTALL_TARGET_CMDS
+        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(REDIS_BUILDOPTS) \
+	    LDCONFIG=true install
+endef
+
+$(eval $(generic-package))
-- 
1.7.6.5
