From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:24:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/redis: fix static
	linking with libatomic
Message-ID: <20170601144623.C906882A11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=667c418a244f022e54f92f8946a91d50cee61ebc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes
http://autobuild.buildroot.net/results/7f1/7f1ecccbfdb6bd95824d9c884f1577e71e0e1e09/
http://autobuild.buildroot.net/results/c0b/c0b1bdcc5fbddf8b996b923015184d753882d4b8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - improve comment to explain the fix
 - remove useless LDFLAGS related code]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 019ad605670670a51055fb5d27a2a1f374a33289)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.mk | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8ab6e72..c16bd23 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -13,17 +13,22 @@ define REDIS_USERS
 	redis -1 redis -1 * /var/lib/redis /bin/false - Redis Server
 endef
 
-# Uses __atomic_fetch_add_4
+# Uses __atomic_fetch_add_4. Adding -latomic to LDFLAGS does not work,
+# because LDFLAGS is used before the list of object files. We need to
+# add -latomic to FINAL_LIBS to provide -latomic at the correct place
+# in the linking command.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-REDIS_LIBATOMIC = -latomic
+define REDIS_FIX_MAKEFILE
+	$(SED) 's/FINAL_LIBS=-lm/FINAL_LIBS=-lm -latomic/' $(@D)/src/Makefile
+endef
+REDIS_POST_PATCH_HOOKS = REDIS_FIX_MAKEFILE
 endif
 
 # Redis doesn't support DESTDIR (yet, see
 # https://github.com/antirez/redis/pull/609).  We set PREFIX
 # instead.
 REDIS_BUILDOPTS = $(TARGET_CONFIGURE_OPTS) \
-	LDFLAGS="$(TARGET_LDFLAGS) $(REDIS_LIBATOMIC)" \
-	PREFIX=$(TARGET_DIR)/usr MALLOC=libc \
+	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
 define REDIS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
