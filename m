From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 15 Apr 2016 08:19:11 +0300
Subject: [Buildroot] [PATCH] memcached: fix musl build
Message-ID: <1163900c34d6fa034bcb8defc1b0f6578a293b28.1460697551.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch fixing pre-processor warnings that breaks the build. The patch is
pending upstream.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../memcached/0001-fix-build-with-musl-libc.patch  | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 package/memcached/0001-fix-build-with-musl-libc.patch

diff --git a/package/memcached/0001-fix-build-with-musl-libc.patch b/package/memcached/0001-fix-build-with-musl-libc.patch
new file mode 100644
index 000000000000..068382051cde
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
-- 
2.8.0.rc3
