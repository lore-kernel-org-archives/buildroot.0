From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jul 2010 10:23:43 -0700
Subject: [Buildroot] [PATCH][v3] Add support for uclibc NPTL toolchain.
In-Reply-To: <AANLkTimbIHU5Un7kt-LNM8Q3dCcdxCX9oO7Ez1A2CGNu@mail.gmail.com>
References: <1279094606-15086-1-git-send-email-raj.khem@gmail.com> 
	<AANLkTimbIHU5Un7kt-LNM8Q3dCcdxCX9oO7Ez1A2CGNu@mail.gmail.com>
Message-ID: <AANLkTimT1wRey9aP_S9dyrRfchAsXhHJC-LahxTqK2EB@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 15, 2010 at 6:20 AM, Viktar Palstsiuk
<viktar.palstsiuk@promwad.com> wrote:
> I'm trying to make arm_nptl_toolchain_defconfig (buildroot-20100715
> with nptl patch) but get this error:
>
> vic at ws-024:~/projects/synchro/src/buildroot$ make
> /usr/bin/make -j1 -C
> /home/vic/projects/synchro/src/buildroot/output/toolchain/uClibc \
> ? ? ? ? ? ? ? ?ARCH="arm" \
> ? ? ? ? ? ? ? ?PREFIX= \
> ? ? ? ? ? ? ? ?DEVEL_PREFIX=/ \
> ? ? ? ? ? ? ? ?RUNTIME_PREFIX=/ \
> ? ? ? ? ? ? ? ?HOSTCC="/usr/bin/gcc" \
> ? ? ? ? ? ? ? ?all
> make[1]: Entering directory
> `/home/vic/projects/synchro/src/buildroot/output/toolchain/uClibc'
> make[2]: Nothing to be done for `locale_headers'.
> ?CC ldso/ldso/ldso.oS
> In file included from ldso/ldso/ldso.c:42:
> ldso/ldso/dl-tls.c: In function 'init_tls':
> ldso/ldso/dl-tls.c:1028: error: '__a1' undeclared (first use in this function)
> ldso/ldso/dl-tls.c:1028: error: (Each undeclared identifier is
> reported only once
> ldso/ldso/dl-tls.c:1028: error: for each function it appears in.)
> In file included from ldso/ldso/ldso.c:46:
> ldso/ldso/arm/elfinterp.c: In function '_dl_linux_resolver':
> ldso/ldso/arm/elfinterp.c:73: warning: assignment makes integer from
> pointer without a cast
> ldso/ldso/arm/elfinterp.c: In function '_dl_do_reloc':
> ldso/ldso/arm/elfinterp.c:203: warning: assignment makes integer from
> pointer without a cast
> ldso/ldso/arm/elfinterp.c:191: warning: unused variable 'def'
> ldso/ldso/ldso.c: In function '_dl_get_ready_to_run':
> ldso/ldso/ldso.c:995: error: '__a1' undeclared (first use in this function)
> make[1]: *** [ldso/ldso/ldso.oS] Error 1
> make[1]: Leaving directory
> `/home/vic/projects/synchro/src/buildroot/output/toolchain/uClibc'
> make: *** [/home/vic/projects/synchro/src/buildroot/output/toolchain/uClibc/lib/libc.a]
> Error 2

Thanks for report. This was introduced recently in uclibc upstream.
I have fixed it in uclibc with commit 48d3643f218a9257f78a5363b4bbbb6edaaabc66
You have to either apply this
patch manually or wait for next snapshot. Alternatively you can switch
to an older snapshot(13th July
should be ok)

you have to delete your downloaded tar file from dl/ dir to fetch is fresh



>
>
> On Wed, Jul 14, 2010 at 11:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> In V3 patch it should stage the thread_db headers properly
>> which are needed for compiling gdbserver
>>
>> This patch modifies current toolchain build sequence so that
>> NPTL enabled toolchain can be built. The new sequence works
>> well with linuxthreads as well.
>>
>> It introduces a new pass for gcc cross compilation. The new
>> sequence is binutils->gcc-initial->linux-headers -> uclibc-configured
>> (some cheats to generate phony shared libc.so and libm.o)
>> -> gcc-intermediate(with shared lib support) -> uclibc -> gcc-final
>>
>> I also added a new sample config arm_nptl_toolchain_defconfig which
>> builds the toolchain and busybox.
>>
>> I have only tried it on arm. However it should work for other
>> architectures which support NPTL on uclibc e.g. mips, sh, x86, ppc, x86_64
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> ?configs/arm_nptl_toolchain_defconfig ? ?| ?751 +++++++++++++++++++++++++++++++
>> ?toolchain/binutils/binutils.mk ? ? ? ? ?| ? ?2 +-
>> ?toolchain/gcc/Config.in ? ? ? ? ? ? ? ? | ? ?2 +-
>> ?toolchain/gcc/gcc-uclibc-4.x.mk ? ? ? ? | ?128 ++++--
>> ?toolchain/uClibc/uClibc-snapshot.config | ?116 ++++--
>> ?toolchain/uClibc/uclibc.mk ? ? ? ? ? ? ?| ? 15 +-
>> ?6 files changed, 950 insertions(+), 64 deletions(-)
>> ?create mode 100644 configs/arm_nptl_toolchain_defconfig
>>
>> diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
>> new file mode 100644
>> index 0000000..a96a4ad
>> --- /dev/null
>> +++ b/configs/arm_nptl_toolchain_defconfig
>> @@ -0,0 +1,751 @@
>> +#
>> +# Automatically generated make config: don't edit
>> +# Tue Jul 13 13:53:48 2010
>> +#
>> +BR2_HAVE_DOT_CONFIG=y
>> +BR2_VERSION="2010.08-git"
>> +# BR2_alpha is not set
>> +BR2_arm=y
>> +# BR2_armeb is not set
>> +# BR2_avr32 is not set
>> +# BR2_cris is not set
>> +# BR2_ia64 is not set
>> +# BR2_i386 is not set
>> +# BR2_m68k is not set
>> +# BR2_mips is not set
>> +# BR2_mipsel is not set
>> +# BR2_powerpc is not set
>> +# BR2_sh is not set
>> +# BR2_sh64 is not set
>> +# BR2_sparc is not set
>> +# BR2_sparc64 is not set
>> +# BR2_x86_64 is not set
>> +# BR2_xtensa is not set
>> +# BR2_generic_arm is not set
>> +# BR2_arm7tdmi is not set
>> +# BR2_arm610 is not set
>> +# BR2_arm710 is not set
>> +# BR2_arm720t is not set
>> +# BR2_arm920t is not set
>> +# BR2_arm922t is not set
>> +BR2_arm926t=y
>> +# BR2_arm10t is not set
>> +# BR2_arm1136jf_s is not set
>> +# BR2_arm1176jz_s is not set
>> +# BR2_arm1176jzf_s is not set
>> +
>> +#
>> +# cortex-A8 needs gcc >= 4.4.x
>> +#
>> +# BR2_cortex_a8 is not set
>> +# BR2_sa110 is not set
>> +# BR2_sa1100 is not set
>> +# BR2_xscale is not set
>> +# BR2_iwmmxt is not set
>> +BR2_ARM_TYPE="ARM926T"
>> +BR2_ARM_EABI=y
>> +# BR2_ARM_OABI is not set
>> +BR2_ARCH="arm"
>> +BR2_ENDIAN="LITTLE"
>> +BR2_GCC_TARGET_TUNE="arm926ej-s"
>> +BR2_GCC_TARGET_ARCH="armv5te"
>> +BR2_GCC_TARGET_ABI="aapcs-linux"
>> +
>> +#
>> +# Target options
>> +#
>> +
>> +#
>> +# Preset Devices
>> +#
>> +BR2_TARGET_ARMLTD=y
>> +
>> +#
>> +# ARM Ltd. based Device Support
>> +#
>> +# BR2_TARGET_ARM_INTEGRATOR_926 is not set
>> +BR2_TARGET_ARM_INTEGRATOR_926_HUGE=y
>> +BR2_BOARD_NAME="integrator926_huge"
>> +BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
>> +# BR2_TARGET_ATMEL is not set
>> +# BR2_TARGET_KWIKBYTE is not set
>> +BR2_TARGET_GENERIC_HOSTNAME="buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot with NPTL"
>> +BR2_TARGET_GENERIC_GETTY=y
>> +# BR2_TARGET_GENERIC_GETTY_NONE is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYS0 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYS2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYS3 is not set
>> +BR2_TARGET_GENERIC_GETTY_TTYAMA0=y
>> +# BR2_TARGET_GENERIC_GETTY_TTYAMA1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYAMA2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYAMA3 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYSAC0 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYSAC1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYSAC2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYSAC3 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYMXC0 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYMXC1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYMXC2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYUL0 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYUL1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYUL2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYUL3 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYPSC0 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYPSC1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYPSC2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYPSC3 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYCPM0 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYCPM1 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYCPM2 is not set
>> +# BR2_TARGET_GENERIC_GETTY_TTYCPM3 is not set
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>> +# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
>> +# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
>> +# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
>> +# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
>> +# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
>> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>> +BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
>> +
>> +#
>> +# Build options
>> +#
>> +
>> +#
>> +# Commands
>> +#
>> +BR2_WGET="wget --passive-ftp -nd"
>> +BR2_SVN_CO="svn co"
>> +BR2_SVN_UP="svn up"
>> +BR2_BZR_CO="bzr co"
>> +BR2_BZR_UP="bzr up"
>> +BR2_GIT="git clone"
>> +BR2_ZCAT="gzip -d -c"
>> +BR2_BZCAT="bzcat"
>> +BR2_TAR_OPTIONS=""
>> +BR2_DL_DIR="$(TOPDIR)/dl"
>> +BR2_STAGING_DIR="$(BASE_DIR)/staging"
>> +
>> +#
>> +# Mirrors and Download locations
>> +#
>> +BR2_PRIMARY_SITE=""
>> +BR2_BACKUP_SITE="http://sources.buildroot.net/"
>> +BR2_SOURCEFORGE_MIRROR="easynews"
>> +BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
>> +BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
>> +BR2_DEBIAN_MIRROR="http://ftp.debian.org"
>> +BR2_JLEVEL=2
>> +# BR2_DEPRECATED is not set
>> +# BR2_ENABLE_DEBUG is not set
>> +BR2_STRIP_strip=y
>> +# BR2_STRIP_sstrip is not set
>> +# BR2_STRIP_none is not set
>> +# BR2_OPTIMIZE_0 is not set
>> +# BR2_OPTIMIZE_1 is not set
>> +BR2_OPTIMIZE_2=y
>> +# BR2_OPTIMIZE_3 is not set
>> +# BR2_OPTIMIZE_S is not set
>> +# BR2_PREFER_STATIC_LIB is not set
>> +# BR2_HAVE_DOCUMENTATION is not set
>> +# BR2_HAVE_DEVFILES is not set
>> +
>> +#
>> +# Advanced
>> +#
>> +BR2_CONFIG_CACHE=y
>> +
>> +#
>> +# Toolchain
>> +#
>> +BR2_TOOLCHAIN_BUILDROOT=y
>> +# BR2_TOOLCHAIN_EXTERNAL is not set
>> +
>> +#
>> +# Kernel Header Options
>> +#
>> +# BR2_KERNEL_HEADERS_2_6_27 is not set
>> +# BR2_KERNEL_HEADERS_2_6_28 is not set
>> +# BR2_KERNEL_HEADERS_2_6_29 is not set
>> +# BR2_KERNEL_HEADERS_2_6_30 is not set
>> +# BR2_KERNEL_HEADERS_2_6_31 is not set
>> +# BR2_KERNEL_HEADERS_2_6_32 is not set
>> +# BR2_KERNEL_HEADERS_2_6_33 is not set
>> +BR2_KERNEL_HEADERS_2_6_34=y
>> +# BR2_KERNEL_HEADERS_VERSION is not set
>> +# BR2_KERNEL_HEADERS_SNAP is not set
>> +BR2_DEFAULT_KERNEL_HEADERS="2.6.34.1"
>> +
>> +#
>> +# uClibc Options
>> +#
>> +# BR2_UCLIBC_VERSION_0_9_28_3 is not set
>> +# BR2_UCLIBC_VERSION_0_9_29 is not set
>> +# BR2_UCLIBC_VERSION_0_9_30 is not set
>> +# BR2_UCLIBC_VERSION_0_9_31 is not set
>> +BR2_UCLIBC_VERSION_SNAPSHOT=y
>> +BR2_USE_UCLIBC_SNAPSHOT="snapshot"
>> +BR2_UCLIBC_VERSION_STRING="snapshot"
>> +BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-snapshot.config"
>> +BR2_PTHREAD_DEBUG=y
>> +# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
>> +
>> +#
>> +# Binutils Options
>> +#
>> +# BR2_BINUTILS_VERSION_2_17 is not set
>> +# BR2_BINUTILS_VERSION_2_18 is not set
>> +# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
>> +# BR2_BINUTILS_VERSION_2_19 is not set
>> +# BR2_BINUTILS_VERSION_2_19_1 is not set
>> +# BR2_BINUTILS_VERSION_2_20 is not set
>> +BR2_BINUTILS_VERSION_2_20_1=y
>> +BR2_BINUTILS_VERSION="2.20.1"
>> +BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
>> +
>> +#
>> +# GCC Options
>> +#
>> +# BR2_GCC_VERSION_4_2_1 is not set
>> +# BR2_GCC_VERSION_4_2_2 is not set
>> +# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
>> +# BR2_GCC_VERSION_4_2_3 is not set
>> +# BR2_GCC_VERSION_4_2_4 is not set
>> +# BR2_GCC_VERSION_4_3_X is not set
>> +BR2_GCC_VERSION_4_4_X=y
>> +# BR2_GCC_VERSION_SNAP is not set
>> +BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
>> +BR2_GCC_VERSION="4.4.4"
>> +# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
>> +BR2_EXTRA_GCC_CONFIG_OPTIONS=""
>> +# BR2_GCC_CROSS_FORTRAN is not set
>> +# BR2_INSTALL_LIBGCJ is not set
>> +# BR2_INSTALL_OBJC is not set
>> +# BR2_INSTALL_FORTRAN is not set
>> +BR2_GCC_SHARED_LIBGCC=y
>> +BR2_GCC_ENABLE_TLS=y
>> +
>> +#
>> +# Ccache Options
>> +#
>> +# BR2_CCACHE is not set
>> +
>> +#
>> +# Gdb Options
>> +#
>> +# BR2_PACKAGE_GDB is not set
>> +
>> +#
>> +# Gdb debugger for the target needs WCHAR support in toolchain
>> +#
>> +# BR2_PACKAGE_GDB_SERVER is not set
>> +# BR2_PACKAGE_GDB_HOST is not set
>> +
>> +#
>> +# Common Toolchain Options
>> +#
>> +BR2_LARGEFILE=y
>> +BR2_INET_IPV6=y
>> +BR2_INET_RPC=y
>> +BR2_ENABLE_LOCALE=y
>> +# BR2_ENABLE_LOCALE_PURGE is not set
>> +BR2_NEEDS_GETTEXT=y
>> +BR2_NEEDS_GETTEXT_IF_LOCALE=y
>> +BR2_USE_WCHAR=y
>> +BR2_PREFER_SOFT_FLOAT=y
>> +BR2_SOFT_FLOAT=y
>> +# BR2_USE_SSP is not set
>> +# BR2_PTHREADS_NONE is not set
>> +# BR2_PTHREADS is not set
>> +# BR2_PTHREADS_OLD is not set
>> +BR2_PTHREADS_NATIVE=y
>> +# BR2_PROGRAM_INVOCATION is not set
>> +BR2_GCC_CROSS_CXX=y
>> +BR2_INSTALL_LIBSTDCPP=y
>> +BR2_TARGET_OPTIMIZATION="-Os -pipe"
>> +# BR2_ELF2FLT is not set
>> +# BR2_MKLIBS is not set
>> +# BR2_PACKAGE_SSTRIP_TARGET is not set
>> +# BR2_PACKAGE_SSTRIP_HOST is not set
>> +# BR2_ENABLE_MULTILIB is not set
>> +BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
>> +
>> +#
>> +# Package Selection for the target
>> +#
>> +BR2_PACKAGE_BUSYBOX=y
>> +# BR2_BUSYBOX_VERSION_1_13_X is not set
>> +# BR2_BUSYBOX_VERSION_1_14_X is not set
>> +# BR2_BUSYBOX_VERSION_1_15_X is not set
>> +# BR2_BUSYBOX_VERSION_1_16_X is not set
>> +BR2_BUSYBOX_VERSION_1_17_X=y
>> +# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
>> +BR2_BUSYBOX_VERSION="1.17.0"
>> +BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
>> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +# BR2_PACKAGE_BUSYBOX_SKELETON is not set
>> +# BR2_PACKAGE_CUSTOMIZE is not set
>> +
>> +#
>> +# Audio and video libraries and applications
>> +#
>> +# BR2_PACKAGE_ALSA_LIB is not set
>> +# BR2_PACKAGE_AUMIX is not set
>> +# BR2_PACKAGE_FLAC is not set
>> +# BR2_PACKAGE_FFMPEG is not set
>> +# BR2_PACKAGE_GSTREAMER is not set
>> +# BR2_PACKAGE_LIBCDAUDIO is not set
>> +# BR2_PACKAGE_LIBDVDREAD is not set
>> +# BR2_PACKAGE_LIBDVDNAV is not set
>> +# BR2_PACKAGE_LIBID3TAG is not set
>> +# BR2_PACKAGE_LIBMAD is not set
>> +# BR2_PACKAGE_LIBMMS is not set
>> +# BR2_PACKAGE_LIBMPD is not set
>> +# BR2_PACKAGE_LIBOGG is not set
>> +# BR2_PACKAGE_LIBSNDFILE is not set
>> +# BR2_PACKAGE_LIBTHEORA is not set
>> +# BR2_PACKAGE_LIBVORBIS is not set
>> +# BR2_PACKAGE_MADPLAY is not set
>> +# BR2_PACKAGE_MPG123 is not set
>> +# BR2_PACKAGE_MPLAYER is not set
>> +# BR2_PACKAGE_SPEEX is not set
>> +# BR2_PACKAGE_SWFDEC is not set
>> +# BR2_PACKAGE_FESTIVAL is not set
>> +# BR2_PACKAGE_TAGLIB is not set
>> +# BR2_PACKAGE_TREMOR is not set
>> +
>> +#
>> +# Compressors and decompressors
>> +#
>> +# BR2_PACKAGE_BZIP2 is not set
>> +# BR2_PACKAGE_GZIP is not set
>> +# BR2_PACKAGE_LZOP is not set
>> +# BR2_PACKAGE_LZMA is not set
>> +
>> +#
>> +# Debugging, profiling and benchmark
>> +#
>> +# BR2_PACKAGE_DMALLOC is not set
>> +# BR2_PACKAGE_KEXEC is not set
>> +# BR2_PACKAGE_LMBENCH is not set
>> +# BR2_PACKAGE_LSOF is not set
>> +# BR2_PACKAGE_LTRACE is not set
>> +# BR2_PACKAGE_MEMSTAT is not set
>> +# BR2_PACKAGE_NETPERF is not set
>> +# BR2_PACKAGE_OPROFILE is not set
>> +# BR2_PACKAGE_STRACE is not set
>> +
>> +#
>> +# Development tools
>> +#
>> +# BR2_PACKAGE_AUTOCONF is not set
>> +# BR2_PACKAGE_AUTOMAKE is not set
>> +# BR2_PACKAGE_BISON is not set
>> +# BR2_PACKAGE_BSDIFF is not set
>> +
>> +#
>> +# coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support
>> +#
>> +# BR2_PACKAGE_CVS is not set
>> +# BR2_PACKAGE_DIFFUTILS is not set
>> +# BR2_PACKAGE_DISTCC is not set
>> +# BR2_PACKAGE_FAKEROOT is not set
>> +# BR2_PACKAGE_FINDUTILS is not set
>> +# BR2_PACKAGE_FLEX is not set
>> +# BR2_PACKAGE_GAWK is not set
>> +
>> +#
>> +# native toolchain needs development files in target filesystem
>> +#
>> +# BR2_PACKAGE_GETTEXT is not set
>> +# BR2_PACKAGE_LIBINTL is not set
>> +# BR2_PACKAGE_LIBGMP is not set
>> +# BR2_PACKAGE_GPERF is not set
>> +# BR2_PACKAGE_GREP is not set
>> +# BR2_PACKAGE_INTLTOOL is not set
>> +# BR2_PACKAGE_MAKE is not set
>> +# BR2_PACKAGE_LIBMPFR is not set
>> +# BR2_PACKAGE_LIBTOOL is not set
>> +# BR2_PACKAGE_M4 is not set
>> +# BR2_PACKAGE_PATCH is not set
>> +# BR2_PACKAGE_PKG_CONFIG is not set
>> +# BR2_PACKAGE_SED is not set
>> +
>> +#
>> +# tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support
>> +#
>> +
>> +#
>> +# Games
>> +#
>> +# BR2_PACKAGE_GNUCHESS is not set
>> +# BR2_PACKAGE_PRBOOM is not set
>> +
>> +#
>> +# Graphic libraries and applications (graphic/text)
>> +#
>> +
>> +#
>> +# graphic libraries
>> +#
>> +# BR2_PACKAGE_DIRECTFB is not set
>> +# BR2_PACKAGE_FBDUMP is not set
>> +# BR2_PACKAGE_FBSET is not set
>> +# BR2_PACKAGE_FBV is not set
>> +# BR2_PACKAGE_IMAGEMAGICK is not set
>> +# BR2_PACKAGE_LINUX_FUSION is not set
>> +# BR2_PACKAGE_SDL is not set
>> +
>> +#
>> +# other GUIs
>> +#
>> +# BR2_PACKAGE_QT is not set
>> +# BR2_PACKAGE_XORG7 is not set
>> +
>> +#
>> +# X libraries and helper libraries
>> +#
>> +# BR2_PACKAGE_LIBERATION is not set
>> +
>> +#
>> +# X Window managers
>> +#
>> +
>> +#
>> +# X applications
>> +#
>> +# BR2_PACKAGE_GOB2 is not set
>> +
>> +#
>> +# Hardware handling
>> +#
>> +# BR2_PACKAGE_CDRKIT is not set
>> +# BR2_PACKAGE_CRAMFS is not set
>> +
>> +#
>> +# dbus not available (need expat or libxml2)
>> +#
>> +# BR2_PACKAGE_DEVMEM2 is not set
>> +# BR2_PACKAGE_DMRAID is not set
>> +# BR2_PACKAGE_DOSFSTOOLS is not set
>> +# BR2_PACKAGE_E2FSPROGS is not set
>> +# BR2_PACKAGE_EEPROG is not set
>> +# BR2_PACKAGE_FCONFIG is not set
>> +# BR2_PACKAGE_FIS is not set
>> +# BR2_PACKAGE_GADGETFS_TEST is not set
>> +# BR2_PACKAGE_GENEXT2FS is not set
>> +# BR2_PACKAGE_GENROMFS is not set
>> +# BR2_PACKAGE_GVFS is not set
>> +# BR2_PACKAGE_HAL is not set
>> +# BR2_PACKAGE_HDPARM is not set
>> +# BR2_PACKAGE_HOTPLUG is not set
>> +# BR2_PACKAGE_HWDATA is not set
>> +# BR2_PACKAGE_I2C_TOOLS is not set
>> +# BR2_PACKAGE_INPUT_TOOLS is not set
>> +# BR2_PACKAGE_IOSTAT is not set
>> +# BR2_PACKAGE_LM_SENSORS is not set
>> +# BR2_PACKAGE_LVM2 is not set
>> +# BR2_PACKAGE_MAKEDEVS is not set
>> +# BR2_PACKAGE_MDADM is not set
>> +# BR2_PACKAGE_MEMTESTER is not set
>> +# BR2_PACKAGE_MTD is not set
>> +# BR2_PACKAGE_NTFS_3G is not set
>> +# BR2_PACKAGE_NTFSPROGS is not set
>> +# BR2_PACKAGE_PCIUTILS is not set
>> +# BR2_PACKAGE_SETSERIAL is not set
>> +# BR2_PACKAGE_SFDISK is not set
>> +# BR2_PACKAGE_SMARTMONTOOLS is not set
>> +# BR2_PACKAGE_SQUASHFS is not set
>> +# BR2_PACKAGE_SYSSTAT is not set
>> +# BR2_PACKAGE_UDEV is not set
>> +# BR2_PACKAGE_USB_MODESWITCH is not set
>> +# BR2_PACKAGE_USBMOUNT is not set
>> +# BR2_PACKAGE_USBUTILS is not set
>> +# BR2_PACKAGE_WIPE is not set
>> +# BR2_PACKAGE_XFSPROGS is not set
>> +
>> +#
>> +# Interpreter languages and scripting
>> +#
>> +# BR2_PACKAGE_HASERL is not set
>> +# BR2_PACKAGE_LUA is not set
>> +# BR2_PACKAGE_MICROPERL is not set
>> +# BR2_PACKAGE_PHP is not set
>> +# BR2_PACKAGE_PYTHON is not set
>> +# BR2_PACKAGE_RUBY is not set
>> +# BR2_PACKAGE_TCL is not set
>> +
>> +#
>> +# Libraries
>> +#
>> +
>> +#
>> +# Compression and decompression
>> +#
>> +# BR2_PACKAGE_LIBARCHIVE is not set
>> +# BR2_PACKAGE_LZO is not set
>> +# BR2_PACKAGE_ZLIB is not set
>> +
>> +#
>> +# Crypto
>> +#
>> +# BR2_PACKAGE_BEECRYPT is not set
>> +# BR2_PACKAGE_LIBGCRYPT is not set
>> +# BR2_PACKAGE_LIBGPG_ERROR is not set
>> +# BR2_PACKAGE_OPENSSL is not set
>> +
>> +#
>> +# Database
>> +#
>> +# BR2_PACKAGE_BERKELEYDB is not set
>> +# BR2_PACKAGE_MYSQL_CLIENT is not set
>> +# BR2_PACKAGE_SQLITE is not set
>> +
>> +#
>> +# Filesystem
>> +#
>> +# BR2_PACKAGE_GAMIN is not set
>> +# BR2_PACKAGE_LIBCONFIG is not set
>> +# BR2_PACKAGE_LIBCONFUSE is not set
>> +# BR2_PACKAGE_LIBFUSE is not set
>> +# BR2_PACKAGE_LIBLOCKFILE is not set
>> +# BR2_PACKAGE_LIBSYSFS is not set
>> +
>> +#
>> +# Graphics
>> +#
>> +# BR2_PACKAGE_ATK is not set
>> +# BR2_PACKAGE_CAIRO is not set
>> +# BR2_PACKAGE_FONTCONFIG is not set
>> +# BR2_PACKAGE_FREETYPE is not set
>> +# BR2_PACKAGE_JPEG is not set
>> +# BR2_PACKAGE_LIBART is not set
>> +# BR2_PACKAGE_LIBPNG is not set
>> +# BR2_PACKAGE_LIBSVGTINY is not set
>> +# BR2_PACKAGE_LIBUNGIF is not set
>> +# BR2_PACKAGE_PANGO is not set
>> +# BR2_PACKAGE_PIXMAN is not set
>> +# BR2_PACKAGE_TIFF is not set
>> +
>> +#
>> +# Hardware handling
>> +#
>> +# BR2_PACKAGE_LIBAIO is not set
>> +# BR2_PACKAGE_LIBRAW1394 is not set
>> +# BR2_PACKAGE_TSLIB is not set
>> +# BR2_PACKAGE_LIBUSB is not set
>> +
>> +#
>> +# Java
>> +#
>> +# BR2_PACKAGE_CLASSPATH is not set
>> +
>> +#
>> +# Networking
>> +#
>> +# BR2_PACKAGE_LIBCGI is not set
>> +# BR2_PACKAGE_LIBCGICC is not set
>> +# BR2_PACKAGE_LIBCURL is not set
>> +# BR2_PACKAGE_LIBDNET is not set
>> +# BR2_PACKAGE_LIBEXOSIP2 is not set
>> +# BR2_PACKAGE_LIBIDN is not set
>> +# BR2_PACKAGE_LIBMICROHTTPD is not set
>> +# BR2_PACKAGE_NEON is not set
>> +# BR2_PACKAGE_LIBNL is not set
>> +# BR2_PACKAGE_LIBPCAP is not set
>> +# BR2_PACKAGE_LIBOSIP2 is not set
>> +# BR2_PACKAGE_LIBRSYNC is not set
>> +# BR2_PACKAGE_LIBSOUP is not set
>> +# BR2_PACKAGE_LIBUPNP is not set
>> +
>> +#
>> +# Other
>> +#
>> +# BR2_PACKAGE_LIBATOMIC_OPS is not set
>> +# BR2_PACKAGE_LIBCAP is not set
>> +# BR2_PACKAGE_LIBDAEMON is not set
>> +# BR2_PACKAGE_LIBELF is not set
>> +# BR2_PACKAGE_LIBEVENT is not set
>> +# BR2_PACKAGE_LIBGLIB12 is not set
>> +# BR2_PACKAGE_LIBGLIB2 is not set
>> +# BR2_PACKAGE_LIBOIL is not set
>> +
>> +#
>> +# Text and terminal handling
>> +#
>> +# BR2_PACKAGE_ENCHANT is not set
>> +# BR2_PACKAGE_ICU is not set
>> +# BR2_PACKAGE_NCURSES is not set
>> +# BR2_PACKAGE_NEWT is not set
>> +# BR2_PACKAGE_PCRE is not set
>> +# BR2_PACKAGE_POPT is not set
>> +# BR2_PACKAGE_READLINE is not set
>> +# BR2_PACKAGE_SLANG is not set
>> +
>> +#
>> +# XML
>> +#
>> +# BR2_PACKAGE_EXPAT is not set
>> +# BR2_PACKAGE_EZXML is not set
>> +# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
>> +# BR2_PACKAGE_LIBXML2 is not set
>> +# BR2_PACKAGE_LIBXSLT is not set
>> +# BR2_PACKAGE_XERCES is not set
>> +
>> +#
>> +# Miscellaneous
>> +#
>> +# BR2_PACKAGE_SHARED_MIME_INFO is not set
>> +
>> +#
>> +# Networking applications
>> +#
>> +# BR2_PACKAGE_ARGUS is not set
>> +# BR2_PACKAGE_AVAHI is not set
>> +# BR2_PACKAGE_AXEL is not set
>> +# BR2_PACKAGE_BOA is not set
>> +# BR2_PACKAGE_BIND is not set
>> +# BR2_PACKAGE_BMON is not set
>> +# BR2_PACKAGE_BRIDGE is not set
>> +# BR2_PACKAGE_CTORRENT is not set
>> +# BR2_PACKAGE_CUPS is not set
>> +# BR2_PACKAGE_ISC_DHCP is not set
>> +# BR2_PACKAGE_DNSMASQ is not set
>> +# BR2_PACKAGE_DROPBEAR is not set
>> +# BR2_PACKAGE_ETHTOOL is not set
>> +# BR2_PACKAGE_HOSTAPD is not set
>> +# BR2_PACKAGE_IFPLUGD is not set
>> +# BR2_PACKAGE_IPERF is not set
>> +# BR2_PACKAGE_IPROUTE2 is not set
>> +# BR2_PACKAGE_IPSEC_TOOLS is not set
>> +# BR2_PACKAGE_IPTABLES is not set
>> +# BR2_PACKAGE_IW is not set
>> +# BR2_PACKAGE_KISMET is not set
>> +# BR2_PACKAGE_L2TP is not set
>> +# BR2_PACKAGE_LIGHTTPD is not set
>> +# BR2_PACKAGE_LINKS is not set
>> +# BR2_PACKAGE_LRZSZ is not set
>> +# BR2_PACKAGE_MIIDIAG is not set
>> +# BR2_PACKAGE_MROUTED is not set
>> +# BR2_PACKAGE_MUTT is not set
>> +# BR2_PACKAGE_NBD is not set
>> +# BR2_PACKAGE_NCFTP is not set
>> +# BR2_PACKAGE_NETCAT is not set
>> +# BR2_PACKAGE_NETKITBASE is not set
>> +# BR2_PACKAGE_NETKITTELNET is not set
>> +# BR2_PACKAGE_NETPLUG is not set
>> +# BR2_PACKAGE_NETSNMP is not set
>> +# BR2_PACKAGE_NETSTAT_NAT is not set
>> +# BR2_PACKAGE_NFS_UTILS is not set
>> +# BR2_PACKAGE_NTP is not set
>> +# BR2_PACKAGE_OLSR is not set
>> +# BR2_PACKAGE_OPENNTPD is not set
>> +# BR2_PACKAGE_OPENSSH is not set
>> +# BR2_PACKAGE_OPENVPN is not set
>> +# BR2_PACKAGE_PORTMAP is not set
>> +# BR2_PACKAGE_PPPD is not set
>> +# BR2_PACKAGE_RADVD is not set
>> +# BR2_PACKAGE_PPTP_LINUX is not set
>> +# BR2_PACKAGE_PROFTPD is not set
>> +# BR2_PACKAGE_QUAGGA is not set
>> +# BR2_PACKAGE_RSYNC is not set
>> +# BR2_PACKAGE_SAMBA is not set
>> +# BR2_PACKAGE_SER2NET is not set
>> +# BR2_PACKAGE_SOCAT is not set
>> +# BR2_PACKAGE_SPAWN_FCGI is not set
>> +# BR2_PACKAGE_SQUID is not set
>> +# BR2_PACKAGE_STUNNEL is not set
>> +# BR2_PACKAGE_TCPDUMP is not set
>> +# BR2_PACKAGE_DHCPDUMP is not set
>> +# BR2_PACKAGE_TCPREPLAY is not set
>> +# BR2_PACKAGE_TFTPD is not set
>> +# BR2_PACKAGE_THTTPD is not set
>> +# BR2_PACKAGE_TINYHTTPD is not set
>> +# BR2_PACKAGE_TN5250 is not set
>> +# BR2_PACKAGE_TTCP is not set
>> +# BR2_PACKAGE_UDPCAST is not set
>> +# BR2_PACKAGE_VPNC is not set
>> +# BR2_PACKAGE_VSFTPD is not set
>> +# BR2_PACKAGE_VTUN is not set
>> +# BR2_PACKAGE_WEBIF is not set
>> +# BR2_PACKAGE_WGET is not set
>> +# BR2_PACKAGE_WIRELESS_TOOLS is not set
>> +# BR2_PACKAGE_WPA_SUPPLICANT is not set
>> +
>> +#
>> +# Package managers
>> +#
>> +# BR2_PACKAGE_IPKG is not set
>> +
>> +#
>> +# rpm requires libneon with SSL, XML and ZLIB support
>> +#
>> +
>> +#
>> +# Shell and utilities
>> +#
>> +# BR2_PACKAGE_AT is not set
>> +# BR2_PACKAGE_BASH is not set
>> +# BR2_PACKAGE_DASH is not set
>> +# BR2_PACKAGE_DIALOG is not set
>> +# BR2_PACKAGE_FILE is not set
>> +# BR2_PACKAGE_LOCKFILE_PROGS is not set
>> +# BR2_PACKAGE_LOGROTATE is not set
>> +# BR2_PACKAGE_SCREEN is not set
>> +# BR2_PACKAGE_SUDO is not set
>> +# BR2_PACKAGE_WHICH is not set
>> +
>> +#
>> +# System tools
>> +#
>> +# BR2_PACKAGE_BOOTUTILS is not set
>> +# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
>> +# BR2_PACKAGE_PROCPS is not set
>> +# BR2_PACKAGE_PSMISC is not set
>> +# BR2_PACKAGE_SYSKLOGD is not set
>> +# BR2_PACKAGE_SYSVINIT is not set
>> +# BR2_PACKAGE_UTIL-LINUX is not set
>> +
>> +#
>> +# Text editors and viewers
>> +#
>> +# BR2_PACKAGE_ED is not set
>> +# BR2_PACKAGE_LESS is not set
>> +# BR2_PACKAGE_NANO is not set
>> +# BR2_PACKAGE_UEMACS is not set
>> +# BR2_PACKAGE_VIM is not set
>> +
>> +#
>> +# Target filesystem options
>> +#
>> +BR2_ROOTFS_POST_BUILD_SCRIPT=""
>> +BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
>> +# BR2_TARGET_ROOTFS_CRAMFS is not set
>> +# BR2_TARGET_ROOTFS_CLOOP is not set
>> +# BR2_TARGET_ROOTFS_EXT2 is not set
>> +# BR2_TARGET_ROOTFS_JFFS2 is not set
>> +# BR2_TARGET_ROOTFS_UBIFS is not set
>> +# BR2_TARGET_ROOTFS_SQUASHFS is not set
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +# BR2_TARGET_ROOTFS_CPIO is not set
>> +
>> +#
>> +# initramfs requires a Linux kernel to be built
>> +#
>> +# BR2_TARGET_ROOTFS_ROMFS is not set
>> +
>> +#
>> +# Bootloaders
>> +#
>> +# BR2_TARGET_BAREBOX is not set
>> +# BR2_TARGET_UBOOT is not set
>> +# BR2_TARGET_AT91BOOTSTRAP is not set
>> +# BR2_TARGET_DATAFLASHBOOT is not set
>> +
>> +#
>> +# Kernel
>> +#
>> +# BR2_LINUX_KERNEL is not set
>> diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
>> index 68ac3e9..5eefa55 100644
>> --- a/toolchain/binutils/binutils.mk
>> +++ b/toolchain/binutils/binutils.mk
>> @@ -94,7 +94,7 @@ $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld: $(BINUTILS_DIR1)/binutils/obj
>> ? ? ? ?# ? ? ? tooldir=/usr build_tooldir=/usr install
>> ? ? ? ?#rm -f $(STAGING_DIR)/usr/bin/{ar,as,ld,nm,objdump,ranlib,strip}
>>
>> -binutils: uclibc-configured $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld
>> +binutils: $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ld
>>
>> ?binutils-source: $(DL_DIR)/$(BINUTILS_SOURCE)
>>
>> diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
>> index 0c72957..4e2e841 100644
>> --- a/toolchain/gcc/Config.in
>> +++ b/toolchain/gcc/Config.in
>> @@ -125,7 +125,7 @@ config BR2_GCC_SHARED_LIBGCC
>> ?config BR2_GCC_ENABLE_TLS
>> ? ? ? ?bool "Enable compiler tls support"
>> ? ? ? ?default y
>> - ? ? ? depends on !BR2_GCC_VERSION_4_4_X
>> + ? ? ? depends on BR2_PTHREADS_NATIVE
>> ? ? ? ?help
>> ? ? ? ? ?Enable the compiler to generate code for accessing
>> ? ? ? ? ?thread local storage variables
>> diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
>> index 081e906..a94db3a 100644
>> --- a/toolchain/gcc/gcc-uclibc-4.x.mk
>> +++ b/toolchain/gcc/gcc-uclibc-4.x.mk
>> @@ -201,6 +201,8 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
>> ? ? ? ? ? ? ? ?--with-gnu-ld \
>> ? ? ? ? ? ? ? ?--disable-shared \
>> ? ? ? ? ? ? ? ?--disable-libssp \
>> + ? ? ? ? ? ? ? --without-headers \
>> + ? ? ? ? ? ? ? --with-newlib \
>> ? ? ? ? ? ? ? ?$(GCC_TLS) \
>> ? ? ? ? ? ? ? ?$(GCC_WITH_HOST_GMP) \
>> ? ? ? ? ? ? ? ?$(GCC_WITH_HOST_MPFR) \
>> @@ -219,7 +221,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
>> ?$(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
>> ? ? ? ?# gcc >= 4.3.0 have to also build all-target-libgcc
>> ?ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>> - ? ? ? $(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc all-target-libgcc
>> + ? ? ? $(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
>> ?else
>> ? ? ? ?$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
>> ?endif
>> @@ -229,13 +231,13 @@ gcc_initial=$(GCC_BUILD_DIR1)/.installed
>> ?$(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
>> ? ? ? ?# gcc >= 4.3.0 have to also install install-target-libgcc
>> ?ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>> - ? ? ? PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc install-target-libgcc
>> + ? ? ? PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
>> ?else
>> ? ? ? ?PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
>> ?endif
>> ? ? ? ?touch $(gcc_initial)
>>
>> -gcc_initial: uclibc-configured binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
>> +gcc_initial: binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
>>
>> ?gcc_initial-clean:
>> ? ? ? ?rm -rf $(GCC_BUILD_DIR1)
>> @@ -245,7 +247,77 @@ gcc_initial-dirclean:
>>
>> ?#############################################################
>> ?#
>> -# second pass compiler build. Build the compiler targeting
>> +# build the second pass gcc compiler
>> +#
>> +#############################################################
>> +GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
>> +
>> +
>> +# The --without-headers option stopped working with gcc 3.0 and has never been
>> +# fixed, so we need to actually have working C library header files prior to
>> +# the step or libgcc will not build...
>> +
>> +$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
>> + ? ? ? mkdir -p $(GCC_BUILD_DIR2)
>> + ? ? ? (cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
>> + ? ? ? ? ? ? ? $(HOST_CONFIGURE_OPTS) \
>> + ? ? ? ? ? ? ? $(GCC_DIR)/configure $(QUIET) \
>> + ? ? ? ? ? ? ? --prefix=$(STAGING_DIR)/usr \
>> + ? ? ? ? ? ? ? --build=$(GNU_HOST_NAME) \
>> + ? ? ? ? ? ? ? --host=$(GNU_HOST_NAME) \
>> + ? ? ? ? ? ? ? --target=$(REAL_GNU_TARGET_NAME) \
>> + ? ? ? ? ? ? ? --enable-languages=c \
>> + ? ? ? ? ? ? ? $(BR2_CONFIGURE_DEVEL_SYSROOT) \
>> + ? ? ? ? ? ? ? --disable-__cxa_atexit \
>> + ? ? ? ? ? ? ? --enable-target-optspace \
>> + ? ? ? ? ? ? ? --with-gnu-ld \
>> + ? ? ? ? ? ? ? --enable-shared \
>> + ? ? ? ? ? ? ? --disable-libssp \
>> + ? ? ? ? ? ? ? $(GCC_TLS) \
>> + ? ? ? ? ? ? ? $(GCC_WITH_HOST_GMP) \
>> + ? ? ? ? ? ? ? $(GCC_WITH_HOST_MPFR) \
>> + ? ? ? ? ? ? ? $(DISABLE_NLS) \
>> + ? ? ? ? ? ? ? $(THREADS) \
>> + ? ? ? ? ? ? ? $(MULTILIB) \
>> + ? ? ? ? ? ? ? $(GCC_DECIMAL_FLOAT) \
>> + ? ? ? ? ? ? ? $(SOFT_FLOAT_CONFIG_OPTION) \
>> + ? ? ? ? ? ? ? $(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
>> + ? ? ? ? ? ? ? $(EXTRA_GCC_CONFIG_OPTIONS) \
>> + ? ? ? ? ? ? ? $(EXTRA_GCC2_CONFIG_OPTIONS) \
>> + ? ? ? ? ? ? ? $(QUIET) \
>> + ? ? ? )
>> + ? ? ? touch $@
>> +
>> +$(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
>> + ? ? ? # gcc >= 4.3.0 have to also build all-target-libgcc
>> +ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>> + ? ? ? $(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc all-target-libgcc
>> +else
>> + ? ? ? $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc
>> +endif
>> + ? ? ? touch $@
>> +
>> +gcc_intermediate=$(GCC_BUILD_DIR2)/.installed
>> +$(gcc_intermediate): $(GCC_BUILD_DIR2)/.compiled
>> + ? ? ? # gcc >= 4.3.0 have to also install install-target-libgcc
>> +ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
>> + ? ? ? PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc install-target-libgcc
>> +else
>> + ? ? ? PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc
>> +endif
>> + ? ? ? touch $(gcc_intermediate)
>> +
>> +gcc_intermediate: uclibc-configured $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
>> +
>> +gcc_intermediate-clean:
>> + ? ? ? rm -rf $(GCC_BUILD_DIR2)
>> +
>> +gcc_intermediate-dirclean:
>> + ? ? ? rm -rf $(GCC_BUILD_DIR2) $(GCC_DIR)
>> +
>> +#############################################################
>> +#
>> +# third pass compiler build. Build the compiler targeting
>> ?# the newly built shared uClibc library.
>> ?#
>> ?#############################################################
>> @@ -256,14 +328,14 @@ gcc_initial-dirclean:
>> ?# affect gcc-target. However, I haven't tested gcc-target yet so no
>> ?# guarantees. mjn3
>>
>> -GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
>> -$(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
>> - ? ? ? mkdir -p $(GCC_BUILD_DIR2)
>> +GCC_BUILD_DIR3:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
>> +$(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
>> + ? ? ? mkdir -p $(GCC_BUILD_DIR3)
>> ? ? ? ?# Important! Required for limits.h to be fixed.
>> ? ? ? ?ln -snf ../include/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
>> ? ? ? ?#-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
>> ? ? ? ?#ln -snf ../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
>> - ? ? ? (cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
>> + ? ? ? (cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
>> ? ? ? ? ? ? ? ?$(HOST_CONFIGURE_OPTS) \
>> ? ? ? ? ? ? ? ?$(GCC_SRC_DIR)/configure $(QUIET) \
>> ? ? ? ? ? ? ? ?--prefix=/usr \
>> @@ -294,13 +366,13 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
>> ? ? ? ?)
>> ? ? ? ?touch $@
>>
>> -$(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
>> - ? ? ? $(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all
>> +$(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
>> + ? ? ? $(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR3) all
>> ? ? ? ?touch $@
>>
>> -$(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
>> +$(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
>> ? ? ? ?PATH=$(TARGET_PATH) $(MAKE) $(BR2_SYSROOT_STAGING_DESTDIR) \
>> - ? ? ? ? ? ? ? -C $(GCC_BUILD_DIR2) install
>> + ? ? ? ? ? ? ? -C $(GCC_BUILD_DIR3) install
>> ? ? ? ?if [ -d "$(STAGING_DIR)/lib64" ]; then \
>> ? ? ? ? ? ? ? ?if [ ! -e "$(STAGING_DIR)/lib" ]; then \
>> ? ? ? ? ? ? ? ? ? ? ? ?mkdir -p "$(STAGING_DIR)/lib"; \
>> @@ -334,7 +406,7 @@ endif
>> ? ? ? ?mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
>> ? ? ? ?touch $@
>>
>> -$(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
>> +$(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
>> ?ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
>> ? ? ? ?# These are in /lib, so...
>> ? ? ? ?rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
>> @@ -361,36 +433,36 @@ endif
>> ? ? ? ?touch $@
>>
>> ?cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
>> -cross_compiler gcc: uclibc-configured binutils gcc_initial \
>> - ? ? ? $(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR2)/.installed \
>> +cross_compiler gcc: gcc_intermediate \
>> + ? ? ? $(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR3)/.installed \
>> ? ? ? ?$(STAMP_DIR)/gcc_libs_target_installed \
>> ? ? ? ?$(GCC_TARGETS)
>>
>> ?gcc-source: $(DL_DIR)/$(GCC_SOURCE)
>>
>> ?gcc-clean:
>> - ? ? ? rm -rf $(GCC_BUILD_DIR2)
>> + ? ? ? rm -rf $(GCC_BUILD_DIR3)
>> ? ? ? ?for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
>> ? ? ? ? ? ? ? ?rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
>> ? ? ? ? ? ? ? ?rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
>> ? ? ? ?done
>>
>> ?gcc-dirclean: gcc_initial-dirclean
>> - ? ? ? rm -rf $(GCC_BUILD_DIR2)
>> + ? ? ? rm -rf $(GCC_BUILD_DIR3)
>>
>> ?#############################################################
>> ?#
>> ?# Next build target gcc compiler
>> ?#
>> ?#############################################################
>> -GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
>> +GCC_BUILD_DIR4:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
>>
>> -$(GCC_BUILD_DIR3)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
>> +$(GCC_BUILD_DIR4)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
>> ? ? ? ?mkdir -p $(GCC_BUILD_DIR3)
>> ? ? ? ?touch $@
>>
>> -$(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
>> - ? ? ? (cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
>> +$(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
>> + ? ? ? (cd $(GCC_BUILD_DIR4); rm -rf config.cache; \
>> ? ? ? ? ? ? ? ?$(TARGET_CONFIGURE_OPTS) \
>> ? ? ? ? ? ? ? ?$(TARGET_CONFIGURE_ARGS) \
>> ? ? ? ? ? ? ? ?$(TARGET_GCC_FLAGS) \
>> @@ -418,13 +490,13 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
>> ? ? ? ? ? ? ? ?$(DISABLE_LARGEFILE) \
>> ? ? ? ? ? ? ? ?$(EXTRA_GCC_CONFIG_OPTIONS) \
>> ? ? ? ? ? ? ? ?$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
>> - ? ? ? ? ? ? ? $(EXTRA_GCC3_CONFIG_OPTIONS) \
>> + ? ? ? ? ? ? ? $(EXTRA_GCC4_CONFIG_OPTIONS) \
>> ? ? ? ?)
>> ? ? ? ?touch $@
>>
>> -$(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
>> +$(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
>> ? ? ? ?PATH=$(TARGET_PATH) \
>> - ? ? ? $(MAKE) -C $(GCC_BUILD_DIR3) all
>> + ? ? ? $(MAKE) -C $(GCC_BUILD_DIR4) all
>> ? ? ? ?touch $@
>>
>> ?GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
>> @@ -434,9 +506,9 @@ else
>> ?GCC_INCLUDE_DIR:=include-fixed
>> ?endif
>>
>> -$(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
>> +$(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
>> ? ? ? ?PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
>> - ? ? ? ? ? ? ? $(MAKE1) -C $(GCC_BUILD_DIR3) install
>> + ? ? ? ? ? ? ? $(MAKE1) -C $(GCC_BUILD_DIR4) install
>> ? ? ? ?# Remove broken specs file (cross compile flag is set).
>> ? ? ? ?rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
>>
>> @@ -466,8 +538,8 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
>> ?gcc_target: uclibc_target binutils_target $(TARGET_DIR)/usr/bin/gcc
>>
>> ?gcc_target-clean:
>> - ? ? ? rm -rf $(GCC_BUILD_DIR3)
>> + ? ? ? rm -rf $(GCC_BUILD_DIR4)
>> ? ? ? ?rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)*
>>
>> ?gcc_target-dirclean:
>> - ? ? ? rm -rf $(GCC_BUILD_DIR3)
>> + ? ? ? rm -rf $(GCC_BUILD_DIR4)
>> diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
>> index cb203a0..8ee737b 100644
>> --- a/toolchain/uClibc/uClibc-snapshot.config
>> +++ b/toolchain/uClibc/uClibc-snapshot.config
>> @@ -1,5 +1,7 @@
>> ?#
>> ?# Automatically generated make config: don't edit
>> +# Version: 0.9.32-git
>> +# Fri Jul ?9 22:31:59 2010
>> ?#
>> ?# TARGET_alpha is not set
>> ?# TARGET_arm is not set
>> @@ -26,14 +28,34 @@
>> ?# TARGET_vax is not set
>> ?# TARGET_x86_64 is not set
>> ?# TARGET_xtensa is not set
>> -TARGET_SUBARCH=""
>>
>> +# CONFIG_GENERIC_ARM is not set
>> +# CONFIG_ARM610 is not set
>> +# CONFIG_ARM710 is not set
>> +# CONFIG_ARM7TDMI is not set
>> +# CONFIG_ARM720T is not set
>> +# CONFIG_ARM920T is not set
>> +# CONFIG_ARM922T is not set
>> +# CONFIG_ARM926T is not set
>> +# CONFIG_ARM10T is not set
>> +# CONFIG_ARM1136JF_S is not set
>> +# CONFIG_ARM1176JZ_S is not set
>> +# CONFIG_ARM1176JZF_S is not set
>> +# CONFIG_ARM_CORTEX_M3 is not set
>> +# CONFIG_ARM_CORTEX_M1 is not set
>> +# CONFIG_ARM_SA110 is not set
>> +# CONFIG_ARM_SA1100 is not set
>> +# CONFIG_ARM_XSCALE is not set
>> +# CONFIG_ARM_IWMMXT is not set
>> +
>> +USE_BX=y
>> +
>> +TARGET_SUBARCH=""
>> ?#
>> ?# Target Architecture Features and Options
>> ?#
>> ?TARGET_ARCH="none"
>> ?FORCE_OPTIONS_FOR_ARCH=y
>> -
>> ?#
>> ?# Using ELF file format
>> ?#
>> @@ -41,15 +63,12 @@ FORCE_OPTIONS_FOR_ARCH=y
>> ?# ARCH_BIG_ENDIAN is not set
>> ?# ARCH_WANTS_LITTLE_ENDIAN is not set
>> ?# ARCH_WANTS_BIG_ENDIAN is not set
>> -
>> -#
>> -# Using Little Endian
>> -#
>> ?ARCH_HAS_MMU=y
>> ?ARCH_USE_MMU=y
>> ?UCLIBC_HAS_FLOATS=y
>> ?UCLIBC_HAS_FPU=y
>> ?DO_C99_MATH=y
>> +# DO_XSI_MATH is not set
>> ?# UCLIBC_HAS_FENV is not set
>> ?KERNEL_HEADERS="/usr/src/linux/include"
>> ?HAVE_DOT_CONFIG=y
>> @@ -59,22 +78,26 @@ HAVE_DOT_CONFIG=y
>> ?#
>> ?# HAVE_NO_PIC is not set
>> ?DOPIC=y
>> -# HAVE_NO_SHARED is not set
>> +# ARCH_HAS_NO_SHARED is not set
>> ?# ARCH_HAS_NO_LDSO is not set
>> ?HAVE_SHARED=y
>> ?# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
>> ?LDSO_LDD_SUPPORT=y
>> -LDSO_CACHE_SUPPORT=y
>> +# LDSO_CACHE_SUPPORT is not set
>> +LDSO_PRELOAD_ENV_SUPPORT=y
>> ?# LDSO_PRELOAD_FILE_SUPPORT is not set
>> -LDSO_BASE_FILENAME="ld.so"
>> ?# UCLIBC_STATIC_LDCONFIG is not set
>> ?LDSO_RUNPATH=y
>> +LDSO_SEARCH_INTERP_PATH=y
>> ?UCLIBC_CTOR_DTOR=y
>> ?# LDSO_GNU_HASH_SUPPORT is not set
>> ?# HAS_NO_THREADS is not set
>> +# LINUXTHREADS_OLD is not set
>> +# LINUXTHREADS_NEW is not set
>> +UCLIBC_HAS_THREADS_NATIVE=y
>> ?UCLIBC_HAS_THREADS=y
>> ?# PTHREADS_DEBUG_SUPPORT is not set
>> -LINUXTHREADS_OLD=y
>> +UCLIBC_HAS_SYSLOG=y
>> ?UCLIBC_HAS_LFS=y
>> ?# MALLOC is not set
>> ?# MALLOC_SIMPLE is not set
>> @@ -82,17 +105,23 @@ MALLOC_STANDARD=y
>> ?MALLOC_GLIBC_COMPAT=y
>> ?UCLIBC_DYNAMIC_ATEXIT=y
>> ?# COMPAT_ATEXIT is not set
>> -# UCLIBC_SUSV3_LEGACY is not set
>> +UCLIBC_SUSV3_LEGACY=y
>> ?# UCLIBC_SUSV3_LEGACY_MACROS is not set
>> +# UCLIBC_SUSV4_LEGACY is not set
>> +# UCLIBC_HAS_STUBS is not set
>> ?UCLIBC_HAS_SHADOW=y
>> ?# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
>> -# UNIX98PTY_ONLY is not set
>> +UCLIBC_HAS_PTY=y
>> ?ASSUME_DEVPTS=y
>> +UNIX98PTY_ONLY=y
>> +UCLIBC_HAS_GETPT=y
>> +# UCLIBC_HAS_LIBUTIL is not set
>> ?UCLIBC_HAS_TM_EXTENSIONS=y
>> ?UCLIBC_HAS_TZ_CACHING=y
>> ?UCLIBC_HAS_TZ_FILE=y
>> ?UCLIBC_HAS_TZ_FILE_READ_MANY=y
>> ?UCLIBC_TZ_FILE_PATH="/etc/TZ"
>> +UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y
>>
>> ?#
>> ?# Advanced Library Settings
>> @@ -101,30 +130,59 @@ UCLIBC_PWD_BUFFER_SIZE=256
>> ?UCLIBC_GRP_BUFFER_SIZE=256
>>
>> ?#
>> -# Networking Support
>> +# Support various families of functions
>> ?#
>> +UCLIBC_LINUX_MODULE_24=y
>> +UCLIBC_LINUX_SPECIFIC=y
>> +UCLIBC_HAS_GNU_ERROR=y
>> +UCLIBC_BSD_SPECIFIC=y
>> +UCLIBC_HAS_BSD_ERR=y
>> +# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
>> +# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
>> +# UCLIBC_NTP_LEGACY is not set
>> +# UCLIBC_SV4_DEPRECATED is not set
>> +UCLIBC_HAS_REALTIME=y
>> +UCLIBC_HAS_ADVANCED_REALTIME=y
>> +UCLIBC_HAS_EPOLL=y
>> +UCLIBC_HAS_XATTR=y
>> +UCLIBC_HAS_PROFILING=y
>> +UCLIBC_HAS_CRYPT_IMPL=y
>> +UCLIBC_HAS_CRYPT=y
>> +UCLIBC_HAS_NETWORK_SUPPORT=y
>> +UCLIBC_HAS_SOCKET=y
>> +UCLIBC_HAS_IPV4=y
>> ?UCLIBC_HAS_IPV6=y
>> ?UCLIBC_HAS_RPC=y
>> ?UCLIBC_HAS_FULL_RPC=y
>> ?UCLIBC_HAS_REENTRANT_RPC=y
>> -# UCLIBC_USE_NETLINK is not set
>> +UCLIBC_USE_NETLINK=y
>> +# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
>> ?# UCLIBC_HAS_BSD_RES_CLOSE is not set
>> +UCLIBC_HAS_COMPAT_RES_STATE=y
>> +# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
>> +# UCLIBC_HAS_LIBRESOLV_STUB is not set
>> +# UCLIBC_HAS_LIBNSL_STUB is not set
>>
>> ?#
>> ?# String and Stdio Support
>> ?#
>> -UCLIBC_HAS_STRING_GENERIC_OPT=y
>> +# UCLIBC_HAS_STRING_GENERIC_OPT is not set
>> ?UCLIBC_HAS_STRING_ARCH_OPT=y
>> ?UCLIBC_HAS_CTYPE_TABLES=y
>> ?UCLIBC_HAS_CTYPE_SIGNED=y
>> ?# UCLIBC_HAS_CTYPE_UNSAFE is not set
>> -UCLIBC_HAS_CTYPE_CHECKED=y
>> -# UCLIBC_HAS_CTYPE_ENFORCED is not set
>> -# UCLIBC_HAS_WCHAR is not set
>> -# UCLIBC_HAS_LOCALE is not set
>> +# UCLIBC_HAS_CTYPE_CHECKED is not set
>> +UCLIBC_HAS_CTYPE_ENFORCED=y
>> +UCLIBC_HAS_WCHAR=y
>> +UCLIBC_HAS_LOCALE=y
>> +# UCLIBC_BUILD_ALL_LOCALE is not set
>> +UCLIBC_BUILD_MINIMAL_LOCALE=y
>> +# UCLIBC_PREGENERATED_LOCALE_DATA is not set
>> +UCLIBC_BUILD_MINIMAL_LOCALES="en_US"
>> +UCLIBC_HAS_XLOCALE=y
>> ?UCLIBC_HAS_HEXADECIMAL_FLOATS=y
>> +# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
>> ?UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
>> -# USE_OLD_VFPRINTF is not set
>> ?UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
>> ?UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
>> ?# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
>> @@ -138,8 +196,8 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
>> ?# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
>> ?# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
>> ?# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
>> -UCLIBC_HAS_STDIO_GETC_MACRO=y
>> -UCLIBC_HAS_STDIO_PUTC_MACRO=y
>> +# UCLIBC_HAS_STDIO_GETC_MACRO is not set
>> +# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
>> ?UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
>> ?# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
>> ?UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
>> @@ -150,26 +208,27 @@ UCLIBC_HAS_ERRNO_MESSAGES=y
>> ?UCLIBC_HAS_SIGNUM_MESSAGES=y
>> ?# UCLIBC_HAS_SYS_SIGLIST is not set
>> ?UCLIBC_HAS_GNU_GETOPT=y
>> -UCLIBC_HAS_GNU_GETSUBOPT=y
>> +# UCLIBC_HAS_GNU_GETSUBOPT is not set
>>
>> ?#
>> ?# Big and Tall
>> ?#
>> ?UCLIBC_HAS_REGEX=y
>> -UCLIBC_HAS_REGEX_OLD=y
>> +# UCLIBC_HAS_REGEX_OLD is not set
>> ?UCLIBC_HAS_FNMATCH=y
>> -UCLIBC_HAS_FNMATCH_OLD=y
>> +# UCLIBC_HAS_FNMATCH_OLD is not set
>> ?# UCLIBC_HAS_WORDEXP is not set
>> -UCLIBC_HAS_FTW=y
>> +# UCLIBC_HAS_NFTW is not set
>> ?UCLIBC_HAS_GLOB=y
>> ?UCLIBC_HAS_GNU_GLOB=y
>>
>> ?#
>> ?# Library Installation Options
>> ?#
>> -SHARED_LIB_LOADER_PREFIX="/lib"
>> ?RUNTIME_PREFIX="/"
>> ?DEVEL_PREFIX="/usr/"
>> +MULTILIB_DIR="lib"
>> +HARDWIRED_ABSPATH=y
>>
>> ?#
>> ?# Security options
>> @@ -180,7 +239,7 @@ DEVEL_PREFIX="/usr/"
>> ?# UCLIBC_HAS_SSP is not set
>> ?UCLIBC_BUILD_RELRO=y
>> ?UCLIBC_BUILD_NOW=y
>> -# UCLIBC_BUILD_NOEXECSTACK is not set
>> +UCLIBC_BUILD_NOEXECSTACK=y
>>
>> ?#
>> ?# uClibc development/debugging options
>> @@ -198,4 +257,3 @@ WARNINGS="-Wall"
>> ?# EXTRA_WARNINGS is not set
>> ?# DOMULTI is not set
>> ?# UCLIBC_MJN3_ONLY is not set
>> -
>> diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
>> index ce1396a..d7c026d 100644
>> --- a/toolchain/uClibc/uclibc.mk
>> +++ b/toolchain/uClibc/uclibc.mk
>> @@ -16,11 +16,12 @@ UCLIBC_VERSION:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
>>
>> ?ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
>> ?UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
>> +UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
>> ?else
>> ?UCLIBC_SITE:=http://www.uclibc.org/downloads
>> +UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
>> ?endif
>>
>> -UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
>> ?UCLIBC_PATCH_DIR:=toolchain/uClibc/
>> ?UCLIBC_SOURCE:=uClibc-$(UCLIBC_VERSION).tar.bz2
>>
>> @@ -407,6 +408,7 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
>> ? ? ? ? ? ? ? ?DEVEL_PREFIX=/usr/ \
>> ? ? ? ? ? ? ? ?RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
>> ? ? ? ? ? ? ? ?HOSTCC="$(HOSTCC)" headers \
>> + ? ? ? ? ? ? ? lib/crt1.o lib/crti.o lib/crtn.o \
>> ? ? ? ? ? ? ? ?$(if $(BR2_UCLIBC_VERSION_0_9_28_3),install_dev,install_headers)
>> ? ? ? ?# Install the kernel headers to the first stage gcc include dir
>> ? ? ? ?# if necessary
>> @@ -414,9 +416,12 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
>> ? ? ? ? ? ? ? ?cp -pLR $(LINUX_HEADERS_DIR)/include/* \
>> ? ? ? ? ? ? ? ? ? ? ? ?$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
>> ? ? ? ?fi
>> + ? ? ? $(TARGET_CROSS)gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libc.so
>> + ? ? ? $(TARGET_CROSS)gcc -nostdlib -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libm.so
>> + ? ? ? cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/
>> ? ? ? ?touch $@
>>
>> -$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TARGET)
>> +$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured gcc_intermediate $(LIBFLOAT_TARGET)
>> ? ? ? ?$(MAKE1) -C $(UCLIBC_DIR) \
>> ? ? ? ? ? ? ? ?ARCH="$(UCLIBC_TARGET_ARCH)" \
>> ? ? ? ? ? ? ? ?PREFIX= \
>> @@ -501,7 +506,7 @@ UCLIBC_TARGETS+=uclibc-test
>> ?endif
>> ?endif
>>
>> -uclibc: $(cross_compiler) $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
>> +uclibc: $(gcc_intermediate) $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
>>
>> ?uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
>>
>> @@ -514,7 +519,7 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
>> ?uclibc-update: uclibc-config
>> ? ? ? ?cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
>>
>> -uclibc-configured: kernel-headers $(UCLIBC_DIR)/.configured
>> +uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
>>
>> ?uclibc-configured-source: uclibc-source
>>
>> @@ -540,7 +545,7 @@ $(TARGET_DIR)/root/uClibc/test/unistd/errno: $(UCLIBC_DIR)/test/unistd/errno
>> ? ? ? ?$(INSTALL) $(UCLIBC_DIR)/Rules.mak $(TARGET_DIR)/root/uClibc
>> ? ? ? ?$(INSTALL) $(UCLIBC_DIR)/.config $(TARGET_DIR)/root/uClibc
>>
>> -uclibc-test: uclibc $(TARGET_DIR)/root/uClibc/test/unistd/errno
>> +uclibc-test: $(STAGING_DIR)/usr/lib/libc.a $(TARGET_DIR)/root/uClibc/test/unistd/errno
>>
>> ?uclibc-test-source: uclibc-source
>>
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>>
>
>
>
> --
> Viktar Palstsiuk
>
