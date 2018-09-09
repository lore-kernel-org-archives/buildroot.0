From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  9 Sep 2018 18:37:50 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: use stat() privided by the
 system
In-Reply-To: <20180909163750.14196-1-romain.naour@gmail.com>
References: <20180909163750.14196-1-romain.naour@gmail.com>
Message-ID: <20180909163750.14196-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the same workaround [1] as gnulib use to get the original
definition of stat. Otherwise with musl toolchains, gnulib try to use
rpl_stat which is not defined.

Fixes:
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552308

[1] http://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stat.c?id=c9d72f69bd201a1ab31464d91f234ea1817fe0e1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...mon-utils-use-stat-privided-by-the-system.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/gdb/8.1.1/0006-gdb-common-utils-use-stat-privided-by-the-system.patch

diff --git a/package/gdb/8.1.1/0006-gdb-common-utils-use-stat-privided-by-the-system.patch b/package/gdb/8.1.1/0006-gdb-common-utils-use-stat-privided-by-the-system.patch
new file mode 100644
index 0000000000..650d963b9e
--- /dev/null
+++ b/package/gdb/8.1.1/0006-gdb-common-utils-use-stat-privided-by-the-system.patch
@@ -0,0 +1,37 @@
+From a7848d4244ffa8db7bf4ab0d5152f57e71600420 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 9 Sep 2018 12:53:34 +0200
+Subject: [PATCH] gdb/common-utils: use stat() privided by the system
+
+Use the same workaround [1] as gnulib use to get the original
+definition of stat. Otherwise with musl toolchains, gnulib try to use
+rpl_stat which is not defined.
+
+Fixes:
+https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552308
+
+[1] http://git.savannah.gnu.org/cgit/gnulib.git/commit/lib/stat.c?id=c9d72f69bd201a1ab31464d91f234ea1817fe0e1
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/common/common-utils.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gdb/common/common-utils.c b/gdb/common/common-utils.c
+index 80de826ba78..d3577c7ff5c 100644
+--- a/gdb/common/common-utils.c
++++ b/gdb/common/common-utils.c
+@@ -20,7 +20,10 @@
+ #include "common-defs.h"
+ #include "common-utils.h"
+ #include "host-defs.h"
++/* Get the original definition of stat.  It might be defined as a macro.  */
++#define __need_system_sys_stat_h
+ #include <sys/stat.h>
++#undef __need_system_sys_stat_h
+ #include <ctype.h>
+ 
+ /* The xmalloc() (libiberty.h) family of memory management routines.
+-- 
+2.14.4
+
-- 
2.14.4
