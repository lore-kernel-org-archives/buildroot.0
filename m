From: Richard Kunze <richard.kunze@web.de>
Date: Sun,  2 Sep 2018 00:06:00 +0200
Subject: [Buildroot] [PATCH v2] package/squashfs: fix build on hosts with
 glibc >= 2.28
In-Reply-To: <87ftys6hrd.fsf@dell.be.48ers.dk>
References: <87ftys6hrd.fsf@dell.be.48ers.dk>
Message-ID: <20180901220600.18416-1-richard.kunze@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since glibc 2.28, sys/sysmacros.h is no longer included from sys/types.h
This patch fixes the resulting build error by explicitly including
sys/sysmacros.h

See also https://github.com/plougher/squashfs-tools/pull/52

Signed-off-by: Richard Kunze <richard.kunze@web.de>
---
 package/squashfs/0001-include-sysmacros.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/squashfs/0001-include-sysmacros.patch

diff --git a/package/squashfs/0001-include-sysmacros.patch b/package/squashfs/0001-include-sysmacros.patch
new file mode 100644
index 0000000000..d794836c04
--- /dev/null
+++ b/package/squashfs/0001-include-sysmacros.patch
@@ -0,0 +1,47 @@
+From 968aa53dd6d2c0831a9af01873441767c06b88d0 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Wed, 1 Aug 2018 12:17:10 +0200
+Subject: [PATCH] mksquashfs/unsquashfs: fix compilation with glibc 2.25+
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+From glibc 2.25 release notes:
+https://sourceware.org/ml/libc-alpha/2017-02/msg00079.html
+"* The inclusion of <sys/sysmacros.h> by <sys/types.h> is deprecated.
+  This means that in a future release, the macros ?major?, ?minor?, and
+  ?makedev? will only be available from <sys/sysmacros.h>."
+
+See glibc bug https://sourceware.org/bugzilla/show_bug.cgi?id=19239 .
+
+Fetch from: https://github.com/plougher/squashfs-tools/pull/52.patch
+Signed-off-by: Richard Kunze <richard.kunze@web.de>
+---
+ squashfs-tools/mksquashfs.c | 1 +
+ squashfs-tools/unsquashfs.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/squashfs-tools/mksquashfs.c b/squashfs-tools/mksquashfs.c
+index d696a51..8d57c3e 100644
+--- a/squashfs-tools/mksquashfs.c
++++ b/squashfs-tools/mksquashfs.c
+@@ -35,6 +35,7 @@
+ #include <stddef.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <errno.h>
+ #include <dirent.h>
+diff --git a/squashfs-tools/unsquashfs.c b/squashfs-tools/unsquashfs.c
+index a57f85c..a492b27 100644
+--- a/squashfs-tools/unsquashfs.c
++++ b/squashfs-tools/unsquashfs.c
+@@ -33,6 +33,7 @@
+ #include "fnmatch_compat.h"
+ 
+ #include <sys/sysinfo.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
-- 
2.18.0
