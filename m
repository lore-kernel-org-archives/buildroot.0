From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 19 Mar 2016 18:26:56 +0100
Subject: [Buildroot] [PATCH 1/2] m68k: enable internal toolchain
Message-ID: <20160319172656.GA19850@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to build a m68k toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in                               |  1 -
 arch/Config.in.m68k                          | 24 +++++++++++++++++++++++-
 package/gcc/4.8.5/890-fix-m68k-compile.patch | 15 +++++++++++++++
 package/gcc/4.9.3/890-fix-m68k-compile.patch | 15 +++++++++++++++
 package/gcc/5.3.0/890-fix-m68k-compile.patch | 15 +++++++++++++++
 5 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 package/gcc/4.8.5/890-fix-m68k-compile.patch
 create mode 100644 package/gcc/4.9.3/890-fix-m68k-compile.patch
 create mode 100644 package/gcc/5.3.0/890-fix-m68k-compile.patch

diff --git a/arch/Config.in b/arch/Config.in
index 401bd28..3f1453f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -95,7 +95,6 @@ config BR2_i386
 config BR2_m68k
 	bool "m68k"
 	select BR2_ARCH_HAS_MMU_MANDATORY
-	depends on BROKEN # ice in uclibc / inet_ntoa_r
 	help
 	  Motorola 68000 family microprocessor
 	  http://en.wikipedia.org/wiki/M68k
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index f40f97c..0697c49 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -4,7 +4,29 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
-config BR2_GCC_TARGET_ARCH
+choice
+	prompt "Target CPU"
+	depends on BR2_m68k
+	default BR2_m68k_68040
+	help
+	  Specific CPU variant to use
+
+config BR2_m68k_68000
+	bool "68000"
+config BR2_m68k_68010
+	bool "68010"
+config BR2_m68k_68020
+	bool "68020"
+config BR2_m68k_68030
+	bool "68030"
+config BR2_m68k_68040
+	bool "68040"
+config BR2_m68k_68060
+	bool "68060"
+
+endchoice
+
+config BR2_GCC_TARGET_CPU
 	default "68000"		if BR2_m68k_68000
 	default "68010"		if BR2_m68k_68010
 	default "68020"		if BR2_m68k_68020
diff --git a/package/gcc/4.8.5/890-fix-m68k-compile.patch b/package/gcc/4.8.5/890-fix-m68k-compile.patch
new file mode 100644
index 0000000..124e842
--- /dev/null
+++ b/package/gcc/4.8.5/890-fix-m68k-compile.patch
@@ -0,0 +1,15 @@
+remove unused header, which breaks the toolchain building
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.8.5.orig/libgcc/config/m68k/linux-atomic.c gcc-4.8.5/libgcc/config/m68k/linux-atomic.c
+--- gcc-4.8.5.orig/libgcc/config/m68k/linux-atomic.c	2013-02-04 20:06:20.000000000 +0100
++++ gcc-4.8.5/libgcc/config/m68k/linux-atomic.c	2016-03-19 00:18:12.000000000 +0100
+@@ -33,7 +33,6 @@
+    using the kernel helper defined below.  There is no support for
+    64-bit operations yet.  */
+ 
+-#include <asm/unistd.h>
+ #include <stdbool.h>
+ 
+ #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/4.9.3/890-fix-m68k-compile.patch b/package/gcc/4.9.3/890-fix-m68k-compile.patch
new file mode 100644
index 0000000..140977b
--- /dev/null
+++ b/package/gcc/4.9.3/890-fix-m68k-compile.patch
@@ -0,0 +1,15 @@
+remove unused header, which breaks the toolchain building
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.9.3.orig/libgcc/config/m68k/linux-atomic.c gcc-4.9.3/libgcc/config/m68k/linux-atomic.c
+--- gcc-4.9.3.orig/libgcc/config/m68k/linux-atomic.c	2014-01-02 23:25:22.000000000 +0100
++++ gcc-4.9.3/libgcc/config/m68k/linux-atomic.c	2016-03-18 22:24:40.000000000 +0100
+@@ -33,7 +33,6 @@
+    using the kernel helper defined below.  There is no support for
+    64-bit operations yet.  */
+ 
+-#include <asm/unistd.h>
+ #include <stdbool.h>
+ 
+ #ifndef __NR_atomic_cmpxchg_32
diff --git a/package/gcc/5.3.0/890-fix-m68k-compile.patch b/package/gcc/5.3.0/890-fix-m68k-compile.patch
new file mode 100644
index 0000000..6e63de0
--- /dev/null
+++ b/package/gcc/5.3.0/890-fix-m68k-compile.patch
@@ -0,0 +1,15 @@
+remove unused header, which breaks the toolchain building
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c gcc-5.3.0/libgcc/config/m68k/linux-atomic.c
+--- gcc-5.3.0.orig/libgcc/config/m68k/linux-atomic.c	2015-01-05 13:33:28.000000000 +0100
++++ gcc-5.3.0/libgcc/config/m68k/linux-atomic.c	2016-03-19 09:25:07.000000000 +0100
+@@ -33,7 +33,6 @@
+    using the kernel helper defined below.  There is no support for
+    64-bit operations yet.  */
+ 
+-#include <asm/unistd.h>
+ #include <stdbool.h>
+ 
+ #ifndef __NR_atomic_cmpxchg_32
-- 
2.1.4
