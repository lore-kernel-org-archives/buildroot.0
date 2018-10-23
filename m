From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Oct 2018 21:55:21 +0200
Subject: [Buildroot] [PATCH 1/1] redis: needs dynamic library
Message-ID: <20181023195521.22600-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dlfcn.h is included in src/debug.c and src/module.c
module.c uses dlopen function

Fixes:
 - http://autobuild.buildroot.org/results/fdda0ee7461dfc9ea479d4d80ab42c50006a3b13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/redis/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/redis/Config.in b/package/redis/Config.in
index 5d7edd8139..2450ccdf7f 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_REDIS
 	bool "redis"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
@@ -10,7 +11,7 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ threads"
+comment "redis needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.17.1
