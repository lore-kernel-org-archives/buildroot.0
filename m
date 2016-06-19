From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Jun 2016 23:58:35 -0300
Subject: [Buildroot] [PATCH] memcached: bump to version 1.4.26
Message-ID: <1466305115-29211-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch, and now uses 64 bit sync built-ins for atomics.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../memcached/0001-fix-build-with-musl-libc.patch  | 78 ----------------------
 package/memcached/Config.in                        |  2 +
 package/memcached/memcached.hash                   |  6 +-
 package/memcached/memcached.mk                     |  2 +-
 4 files changed, 6 insertions(+), 82 deletions(-)
 delete mode 100644 package/memcached/0001-fix-build-with-musl-libc.patch

diff --git a/package/memcached/0001-fix-build-with-musl-libc.patch b/package/memcached/0001-fix-build-with-musl-libc.patch
deleted file mode 100644
index 0683820..0000000
--- a/package/memcached/0001-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 2137a608c77c467200d73469f723ba97ff6b3511 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Mon, 18 Jan 2016 12:11:48 +0100
-Subject: [PATCH] fix build with musl libc
-
-musl libc will warn if you include sys/signal.h instead of signal.h as
-specified by posix. Build will fail due to -Werror explicitly beeing
-set.
-
-Fix it by use the posix location.
-
-fixes #138
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: pending (https://github.com/memcached/memcached/pull/139)
-
- assoc.c | 2 +-
- items.c | 2 +-
- slabs.c | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/assoc.c b/assoc.c
-index e6cf09b64e8c..9fff38fe01d6 100644
---- a/assoc.c
-+++ b/assoc.c
-@@ -14,8 +14,8 @@
- #include "memcached.h"
- #include <sys/stat.h>
- #include <sys/socket.h>
--#include <sys/signal.h>
- #include <sys/resource.h>
-+#include <signal.h>
- #include <fcntl.h>
- #include <netinet/in.h>
- #include <errno.h>
-diff --git a/items.c b/items.c
-index 199dc9fa6e6b..7040777ab0fb 100644
---- a/items.c
-+++ b/items.c
-@@ -2,13 +2,13 @@
- #include "memcached.h"
- #include <sys/stat.h>
- #include <sys/socket.h>
--#include <sys/signal.h>
- #include <sys/resource.h>
- #include <fcntl.h>
- #include <netinet/in.h>
- #include <errno.h>
- #include <stdlib.h>
- #include <stdio.h>
-+#include <signal.h>
- #include <string.h>
- #include <time.h>
- #include <assert.h>
-diff --git a/slabs.c b/slabs.c
-index 31e85f6ec21d..bfafe5d0fdde 100644
---- a/slabs.c
-+++ b/slabs.c
-@@ -10,7 +10,6 @@
- #include "memcached.h"
- #include <sys/stat.h>
- #include <sys/socket.h>
--#include <sys/signal.h>
- #include <sys/resource.h>
- #include <fcntl.h>
- #include <netinet/in.h>
-@@ -18,6 +17,7 @@
- #include <stdlib.h>
- #include <stdio.h>
- #include <string.h>
-+#include <signal.h>
- #include <assert.h>
- #include <pthread.h>
- 
--- 
-2.8.0.rc3
-
diff --git a/package/memcached/Config.in b/package/memcached/Config.in
index e011d08..901ecf2 100644
--- a/package/memcached/Config.in
+++ b/package/memcached/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MEMCACHED
 	bool "memcached"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Memcached is an in-memory key-value store for small chunks
@@ -13,3 +14,4 @@ config BR2_PACKAGE_MEMCACHED
 comment "memcached needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_8
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index ed330cf..096431c 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.25.tar.gz.sha1
-sha1	7fd0ba9283c61204f196638ecf2e9295688b2314	memcached-1.4.25.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.26.tar.gz.sha1
+sha1	f0d4f89ead2ac48c6b9e8070178279c0a3d45559	memcached-1.4.26.tar.gz
 # Calculated based on the hash above
-sha256	f058437b3c224d321919a9a6bb4e3eedb2312ed718c0caf087ff2f04ab795dda	memcached-1.4.25.tar.gz
+sha256	4a67800277eec2e523c51d5f620c416e7d0acfde90beacaa26d8e4f6976b43f6	memcached-1.4.26.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index b0753e4..bab5a84 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.25
+MEMCACHED_VERSION = 1.4.26
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.7.3
