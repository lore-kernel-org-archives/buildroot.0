From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 09:36:07 +0200
Subject: [Buildroot] [git commit] memcached: fix musl build
Message-ID: <20160415073625.B00387FADF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e0d10da02ffd34f300a898de50b8f934e649258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing pre-processor warnings that breaks the build. The patch is
pending upstream.

Fixes:

 http://autobuild.buildroot.org/results/ee9bdcad1c2d392558812c5ec185e92c20ed5340/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../memcached/0001-fix-build-with-musl-libc.patch  | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/package/memcached/0001-fix-build-with-musl-libc.patch b/package/memcached/0001-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000..0683820
--- /dev/null
+++ b/package/memcached/0001-fix-build-with-musl-libc.patch
@@ -0,0 +1,78 @@
+From 2137a608c77c467200d73469f723ba97ff6b3511 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 18 Jan 2016 12:11:48 +0100
+Subject: [PATCH] fix build with musl libc
+
+musl libc will warn if you include sys/signal.h instead of signal.h as
+specified by posix. Build will fail due to -Werror explicitly beeing
+set.
+
+Fix it by use the posix location.
+
+fixes #138
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: pending (https://github.com/memcached/memcached/pull/139)
+
+ assoc.c | 2 +-
+ items.c | 2 +-
+ slabs.c | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/assoc.c b/assoc.c
+index e6cf09b64e8c..9fff38fe01d6 100644
+--- a/assoc.c
++++ b/assoc.c
+@@ -14,8 +14,8 @@
+ #include "memcached.h"
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/resource.h>
++#include <signal.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+ #include <errno.h>
+diff --git a/items.c b/items.c
+index 199dc9fa6e6b..7040777ab0fb 100644
+--- a/items.c
++++ b/items.c
+@@ -2,13 +2,13 @@
+ #include "memcached.h"
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/resource.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <signal.h>
+ #include <string.h>
+ #include <time.h>
+ #include <assert.h>
+diff --git a/slabs.c b/slabs.c
+index 31e85f6ec21d..bfafe5d0fdde 100644
+--- a/slabs.c
++++ b/slabs.c
+@@ -10,7 +10,6 @@
+ #include "memcached.h"
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/resource.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+@@ -18,6 +17,7 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <signal.h>
+ #include <assert.h>
+ #include <pthread.h>
+ 
+-- 
+2.8.0.rc3
+
