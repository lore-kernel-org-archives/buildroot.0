From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Nov 2015 15:05:44 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: add patches for powerpc e6500 64-bit
	support
Message-ID: <1446818745-32224-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with -mtune=e6500 led to build failures in glibc (probably in
uclibc as well) because gcc was built for a 32-bit target even though
the target tuple is powerpc64-*. This lead to a mix of 32-bit and
64-bit support and build errors like:

  fatal error: gnu/lib-names-32.h: No such file or directory

The root cause is that the configure script is not handling e6500
correctly, because of stupid typo in the condition.

Change has been submitted upstream.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch | 29 ++++++++++++++++++++++
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch | 29 ++++++++++++++++++++++
 ...gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch | 29 ++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 package/gcc/4.8.5/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
 create mode 100644 package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
 create mode 100644 package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch

diff --git a/package/gcc/4.8.5/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/4.8.5/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
new file mode 100644
index 0000000..c11ad35
--- /dev/null
+++ b/package/gcc/4.8.5/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
@@ -0,0 +1,29 @@
+From 9bf6066d588632dab9f78932df15b5b4140f31f3 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 6 Nov 2015 14:27:23 +0100
+Subject: [PATCH] gcc/config.gcc: fix typo for powerpc e6500 cpu_is_64bit
+
+Otherwise it is not recognized as a 64-bit powerpc and gcc will not generate
+64-bit binaries by default.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gcc/config.gcc | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 4a7cbd2..9cc765e 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -439,7 +439,7 @@ powerpc*-*-*)
+ 	cpu_type=rs6000
+ 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
+ 	case x$with_cpu in
+-	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
++	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
+ 		cpu_is_64bit=yes
+ 		;;
+ 	esac
+-- 
+2.6.2
+
diff --git a/package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
new file mode 100644
index 0000000..c11ad35
--- /dev/null
+++ b/package/gcc/4.9.3/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
@@ -0,0 +1,29 @@
+From 9bf6066d588632dab9f78932df15b5b4140f31f3 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 6 Nov 2015 14:27:23 +0100
+Subject: [PATCH] gcc/config.gcc: fix typo for powerpc e6500 cpu_is_64bit
+
+Otherwise it is not recognized as a 64-bit powerpc and gcc will not generate
+64-bit binaries by default.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gcc/config.gcc | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 4a7cbd2..9cc765e 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -439,7 +439,7 @@ powerpc*-*-*)
+ 	cpu_type=rs6000
+ 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
+ 	case x$with_cpu in
+-	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
++	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
+ 		cpu_is_64bit=yes
+ 		;;
+ 	esac
+-- 
+2.6.2
+
diff --git a/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch b/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
new file mode 100644
index 0000000..c11ad35
--- /dev/null
+++ b/package/gcc/5.2.0/120-gcc-config.gcc-fix-typo-for-powerpc-e6500-cpu_is_64b.patch
@@ -0,0 +1,29 @@
+From 9bf6066d588632dab9f78932df15b5b4140f31f3 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Fri, 6 Nov 2015 14:27:23 +0100
+Subject: [PATCH] gcc/config.gcc: fix typo for powerpc e6500 cpu_is_64bit
+
+Otherwise it is not recognized as a 64-bit powerpc and gcc will not generate
+64-bit binaries by default.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ gcc/config.gcc | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 4a7cbd2..9cc765e 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -439,7 +439,7 @@ powerpc*-*-*)
+ 	cpu_type=rs6000
+ 	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h htmintrin.h htmxlintrin.h"
+ 	case x$with_cpu in
+-	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
++	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[345678]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|xe6500)
+ 		cpu_is_64bit=yes
+ 		;;
+ 	esac
+-- 
+2.6.2
+
-- 
2.6.2
