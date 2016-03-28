From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 22:41:02 +0200
Subject: [Buildroot] [git commit] redis: use BR2_TOOLCHAIN_HAS_LIBATOMIC
Message-ID: <20160328210554.6111C81851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=339048ba661578463f323a60ebe28c6ca4f9ed95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses __atomic_fetch_add_4 so libatomic must be pulled in if
necessary. Fixes:
http://autobuild.buildroot.net/results/dfd/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/

[Peter: keep TARGET_CONFIGURE_OPTS]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/Config.in | 2 ++
 package/redis/redis.mk  | 6 ++++++
 2 files changed, 8 insertions(+)

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
index 6a3dd01..a9df6e7 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -13,10 +13,16 @@ define REDIS_USERS
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
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
+	LDFLAGS="$(TARGET_LDFLAGS) $(REDIS_LIBATOMIC)" \
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
 
 define REDIS_BUILD_CMDS
