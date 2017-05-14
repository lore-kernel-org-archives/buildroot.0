From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 May 2017 23:26:43 +0200
Subject: [Buildroot] [PATCH] package/faketime: fix build with gcc >= 6
Message-ID: <20170514212643.17153-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added -Wno-nonnull-compare to disable this error [1].

Fixes:
libfaketime.c:513:7: error?: nonnull argument ??buf?? compared to NULL [-Werror=nonnull-compare]
    if (buf != NULL)
       ^
[1] https://github.com/wolfcw/libfaketime/commit/47e958b753fc15098a2b7d0e9ef26b83ee255874

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...isable-the-non-null-compare-warning-error.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/faketime/0001-Disable-the-non-null-compare-warning-error.patch

diff --git a/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch b/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch
new file mode 100644
index 0000000..859592e
--- /dev/null
+++ b/package/faketime/0001-Disable-the-non-null-compare-warning-error.patch
@@ -0,0 +1,31 @@
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
-- 
2.9.3
