From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Aug 2010 10:51:27 +0200
Subject: [Buildroot] [PATCH 1/2] Add the patch fixing gcc 4.2.4 to gcc 4.2.2
In-Reply-To: <cover.1283158281.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283158281.git.thomas.petazzoni@free-electrons.com>
Message-ID: <53020c806929cbb57e9702bf3c9ad0d06b582a19.1283158281.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch introduced by commit
1ed2e4fffd0d852e62bc98e92045a132f24c37d8 must also be added to gcc
4.2.2 to let the AVR32 toolchain build properly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../1001-gcc-4.2.x-inhibit-libc.patch              |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch

diff --git a/toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch b/toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
new file mode 100644
index 0000000..9a7c909
--- /dev/null
+++ b/toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
@@ -0,0 +1,49 @@
+--- gcc-4.2.4/gcc/unwind-sjlj.c.khem	2010-08-11 12:45:28.000000000 -0700
++++ gcc-4.2.4/gcc/unwind-sjlj.c	2010-08-11 12:45:50.000000000 -0700
+@@ -28,6 +28,8 @@
+    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+    02110-1301, USA.  */
+ 
++#ifndef inhibit_libc
++
+ #include "tconfig.h"
+ #include "tsystem.h"
+ #include "coretypes.h"
+@@ -326,3 +328,4 @@ uw_identify_context (struct _Unwind_Cont
+ #include "unwind.inc"
+ 
+ #endif /* USING_SJLJ_EXCEPTIONS */
++#endif
+--- gcc-4.2.4/gcc/unwind-dw2.c.khem	2010-08-11 12:42:45.000000000 -0700
++++ gcc-4.2.4/gcc/unwind-dw2.c	2010-08-11 12:43:17.000000000 -0700
+@@ -28,6 +28,8 @@
+    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
+    02110-1301, USA.  */
+ 
++#ifndef inhibit_libc
++
+ #include "tconfig.h"
+ #include "tsystem.h"
+ #include "coretypes.h"
+@@ -1537,3 +1539,5 @@ alias (_Unwind_SetIP);
+ #endif
+ 
+ #endif /* !USING_SJLJ_EXCEPTIONS */
++#endif
++
+--- gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c.khem	2010-08-11 12:44:25.000000000 -0700
++++ gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c	2010-08-11 12:44:48.000000000 -0700
+@@ -29,6 +29,8 @@
+    segment and dl_iterate_phdr to avoid register/deregister calls at
+    DSO load/unload.  */
+ 
++#ifndef inhibit_libc
++
+ #ifndef _GNU_SOURCE
+ #define _GNU_SOURCE 1
+ #endif
+@@ -438,3 +440,4 @@ _Unwind_Find_FDE (void *pc, struct dwarf
+ #if defined (USE_GAS_SYMVER) && defined (SHARED) && defined (USE_LIBUNWIND_EXCEPTIONS)
+ alias (_Unwind_Find_FDE);
+ #endif
++#endif
-- 
1.7.0.4
