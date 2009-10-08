From: Jon Smirl <jonsmirl@gmail.com>
Date: Thu, 8 Oct 2009 14:55:48 -0400
Subject: [Buildroot] Compiler for arm7tdmi
Message-ID: <9e4733910910081155p1e1101abofef056aa21ce82db@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not having any luck building a compiler for arm7tdmi. I have the
static_flat file format selected, I couldn't get Elf to build. My goal
is to compile Contiki for a Freescale MC1322x.

Now I'm hitting this problem with __fini_array_end using git head.

/home/apps/buildroot/output/toolchain/gcc-4.3.4-final/./gcc/xgcc
-B/home/apps/buildroot/output/toolchain/gcc-4.3.4-final/./gcc/
-B/usr/arm-linux-uclibcgnueabi/bin/
-B/usr/arm-linux-uclibcgnueabi/lib/ -isystem
/usr/arm-linux-uclibcgnueabi/include -isystem
/usr/arm-linux-uclibcgnueabi/sys-include -O2  -g -Os -DIN_GCC
-DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition
-isystem ./include  -fPIC -g -DHAVE_GTHR_DEFAULT -DIN_LIBGCC2
-D__GCC_FLOAT_NOT_NEEDED  -shared -nodefaultlibs
-Wl,--soname=libgcc_s.so.1 -Wl,--version-script=libgcc.map -o
./libgcc_s.so.1.tmp -g -Os -B./ _udivsi3_s.o _divsi3_s.o _umodsi3_s.o
_modsi3_s.o _bb_init_func_s.o _call_via_rX_s.o
_interwork_call_via_rX_s.o _lshrdi3_s.o _ashrdi3_s.o _ashldi3_s.o
_negdf2_s.o _addsubdf3_s.o _muldivdf3_s.o _cmpdf2_s.o _unorddf2_s.o
_fixdfsi_s.o _fixunsdfsi_s.o _truncdfsf2_s.o _negsf2_s.o
_addsubsf3_s.o _muldivsf3_s.o _cmpsf2_s.o _unordsf2_s.o _fixsfsi_s.o
_fixunssfsi_s.o _floatdidf_s.o _floatdisf_s.o _floatundidf_s.o
_floatundisf_s.o _aeabi_lcmp_s.o _aeabi_ulcmp_s.o _aeabi_ldivmod_s.o
_aeabi_uldivmod_s.o _dvmd_lnx_s.o _muldi3_s.o _negdi2_s.o _cmpdi2_s.o
_ucmpdi2_s.o _clear_cache_s.o _enable_execute_stack_s.o
_trampoline_s.o __main_s.o _absvsi2_s.o _absvdi2_s.o _addvsi3_s.o
_addvdi3_s.o _subvsi3_s.o _subvdi3_s.o _mulvsi3_s.o _mulvdi3_s.o
_negvsi2_s.o _negvdi2_s.o _ctors_s.o _ffssi2_s.o _ffsdi2_s.o _clz_s.o
_clzsi2_s.o _clzdi2_s.o _ctzsi2_s.o _ctzdi2_s.o _popcount_tab_s.o
_popcountsi2_s.o _popcountdi2_s.o _paritysi2_s.o _paritydi2_s.o
_powisf2_s.o _powidf2_s.o _powixf2_s.o _powitf2_s.o _mulsc3_s.o
_muldc3_s.o _mulxc3_s.o _multc3_s.o _divsc3_s.o _divdc3_s.o
_divxc3_s.o _divtc3_s.o _bswapsi2_s.o _bswapdi2_s.o _fixunsxfsi_s.o
_fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixtfdi_s.o _fixunssfdi_s.o
_fixunsdfdi_s.o _fixunsxfdi_s.o _fixunstfdi_s.o _floatdixf_s.o
_floatditf_s.o _floatundixf_s.o _floatunditf_s.o _divdi3_s.o
_moddi3_s.o _udivdi3_s.o _umoddi3_s.o _udiv_w_sdiv_s.o _udivmoddi4_s.o
bpabi_s.o unaligned-funcs_s.o unwind-arm_s.o libunwind_s.o
pr-support_s.o unwind-c_s.o emutls_s.o -lc && rm -f ./libgcc_s.so &&
if [ -f ./libgcc_s.so.1 ]; then mv -f ./libgcc_s.so.1
./libgcc_s.so.1.backup; else true; fi && mv ./libgcc_s.so.1.tmp
./libgcc_s.so.1 && ln -s libgcc_s.so.1 ./libgcc_s.so
/home/apps/buildroot/output/staging/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_fini':
__uClibc_main.c:(.text+0x6c): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x74): undefined reference to `__fini_array_end'
/home/apps/buildroot/output/staging/usr/lib/libc.a(__uClibc_main.os):
In function `__uClibc_main':
__uClibc_main.c:(.text+0x250): undefined reference to `__preinit_array_start'
__uClibc_main.c:(.text+0x254): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x25c): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x260): undefined reference to `__init_array_end'
/home/apps/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/bin/ld:
./libgcc_s.so.1.tmp: hidden symbol `__fini_array_end' isn't defined
/home/apps/buildroot/output/staging/usr/arm-linux-uclibcgnueabi/bin/ld:
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[3]: *** [libgcc_s.so] Error 1
make[3]: Leaving directory
`/home/apps/buildroot/output/toolchain/gcc-4.3.4-final/arm-linux-uclibcgnueabi/libgcc'
make[2]: *** [all-target-libgcc] Error 2
make[2]: Leaving directory
`/home/apps/buildroot/output/toolchain/gcc-4.3.4-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/apps/buildroot/output/toolchain/gcc-4.3.4-final'
make: *** [/home/apps/buildroot/output/toolchain/gcc-4.3.4-final/.compiled]
Error 2



-- 
Jon Smirl
jonsmirl at gmail.com
