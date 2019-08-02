From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 22:46:14 +0200
Subject: [Buildroot] [git commit] package/pdbg: fix musl build
Message-ID: <20190802205213.8A7D38D1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc153c3930b80a6360c158aca5da7ad70d578c08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/81b1107bdb06250e1a7837506aec0c9762e771c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../pdbg/0001-src-thread.c-include-endian.h.patch  | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/pdbg/0001-src-thread.c-include-endian.h.patch b/package/pdbg/0001-src-thread.c-include-endian.h.patch
new file mode 100644
index 0000000000..b7ee09a27a
--- /dev/null
+++ b/package/pdbg/0001-src-thread.c-include-endian.h.patch
@@ -0,0 +1,35 @@
+From e6a903ce82392c59d653f870a8af57d263c83a4f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 2 Aug 2019 12:28:42 +0200
+Subject: [PATCH] src/thread.c: include endian.h
+
+endian.h is needed for be64oh otherwise build with musl fails on:
+
+src/thread.c: In function 'flip_endian':
+src/thread.c:49:9: error: implicit declaration of function 'be64toh' [-Werror=implicit-function-declaration]
+  return be64toh(v);
+
+Fixes:
+ - http://autobuild.buildroot.org/results/81b1107bdb06250e1a7837506aec0c9762e771c5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/open-power/pdbg/pull/43]
+---
+ src/thread.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/thread.c b/src/thread.c
+index 7fd53a8..7ead430 100644
+--- a/src/thread.c
++++ b/src/thread.c
+@@ -18,6 +18,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <assert.h>
++#include <endian.h>
+ 
+ #include <libpdbg.h>
+ 
+-- 
+2.20.1
+
