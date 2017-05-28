From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:26:56 +0200
Subject: [Buildroot] [git commit] package/redis: fix static linking with
	libatomic
Message-ID: <20170528143520.22CAF81DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=019ad605670670a51055fb5d27a2a1f374a33289
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/7f1/7f1ecccbfdb6bd95824d9c884f1577e71e0e1e09/
http://autobuild.buildroot.net/results/c0b/c0b1bdcc5fbddf8b996b923015184d753882d4b8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas:
 - improve comment to explain the fix
 - remove useless LDFLAGS related code]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/redis.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 3f4956c..458ed4f 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -13,16 +13,21 @@ define REDIS_USERS
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
 	PREFIX=$(TARGET_DIR)/usr MALLOC=libc
 
 define REDIS_BUILD_CMDS
