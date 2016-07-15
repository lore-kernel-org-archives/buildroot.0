From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 09:51:27 +0200
Subject: [Buildroot] [git commit] jemalloc: fix sparc64 build
Message-ID: <20160715075151.107C780129@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d6efcc3d270d8140c5b72f5ddaaf502199e7a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 4.9.3 for sparc64 defines __sparc_v9__, not __sparc64__ nor
__sparcv9 (as reported by `gcc -dM -E - < /dev/null | egrep 'sparc|arch'`).

This prevents LG_QUANTUM from being properly defined. Adding this new
value solves the issue.

Fixes:

  http://autobuild.buildroot.net/results/95d/95df560b13be7abbce6aeeb3ed0f0814d597bd08/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...001-Fix-LG_QUANTUM-definition-for-sparc64.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch b/package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch
new file mode 100644
index 0000000..ef5b857
--- /dev/null
+++ b/package/jemalloc/0001-Fix-LG_QUANTUM-definition-for-sparc64.patch
@@ -0,0 +1,30 @@
+From b3211bd6363ee6884c8db64008dc325a9c711bfb Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Thu, 14 Jul 2016 22:44:01 +0200
+Subject: [PATCH] Fix LG_QUANTUM definition for sparc64
+
+GCC 4.9.3 cross-compiled for sparc64 defines __sparc_v9__, not
+__sparc64__ nor __sparcv9. This prevents LG_QUANTUM from being defined
+properly. Adding this new value to the check solves the issue.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ include/jemalloc/internal/jemalloc_internal.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/jemalloc/internal/jemalloc_internal.h.in b/include/jemalloc/internal/jemalloc_internal.h.in
+index 51bf897..ece15b2 100644
+--- a/include/jemalloc/internal/jemalloc_internal.h.in
++++ b/include/jemalloc/internal/jemalloc_internal.h.in
+@@ -234,7 +234,7 @@ typedef unsigned szind_t;
+ #  ifdef __alpha__
+ #    define LG_QUANTUM		4
+ #  endif
+-#  if (defined(__sparc64__) || defined(__sparcv9))
++#  if (defined(__sparc64__) || defined(__sparcv9) || defined(__sparc_v9__))
+ #    define LG_QUANTUM		4
+ #  endif
+ #  if (defined(__amd64__) || defined(__x86_64__) || defined(_M_X64))
+-- 
+2.4.11
+
