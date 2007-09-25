From: vano <ivan.kuten@promwad.com>
Date: Tue, 25 Sep 2007 13:29:01 -0100
Subject: [Buildroot] ARM softfloat - revisited
In-Reply-To: <1190721750.19731.23.camel@elrond.atmel.sweden>
References: <1190721750.19731.23.camel@elrond.atmel.sweden>
Message-ID: <46F91B2D.4020100@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> ---------------------------------------------------------------------------
> If I check the STAGING_DIR, I see that 
> 
> <buildroot>/build_arm_wchar/staging_dir/usr/lib/gcc/arm-linux-uclibc/4.2.1/libgcc.a
> seems to contain the neccessary files, but the linking of libc/libc_so.a
> does not seem to take into account this files.
> I tried adding LDFLAGS+=-lgcc but this does not help.
> The I added the gcc/config/soft-fp source files from gcc-4.2.1
> and this allows the compile to continue, but it seems to be strange
> that this should be required.
> 
> Any ideas?
> 
> Best Regards
> Ulf Samuelsson
> 


Hi Ulf,

I tried softfloat about one week ago but without success.
I tried this patch to 4.2.1 , build goes a bit further but fails too.

diff -urN gcc-3.4.1-old/gcc/config/arm/t-linux
gcc-3.4.1/gcc/config/arm/t-linux
--- gcc-3.4.1-old/gcc/config/arm/t-linux        2003-09-20
16:09:07.000000000 -0500
+++ gcc-3.4.1/gcc/config/arm/t-linux    2004-09-02 21:51:15.000000000 -0500
@@ -4,7 +4,10 @@
 LIBGCC2_DEBUG_CFLAGS = -g0

 LIB1ASMSRC = arm/lib1funcs.asm
-LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx
+LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
+       _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi
_fixunsdfsi \
+       _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
+       _fixsfsi _fixunssfsi

 # MULTILIB_OPTIONS = mhard-float/msoft-float
 # MULTILIB_DIRNAMES = hard-float soft-float


I'll try your proposed approach.

Best regards,
Ivan
