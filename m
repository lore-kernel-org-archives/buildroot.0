From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 11:11:01 -0300
Subject: [Buildroot] [PATCH] redis: use BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <1459174261-25242-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __atomic_fetch_add_4 so libatomic must be pulled in if
necessary. Fixes:
http://autobuild.buildroot.net/results/dfd/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/redis/Config.in |  2 ++
 package/redis/redis.mk  | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/redis/Config.in b/package/redis/Config.in
index 3b7b743..5d7edd8 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_REDIS
 	bool "redis"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Redis is an open source, advanced key-value store. It is
@@ -11,4 +12,5 @@ config BR2_PACKAGE_REDIS
 
 comment "redis needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 6a3dd01..b285ab5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -13,10 +13,18 @@ define REDIS_USERS
 	redis -1 redis -1 * /var/lib/redis /bin/false - Redis Server
 endef
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+REDIS_LIBATOMIC = -latomic
+endif
+
 # Redis doesn't support DESTDIR (yet, see
 # https://github.com/antirez/redis/pull/609).  We set PREFIX
 # instead.
-REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
+REDIS_BUILDOPTS = \
+	CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS) $(REDIS_LIBATOMIC)" \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
 
 define REDIS_BUILD_CMDS
-- 
2.7.3
