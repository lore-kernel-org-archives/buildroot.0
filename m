From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 13:47:57 +0200
Subject: [Buildroot] [git commit] faketime: add patch to disable -Werror
Message-ID: <20180519114658.887A588397@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=968f2fbd7d99b7b6b875709acf13501be21aa26e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

faketime currently doesn't build on host machines that use gcc 8.x due
to stricter checks done by gcc, and the fact that it is built with
-Werror.

As a simple stop-gap measure, this commit patches the faketime
Makefile to not use -Werror anymore.

The actual fixes for the gcc 8.x issues have been submitted upstream
at https://github.com/wolfcw/libfaketime/pull/161, but disabling
-Werror is a much smaller fix.

Also, it is worth mentioning that removing -Werror makes the existing
patch 0001-Disable-the-non-null-compare-warning-error.patch (which was
just disabling one specific warning). We nonetheless keep this patch
around as it is a backport from upstream.

Fixes:

  http://autobuild.buildroot.net/results/bd223dfa1c4baa68e427d4941bd2e9917e22da84/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-src-Makefile-disable-Werror.patch         | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/faketime/0002-src-Makefile-disable-Werror.patch b/package/faketime/0002-src-Makefile-disable-Werror.patch
new file mode 100644
index 0000000000..e1e3b321b8
--- /dev/null
+++ b/package/faketime/0002-src-Makefile-disable-Werror.patch
@@ -0,0 +1,32 @@
+From bcde6e6f34c3cf78a254315c5caa530db91802fb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 17 May 2018 23:41:03 +0200
+Subject: [PATCH] src/Makefile: disable -Werror
+
+gcc 8.x has enabled additional warnings that break the build due to
+-Werror, so let's drop -Werror for now. A set of patches has been
+submitted upstream (https://github.com/wolfcw/libfaketime/pull/161) to
+properly fix the gcc 8.x issues, but in the mean time, disabling
+-Werror is a simpler option.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index bbbd476..6b0d2cd 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -67,7 +67,7 @@ INSTALL ?= install
+ PREFIX ?= /usr/local
+ LIBDIRNAME ?= /lib/faketime
+ 
+-CFLAGS += -std=gnu99 -Wall -Wextra -Werror -Wno-nonnull-compare -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
++CFLAGS += -std=gnu99 -Wall -Wextra -Wno-nonnull-compare -DFAKE_STAT -DFAKE_SLEEP -DFAKE_TIMERS -DFAKE_INTERNAL_CALLS -fPIC -DPREFIX='"'$(PREFIX)'"' -DLIBDIRNAME='"'$(LIBDIRNAME)'"'
+ LIB_LDFLAGS += -shared
+ LDFLAGS += -Wl,--version-script=libfaketime.map -lpthread
+ LDADD += -ldl -lm -lrt
+-- 
+2.14.3
+
