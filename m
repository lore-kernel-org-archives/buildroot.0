From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 19 Oct 2007 10:41:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.1.2
Message-ID: <20071019174158.43A8CA686B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-19 10:41:58 -0700 (Fri, 19 Oct 2007)
New Revision: 20297

Log:
add soft-float support to 4.1.2 gcc, thanks to Hamish Moffatt

Added:
   trunk/buildroot/toolchain/gcc/4.1.2/910-soft-float.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.1.2/910-soft-float.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.1.2/910-soft-float.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.1.2/910-soft-float.patch	2007-10-19 17:41:58 UTC (rev 20297)
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
