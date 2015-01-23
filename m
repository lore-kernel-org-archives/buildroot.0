From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Jan 2015 16:45:38 +0100
Subject: [Buildroot] [git commit] redis: bump to version 2.8.19
Message-ID: <20150123155105.906B880E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d226500192dcac84e5fdeba6867ee51ceb402c4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file.
Drop redis-002-lua-AR.patch (upstream).
Rename patches to new naming convention.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{redis-001-uclibc.patch => 0001-uclibc.patch}  |    0
 ...tch => 0002-largefile-conditional-define.patch} |    0
 package/redis/Config.in                            |    6 ++-
 package/redis/redis-002-lua-AR.patch               |   32 --------------------
 package/redis/redis.hash                           |    2 +
 package/redis/redis.mk                             |    2 +-
 6 files changed, 7 insertions(+), 35 deletions(-)

diff --git a/package/redis/redis-001-uclibc.patch b/package/redis/0001-uclibc.patch
similarity index 100%
rename from package/redis/redis-001-uclibc.patch
rename to package/redis/0001-uclibc.patch
diff --git a/package/redis/redis-003-largefile-conditional-define.patch b/package/redis/0002-largefile-conditional-define.patch
similarity index 100%
rename from package/redis/redis-003-largefile-conditional-define.patch
rename to package/redis/0002-largefile-conditional-define.patch
diff --git a/package/redis/Config.in b/package/redis/Config.in
index b370e7d..d2a7556 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_REDIS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
 	help
 	  Redis is an open source, advanced key-value store. It is
 	  often referred to as a data structure server since keys can
@@ -10,6 +11,7 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ largefile, threads"
+comment "redis needs a toolchain w/ IPv6, largefile, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_INET_IPV6
diff --git a/package/redis/redis-002-lua-AR.patch b/package/redis/redis-002-lua-AR.patch
deleted file mode 100644
index 68ee70c..0000000
--- a/package/redis/redis-002-lua-AR.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-
-redis-002-lua-AR.patch: Improve redis Makefiles to handle Lua's unusual
-definition of AR.  Patch originates from:
-
-  Define AR to help with lua cross-compilation
-  https://github.com/antirez/redis/pull/997
-  Daniel Price, daniel.price at gmail.com
-
-Signed-off-by: Daniel Price <daniel.price@gmail.com>
-
-=========================================================================
-diff --git a/deps/Makefile b/deps/Makefile
-index d58ee56..c9d7116 100644
---- a/deps/Makefile
-+++ b/deps/Makefile
-@@ -60,10 +60,15 @@ endif
- 
- LUA_CFLAGS+= -O2 -Wall -DLUA_ANSI $(CFLAGS)
- LUA_LDFLAGS+= $(LDFLAGS)
-+# lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
-+# challenging to cross-compile lua (and redis).  These defines make it easier
-+# to fit redis into cross-compilation environments, which typically set AR.
-+AR = ar
-+ARFLAGS = rcu
- 
- lua: .make-prerequisites
- 	@printf '%b %b\n' $(MAKECOLOR)MAKE$(ENDCOLOR) $(BINCOLOR)$@$(ENDCOLOR)
--	cd lua/src && $(MAKE) all CFLAGS="$(LUA_CFLAGS)" MYLDFLAGS="$(LUA_LDFLAGS)"
-+	cd lua/src && $(MAKE) all CFLAGS="$(LUA_CFLAGS)" MYLDFLAGS="$(LUA_LDFLAGS)" AR="$(AR) $(ARFLAGS)"
- 
- .PHONY: lua
- 
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
new file mode 100644
index 0000000..5f91766
--- /dev/null
+++ b/package/redis/redis.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	29bb08abfc3d392b2f0c3e7f48ec46dd09ab1023f9a5575fc2a93546f4ca5145	redis-2.8.19.tar.gz
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 00490e7..4cad061 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 2.6.17
+REDIS_VERSION = 2.8.19
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
