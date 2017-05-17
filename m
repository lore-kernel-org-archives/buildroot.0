From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:35:31 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/faketime: fix
	build with gcc >= 6
Message-ID: <20170517204653.40CCF82862@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f0c43a9a640309cbdeb01b0a8d1e7adfca5d730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Upstream added -Wno-nonnull-compare to disable this error [1].

Fixes:
libfaketime.c:513:7: error??: nonnull argument ????buf???? compared to NULL [-Werror=nonnull-compare]
    if (buf != NULL)
       ^
[1] https://github.com/wolfcw/libfaketime/commit/47e958b753fc15098a2b7d0e9ef26b83ee255874

[Peter: add upstream git commit id to patch]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 2a1401fa923e65de2efd78bbb4e66f73291a3fe2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...isable-the-non-null-compare-warning-error.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch b/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch
new file mode 100644
index 0000000..f8c7484
--- /dev/null
+++ b/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch
@@ -0,0 +1,32 @@
+From e85a157b51b1276c91c736d8624d9f3e876e9189 Mon Sep 17 00:00:00 2001
+From: Andreas Rammhold <andreas@rammhold.de>
+Date: Tue, 20 Dec 2016 19:25:32 +0100
+Subject: [PATCH] Disable the non-null compare warning/error.
+
+We rely on the provided local library definitions for the hooked
+functions which in some cases (GCC >6) carry a non-null-attribute flag
+which causes compile errors on `!= NULL` checks.
+
+[Romain: rebase on 0.9.6]
+(cherry picked from commit 47e958b753fc15098a2b7d0e9ef26b83ee255874)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 51634b0..bbbd476 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -67,7 +67,7 @@ INSTALL ?= install
+ PREFIX ?= /usr/local
+ LIBDIRNAME ?= /lib/faketime
+ 
+-CFLAGS += -std=gnu99 -Wall -Wextra -Werror -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
++CFLAGS += -std=gnu99 -Wall -Wextra -Werror -Wno-nonnull-compare -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
+ LIB_LDFLAGS += -shared
+ LDFLAGS += -Wl,--version-script=libfaketime.map -lpthread
+ LDADD += -ldl -lm -lrt
+-- 
+2.9.3
+
