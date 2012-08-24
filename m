From: chuck.fry@nasa.gov (Fry, Charles R. {Chuck}(ARC-TI)[Stinger Ghaffarian Technologies Inc.
 (SGT Inc.)])
Date: Fri, 24 Aug 2012 17:01:50 -0500
Subject: [Buildroot] Missing symbols in Xenomai regression tests
Message-ID: <EDEA1A64-0ECF-46A7-90CE-F3080E1C2ABB@nasa.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm encountering missing symbols '__wrap_pthread_*' when buildboot tries to build the Xenomai regression test suite. I suspect this is a configuration error on my part, as I have not modified anything in buildroot.

My full .config file is below. I'm building a 3.0.x kernel for arm926t. The settings related to Xenomai are:

BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_VERSION=""
# BR2_PACKAGE_XENOMAI_SMP is not set
BR2_PACKAGE_XENOMAI_TESTSUITE=y
# BR2_PACKAGE_XENOMAI_RTCAN is not set
# BR2_PACKAGE_XENOMAI_ANALOGY is not set
BR2_PACKAGE_XENOMAI_NATIVE_SKIN=y
BR2_PACKAGE_XENOMAI_POSIX_SKIN=y
# BR2_PACKAGE_XENOMAI_VXWORKS_SKIN is not set
# BR2_PACKAGE_XENOMAI_PSOS_SKIN is not set
BR2_PACKAGE_XENOMAI_RTAI_SKIN=y
# BR2_PACKAGE_XENOMAI_UITRON_SKIN is not set
# BR2_PACKAGE_XENOMAI_VRTX_SKIN is not set

BR2_LINUX_KERNEL_EXT_XENOMAI=y
BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH=""

Here's the relevant part of the build console output. Thanks in advance for any help.
 -- Chuck

Making all in posix
make[5]: Entering directory `/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/testsuite/regression/posix'
/home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/ccache /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../../../../src/include   -O2 -D_GNU_SOURCE -D_REENTRANT -Wall -Werror-implicit-function-declaration -pipe -D__XENO__ -D__IN_XENO__ -Wstrict-prototypes -I../../../../include/posix -I../../../../include  -pipe -Os -g2 -MT leaks.o -MD -MP -MF .deps/leaks.Tpo -c -o leaks.o leaks.c
/home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/ccache /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -DHAVE_CONFIG_H -I. -I../../../../src/include   -O2 -D_GNU_SOURCE -D_REENTRANT -Wall -Werror-implicit-function-declaration -pipe -D__XENO__ -D__IN_XENO__ -Wstrict-prototypes -I../../../../include/posix -I../../../../include  -pipe -Os -g2 -MT shm.o -MD -MP -MF .deps/shm.Tpo -c -o shm.o shm.c
mv -f .deps/leaks.Tpo .deps/leaks.Po
/bin/sh ../../../../libtool --tag=CC   --mode=link /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/ccache /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc  -pipe -Os -g2  -Wl,@/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/posix/posix.wrappers  -o leaks leaks.o ../../../skins/posix/libpthread_rt.la ../../../skins/common/libxenomai.la -lpthread -lm
mv -f .deps/shm.Tpo .deps/shm.Po
/bin/sh ../../../../libtool --tag=CC   --mode=link /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/ccache /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc  -pipe -Os -g2  -Wl,@/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/posix/posix.wrappers  -o shm shm.o ../../../skins/posix/libpthread_rt.la ../../../skins/common/libxenomai.la -lpthread -lm
libtool: link: /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/ccache /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -pipe -Os -g2 -Wl,@/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/posix/posix.wrappers -o shm shm.o  ../../../skins/posix/.libs/libpthread_rt.a ../../../skins/common/.libs/libxenomai.a -lrt -lpthread -lm
libtool: link: /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/ccache /home/cfry/buildroot/buildroot-2012.05/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc -pipe -Os -g2 -Wl,@/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/posix/posix.wrappers -o leaks leaks.o  ../../../skins/posix/.libs/libpthread_rt.a ../../../skins/common/.libs/libxenomai.a -lrt -lpthread -lm
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `rt_print_init_inner':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:301: undefined reference to `__wrap_pthread_mutex_lock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:309: undefined reference to `__wrap_pthread_cond_signal'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:311: undefined reference to `__wrap_pthread_mutex_unlock'
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `printer_loop':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:575: undefined reference to `__wrap_pthread_mutex_lock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:578: undefined reference to `__wrap_pthread_cond_wait'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:582: undefined reference to `__wrap_pthread_mutex_unlock'
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `cleanup_buffer':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:450: undefined reference to `__wrap_pthread_mutex_lock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:454: undefined reference to `__wrap_pthread_mutex_unlock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:486: undefined reference to `__wrap_pthread_mutex_lock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:500: undefined reference to `__wrap_pthread_mutex_unlock'
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `forked_child_init':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:614: undefined reference to `__wrap_pthread_mutex_init'
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `rt_print_cleanup':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:401: undefined reference to `__wrap_pthread_mutex_lock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:405: undefined reference to `__wrap_pthread_mutex_unlock'
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `rt_print_flush_buffers':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:435: undefined reference to `__wrap_pthread_mutex_lock'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:439: undefined reference to `__wrap_pthread_mutex_unlock'
../../../skins/common/.libs/libxenomai.a(libxenomai_la-rt_print.o): In function `__rt_print_init':
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:723: undefined reference to `__wrap_pthread_mutex_init'
/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/skins/common/rt_print.c:726: undefined reference to `__wrap_pthread_cond_init'
collect2: ld returned 1 exit status
make[5]: *** [shm] Error 1
make[5]: Leaving directory `/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/testsuite/regression/posix'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory `/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/testsuite/regression'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src/testsuite'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0'
make: *** [/home/cfry/buildroot/buildroot-2012.05/output/build/xenomai-2.6.0/.stamp_built] Error 2
cfry at Pangolin32:~/buildroot/buildroot-2012.05$

The .config used to generate this error:

#
# Automatically generated make config: don't edit
# Buildroot 2012.05 Configuration
#
BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_bfin is not set
# BR2_i386 is not set
# BR2_microblazeel is not set
# BR2_microblazebe is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_x86_64 is not set
# BR2_generic_arm is not set
# BR2_arm7tdmi is not set
# BR2_arm610 is not set
# BR2_arm710 is not set
# BR2_arm720t is not set
# BR2_arm920t is not set
# BR2_arm922t is not set
BR2_arm926t=y
# BR2_arm10t is not set
# BR2_arm1136jf_s is not set
# BR2_arm1176jz_s is not set
# BR2_arm1176jzf_s is not set

#
# cortex-A8/A9 needs gcc >= 4.4.x
#
# BR2_cortex_a8 is not set
# BR2_cortex_a9 is not set
# BR2_sa110 is not set
# BR2_sa1100 is not set
# BR2_xscale is not set
# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM926T"
BR2_ARM_EABI=y
# BR2_ARM_OABI is not set
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm926ej-s"
BR2_GCC_TARGET_ARCH="armv5te"
BR2_GCC_TARGET_ABI="aapcs-linux"

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_LOCALFILES="cp"
BR2_SCP="scp"
BR2_SSH="ssh"
BR2_HG="hg"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=2
BR2_CCACHE=y
BR2_CCACHE_DIR="$(HOME)/.buildroot-ccache"
# BR2_DEPRECATED is not set
BR2_ENABLE_DEBUG=y
# BR2_DEBUG_1 is not set
BR2_DEBUG_2=y
# BR2_DEBUG_3 is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
BR2_PREFER_STATIC_LIB=y
# BR2_HAVE_DOCUMENTATION is not set
BR2_HAVE_DEVFILES=y
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set
# BR2_TOOLCHAIN_CTNG is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_35 is not set
# BR2_KERNEL_HEADERS_2_6_36 is not set
# BR2_KERNEL_HEADERS_2_6_37 is not set
# BR2_KERNEL_HEADERS_2_6_38 is not set
# BR2_KERNEL_HEADERS_2_6_39 is not set
BR2_KERNEL_HEADERS_3_0=y
# BR2_KERNEL_HEADERS_3_1 is not set
# BR2_KERNEL_HEADERS_3_2 is not set
# BR2_KERNEL_HEADERS_3_3 is not set
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="3.0.32"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_31 is not set
# BR2_UCLIBC_VERSION_0_9_32 is not set
BR2_UCLIBC_VERSION_0_9_33=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.33.2"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.33.config"
BR2_PTHREAD_DEBUG=y
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_20 is not set
# BR2_BINUTILS_VERSION_2_20_1 is not set
# BR2_BINUTILS_VERSION_2_21 is not set
BR2_BINUTILS_VERSION_2_21_1=y
# BR2_BINUTILS_VERSION_2_22 is not set
BR2_BINUTILS_VERSION="2.21.1"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_3_X is not set
# BR2_GCC_VERSION_4_4_X is not set
BR2_GCC_VERSION_4_5_X=y
# BR2_GCC_VERSION_4_6_X is not set
# BR2_GCC_VERSION_4_7_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.5.3"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
# BR2_GCC_ENABLE_OPENMP is not set

#
# Gdb Options
#
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
# BR2_GDB_VERSION_7_2 is not set
# BR2_GDB_VERSION_7_3 is not set
BR2_GDB_VERSION_7_4=y
BR2_GDB_VERSION="7.4.1"
BR2_USE_WCHAR=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="en_US"
BR2_GENERATE_LOCALE=""
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""

#
# Toolchain Options
#
# BR2_TOOLCHAIN_BUILDROOT_LARGEFILE is not set
# BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 is not set
# BR2_TOOLCHAIN_BUILDROOT_INET_RPC is not set
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
# BR2_TOOLCHAIN_BUILDROOT_LOCALE is not set
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_USE_SSP=y
# BR2_PTHREADS_NONE is not set
BR2_PTHREADS=y
# BR2_PTHREADS_OLD is not set
# BR2_PTHREADS_NATIVE is not set
# BR2_ELF2FLT is not set

#
# System configuration
#
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
BR2_ROOTFS_DEVICE_CREATION_STATIC=y
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set

#
# udev requires a toolchain with LARGEFILE + WCHAR support
#
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_POST_BUILD_SCRIPT=""

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_19_X is not set
BR2_BUSYBOX_VERSION_1_20_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.20.1"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.20.x.config"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
# BR2_PACKAGE_BUSYBOX_WATCHDOG is not set

#
# Audio and video applications
#

#
# alsa-utils requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_BELLAGIO is not set
# BR2_PACKAGE_FAAD2 is not set
# BR2_PACKAGE_FLAC is not set

#
# ffmpeg requires a toolchain with LARGEFILE and IPV6 support
#
# BR2_PACKAGE_GSTREAMER is not set

#
# gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support
#
# BR2_PACKAGE_LAME is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPD is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_MUSEPACK is not set
# BR2_PACKAGE_PULSEAUDIO is not set
# BR2_PACKAGE_VORBIS_TOOLS is not set
# BR2_PACKAGE_WAVPACK is not set

#
# Compressors and decompressors
#
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_GZIP=y
# BR2_PACKAGE_LZOP is not set
# BR2_PACKAGE_XZ is not set

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_BONNIE is not set
# BR2_PACKAGE_DHRYSTONE is not set
# BR2_PACKAGE_DSTAT is not set
BR2_PACKAGE_DMALLOC=y
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LATENCYTOP is not set

#
# lmbench requires a toolchain with RPC support
#
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP_TESTSUITE is not set
# BR2_PACKAGE_LTTNG_MODULES is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set
# BR2_PACKAGE_OPROFILE is not set
# BR2_PACKAGE_RT_TESTS is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_STRESS is not set
# BR2_PACKAGE_WHETSTONE is not set
# BR2_PACKAGE_PV is not set

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
BR2_PACKAGE_BINUTILS=y
BR2_PACKAGE_BINUTILS_TARGET=y
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_CCACHE is not set
# BR2_PACKAGE_COREUTILS is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_GETTEXT is not set
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_GMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_GREP is not set
BR2_PACKAGE_MAKE=y
# BR2_PACKAGE_MPC is not set
# BR2_PACKAGE_MPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set
BR2_PACKAGE_PATCH=y
# BR2_PACKAGE_PKG_CONFIG is not set
BR2_PACKAGE_SED=y
# BR2_PACKAGE_SSTRIP is not set
BR2_PACKAGE_TAR=y

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# Graphic applications
#
# BR2_PACKAGE_RRDTOOL is not set

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBGRAB is not set
# BR2_PACKAGE_FBSET is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#
# BR2_PACKAGE_EFL is not set
# BR2_PACKAGE_QT is not set
# BR2_PACKAGE_XORG7 is not set

#
# X libraries and helper libraries
#
# BR2_PACKAGE_LIBERATION is not set

#
# X Window managers
#

#
# X applications
#
# BR2_PACKAGE_GOB2 is not set

#
# midori requires C++, WCHAR in toolchain and libgtk2
#
# BR2_PACKAGE_VALA is not set

#
# Hardware handling
#

#
# cdrkit requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_CRAMFS is not set
# BR2_PACKAGE_DBUS is not set
# BR2_PACKAGE_DEVMEM2 is not set

#
# dmraid requires a toolchain with LARGEFILE support
#

#
# dosfstools requires a toolchain with LARGEFILE support
#

#
# e2fsprogs requires a toolchain with LARGEFILE + WCHAR support
#
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_FMTOOLS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set

#
# gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support enabled
#
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set
# BR2_PACKAGE_GPSD is not set

#
# gvfs requires a toolchain with LARGEFILE and WCHAR support
#

#
# hdparm requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_IRDA_UTILS is not set
# BR2_PACKAGE_KBD is not set
# BR2_PACKAGE_LCDPROC is not set
# BR2_PACKAGE_LINUX_FIRMWARE is not set
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LSUIO is not set

#
# lvm2 requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set

#
# memtester requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_MINICOM is not set
# BR2_PACKAGE_MTD is not set

#
# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
#
# BR2_PACKAGE_OPEN2300 is not set
# BR2_PACKAGE_OPENOCD is not set

#
# parted requires a toolchain with LARGEFILE+WCHAR support
#
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_PICOCOM is not set
# BR2_PACKAGE_RNG_TOOLS is not set
# BR2_PACKAGE_SANE_BACKENDS is not set
# BR2_PACKAGE_SDPARM is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set

#
# squashfs requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_SREDIRD is not set

#
# sshfs requires a toolchain with LARGEFILE and WCHAR support
#
# BR2_PACKAGE_STATSERIAL is not set
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_TI_UTILS is not set
BR2_PACKAGE_UBOOT_TOOLS=y
# BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE is not set
BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV=y

#
# udev requires /dev mgmnt set to udev under System configuration
#

#
# unionfs requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set

#
# xfsprogs requires a toolchain with LARGEFILE + WCHAR support
#

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_LUA is not set
BR2_PACKAGE_MICROPERL=y
BR2_PACKAGE_MICROPERL_MODULES=""

#
# module bundles
#
# BR2_PACKAGE_MICROPERL_BUNDLE_CGI is not set
# BR2_PACKAGE_PHP is not set
# BR2_PACKAGE_PYTHON is not set
# BR2_PACKAGE_RUBY is not set
# BR2_PACKAGE_TCL is not set

#
# Libraries
#

#
# Audio/Sound
#
# BR2_PACKAGE_ALSA_LIB is not set
# BR2_PACKAGE_AUDIOFILE is not set
# BR2_PACKAGE_LIBAO is not set
# BR2_PACKAGE_LIBCDAUDIO is not set
# BR2_PACKAGE_LIBCUE is not set
# BR2_PACKAGE_LIBCUEFILE is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBREPLAYGAIN is not set
# BR2_PACKAGE_LIBSAMPLERATE is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_PORTAUDIO is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_TAGLIB is not set
# BR2_PACKAGE_TREMOR is not set

#
# Compression and decompression
#
# BR2_PACKAGE_LIBARCHIVE is not set
# BR2_PACKAGE_LZO is not set
BR2_PACKAGE_ZLIB=y

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_GNUTLS is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set

#
# libnss requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_OCF_LINUX is not set
BR2_PACKAGE_OPENSSL=y
# BR2_PACKAGE_OPENSSL_BIN is not set
# BR2_PACKAGE_OPENSSL_ENGINES is not set
# BR2_PACKAGE_OPENSSL_OCF is not set
# BR2_PACKAGE_POLARSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_MYSQL_CLIENT is not set
# BR2_PACKAGE_SQLCIPHER is not set
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#
# BR2_PACKAGE_GAMIN is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set

#
# libfuse requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBLOCKFILE is not set
# BR2_PACKAGE_LIBSYSFS is not set

#
# Graphics
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_IMLIB2 is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set
# BR2_PACKAGE_LIBDMTX is not set
# BR2_PACKAGE_LIBEXIF is not set
# BR2_PACKAGE_LIBGEOTIFF is not set
# BR2_PACKAGE_GDK_PIXBUF is not set
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBRAW is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set
# BR2_PACKAGE_OPENCV is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_TIFF is not set

#
# webkit requires C++, WCHAR in toolchain and libgtk2
#

#
# Hardware handling
#
BR2_PACKAGE_LIBAIO=y
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_LIBFTDI is not set
# BR2_PACKAGE_LIBHID is not set
# BR2_PACKAGE_LIBIQRF is not set
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBUSB_COMPAT=y

#
# libv4l requires a toolchain with LARGEFILE support
#

#
# Javascript
#
# BR2_PACKAGE_EXPLORERCANVAS is not set
# BR2_PACKAGE_FLOT is not set
# BR2_PACKAGE_JQUERY is not set
# BR2_PACKAGE_JQUERY_SPARKLINE is not set
# BR2_PACKAGE_JQUERY_VALIDATION is not set
# BR2_PACKAGE_JSMIN is not set

#
# Multimedia
#

#
# libdvdread requires a toolchain with LARGEFILE support
#

#
# libdvdnav requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBMMS is not set
# BR2_PACKAGE_LIBMPEG2 is not set
# BR2_PACKAGE_LIBOGG is not set

#
# libplayer requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIVE555 is not set

#
# Networking
#
# BR2_PACKAGE_GLIB_NETWORKING is not set
# BR2_PACKAGE_LIBCGI is not set
# BR2_PACKAGE_LIBCGICC is not set
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBESMTP is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBFCGI is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBOAUTH is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set

#
# libmnl requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBMODBUS is not set
# BR2_PACKAGE_LIBMBUS is not set
# BR2_PACKAGE_LIBNETFILTER_CONNTRACK is not set
# BR2_PACKAGE_LIBNFNETLINK is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set
# BR2_PACKAGE_LIBSOUP is not set

#
# libupnp requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBVNCSERVER is not set

#
# zeromq requires a toolchain with C++, LARGEFILE + WCHAR support
#

#
# Other
#
# BR2_PACKAGE_FFTW is not set
# BR2_PACKAGE_LIBARGTABLE2 is not set
# BR2_PACKAGE_ARGP_STANDALONE is not set
# BR2_PACKAGE_BOOST is not set
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBCAP_NG is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBEV is not set
# BR2_PACKAGE_LIBFFI is not set
# BR2_PACKAGE_LIBGLIB2 is not set
# BR2_PACKAGE_LIBICAL is not set

#
# libnspr requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBSIGC is not set
# BR2_PACKAGE_LIBTPL is not set
# BR2_PACKAGE_LIBURCU is not set
# BR2_PACKAGE_ORC is not set
# BR2_PACKAGE_POCO is not set
# BR2_PACKAGE_PROTOBUF is not set

#
# Text and terminal handling
#
# BR2_PACKAGE_ENCHANT is not set
# BR2_PACKAGE_ICU is not set
# BR2_PACKAGE_LIBICONV is not set
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
BR2_PACKAGE_READLINE=y
# BR2_PACKAGE_SLANG is not set

#
# JSON/XML
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_JSON_C is not set
# BR2_PACKAGE_LIBROXML is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set
# BR2_PACKAGE_LIBYAML is not set
# BR2_PACKAGE_MXML is not set
# BR2_PACKAGE_XERCES is not set
# BR2_PACKAGE_YAJL is not set

#
# Miscellaneous
#
# BR2_PACKAGE_EMPTY is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BLUEZ_UTILS is not set
# BR2_PACKAGE_BOA is not set

#
# bind requires a toolchain with LARGEFILE and IPV6 support
#

#
# bmon requires a toolchain with IPv6 support
#
# BR2_PACKAGE_BRIDGE_UTILS is not set
# BR2_PACKAGE_BWM_NG is not set
# BR2_PACKAGE_CAN_UTILS is not set

#
# connman needs a toolchain with resolver support
#
# BR2_PACKAGE_CTORRENT is not set
# BR2_PACKAGE_CIFS_UTILS is not set

#
# conntrack-tools requires a toolchain with IPV6 support
#
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DHCP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set

#
# ebtables requires a toolchain with IPv6 support
#
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HEIRLOOM_MAILX is not set
# BR2_PACKAGE_HIAWATHA is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set
# BR2_PACKAGE_IGH_ETHERCAT is not set
# BR2_PACKAGE_IPERF is not set
# BR2_PACKAGE_IPROUTE2 is not set
# BR2_PACKAGE_IPSEC_TOOLS is not set

#
# ipset requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_IPTABLES is not set
# BR2_PACKAGE_IW is not set
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MII_DIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MSMTP is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set

#
# ndisc6 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_NETCAT is not set

#
# netkitbase requires a toolchain with RPC support
#

#
# netkittelnet requires a toolchain with RPC support
#
# BR2_PACKAGE_NETATALK is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# NetworkManager requires a toolchain with IPV6, LARGEFILE and WCHAR support
#
# BR2_PACKAGE_NOIP is not set

#
# nfs-utils requires a toolchain with RPC and LARGEFILE support
#
# BR2_PACKAGE_NGIRCD is not set
# BR2_PACKAGE_NGREP is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_NUTTCP is not set

#
# olsr requires a toolchain with IPv6 support
#
# BR2_PACKAGE_OPENNTPD is not set
BR2_PACKAGE_OPENSSH=y
# BR2_PACKAGE_OPENSWAN is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with RPC support
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set

#
# radvd requires a toolchain with IPV6 support
#
# BR2_PACKAGE_RSH_REDONE is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SOCKETCAND is not set
# BR2_PACKAGE_SPAWN_FCGI is not set

#
# Squid requires a toolchain with C++ and IPv6 support enabled
#
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set

#
# Transmission requires a toolchain with IPv6 support
#

#
# udpcast requires a toolchain with LARGEFILE support
#

#
# ushare requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set
# BR2_PACKAGE_XL2TP is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set

#
# rpm requires libneon with SSL, XML and ZLIB support
#

#
# Real-Time
#
BR2_PACKAGE_XENOMAI=y
BR2_PACKAGE_XENOMAI_VERSION=""
# BR2_PACKAGE_XENOMAI_SMP is not set
BR2_PACKAGE_XENOMAI_TESTSUITE=y
# BR2_PACKAGE_XENOMAI_RTCAN is not set
# BR2_PACKAGE_XENOMAI_ANALOGY is not set
BR2_PACKAGE_XENOMAI_NATIVE_SKIN=y
BR2_PACKAGE_XENOMAI_POSIX_SKIN=y
# BR2_PACKAGE_XENOMAI_VXWORKS_SKIN is not set
# BR2_PACKAGE_XENOMAI_PSOS_SKIN is not set
BR2_PACKAGE_XENOMAI_RTAI_SKIN=y
# BR2_PACKAGE_XENOMAI_UITRON_SKIN is not set
# BR2_PACKAGE_XENOMAI_VRTX_SKIN is not set

#
# Shell and utilities
#
BR2_PACKAGE_AT=y
BR2_PACKAGE_BASH=y
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set

#
# inotify-tools requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LOCKFILE_PROGS is not set
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_SCREEN is not set
BR2_PACKAGE_SUDO=y
# BR2_PACKAGE_WHICH is not set
# BR2_PACKAGE_XMLSTARLET is not set

#
# System tools
#

#
# acl requires a toolchain with LARGEFILE support
#

#
# attr requires a toolchain with LARGEFILE support
#

#
# bootutils requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_HTOP is not set
# BR2_PACKAGE_KMOD is not set
# BR2_PACKAGE_KMOD_TOOLS is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_RSYSLOG is not set

#
# syslogd requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_SYSVINIT is not set

#
# systemd not available (depends on /dev management with udev and ipv6 support)
#

#
# util-linux requires a toolchain with LARGEFILE + WCHAR support
#

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_NANO is not set
BR2_PACKAGE_UEMACS=y
BR2_PACKAGE_VIM=y
BR2_PACKAGE_VIM_RUNTIME=y

#
# Host utilities
#
# BR2_PACKAGE_HOST_LPC3250LOADER is not set
# BR2_PACKAGE_HOST_OPENOCD is not set
BR2_PACKAGE_HOST_SAM_BA=y
BR2_PACKAGE_HOST_UBOOT_TOOLS=y

#
# Filesystem images
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
# BR2_TARGET_ROOTFS_TAR_NONE is not set
# BR2_TARGET_ROOTFS_TAR_GZIP is not set
BR2_TARGET_ROOTFS_TAR_BZIP2=y
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_AT91BOOTSTRAP is not set
BR2_TARGET_AT91DATAFLASHBOOT=y
# BR2_TARGET_BAREBOX is not set
# BR2_TARGET_LPC32XXCDL is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek_dataflash_cs1"
BR2_TARGET_UBOOT_2012_04=y
# BR2_TARGET_UBOOT_2011_12 is not set
# BR2_TARGET_UBOOT_2011_09 is not set
# BR2_TARGET_UBOOT_CUSTOM_TARBALL is not set
# BR2_TARGET_UBOOT_CUSTOM_GIT is not set
BR2_TARGET_UBOOT_VERSION="2012.04.01"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR=""
BR2_TARGET_UBOOT_FORMAT_BIN=y
# BR2_TARGET_UBOOT_FORMAT_IMG is not set
# BR2_TARGET_UBOOT_FORMAT_NAND_BIN is not set
# BR2_TARGET_UBOOT_FORMAT_KWB is not set
# BR2_TARGET_UBOOT_NETWORK is not set
# BR2_TARGET_UBOOT_SPL is not set

#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_3 is not set
BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
BR2_LINUX_KERNEL_VERSION="3.0.32"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g20ek"
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
BR2_LINUX_KERNEL_INSTALL_TARGET=y

#
# Linux Kernel Extensions
#
BR2_LINUX_KERNEL_EXT_XENOMAI=y
BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH=""
# BR2_LINUX_KERNEL_EXT_OCF_LINUX is not set
# BR2_LINUX_KERNEL_EXT_RTAI is not set

-- Chuck

Chuck Fry
Senior Software Engineer
Dell | Services, Federal Government
Office: 650 604 1882  Mobile: 408 230 2715
M/S 269-1, Building N269/260-7
NASA Ames Research Center
Moffett Field, CA 94035-1000

I do not speak for Dell, SGT, Code TI, or NASA, nor do they speak for me.



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120824/4dbb0ad0/attachment-0001.html>
