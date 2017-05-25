From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 09:19:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: fix static linking with
	libatomic
Message-ID: <20170525071934.31057-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/7f1/7f1ecccbfdb6bd95824d9c884f1577e71e0e1e09/
http://autobuild.buildroot.net/results/c0b/c0b1bdcc5fbddf8b996b923015184d753882d4b8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/redis/redis.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 3f4956cf3..2a5012812 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -14,8 +14,14 @@ define REDIS_USERS
 endef
 
 # Uses __atomic_fetch_add_4
+# src/Makefile contains a wrong linking order which breaks linking
+# for static builds. We need to add -latomic to FINAL_LIBS to provide
+# -latomic at the correct place in the linking command.
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-REDIS_LIBATOMIC = -latomic
+define REDIS_FIX_MAKEFILE
+	$(SED) 's/FINAL_LIBS=-lm/FINAL_LIBS=-lm -latomic/' $(@D)/src/Makefile
+endef
+REDIS_POST_PATCH_HOOKS = REDIS_FIX_MAKEFILE
 endif
 
 # Redis doesn't support DESTDIR (yet, see
-- 
2.11.0
