From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  9 Aug 2017 14:35:26 +0300
Subject: [Buildroot] [PATCH] snappy: fix static build with threads
Message-ID: <da319ecb11615615a937a3af5e8468232c922031.1502278526.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 0e2ee0e6e8076 (package.snappy: fix static builds with threads)
added LIBS=-pthread to configure options to fix static build with
threads on some architectures. This works for autotools packages. Then,
commit d26282b3aa14cb (package/snappy: bump version, switch to cmake)
switched to cmake that does not understand the 'LIBS' parameter.

Remove this LIBS parameter to fix static build with threads. Build for
Cortex-M4 target indicates that the original issue is fixed now.

Fixes:
http://autobuild.buildroot.net/results/8dc/8dc9e147e5f41a979aafdfb1ab98121e9cd491b8/
http://autobuild.buildroot.net/results/9e8/9e8405360d1da6824a741fb4ac45495f9e806358/
http://autobuild.buildroot.net/results/500/50095cae347eb95a6912df33f455b6284fee73d4/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/snappy/snappy.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index f5df6bf1f12d..a537ade57b83 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -11,13 +11,4 @@ SNAPPY_LICENSE_FILES = COPYING
 SNAPPY_INSTALL_STAGING = YES
 SNAPPY_CONF_OPTS = -DSNAPPY_BUILD_TESTS=OFF
 
-# libsnappy links with libstdc++. Some libstdc++/arch variants use
-# pthread symbols for internal locking if built with thread
-# support. libstdc++ does not have a .pc file, and its .la file does
-# not mention -pthread.  So, static linkig to libstdc++ will fail if
-# -pthread is not explicity linked to. Only do that for static builds.
-ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
-SNAPPY_CONF_OPTS += LIBS=-pthread
-endif
-
 $(eval $(cmake-package))
-- 
2.13.2
