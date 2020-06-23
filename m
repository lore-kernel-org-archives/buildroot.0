From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jun 2020 18:18:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/dropbear: fix build on uclibc
Message-ID: <20200623161835.853790-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d6d783da2fb834ce21475ff54f82c07873246826

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-_GNU_SOURCE-for-random.patch         | 25 ++++++++++++++
 .../0002-move-GNU_SOURCE-earlier.patch        | 34 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 package/dropbear/0001-_GNU_SOURCE-for-random.patch
 create mode 100644 package/dropbear/0002-move-GNU_SOURCE-earlier.patch

diff --git a/package/dropbear/0001-_GNU_SOURCE-for-random.patch b/package/dropbear/0001-_GNU_SOURCE-for-random.patch
new file mode 100644
index 0000000000..dfb8514114
--- /dev/null
+++ b/package/dropbear/0001-_GNU_SOURCE-for-random.patch
@@ -0,0 +1,25 @@
+From 3f5c106a880a02b21739f2022746e6aa7672474c Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 23 Jun 2020 21:38:46 +0800
+Subject: [PATCH] _GNU_SOURCE for random
+
+[Retrieved from:
+https://github.com/mkj/dropbear/commit/3f5c106a880a02b21739f2022746e6aa7672474c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ includes.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/includes.h b/includes.h
+index e8c3e189..2789f23d 100644
+--- a/includes.h
++++ b/includes.h
+@@ -125,6 +125,8 @@
+ #endif
+ 
+ #ifdef HAVE_SYS_RANDOM_H
++/* uclibc needs _GNU_SOURCE */
++#define _GNU_SOURCE
+ #include <sys/random.h>
+ #endif
+ 
diff --git a/package/dropbear/0002-move-GNU_SOURCE-earlier.patch b/package/dropbear/0002-move-GNU_SOURCE-earlier.patch
new file mode 100644
index 0000000000..81282e423b
--- /dev/null
+++ b/package/dropbear/0002-move-GNU_SOURCE-earlier.patch
@@ -0,0 +1,34 @@
+From a7a67585cbc3fe5df85c641618b347a51a943356 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Tue, 23 Jun 2020 22:24:58 +0800
+Subject: [PATCH] move GNU_SOURCE earlier
+
+[Retrieved from:
+https://github.com/mkj/dropbear/commit/a7a67585cbc3fe5df85c641618b347a51a943356]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ includes.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/includes.h b/includes.h
+index 2789f23d..884ebf71 100644
+--- a/includes.h
++++ b/includes.h
+@@ -25,6 +25,8 @@
+ #ifndef DROPBEAR_INCLUDES_H_
+ #define DROPBEAR_INCLUDES_H_
+ 
++/* uclibc needs _GNU_SOURCE, maybe other things? */
++#define _GNU_SOURCE
+ 
+ #include "options.h"
+ #include "debug.h"
+@@ -125,8 +127,6 @@
+ #endif
+ 
+ #ifdef HAVE_SYS_RANDOM_H
+-/* uclibc needs _GNU_SOURCE */
+-#define _GNU_SOURCE
+ #include <sys/random.h>
+ #endif
+ 
-- 
2.26.2
