From: Tom <fivemiletom@gmail.com>
Date: Wed, 20 Jun 2007 00:42:07 -0700
Subject: [Buildroot] Arm / buildroot / kernel issue: init crashes?
In-Reply-To: <6311fe0b0706191700g54364c24s3440e62e45eec187@mail.gmail.com>
References: <4672496D.1060904@gmail.com>	
	<6311fe0b0706161040h626e4d85x227e490373938537@mail.gmail.com>	
	<6311fe0b0706161136q30c4ca11qbd6ac0e50baf66d8@mail.gmail.com>	
	<467721B4.3090906@gmail.com> <4678663A.6060606@gmail.com>
	<6311fe0b0706191700g54364c24s3440e62e45eec187@mail.gmail.com>
Message-ID: <4678DA4F.90004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rex,

Rex Ashbaugh wrote:
> and also to select arm920T specifically as your target.
> I believe this in turn specifies the default ARCH= (or CPU=) parameter 
> for how gcc is built.
> type 'gcc --verbose' to see the default parameter assumptions that are 
> built into your toolchain.
> 
> Have you done the above? and is the resulting toolchain still inserting 
> illegal instructions for arm920T?

Yes, I had specified ARM920T in both buildroot and uclibc configurations 
and got the specs below. While the resulting toolchain could certainly 
compile code for this cpu, it seemed to happen frequently that gcc would 
use a different default cpu, which caused these ARMv5 instructions to be 
included.

Just now, after adding --with-spec=arm9tdmi to the binutils/gcc options 
of buildroot, it seems to work better. (More testing tomorrow.)

Thanks
Tom

arm-linux-gcc --verbose
Using built-in specs.
Target: arm-linux-uclibcgnueabi
Configured with:
/tw/buildroot/toolchain_build_arm_nofpu/gcc-4.1.2/configure
--prefix=/tw/tools/gcc/armv4/linux-uclibc --build=i386-pc-linux-gnu
--host=i386-pc-linux-gnu --target=arm-linux-uclibcgnueabi
--enable-languages=c --disable-__cxa_atexit --enable-target-optspace
--with-gnu-ld --disable-shared --disable-nls --enable-threads
--disable-multilib --with-float=soft



arm-linux-gcc --verbose
Using built-in specs.
Target: arm-linux-uclibcgnueabi
Configured with:
/tw/buildroot/toolchain_build_arm_nofpu/gcc-4.1.2/configure
--prefix=/tw/tools/gcc/armv4/linux-uclibc --build=i386-pc-linux-gnu
--host=i386-pc-linux-gnu --target=arm-linux-uclibcgnueabi
--enable-languages=c --disable-__cxa_atexit --enable-target-optspace
--with-gnu-ld --disable-shared --disable-nls --enable-threads
--disable-multilib --with-float=soft
Thread model: posix
gcc version 4.1.2



*asm:
%{mbig-endian:-EB} %{mlittle-endian:-EL} %{mcpu=*:-mcpu=%*}
%{march=*:-march=%*} %{mapcs-*:-mapcs-%*} %(subtarget_asm_float_spec)
%{mthumb-interwork:-mthumb-interwork} %{msoft-float:-mfloat-abi=soft}
%{mhard-float:-mfloat-abi=hard} %{mfloat-abi=*} %{mfpu=*}
%(subtarget_extra_asm_spec)

*asm_debug:
%{gstabs*:--gstabs}%{!gstabs*:%{g*:--gdwarf2}}

*asm_final:


*asm_options:
%a %Y %{c:%W{o*}%{!o*:-o %w%b%O}}%{!c:-o %d%w%u%O}

*invoke_as:
%{!S:-o %|.s |
  as %(asm_options) %m.s %A }

*cpp:
%(subtarget_cpp_spec)					%{msoft-float:%{mhard-float:						
%e-msoft-float and -mhard_float may not be used together}}
%{mbig-endian:%{mlittle-endian:							%e-mbig-endian and -mlittle-endian
may not be used together}}

*cpp_options:
%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*}
%{w} %{f*} %{g*:%{!g0:%{!fno-working-directory:-fworking-directory}}}
%{O*} %{undef} %{save-temps:-fpch-preprocess}

*cpp_debug_options:
%{d*}

*cpp_unique_options:
%{C|CC:%{!E:%eGCC does not support -C or -CC without -E}} %{!Q:-quiet}
%{nostdinc*} %{C} %{CC} %{v} %{I*&F*} %{P} %I %{MD:-MD
%{!o:%b.d}%{o*:%.d%*}} %{MMD:-MMD %{!o:%b.d}%{o*:%.d%*}} %{M} %{MM}
%{MF*} %{MG} %{MP} %{MQ*} %{MT*} %{!E:%{!M:%{!MM:%{MD|MMD:%{o*:-MQ
%*}}}}} %{remap} %{g3:-dD} %{H} %C %{D*&U*&A*} %{i*} %Z %i
%{fmudflap:-D_MUDFLAP -include mf-runtime.h} %{fmudflapth:-D_MUDFLAP
-D_MUDFLAPTH -include mf-runtime.h} %{E|M|MM:%W{o*}}

*trad_capable_cpp:
cc1 -E %{traditional|ftraditional|traditional-cpp:-traditional-cpp}

*cc1:
%{profile:-p}

*cc1_options:
%{pg:%{fomit-frame-pointer:%e-pg and -fomit-frame-pointer are
incompatible}} %1 %{!Q:-quiet} -dumpbase %B %{d*} %{m*} %{a*}
%{c|S:%{o*:-auxbase-strip %*}%{!o*:-auxbase %b}}%{!c:%{!S:-auxbase %b}}
%{g*} %{O*} %{W*&pedantic*} %{w} %{std*&ansi&trigraphs} %{v:-version}
%{pg:-p} %{p} %{f*} %{undef} %{Qn:-fno-ident} %{--help:--help}
%{--target-help:--target-help} %{!fsyntax-only:%{S:%W{o*}%{!o*:-o
%b.s}}} %{fsyntax-only:-o %j} %{-param*}
%{fmudflap|fmudflapth:-fno-builtin -fno-merge-constants}
%{coverage:-fprofile-arcs -ftest-coverage}

*cc1plus:


*link_gcc_c_sequence:
%{static:--start-group} %G %L %{static:--end-group}%{!static:%G}

*link_ssp:
%{fstack-protector|fstack-protector-all:-lssp_nonshared -lssp}

*endfile:
%{shared|pie:crtendS.o%s;:crtend.o%s} crtn.o%s

*link:
%{!static:--eh-frame-hdr} %{h*} %{version:-v}    %{b}
%{static:-Bstatic}    %{shared:-shared}    %{symbolic:-Bsymbolic}
%{rdynamic:-export-dynamic}    %{!dynamic-linker:-dynamic-linker
/lib/ld-uClibc.so.0}    -X    %{mbig-endian:-EB} %{mlittle-endian:-EL}
-m armelf_linux_eabi

*lib:
%{pthread:-lpthread}    %{shared:-lc}
%{!shared:%{profile:-lc_p}%{!profile:-lc}}

*mfwrap:
  %{static: %{fmudflap|fmudflapth:  --wrap=malloc --wrap=free
--wrap=calloc --wrap=realloc --wrap=mmap --wrap=munmap --wrap=alloca}
%{fmudflapth: --wrap=pthread_create}} %{fmudflap|fmudflapth: --wrap=main}

*mflib:
%{fmudflap|fmudflapth: -export-dynamic}

*libgcc:
-lgcc

*startfile:
%{!shared: %{pg|p|profile:gcrt1.o%s;pie:Scrt1.o%s;:crt1.o%s}}
crti.o%s %{static:crtbeginT.o%s;shared|pie:crtbeginS.o%s;:crtbegin.o%s}

*switches_need_spaces:


*cross_compile:
1

*version:
4.1.2

*multilib:
. ;

*multilib_defaults:
marm mlittle-endian mhard-float mno-thumb-interwork

*multilib_extra:


*multilib_matches:


*multilib_exclusions:


*multilib_options:


*linker:
collect2

*link_libgcc:
%D

*md_exec_prefix:


*md_startfile_prefix:


*md_startfile_prefix_1:


*startfile_prefix_spec:


*sysroot_spec:
--sysroot=%R

*sysroot_suffix_spec:


*sysroot_hdrs_suffix_spec:


*subtarget_cpp_spec:
%{posix:-D_POSIX_SOURCE}

*subtarget_extra_asm_spec:
%{mabi=apcs-gnu|mabi=atpcs:-meabi=gnu;:-meabi=4}

*subtarget_asm_float_spec:
%{mapcs-float:-mfloat}

*link_command:
%{!fsyntax-only:%{!c:%{!M:%{!MM:%{!E:%{!S:    %(linker) %l %{pie:-pie}
%X %{o*} %{A} %{d} %{e*} %{m} %{N} %{n} %{r}    %{s} %{t} %{u*} %{x}
%{z} %{Z} %{!A:%{!nostdlib:%{!nostartfiles:%S}}}    %{static:} %{L*}
%(mfwrap) %(link_libgcc) %o %(mflib)
%{fprofile-arcs|fprofile-generate|coverage:-lgcov}
%{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}
%{!A:%{!nostdlib:%{!nostartfiles:%E}}} %{T*} }}}}}}




> 
> 
> 
> On 6/19/07, *Tom* < fivemiletom@gmail.com 
> <mailto:fivemiletom@gmail.com>> wrote:
> 
>     Hello,
> 
>      > Have tried both "generic_arm" and "ARM920T" as mentioned, but I
>     guess
>      > will go over all buildroot and nested options again.
> 
>     After setting the options as shown below, I am now getting over this
>     particular error and can compile and run my own very simple 'hello
>     world' init program:
>     arm-linux-uclibcgnueabi-gcc --static init.c -o init
> 
>     However, when using busybox instead of this, I still get an undefined
>     instruction error, because of a clz instruction @ pc=0x00081e60 which is
>     not valid for ARM920T. It seems to get included from
>     buildroot/toolchain_build_arm_nofpu/gcc-4.1.2/gcc/config/arm/lib1funcs.asm
>     [..]
>     #if __ARM_ARCH__ >= 5 && ! defined (__OPTIMIZE_SIZE__)
> 
>              clz     \curbit, \dividend
>              clz     \result, \divisor
> 
>     Is it necessary to set BR2_EXTRA_GCC_CONFIG_OPTIONS in .config ? Is
>     there anything relevant at all to this in make busybox-menuconfig?
> 
>     Thanks a lot,
>     Tom
> 
> 
> 
>     buildroot/.config
>     *****************************************************************************************
> 
>     #
>     # Automatically generated make config: don't edit
>     #
>     BR2_HAVE_DOT_CONFIG=y
>     # BR2_alpha is not set
>     BR2_arm=y
>     # BR2_armeb is not set
>     # BR2_avr32 is not set
>     # BR2_cris is not set
>     # BR2_i386 is not set
>     # BR2_m68k is not set
>     # BR2_mips is not set
>     # BR2_mipsel is not set
>     # BR2_nios2 is not set
>     # BR2_powerpc is not set
>     # BR2_sh is not set
>     # BR2_sh64 is not set
>     # BR2_sparc is not set
>     # BR2_x86_64 is not set
>     # BR2_generic_arm is not set
>     # BR2_arm610 is not set
>     # BR2_arm710 is not set
>     # BR2_arm720t is not set
>     BR2_arm920t=y
>     # BR2_arm922t is not set
>     # BR2_arm926t is not set
>     # BR2_arm1136jf_s is not set
>     # BR2_arm1176jz_s is not set
>     # BR2_arm1176jzf_s is not set
>     # BR2_sa110 is not set
>     # BR2_sa1100 is not set
>     # BR2_xscale is not set
>     # BR2_iwmmxt is not set
>     BR2_ARM_TYPE="ARM920T"
>     # BR2_ARM_OABI is not set
>     BR2_ARM_EABI=y
>     BR2_ARCH="arm"
>     BR2_ENDIAN="LITTLE"
> 
>     #
>     # Build options
>     #
>     BR2_WGET="wget --passive-ftp"
>     BR2_SVN="svn co"
>     BR2_ZCAT="gzip -d -c"
>     BR2_BZCAT="bzcat"
>     BR2_TAR_OPTIONS=""
>     BR2_DL_DIR="$(BASE_DIR)/dl"
>     BR2_SOURCEFORGE_MIRROR="easynews"
>     BR2_STAGING_DIR="/tw/tools/gnu/arm/linux-uclibc"
>     BR2_TOPDIR_PREFIX=""
>     BR2_TOPDIR_SUFFIX=""
>     BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
>     BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
>     BR2_JLEVEL=1
>     # BR2_PREFER_IMA is not set
>     # BR2_DEPRECATED is not set
>     # BR2_PREFER_STATIC_LIB is not set
>     BR2_TOOLCHAIN_BUILDROOT=y
>     # BR2_TOOLCHAIN_EXTERNAL is not set
> 
>     #
>     # Toolchain Options
>     #
> 
>     #
>     # Kernel Header Options
>     #
>     # BR2_KERNEL_HEADERS_2_4_25 is not set
>     # BR2_KERNEL_HEADERS_2_4_27 is not set
>     # BR2_KERNEL_HEADERS_2_4_29 is not set
>     # BR2_KERNEL_HEADERS_2_4_31 is not set
>     # BR2_KERNEL_HEADERS_2_6_9 is not set
>     # BR2_KERNEL_HEADERS_2_6_11 is not set
>     # BR2_KERNEL_HEADERS_2_6_12 is not set
>     # BR2_KERNEL_HEADERS_2_6_19_2 is not set
>     BR2_KERNEL_HEADERS_2_6_20=y
>     BR2_DEFAULT_KERNEL_HEADERS="2.6.20.4 <http://2.6.20.4>"
> 
>     #
>     # uClibc Options
>     #
>     # BR2_UCLIBC_VERSION_0_9_28 is not set
>     # BR2_UCLIBC_VERSION_0_9_28_3 is not set
>     BR2_UCLIBC_VERSION_0_9_29=y
>     # BR2_UCLIBC_VERSION_SNAPSHOT is not set
>     BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
>     # BR2_ENABLE_LOCALE is not set
>     # BR2_PTHREADS_NONE is not set
>     # BR2_PTHREADS is not set
>     BR2_PTHREADS_OLD=y
>     # BR2_PTHREADS_NATIVE is not set
>     # BR2_PTHREAD_DEBUG is not set
> 
>     #
>     # Binutils Options
>     #
>     # BR2_BINUTILS_VERSION_2_14_90_0_8 is not set
>     # BR2_BINUTILS_VERSION_2_15 is not set
>     # BR2_BINUTILS_VERSION_2_15_94_0_2_2 is not set
>     # BR2_BINUTILS_VERSION_2_16_1 is not set
>     # BR2_BINUTILS_VERSION_2_16_90_0_3 is not set
>     # BR2_BINUTILS_VERSION_2_16_91_0_5 is not set
>     # BR2_BINUTILS_VERSION_2_16_91_0_6 is not set
>     # BR2_BINUTILS_VERSION_2_16_91_0_7 is not set
>     BR2_BINUTILS_VERSION_2_17=y
>     # BR2_BINUTILS_VERSION_2_17_50_0_2 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_3 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_4 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_5 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_6 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_7 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_8 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_9 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_10 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_12 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_14 is not set
>     # BR2_BINUTILS_VERSION_2_17_50_0_16 is not set
>     BR2_BINUTILS_VERSION="2.17"
>     BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
> 
>     #
>     # Gcc Options
>     #
>     # BR2_GCC_VERSION_3_3_5 is not set
>     # BR2_GCC_VERSION_3_3_6 is not set
>     # BR2_GCC_VERSION_3_4_2 is not set
>     # BR2_GCC_VERSION_3_4_3 is not set
>     # BR2_GCC_VERSION_3_4_4 is not set
>     # BR2_GCC_VERSION_3_4_5 is not set
>     # BR2_GCC_VERSION_3_4_6 is not set
>     # BR2_GCC_VERSION_4_0_0 is not set
>     # BR2_GCC_VERSION_4_0_1 is not set
>     # BR2_GCC_VERSION_4_0_2 is not set
>     # BR2_GCC_VERSION_4_0_3 is not set
>     # BR2_GCC_VERSION_4_0_4 is not set
>     # BR2_GCC_VERSION_4_1_0 is not set
>     # BR2_GCC_VERSION_4_1_1 is not set
>     BR2_GCC_VERSION_4_1_2=y
>     # BR2_GCC_VERSION_4_2_0 is not set
>     # BR2_GCC_IS_SNAP is not set
>     BR2_GCC_VERSION="4.1.2"
>     # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
>     BR2_EXTRA_GCC_CONFIG_OPTIONS=""
>     # BR2_INSTALL_LIBSTDCPP is not set
>     # BR2_INSTALL_OBJC is not set
>     # BR2_INSTALL_FORTRAN is not set
>     # BR2_GCC_SHARED_LIBGCC is not set
> 
>     #
>     # Ccache Options
>     #
>     # BR2_CCACHE is not set
> 
>     #
>     # Gdb Options
>     #
>     # BR2_PACKAGE_GDB is not set
>     # BR2_PACKAGE_GDB_SERVER is not set
>     # BR2_PACKAGE_GDB_HOST is not set
> 
>     #
>     # elf2flt
>     #
>     # BR2_ELF2FLT is not set
>     # BR2_MKLIBS is not set
> 
>     #
>     # Common Toolchain Options
>     #
>     # BR2_PACKAGE_SSTRIP_TARGET is not set
>     # BR2_PACKAGE_SSTRIP_HOST is not set
>     # BR2_ENABLE_MULTILIB is not set
>     BR2_LARGEFILE=y
>     BR2_SOFT_FLOAT=y
>     BR2_TARGET_OPTIMIZATION="-Os -pipe"
>     # BR2_CROSS_TOOLCHAIN_TARGET_UTILS is not set
> 
>     #
>     # Package Selection for the target
>     #
> 
>     #
>     # The default minimal system
>     #
>     BR2_PACKAGE_BUSYBOX=y
>     # BR2_BUSYBOX_VERSION_1_0_1 is not set
>     # BR2_BUSYBOX_VERSION_1_1_3 is not set
>     # BR2_BUSYBOX_VERSION_1_2_2_1 is not set
>     # BR2_BUSYBOX_VERSION_1_4_0 is not set
>     # BR2_BUSYBOX_VERSION_1_4_1 is not set
>     # BR2_BUSYBOX_VERSION_1_4_2 is not set
>     # BR2_BUSYBOX_VERSION_1_5_0 is not set
>     # BR2_BUSYBOX_VERSION_1_5_1 is not set
>     BR2_BUSYBOX_VERSION_1_6_0=y
>     # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
>     BR2_BUSYBOX_VERSION="1.6.0"
>     BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
>     BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
>     # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
>     # BR2_PACKAGE_BUSYBOX_SKELETON is not set
> 
>     #
>     # The minimum needed to build a uClibc development system
>     #
>     BR2_PACKAGE_BASH=y
>     # BR2_PACKAGE_BZIP2 is not set
>     # BR2_PACKAGE_COREUTILS is not set
>     # BR2_PACKAGE_DIFFUTILS is not set
>     # BR2_PACKAGE_ED is not set
>     # BR2_PACKAGE_FINDUTILS is not set
>     # BR2_PACKAGE_FLEX is not set
>     # BR2_PACKAGE_GAWK is not set
>     # BR2_PACKAGE_GCC_TARGET is not set
>     BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS=""
>     # BR2_PACKAGE_GREP is not set
>     # BR2_PACKAGE_MAKE is not set
>     # BR2_PACKAGE_PATCH is not set
>     # BR2_PACKAGE_SED is not set
>     # BR2_PACKAGE_TAR is not set
> 
>     #
>     # Other development stuff
>     #
>     # BR2_PACKAGE_AUTOCONF is not set
>     # BR2_PACKAGE_AUTOMAKE is not set
>     # BR2_PACKAGE_BISON is not set
>     # BR2_PACKAGE_CCACHE_TARGET is not set
>     # BR2_PACKAGE_CVS is not set
>     # BR2_PACKAGE_DISTCC is not set
>     # BR2_PACKAGE_DMALLOC is not set
>     # BR2_PACKAGE_EXPAT is not set
>     # BR2_PACKAGE_FAKEROOT is not set
>     BR2_HOST_FAKEROOT=y
>     # BR2_PACKAGE_GETTEXT is not set
>     # BR2_PACKAGE_LIBINTL is not set
>     # BR2_PACKAGE_LIBGMP is not set
>     # BR2_PACKAGE_LIBMPFR is not set
>     # BR2_PACKAGE_LIBTOOL is not set
>     # BR2_PACKAGE_M4 is not set
>     # BR2_PACKAGE_MPATROL is not set
>     # BR2_PACKAGE_PKGCONFIG is not set
>     # BR2_READLINE is not set
>     # BR2_PACKAGE_XERCES is not set
> 
>     #
>     # Other stuff
>     #
>     # BR2_PACKAGE_AT is not set
>     # BR2_PACKAGE_BERKELEYDB is not set
>     # BR2_PACKAGE_BSDIFF is not set
>     # BR2_PACKAGE_CUSTOMIZE is not set
>     # BR2_PACKAGE_DASH is not set
>     # BR2_PACKAGE_FILE is not set
>     # BR2_PACKAGE_KEXEC is not set
>     # BR2_PACKAGE_LESS is not set
>     # BR2_PACKAGE_LIBELF is not set
>     # BR2_PACKAGE_LIBEVENT is not set
>     # BR2_PACKAGE_LIBFLOAT is not set
>     # BR2_PACKAGE_LIBLOCKFILE is not set
>     # BR2_PACKAGE_LIBSYSFS is not set
>     # BR2_PACKAGE_LOCKFILE_PROGS is not set
>     # BR2_PACKAGE_LSOF is not set
>     # BR2_PACKAGE_LTP-TESTSUITE is not set
>     # BR2_PACKAGE_LTT is not set
>     # BR2_PACKAGE_MICROCOM is not set
>     # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
>     # BR2_PACKAGE_MODUTILS is not set
>     # BR2_PACKAGE_NANO is not set
>     # BR2_PACKAGE_PORTAGE is not set
>     # BR2_PACKAGE_PROCPS is not set
>     # BR2_PACKAGE_PSMISC is not set
>     # BR2_PACKAGE_SQLITE is not set
>     # BR2_PACKAGE_STRACE is not set
>     # BR2_PACKAGE_SUDO is not set
>     # BR2_PACKAGE_SYSKLOGD is not set
>     # BR2_PACKAGE_SYSVINIT is not set
>     # BR2_PACKAGE_TINYLOGIN is not set
>     # BR2_PACKAGE_UEMACS is not set
>     # BR2_PACKAGE_UTIL-LINUX is not set
>     # BR2_PACKAGE_WHICH is not set
>     # BR2_NETWORK_SUPPORT is not set
>     # BR2_BLOCKDEV_SUPPORT is not set
>     # BR2_AUDIO_SUPPORT is not set
>     # BR2_GRAPHIC_SUPPORT is not set
>     BR2_PACKAGE_NCURSES=y
>     # BR2_COMPRESSOR_SUPPORT is not set
>     # BR2_SCRIPTING_SUPPORT is not set
> 
>     #
>     # Target Options
>     #
> 
>     #
>     # filesystem for target device
>     #
>     # BR2_TARGET_ROOTFS_CRAMFS is not set
>     # BR2_TARGET_ROOTFS_CLOOP is not set
>     # BR2_TARGET_ROOTFS_EXT2 is not set
>     # BR2_TARGET_ROOTFS_JFFS2 is not set
>     # BR2_TARGET_ROOTFS_SQUASHFS is not set
>     # BR2_TARGET_ROOTFS_TAR is not set
>     BR2_TARGET_ROOTFS_CPIO=y
> 
>     #
>     # bootloader for target device
>     #
> 
>     #
>     # Board Support Options
>     #
>     # BR2_PACKAGE_LINUX is not set
> 
>     #
>     # Arm based Device Support
>     #
>     # BR2_TARGET_ARM_INTEGRATOR_926 is not set
>     # BR2_TARGET_ATMEL is not set
> 
>     #
>     # Sharp Specific Device Support
>     #
>     # BR2_TARGET_SHARP_LNODE80 is not set
> 
>     #
>     # Generic System Support
>     #
>     # BR2_TARGET_GENERIC_ACCESS_POINT is not set
>     # BR2_TARGET_GENERIC_FIREWALL is not set
>     # BR2_TARGET_GENERIC_DEV_SYSTEM is not set
> 
> 
>     buildroot/toolchain/uClibc/uClibc-0.9.29.config
>     *****************************************************************************************
>     #
>     # Automatically generated make config: don't edit
>     # Tue Jun 19 14:22:49 2007
>     #
>     # TARGET_alpha is not set
>     TARGET_arm=y
>     # TARGET_bfin is not set
>     # TARGET_cris is not set
>     # TARGET_e1 is not set
>     # TARGET_frv is not set
>     # TARGET_h8300 is not set
>     # TARGET_hppa is not set
>     # TARGET_i386 is not set
>     # TARGET_i960 is not set
>     # TARGET_ia64 is not set
>     # TARGET_m68k is not set
>     # TARGET_microblaze is not set
>     # TARGET_mips is not set
>     # TARGET_nios is not set
>     # TARGET_nios2 is not set
>     # TARGET_powerpc is not set
>     # TARGET_sh is not set
>     # TARGET_sh64 is not set
>     # TARGET_sparc is not set
>     # TARGET_v850 is not set
>     # TARGET_vax is not set
>     # TARGET_x86_64 is not set
> 
>     #
>     # Target Architecture Features and Options
>     #
>     TARGET_ARCH="arm"
>     FORCE_OPTIONS_FOR_ARCH=y
>     # CONFIG_ARM_OABI is not set
>     CONFIG_ARM_EABI=y
>     USE_BX=y
>     # CONFIG_GENERIC_ARM is not set
>     # CONFIG_ARM610 is not set
>     # CONFIG_ARM710 is not set
>     # CONFIG_ARM7TDMI is not set
>     # CONFIG_ARM720T is not set
>     CONFIG_ARM920T=y
>     # CONFIG_ARM922T is not set
>     # CONFIG_ARM926T is not set
>     # CONFIG_ARM10T is not set
>     # CONFIG_ARM1136JF_S is not set
>     # CONFIG_ARM1176JZ_S is not set
>     # CONFIG_ARM1176JZF_S is not set
>     # CONFIG_ARM_SA110 is not set
>     # CONFIG_ARM_SA1100 is not set
>     # CONFIG_ARM_XSCALE is not set
>     # CONFIG_ARM_IWMMXT is not set
>     TARGET_SUBARCH=""
> 
>     #
>     # Using ELF file format
>     #
>     ARCH_ANY_ENDIAN=y
>     ARCH_LITTLE_ENDIAN=y
>     # ARCH_WANTS_BIG_ENDIAN is not set
>     ARCH_WANTS_LITTLE_ENDIAN=y
>     ARCH_HAS_MMU=y
>     ARCH_USE_MMU=y
>     UCLIBC_HAS_FLOATS=y
>     # UCLIBC_HAS_FPU is not set
>     UCLIBC_HAS_SOFT_FLOAT=y
>     DO_C99_MATH=y
>     KERNEL_HEADERS="/tw/buildroot/toolchain_build_arm_nofpu/linux/include"
>     HAVE_DOT_CONFIG=y
> 
>     #
>     # General Library Settings
>     #
>     # HAVE_NO_PIC is not set
>     DOPIC=y
>     # HAVE_NO_SHARED is not set
>     # ARCH_HAS_NO_LDSO is not set
>     HAVE_SHARED=y
>     # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
>     LDSO_LDD_SUPPORT=y
>     LDSO_CACHE_SUPPORT=y
>     # LDSO_PRELOAD_FILE_SUPPORT is not set
>     LDSO_BASE_FILENAME="ld.so"
>     # UCLIBC_STATIC_LDCONFIG is not set
>     # LDSO_RUNPATH is not set
>     UCLIBC_CTOR_DTOR=y
>     # HAS_NO_THREADS is not set
>     UCLIBC_HAS_THREADS=y
>     # PTHREADS_DEBUG_SUPPORT is not set
>     LINUXTHREADS_OLD=y
>     UCLIBC_HAS_LFS=y
>     # MALLOC is not set
>     # MALLOC_SIMPLE is not set
>     MALLOC_STANDARD=y
>     MALLOC_GLIBC_COMPAT=y
>     UCLIBC_DYNAMIC_ATEXIT=y
>     # COMPAT_ATEXIT is not set
>     # UCLIBC_SUSV3_LEGACY is not set
>     UCLIBC_SUSV3_LEGACY_MACROS=y
>     UCLIBC_HAS_SHADOW=y
>     # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
>     UCLIBC_HAS___PROGNAME=y
>     # UNIX98PTY_ONLY is not set
>     ASSUME_DEVPTS=y
>     UCLIBC_HAS_TM_EXTENSIONS=y
>     UCLIBC_HAS_TZ_CACHING=y
>     UCLIBC_HAS_TZ_FILE=y
>     UCLIBC_HAS_TZ_FILE_READ_MANY=y
>     UCLIBC_TZ_FILE_PATH="/etc/TZ"
> 
>     #
>     # Advanced Library Settings
>     #
>     UCLIBC_PWD_BUFFER_SIZE=256
>     UCLIBC_GRP_BUFFER_SIZE=256
> 
>     #
>     # Networking Support
>     #
>     # UCLIBC_HAS_IPV6 is not set
>     # UCLIBC_HAS_RPC is not set
>     # UCLIBC_USE_NETLINK is not set
>     # UCLIBC_HAS_BSD_RES_CLOSE is not set
> 
>     #
>     # String and Stdio Support
>     #
>     UCLIBC_HAS_STRING_GENERIC_OPT=y
>     UCLIBC_HAS_STRING_ARCH_OPT=y
>     UCLIBC_HAS_CTYPE_TABLES=y
>     UCLIBC_HAS_CTYPE_SIGNED=y
>     # UCLIBC_HAS_CTYPE_UNSAFE is not set
>     UCLIBC_HAS_CTYPE_CHECKED=y
>     # UCLIBC_HAS_CTYPE_ENFORCED is not set
>     UCLIBC_HAS_WCHAR=y
>     # UCLIBC_HAS_LOCALE is not set
>     # UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
>     UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
>     UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
>     UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
>     # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
>     # UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
>     # UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
>     # UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
>     # UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
>     UCLIBC_HAS_STDIO_BUFSIZ_4096=y
>     # UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
>     UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
>     # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
>     # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
>     # UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
>     UCLIBC_HAS_STDIO_GETC_MACRO=y
>     UCLIBC_HAS_STDIO_PUTC_MACRO=y
>     UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
>     # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
>     UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
>     UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
>     UCLIBC_HAS_PRINTF_M_SPEC=y
>     UCLIBC_HAS_ERRNO_MESSAGES=y
>     # UCLIBC_HAS_SYS_ERRLIST is not set
>     UCLIBC_HAS_SIGNUM_MESSAGES=y
>     # UCLIBC_HAS_SYS_SIGLIST is not set
>     UCLIBC_HAS_GNU_GETOPT=y
>     UCLIBC_HAS_GNU_GETSUBOPT=y
> 
>     #
>     # Big and Tall
>     #
>     UCLIBC_HAS_REGEX=y
>     UCLIBC_HAS_REGEX_OLD=y
>     UCLIBC_HAS_FNMATCH=y
>     UCLIBC_HAS_FNMATCH_OLD=y
>     # UCLIBC_HAS_WORDEXP is not set
>     UCLIBC_HAS_FTW=y
>     UCLIBC_HAS_GLOB=y
>     UCLIBC_HAS_GNU_GLOB=y
> 
>     #
>     # Library Installation Options
>     #
>     SHARED_LIB_LOADER_PREFIX="/lib"
>     RUNTIME_PREFIX="/"
>     DEVEL_PREFIX="/usr/"
> 
>     #
>     # Security options
>     #
>     # UCLIBC_BUILD_PIE is not set
>     # UCLIBC_HAS_ARC4RANDOM is not set
>     # HAVE_NO_SSP is not set
>     # UCLIBC_HAS_SSP is not set
>     UCLIBC_BUILD_RELRO=y
>     UCLIBC_BUILD_NOW=y
>     # UCLIBC_BUILD_NOEXECSTACK is not set
> 
>     #
>     # uClibc development/debugging options
>     #
>     CROSS_COMPILER_PREFIX="/tw/tools/gnu/arm/linux-uclibc/bin/arm-linux-uclibcgnueabi-"
> 
>     UCLIBC_EXTRA_CFLAGS=""
>     # DODEBUG is not set
>     # DODEBUG_PT is not set
>     DOSTRIP=y
>     # DOASSERTS is not set
>     # SUPPORT_LD_DEBUG is not set
>     # SUPPORT_LD_DEBUG_EARLY is not set
>     # UCLIBC_MALLOC_DEBUGGING is not set
>     WARNINGS="-Wall"
>     # EXTRA_WARNINGS is not set
>     # DOMULTI is not set
>     # UCLIBC_MJN3_ONLY is not set
> 
> 
>     _______________________________________________
>     buildroot mailing list
>     buildroot at uclibc.org <mailto:buildroot@uclibc.org>
>     http://busybox.net/mailman/listinfo/buildroot
> 
> 
