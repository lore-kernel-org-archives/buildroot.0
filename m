From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 22:15:34 +0100
Subject: [Buildroot] [PATCH] redis: build fix and minor improvement
Message-ID: <1364246134-30923-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The redis-001-uclibc.patch was properly adding conditionals to ensure
HAVE_BACKTRACE is not defined when uClibc is used. However, __unix
doesn't seem to be define with the toolchain Peter uses on gcc14, so
the <features.h> doesn't get included, therefore __UCLIBC isn't
defined, and the code believes that backtrace support is available. We
fix this by including <features.h> when __linux__ is defined.

Fixes:
http://autobuild.buildroot.org/results/4ba818f877af145a547a1fede0bb738192c2f181/build-end.log.

Also add another patch that do not redefine the _LARGEFILE_SOURCE and
_FILE_OFFSET_BITS macros if they are already defined on the command
line. It avoids the ugly warnings that we could see from the build
logs, and therefore make it easier to spot real errors.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/redis/redis-001-uclibc.patch               |    2 +-
 .../redis-003-largefile-conditional-define.patch   |   32 ++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 package/redis/redis-003-largefile-conditional-define.patch

diff --git a/package/redis/redis-001-uclibc.patch b/package/redis/redis-001-uclibc.patch
index d7fd9c3..8762ca2 100644
--- a/package/redis/redis-001-uclibc.patch
+++ b/package/redis/redis-001-uclibc.patch
@@ -15,7 +15,7 @@ diff -ur old/src/config.h new/src/config.h
  #ifndef __CONFIG_H
  #define __CONFIG_H
  
-+#ifdef __unix
++#if defined(__unix) || defined(__linux__)
 +#include <features.h>
 +#endif
 +
diff --git a/package/redis/redis-003-largefile-conditional-define.patch b/package/redis/redis-003-largefile-conditional-define.patch
new file mode 100644
index 0000000..747e055
--- /dev/null
+++ b/package/redis/redis-003-largefile-conditional-define.patch
@@ -0,0 +1,32 @@
+Define _LARGEFILE_SOURCE and _FILE_OFFSET_BITS conditionally
+
+In order to avoid ugly warnings at compile time, only define
+_LARGEFILE_SOURCE and _FILE_OFFSET_BITS if they have not already been
+defined through the build command line.
+
+Avoids:
+
+  In file included from redis.h:33:0,
+                   from migrate.c:1:
+  fmacros.h:45:0: warning: "_LARGEFILE_SOURCE" redefined
+  <command-line>:0:0: note: this is the location of the previous definition
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: redis-2.6.11/src/fmacros.h
+===================================================================
+--- redis-2.6.11.orig/src/fmacros.h	2013-03-25 22:09:15.000000000 +0100
++++ redis-2.6.11/src/fmacros.h	2013-03-25 22:09:40.000000000 +0100
+@@ -42,7 +42,12 @@
+ #define _XOPEN_SOURCE
+ #endif
+ 
++#ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE
++#endif
++
++#ifndef _FILE_OFFSET_BITS
+ #define _FILE_OFFSET_BITS 64
++#endif
+ 
+ #endif
-- 
1.7.9.5
