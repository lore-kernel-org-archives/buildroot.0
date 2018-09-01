From: Richard Kunze <richard.kunze@web.de>
Date: Sun,  2 Sep 2018 00:02:45 +0200
Subject: [Buildroot] [PATCH v2] package/squashfs: fix build on hosts with
 glibc >= 2.28
In-Reply-To: <87ftys6hrd.fsf@dell.be.48ers.dk>
References: <87ftys6hrd.fsf@dell.be.48ers.dk>
Message-ID: <20180901220245.16860-1-richard.kunze@web.de>
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
 package/squashfs/0001-include-sysmacros.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/squashfs/0001-include-sysmacros.patch

diff --git a/package/squashfs/0001-include-sysmacros.patch b/package/squashfs/0001-include-sysmacros.patch
new file mode 100644
index 0000000000..56d9a742e7
--- /dev/null
+++ b/package/squashfs/0001-include-sysmacros.patch
@@ -0,0 +1,19 @@
+--- a/squashfs-tools/mksquashfs.c       2018-02-15 14:11:24.661930637 +0100
++++ b/squashfs-tools/mksquashfs.c       2018-02-15 14:12:28.218412025 +0100
+@@ -44,6 +44,7 @@
+ #include <setjmp.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/mman.h>
+ #include <pthread.h>
+ #include <regex.h>
+ #include <sys/wait.h>
+--- a/squashfs-tools/unsquashfs.c       2018-02-15 14:25:34.608263881 +0100
++++ b/squashfs-tools/unsquashfs.c       2018-02-15 14:26:01.376410327 +0100
+@@ -36,6 +36,7 @@
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
+ #include <limits.h>
+ #include <ctype.h>
-- 
2.18.0
