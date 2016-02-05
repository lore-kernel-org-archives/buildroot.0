From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:56:17 +0100
Subject: [Buildroot] [git commit] uclibc: fix MIPS builds with disabled
	threads
Message-ID: <20160205220712.9699E8027B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74e4e830b0240a30353cf9d1ed474f76457ff8dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was a regression found while building for MIPS
with disabled threads. Upstream patch fixed it.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...02-mips-fix-build-if-threads-are-disabled.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch b/package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch
new file mode 100644
index 0000000..a74a5f9
--- /dev/null
+++ b/package/uclibc/0002-mips-fix-build-if-threads-are-disabled.patch
@@ -0,0 +1,59 @@
+From b499fe614ac5b492fc0fdc6e1fbbeeb904674159 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Wed, 3 Feb 2016 21:57:04 +0100
+Subject: [PATCH] mips: fix build if threads are disabled
+
+Reported-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libc/string/mips/memcpy.S |    4 ++--
+ libc/string/mips/memset.S |    4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libc/string/mips/memcpy.S b/libc/string/mips/memcpy.S
+index 3afdb2c..59f9f0a 100644
+--- a/libc/string/mips/memcpy.S
++++ b/libc/string/mips/memcpy.S
+@@ -23,7 +23,7 @@
+ # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
+ #elif _LIBC
+ # include <sysdep.h>
+-# include <regdef.h>
++# include <sys/regdef.h>
+ # include <sys/asm.h>
+ # define PREFETCH_LOAD_HINT PREFETCH_HINT_LOAD_STREAMED
+ # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
+@@ -33,7 +33,7 @@
+ # define PREFETCH_LOAD_HINT PREFETCH_HINT_LOAD_STREAMED
+ # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
+ #else
+-# include <regdef.h>
++# include <sys/regdef.h>
+ # include <sys/asm.h>
+ #endif
+ 
+diff --git a/libc/string/mips/memset.S b/libc/string/mips/memset.S
+index ef8ab0b..43034ce 100644
+--- a/libc/string/mips/memset.S
++++ b/libc/string/mips/memset.S
+@@ -21,7 +21,7 @@
+ # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
+ #elif _LIBC
+ # include <sysdep.h>
+-# include <regdef.h>
++# include <sys/regdef.h>
+ # include <sys/asm.h>
+ # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
+ #elif defined _COMPILING_NEWLIB
+@@ -29,7 +29,7 @@
+ # include "machine/regdef.h"
+ # define PREFETCH_STORE_HINT PREFETCH_HINT_PREPAREFORSTORE
+ #else
+-# include <regdef.h>
++# include <sys/regdef.h>
+ # include <sys/asm.h>
+ #endif
+ 
+-- 
+1.7.10.4
+
