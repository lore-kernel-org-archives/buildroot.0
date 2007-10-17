From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Oct 2007 14:56:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1
Message-ID: <20071017215621.8B32CA4569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-17 14:56:21 -0700 (Wed, 17 Oct 2007)
New Revision: 20276

Log:
Softfloat patch

Added:
   trunk/buildroot/toolchain/gcc/4.2.1/910-soft-float.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.2.1/910-soft-float.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/910-soft-float.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.2.1/910-soft-float.patch	2007-10-17 21:56:21 UTC (rev 20276)
@@ -0,0 +1,26 @@
+--- gcc-4.2-20061205/gcc/config/arm/t-linux    2006-12-08 15:18:33.000000000 -0800
++++ gcc-4.2-20061205/gcc/config/arm/t-linux    2006-12-08 15:18:33.000000000 -0800
+@@ -4,7 +4,10 @@
+ LIBGCC2_DEBUG_CFLAGS = -g0
+ 
+ LIB1ASMSRC = arm/lib1funcs.asm
+-LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
++LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
++      _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
++      _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
++      _fixsfsi _fixunssfsi _floatdidf _floatundidf _floatdisf _floatundisf
+ 
+ # MULTILIB_OPTIONS = mhard-float/msoft-float
+ # MULTILIB_DIRNAMES = hard-float soft-float
+
+--- gcc-4.2-20061205/gcc/config/arm/linux-elf.h        2006-12-08 15:18:33.000000000 -0800
++++ gcc-4.2-20061205/gcc/config/arm/linux-elf.h        2006-12-08 15:18:33.000000000 -0800
+@@ -63,7 +63,7 @@
+    %{shared:-lc} \
+    %{!shared:%{profile:-lc_p}%{!profile:-lc}}"
+ 
+-#define LIBGCC_SPEC "%{msoft-float:-lfloat} %{mfloat-abi=soft*:-lfloat} -lgcc"
++#define LIBGCC_SPEC "-lgcc"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
+ 
