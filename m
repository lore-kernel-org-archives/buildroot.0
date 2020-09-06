From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Sep 2020 23:04:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix build with gcc 10
Message-ID: <20200906210402.396929-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/ba8dcdece193b91845a30cd31d3574674ec30068

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ash-fix-build-failure-against-gcc-10.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/memcached/0003-hash-fix-build-failure-against-gcc-10.patch

diff --git a/package/memcached/0003-hash-fix-build-failure-against-gcc-10.patch b/package/memcached/0003-hash-fix-build-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..564b191c1b
--- /dev/null
+++ b/package/memcached/0003-hash-fix-build-failure-against-gcc-10.patch
@@ -0,0 +1,56 @@
+From 0447ae4cbbebb87d3f28bb92f7e219a47263b889 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Thu, 23 Jan 2020 22:16:36 +0000
+Subject: [PATCH] hash: fix build failure against gcc-10
+
+On gcc-10 (and gcc-9 -fno-common) build fails as:
+
+```
+gcc  -g -O2 -pthread -pthread -Wall -Werror -pedantic -Wmissing-prototypes \
+  -Wmissing-declarations -Wredundant-decls   -o memcached ... -levent
+ld: memcached-hash.o:memcached/hash.h:5:
+  multiple definition of `hash'; memcached-memcached.o:memcached/hash.h:5: first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+https://gcc.gnu.org/PR85678.
+
+The error also happens if CFLAGS=-fno-common passed explicitly.
+
+Reported-by: Brian Evans
+Bug: https://bugs.gentoo.org/706196
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+[Retrieved from:
+https://github.com/memcached/memcached/commit/0447ae4cbbebb87d3f28bb92f7e219a47263b889]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ hash.c | 2 ++
+ hash.h | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hash.c b/hash.c
+index a0c30369f..b5ff28ae4 100644
+--- a/hash.c
++++ b/hash.c
+@@ -4,6 +4,8 @@
+ #include "jenkins_hash.h"
+ #include "murmur3_hash.h"
+ 
++hash_func hash;
++
+ int hash_init(enum hashfunc_type type) {
+     switch(type) {
+         case JENKINS_HASH:
+diff --git a/hash.h b/hash.h
+index 059d1e2a6..3b2a98478 100644
+--- a/hash.h
++++ b/hash.h
+@@ -2,7 +2,7 @@
+ #define    HASH_H
+ 
+ typedef uint32_t (*hash_func)(const void *key, size_t length);
+-hash_func hash;
++extern hash_func hash;
+ 
+ enum hashfunc_type {
+     JENKINS_HASH=0, MURMUR3_HASH
-- 
2.28.0
