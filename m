From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 17 Oct 2007 11:19:18 +1000
Subject: [Buildroot] PATCH: buildroot for armeb, gcc-4.2.1 fails to build
In-Reply-To: <20071016001608.GA17751@cloud.net.au>
References: <20071015054821.GA5245@cloud.net.au>
	<d83696340710150806x33bc3b44ofe8d5cd349220e4@mail.gmail.com>
	<20071016001608.GA17751@cloud.net.au>
Message-ID: <20071017011917.GA27174@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2007 at 10:16:08AM +1000, Hamish Moffatt wrote:
> 3. OABI + linux 2.6.21.5 headers + soft-float: uClibc fails to build
> with some missing floating-point symbols, possibly due to a mixup with
> soft float options.
> 
> libc/libc_so.a(difftime.os): In function `difftime':
> difftime.c:(.text+0x8): undefined reference to `__floatsidf'
> difftime.c:(.text+0x2c): undefined reference to `__subdf3'
> libc/libc_so.a(_fpmaxtostr.os): In function `_fpmaxtostr':

The patch below makes arm & armeb build for OABI with soft floats with
gcc 4.2.1.

It's a massaged version of a patch posted here last year:
http://osdir.com/ml/lib.uclibc.buildroot/2006-12/msg00076.html

Index: toolchain/gcc/4.2.1/910-soft-float.patch
===================================================================
--- toolchain/gcc/4.2.1/910-soft-float.patch    (revision 0)
+++ toolchain/gcc/4.2.1/910-soft-float.patch    (revision 0)
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

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
