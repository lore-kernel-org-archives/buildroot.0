From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 09:19:06 +0200
Subject: [Buildroot] Toolchain generate invalid executable format
In-Reply-To: <4E78C4FB.2060802@signaturealpha.com>
References: <4E7266AA.1000103@signaturealpha.com>
 <CAAXf6LW=+qRvUi1BR3ajVQ=SoZObj4cm0zUiN=oznJ-tkwMVDA@mail.gmail.com>
 <4E732E0F.6070709@signaturealpha.com>
 <4E73B2A8.4030507@signaturealpha.com>
 <CAAXf6LVR6XwVbis+4URWdbOs_NR6JEQRZ7j7a1g7=c7=xF6MWA@mail.gmail.com>
 <4E77B4C9.5000302@signaturealpha.com>
 <CAAXf6LWHKp-OXoaeWp7gvYk_c=zGzSCPLzP77Y3vxzgY6im8Tw@mail.gmail.com>
 <4E78726D.4060801@signaturealpha.com>
 <4E78C4FB.2060802@signaturealpha.com>
Message-ID: <CAAXf6LUW_1U48D_s8R7bhb52UB2OtuxiyfJZyCqLUnjC=AcvKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Sep 20, 2011 at 6:53 PM, Marc Leclerc
<marc-leclerc@signaturealpha.com> wrote:
> Hi,
>
> tried a simple helloworld app and the same problem exists. it segfaults and
> gdb does not recognize the file format
>
> Is there any informatiom I could pull out of either the host or the target
> to find the problem

It segfaults? Does it run correctly on your host?
Can you post the source code, plus the exact command-line you used to
compile it?

Can you compile that hello world app with the old and new toolchain,
and compare them? For example compare the ELF header with 'readelf
-h', compare the assembly output with 'objdump -d' and see if anything
comes up...

>
> Regards
>
> On 2011-09-20 07:01, Marc Leclerc wrote:
>>
>> Hi,
>>
>> I will try an Hello world this afternoon, gdb version is 6.8 running on
>> the target.
>> I compile my app using a makefile that has not changed in months, I will
>> also post my makefile later, there may be a setting that is now required
>> that was not before.
>>
>> BR2_PACKAGE_GDB=y
>> BR2_PACKAGE_GDB_SERVER=y
>>
>> Regards
>> Marc
>>
>> On 2011-09-20 03:41, Thomas De Schampheleire wrote:
>>>
>>> Hi,
>>>
>>> On Mon, Sep 19, 2011 at 11:31 PM, Marc Leclerc
>>> <marc-leclerc@signaturealpha.com> ?wrote:
>>>>
>>>> Hi,
>>>>
>>>> first thanks for your time, appreciated.
>>>>
>>>> I was under the impression that the environement (target) was built
>>>> using
>>>> the downloaded toolchain and assuming this, shouldn't the applications
>>>> built
>>>> with the toolchain have problem as well.
>>>
>>> It depends on what the underlying problem is. Maybe your application
>>> does something 'special' that is interpreted differently now.
>>>
>>> How do you compile your application?
>>> Did you try compiling a hello world application in exactly the same
>>> way as you build your application?
>>>
>>>> I have tried loading the application with gdb which tell me the file is
>>>> invalid format.
>>>
>>> Which gdb are you using and where are you running it?
>>> Your buildroot configuration does not show a gdb for the host being
>>> built, so I assume you are using the target gdb on your host, or the
>>> target gdb on target.
>>> I have to say that I'm unfamiliar with embedded development on x86
>>> targets, so I can only try to guide you in general ways.
>>>
>>> Best regards,
>>> Thomas
>>>
>>>> The target is a Vortex86DX and has a floating point unit.
>>>>
>>>> Both executable also runs on my host (i5)
>>>>
>>>> The only difference in gcc -v output are paths and gcc version (4.3.5 vs
>>>> 4.3.6) and --disable-libomp
>>>>
>>>> Does any of this makes sence?
>>>>
>>>> Regards
>>>> Marc
>>>>
>>>> On 2011-09-17 07:12, Thomas De Schampheleire wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On Fri, Sep 16, 2011 at 10:33 PM, Marc Leclerc
>>>>> <marc-leclerc@signaturealpha.com> ? ?wrote:
>>>>>>
>>>>>> If it may help here is the -v output of the gcc compiler and output
>>>>>> from
>>>>>> compiling my app
>>>>>>
>>>>>> Thanks
>>>>>
>>>>> At least on my host, both apps you sent run fine. The 'file' command
>>>>> also shows that both apps are built for i486 (I was thinking you had a
>>>>> binary for the wrong architecture).
>>>>>
>>>>> If you get a specific invalid instruction exception, you should try to
>>>>> figure out which instruction it is. An example could be that your new
>>>>> app is compiled with hardware-floating point instructions, while your
>>>>> processor doesn't have such floating point unit.
>>>>>
>>>>> It's a good idea to compare the output you gave below for both your
>>>>> toolchains, and see if there is a difference...
>>>>>
>>>>> Thomas
>>>>>
>>>>>> marc at Vostro-Linux:~/Smartlinks/DNP3/sa_DNP3$ i486-linux-gcc -v
>>>>>> Using built-in specs.
>>>>>> Target: i486-unknown-linux-uclibc
>>>>>> Configured with:
>>>>>> /home/marc/buildroot/output/toolchain/gcc-4.3.6/configure
>>>>>> --prefix=/home/marc/buildroot/output/host/usr
>>>>>> --build=i686-pc-linux-gnu
>>>>>> --host=i686-pc-linux-gnu --target=i486-unknown-linux-uclibc
>>>>>> --enable-languages=c
>>>>>>
>>>>>>
>>>>>> --with-sysroot=/home/marc/buildroot/output/host/usr/i486-unknown-linux-uclibc/sysroot
>>>>>>
>>>>>>
>>>>>> --with-build-time-tools=/home/marc/buildroot/output/host/usr/i486-unknown-linux-uclibc/bin
>>>>>> --disable-__cxa_atexit --enable-target-optspace --disable-libgomp
>>>>>> --with-gnu-ld --disable-libssp --disable-multilib --disable-tls
>>>>>> --disable-shared --with-gmp=/home/marc/buildroot/output/host/usr
>>>>>> --with-mpfr=/home/marc/buildroot/output/host/usr --enable-threads
>>>>>> --disable-decimal-float --with-arch=i486 --with-tune=i486
>>>>>> --with-pkgversion='Buildroot 2011.08'
>>>>>> --with-bugurl=http://bugs.buildroot.net/
>>>>>> Thread model: posix
>>>>>> gcc version 4.3.6 (Buildroot 2011.08)
>>>>>> marc at Vostro-Linux:~/Smartlinks/DNP3/sa_DNP3$ make
>>>>>> i486-linux-gcc -c -g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3
>>>>>> \
>>>>>> ? ?-oobj_gcc/sa_DNP3.o \
>>>>>> ? ?sa_DNP3.c
>>>>>> i486-linux-gcc -c ?-g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3 ?\
>>>>>> ? ? ? ? ? ? ? ? \
>>>>>> ? ? ? ? ? ? ? ?-oobj_gcc/vdx_gpio.o \
>>>>>> ? ? ? ? ? ? ? ?../../sa_shared/vdx_gpio.c
>>>>>> i486-linux-gcc -c ?-g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3 ?\
>>>>>> ? ? ? ? ? ? ? ? \
>>>>>> ? ? ? ? ? ? ? ?-oobj_gcc/vdx_isaio.o \
>>>>>> ? ? ? ? ? ? ? ?../../sa_shared/vdx_isaio.c
>>>>>> i486-linux-gcc -c ?-g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3 ?\
>>>>>> ? ? ? ? ? ? ? ? \
>>>>>> ? ? ? ? ? ? ? ?-oobj_gcc/sa_simulate.o \
>>>>>> ? ? ? ? ? ? ? ?../../sa_shared/sa_simulate.c
>>>>>> i486-linux-gcc -c ?-g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3 ?\
>>>>>> ? ? ? ? ? ? ? ? \
>>>>>> ? ? ? ? ? ? ? ?-oobj_gcc/sa_comtrade.o \
>>>>>> ? ? ? ? ? ? ? ?../../sa_shared/sa_comtrade.c
>>>>>> i486-linux-gcc -c ?-g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3 ?\
>>>>>> ? ? ? ? ? ? ? ? \
>>>>>> ? ? ? ? ? ? ? ?-oobj_gcc/sa_calculation.o \
>>>>>> ? ? ? ? ? ? ? ?../../sa_shared/sa_calculation.c
>>>>>> i486-linux-gcc -c ?-g -I ../ -I ../../sa_shared/ -DTMW_LINUX_TARGET
>>>>>> -DSA_DNP3 ?\
>>>>>> ? ? ? ? ? ? ? ? \
>>>>>> ? ? ? ? ? ? ? ?-oobj_gcc/sa_config.o \
>>>>>> ? ? ? ? ? ? ? ?../../sa_shared/sa_config.c
>>>>>> i486-linux-gcc -g -static -o ../bin/sa_DNP3 \
>>>>>> ? ?obj_gcc/sa_DNP3.o \
>>>>>> ? ?obj_gcc/vdx_gpio.o \
>>>>>> ? ?obj_gcc/vdx_isaio.o \
>>>>>> ? ?obj_gcc/sa_simulate.o \
>>>>>> ? ?obj_gcc/sa_comtrade.o \
>>>>>> ? ?obj_gcc/sa_calculation.o \
>>>>>> ? ?obj_gcc/sa_config.o \
>>>>>> ? ?../tmwscl/dnp.lib ../tmwscl/utils.lib ../liniotarg.lib -lpthread
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2011-09-16 07:07, Marc Leclerc wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> BR2_i386=y
>>>>>>> BR2_x86_i486=y
>>>>>>>
>>>>>>>
>>>>>>> BR2_GCC_TARGET_TUNE="i486"
>>>>>>> BR2_GCC_TARGET_ARCH="i486"
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>> On 2011-09-16 01:36, Thomas De Schampheleire wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Thu, Sep 15, 2011 at 10:57 PM, Marc Leclerc
>>>>>>>> <marc-leclerc@signaturealpha.com> ? ? ?wrote:
>>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> Finally got a working environment after going back to the version
>>>>>>>>> of
>>>>>>>>> tools I
>>>>>>>>> had on my previous setup beside the kernel (now 3.0.4)
>>>>>>>>>
>>>>>>>>> One big problem though when I compile my application from my
>>>>>>>>> workstation
>>>>>>>>> using the buildroot toolchain it no longer runs on my target
>>>>>>>>> leaving
>>>>>>>>> an
>>>>>>>>> illegal instruction message. gdb (6.8) say the file format is not
>>>>>>>>> recognized. if i take the same app compiled with my previous setup
>>>>>>>>> it
>>>>>>>>> runs
>>>>>>>>> fine (no changes have been made to the source, only had to change
>>>>>>>>> the
>>>>>>>>> PATH
>>>>>>>>> (to the compiler) since it changed from the buildroot version I was
>>>>>>>>> using.
>>>>>>>>
>>>>>>>> What architecture is your target?
>>>>>>>> What is the output of 'file<your-application>' ?
>>>>>>>>
>>>>>>>>> Here is my buildroot .config, hopefully this is only caused by a
>>>>>>>>> change
>>>>>>>>> in
>>>>>>>>> default configuration
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Automatically generated make config: don't edit
>>>>>>>>> # Buildroot 2011.08 Configuration
>>>>>>>>> # Thu Sep 15 14:57:25 2011
>>>>>>>>> #
>>>>>>>>> BR2_HAVE_DOT_CONFIG=y
>>>>>>>>> # BR2_arm is not set
>>>>>>>>> # BR2_armeb is not set
>>>>>>>>> # BR2_avr32 is not set
>>>>>>>>> # BR2_bfin is not set
>>>>>>>>> BR2_i386=y
>>>>>>>>> # BR2_mips is not set
>>>>>>>>> # BR2_mipsel is not set
>>>>>>>>> # BR2_powerpc is not set
>>>>>>>>> # BR2_sh is not set
>>>>>>>>> # BR2_sh64 is not set
>>>>>>>>> # BR2_sparc is not set
>>>>>>>>> # BR2_x86_64 is not set
>>>>>>>>> # BR2_xtensa is not set
>>>>>>>>> # BR2_x86_i386 is not set
>>>>>>>>> BR2_x86_i486=y
>>>>>>>>> # BR2_x86_i586 is not set
>>>>>>>>> # BR2_x86_i686 is not set
>>>>>>>>> # BR2_x86_pentiumpro is not set
>>>>>>>>> # BR2_x86_pentium_mmx is not set
>>>>>>>>> # BR2_x86_pentium_m is not set
>>>>>>>>> # BR2_x86_pentium2 is not set
>>>>>>>>> # BR2_x86_pentium3 is not set
>>>>>>>>> # BR2_x86_pentium4 is not set
>>>>>>>>> # BR2_x86_prescott is not set
>>>>>>>>> # BR2_x86_nocona is not set
>>>>>>>>> # BR2_x86_core2 is not set
>>>>>>>>> # BR2_x86_k6 is not set
>>>>>>>>> # BR2_x86_k6_2 is not set
>>>>>>>>> # BR2_x86_athlon is not set
>>>>>>>>> # BR2_x86_athlon_4 is not set
>>>>>>>>> # BR2_x86_opteron is not set
>>>>>>>>> # BR2_x86_opteron_sse3 is not set
>>>>>>>>> # BR2_x86_barcelona is not set
>>>>>>>>> # BR2_x86_geode is not set
>>>>>>>>> # BR2_x86_c3 is not set
>>>>>>>>> # BR2_x86_c32 is not set
>>>>>>>>> # BR2_x86_winchip_c6 is not set
>>>>>>>>> # BR2_x86_winchip2 is not set
>>>>>>>>> BR2_ARCH="i486"
>>>>>>>>> BR2_ENDIAN="LITTLE"
>>>>>>>>> BR2_GCC_TARGET_TUNE="i486"
>>>>>>>>> BR2_GCC_TARGET_ARCH="i486"
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Build options
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Commands
>>>>>>>>> #
>>>>>>>>> BR2_WGET="wget --passive-ftp -nd -t 3"
>>>>>>>>> BR2_SVN="svn"
>>>>>>>>> BR2_BZR="bzr"
>>>>>>>>> BR2_GIT="git"
>>>>>>>>> BR2_ZCAT="gzip -d -c"
>>>>>>>>> BR2_BZCAT="bzcat"
>>>>>>>>> BR2_XZCAT="xzcat"
>>>>>>>>> BR2_TAR_OPTIONS=""
>>>>>>>>> BR2_DL_DIR="$(TOPDIR)/dl"
>>>>>>>>> BR2_HOST_DIR="$(BASE_DIR)/host"
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Mirrors and Download locations
>>>>>>>>> #
>>>>>>>>> BR2_PRIMARY_SITE=""
>>>>>>>>> BR2_BACKUP_SITE="http://sources.buildroot.net/"
>>>>>>>>> BR2_SOURCEFORGE_MIRROR="kent"
>>>>>>>>> BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
>>>>>>>>> BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
>>>>>>>>> BR2_DEBIAN_MIRROR="http://ftp.debian.org"
>>>>>>>>> BR2_JLEVEL=2
>>>>>>>>> # BR2_CCACHE is not set
>>>>>>>>> # BR2_DEPRECATED is not set
>>>>>>>>> # BR2_ENABLE_DEBUG is not set
>>>>>>>>> BR2_STRIP_strip=y
>>>>>>>>> # BR2_STRIP_sstrip is not set
>>>>>>>>> # BR2_STRIP_none is not set
>>>>>>>>> # BR2_OPTIMIZE_0 is not set
>>>>>>>>> # BR2_OPTIMIZE_1 is not set
>>>>>>>>> # BR2_OPTIMIZE_2 is not set
>>>>>>>>> # BR2_OPTIMIZE_3 is not set
>>>>>>>>> BR2_OPTIMIZE_S=y
>>>>>>>>> # BR2_PREFER_STATIC_LIB is not set
>>>>>>>>> # BR2_HAVE_DOCUMENTATION is not set
>>>>>>>>> # BR2_HAVE_DEVFILES is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Toolchain
>>>>>>>>> #
>>>>>>>>> BR2_TOOLCHAIN_BUILDROOT=y
>>>>>>>>> # BR2_TOOLCHAIN_EXTERNAL is not set
>>>>>>>>> # BR2_TOOLCHAIN_CTNG is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Kernel Header Options
>>>>>>>>> #
>>>>>>>>> # BR2_KERNEL_HEADERS_2_6_35 is not set
>>>>>>>>> # BR2_KERNEL_HEADERS_2_6_36 is not set
>>>>>>>>> # BR2_KERNEL_HEADERS_2_6_37 is not set
>>>>>>>>> # BR2_KERNEL_HEADERS_2_6_38 is not set
>>>>>>>>> # BR2_KERNEL_HEADERS_2_6_39 is not set
>>>>>>>>> BR2_KERNEL_HEADERS_3_0=y
>>>>>>>>> # BR2_KERNEL_HEADERS_VERSION is not set
>>>>>>>>> # BR2_KERNEL_HEADERS_SNAP is not set
>>>>>>>>> BR2_DEFAULT_KERNEL_HEADERS="3.0.4"
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # uClibc Options
>>>>>>>>> #
>>>>>>>>> # BR2_UCLIBC_VERSION_0_9_31 is not set
>>>>>>>>> BR2_UCLIBC_VERSION_0_9_32=y
>>>>>>>>> # BR2_UCLIBC_VERSION_SNAPSHOT is not set
>>>>>>>>> BR2_UCLIBC_VERSION_STRING="0.9.32"
>>>>>>>>> BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.32.config"
>>>>>>>>> # BR2_PTHREAD_DEBUG is not set
>>>>>>>>> # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Binutils Options
>>>>>>>>> #
>>>>>>>>> # BR2_BINUTILS_VERSION_2_20 is not set
>>>>>>>>> BR2_BINUTILS_VERSION_2_20_1=y
>>>>>>>>> # BR2_BINUTILS_VERSION_2_21 is not set
>>>>>>>>> # BR2_BINUTILS_VERSION_2_21_1 is not set
>>>>>>>>> BR2_BINUTILS_VERSION="2.20.1"
>>>>>>>>> BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # GCC Options
>>>>>>>>> #
>>>>>>>>> # BR2_GCC_VERSION_4_2_4 is not set
>>>>>>>>> BR2_GCC_VERSION_4_3_X=y
>>>>>>>>> # BR2_GCC_VERSION_4_4_X is not set
>>>>>>>>> # BR2_GCC_VERSION_4_5_X is not set
>>>>>>>>> # BR2_GCC_VERSION_4_6_X is not set
>>>>>>>>> # BR2_GCC_VERSION_SNAP is not set
>>>>>>>>> BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
>>>>>>>>> BR2_GCC_VERSION="4.3.6"
>>>>>>>>> BR2_EXTRA_GCC_CONFIG_OPTIONS=""
>>>>>>>>> # BR2_INSTALL_OBJC is not set
>>>>>>>>> # BR2_INSTALL_FORTRAN is not set
>>>>>>>>> # BR2_GCC_SHARED_LIBGCC is not set
>>>>>>>>> # BR2_GCC_ENABLE_OPENMP is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Gdb Options
>>>>>>>>> #
>>>>>>>>> BR2_PACKAGE_GDB=y
>>>>>>>>> BR2_PACKAGE_GDB_SERVER=y
>>>>>>>>> # BR2_PACKAGE_GDB_HOST is not set
>>>>>>>>> # BR2_GDB_VERSION_6_7_1 is not set
>>>>>>>>> BR2_GDB_VERSION_6_8=y
>>>>>>>>> # BR2_GDB_VERSION_7_0_1 is not set
>>>>>>>>> # BR2_GDB_VERSION_7_1 is not set
>>>>>>>>> BR2_GDB_VERSION="6.8"
>>>>>>>>> BR2_LARGEFILE=y
>>>>>>>>> BR2_INET_IPV6=y
>>>>>>>>> BR2_INET_RPC=y
>>>>>>>>> BR2_USE_WCHAR=y
>>>>>>>>> BR2_ENABLE_LOCALE=y
>>>>>>>>> BR2_TOOLCHAIN_HAS_THREADS=y
>>>>>>>>> BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
>>>>>>>>> # BR2_ENABLE_LOCALE_PURGE is not set
>>>>>>>>> BR2_NEEDS_GETTEXT=y
>>>>>>>>> BR2_NEEDS_GETTEXT_IF_LOCALE=y
>>>>>>>>> BR2_USE_MMU=y
>>>>>>>>> BR2_TARGET_OPTIMIZATION="-pipe"
>>>>>>>>> BR2_TARGET_LDFLAGS=""
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Toolchain Options
>>>>>>>>> #
>>>>>>>>> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
>>>>>>>>> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
>>>>>>>>> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
>>>>>>>>> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>>>>>>>>> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>>>>>>>>> # BR2_TOOLCHAIN_BUILDROOT_CXX is not set
>>>>>>>>> # BR2_TOOLCHAIN_BUILDROOT_USE_SSP is not set
>>>>>>>>> # BR2_PTHREADS_NONE is not set
>>>>>>>>> # BR2_PTHREADS is not set
>>>>>>>>> BR2_PTHREADS_OLD=y
>>>>>>>>> # BR2_PTHREADS_NATIVE is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # System configuration
>>>>>>>>> #
>>>>>>>>> BR2_TARGET_GENERIC_HOSTNAME="buildroot"
>>>>>>>>> BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
>>>>>>>>> BR2_ROOTFS_DEVICE_CREATION_STATIC=y
>>>>>>>>> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
>>>>>>>>> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
>>>>>>>>> # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
>>>>>>>>> BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
>>>>>>>>>
>>>>>>>>> BR2_ROOTFS_STATIC_DEVICE_TABLE="target/generic/device_table_dev.txt"
>>>>>>>>> BR2_ROOTFS_SKELETON_DEFAULT=y
>>>>>>>>> # BR2_ROOTFS_SKELETON_CUSTOM is not set
>>>>>>>>> BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>>>>>>>>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
>>>>>>>>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
>>>>>>>>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
>>>>>>>>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
>>>>>>>>> # BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
>>>>>>>>> BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>>>>>>>>> BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
>>>>>>>>> BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
>>>>>>>>> BR2_ROOTFS_POST_BUILD_SCRIPT="custom/copy_etc.sh"
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Package Selection for the target
>>>>>>>>> #
>>>>>>>>> BR2_PACKAGE_BUSYBOX=y
>>>>>>>>> # BR2_BUSYBOX_VERSION_1_16_X is not set
>>>>>>>>> # BR2_BUSYBOX_VERSION_1_17_X is not set
>>>>>>>>> BR2_BUSYBOX_VERSION_1_18_X=y
>>>>>>>>> # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
>>>>>>>>> BR2_BUSYBOX_VERSION="1.18.5"
>>>>>>>>> BR2_PACKAGE_BUSYBOX_CONFIG="vortex86/busybox.config"
>>>>>>>>> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>>>>>>>>> # BR2_PACKAGE_CUSTOMIZE is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Audio and video libraries and applications
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ALSA_LIB is not set
>>>>>>>>> # BR2_PACKAGE_ALSA_UTILS is not set
>>>>>>>>> # BR2_PACKAGE_AUMIX is not set
>>>>>>>>> # BR2_PACKAGE_FAAD2 is not set
>>>>>>>>> # BR2_PACKAGE_FLAC is not set
>>>>>>>>> # BR2_PACKAGE_FFMPEG is not set
>>>>>>>>> # BR2_PACKAGE_GSTREAMER is not set
>>>>>>>>> # BR2_PACKAGE_LAME is not set
>>>>>>>>> # BR2_PACKAGE_LIBAO is not set
>>>>>>>>> # BR2_PACKAGE_LIBCDAUDIO is not set
>>>>>>>>> # BR2_PACKAGE_LIBCUE is not set
>>>>>>>>> # BR2_PACKAGE_LIBCUEFILE is not set
>>>>>>>>> # BR2_PACKAGE_LIBDVDREAD is not set
>>>>>>>>> # BR2_PACKAGE_LIBDVDNAV is not set
>>>>>>>>> # BR2_PACKAGE_LIBID3TAG is not set
>>>>>>>>> # BR2_PACKAGE_LIBMAD is not set
>>>>>>>>> # BR2_PACKAGE_LIBMMS is not set
>>>>>>>>> # BR2_PACKAGE_LIBMPD is not set
>>>>>>>>> # BR2_PACKAGE_LIBMPEG2 is not set
>>>>>>>>> # BR2_PACKAGE_LIBOGG is not set
>>>>>>>>> # BR2_PACKAGE_LIBREPLAYGAIN is not set
>>>>>>>>> # BR2_PACKAGE_LIBSAMPLERATE is not set
>>>>>>>>> # BR2_PACKAGE_LIBSNDFILE is not set
>>>>>>>>> # BR2_PACKAGE_LIBTHEORA is not set
>>>>>>>>> # BR2_PACKAGE_LIBVORBIS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Live555 needs C++ compiler
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_MADPLAY is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # mpd requires a toolchain with C++ and WCHAR support
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_MPG123 is not set
>>>>>>>>> # BR2_PACKAGE_MPLAYER is not set
>>>>>>>>> # BR2_PACKAGE_MUSEPACK is not set
>>>>>>>>> # BR2_PACKAGE_SPEEX is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # swfdec requires a toolchain with WCHAR and C++ support
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # taglib requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_TREMOR is not set
>>>>>>>>> # BR2_PACKAGE_VORBIS_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_WAVPACK is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Compressors and decompressors
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_BZIP2 is not set
>>>>>>>>> # BR2_PACKAGE_GZIP is not set
>>>>>>>>> # BR2_PACKAGE_LZOP is not set
>>>>>>>>> # BR2_PACKAGE_XZ is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Debugging, profiling and benchmark
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # bonnie++ requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> BR2_PACKAGE_DHRYSTONE=y
>>>>>>>>> # BR2_PACKAGE_DMALLOC is not set
>>>>>>>>> # BR2_PACKAGE_KEXEC is not set
>>>>>>>>> BR2_PACKAGE_LMBENCH=y
>>>>>>>>> BR2_PACKAGE_LSOF=y
>>>>>>>>> # BR2_PACKAGE_LTP_TESTSUITE is not set
>>>>>>>>> BR2_PACKAGE_LTRACE=y
>>>>>>>>> BR2_PACKAGE_MEMSTAT=y
>>>>>>>>> # BR2_PACKAGE_NETPERF is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # oprofile requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> BR2_PACKAGE_STRACE=y
>>>>>>>>> # BR2_PACKAGE_WHETSTONE is not set
>>>>>>>>> # BR2_PACKAGE_VALGRIND is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Development tools
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_AUTOCONF is not set
>>>>>>>>> # BR2_PACKAGE_AUTOMAKE is not set
>>>>>>>>> # BR2_PACKAGE_BINUTILS is not set
>>>>>>>>> # BR2_PACKAGE_BISON is not set
>>>>>>>>> # BR2_PACKAGE_BSDIFF is not set
>>>>>>>>> # BR2_PACKAGE_CCACHE is not set
>>>>>>>>> # BR2_PACKAGE_COREUTILS is not set
>>>>>>>>> # BR2_PACKAGE_CVS is not set
>>>>>>>>> # BR2_PACKAGE_DIFFUTILS is not set
>>>>>>>>> # BR2_PACKAGE_DISTCC is not set
>>>>>>>>> # BR2_PACKAGE_FINDUTILS is not set
>>>>>>>>> # BR2_PACKAGE_FLEX is not set
>>>>>>>>> # BR2_PACKAGE_GAWK is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # gcc needs development files in target filesystem
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_GETTEXT is not set
>>>>>>>>> # BR2_PACKAGE_LIBINTL is not set
>>>>>>>>> # BR2_PACKAGE_GMP is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # gperf requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_GREP is not set
>>>>>>>>> # BR2_PACKAGE_MAKE is not set
>>>>>>>>> # BR2_PACKAGE_MPC is not set
>>>>>>>>> # BR2_PACKAGE_MPFR is not set
>>>>>>>>> # BR2_PACKAGE_LIBTOOL is not set
>>>>>>>>> # BR2_PACKAGE_M4 is not set
>>>>>>>>> # BR2_PACKAGE_PATCH is not set
>>>>>>>>> # BR2_PACKAGE_PKG_CONFIG is not set
>>>>>>>>> # BR2_PACKAGE_SED is not set
>>>>>>>>> # BR2_PACKAGE_SSTRIP is not set
>>>>>>>>> # BR2_PACKAGE_TAR is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Games
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_GNUCHESS is not set
>>>>>>>>> # BR2_PACKAGE_PRBOOM is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Graphic libraries and applications (graphic/text)
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Graphic applications
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_RRDTOOL is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # graphic libraries
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_DIRECTFB is not set
>>>>>>>>> # BR2_PACKAGE_FBDUMP is not set
>>>>>>>>> # BR2_PACKAGE_FBGRAB is not set
>>>>>>>>> # BR2_PACKAGE_FBSET is not set
>>>>>>>>> # BR2_PACKAGE_FBV is not set
>>>>>>>>> # BR2_PACKAGE_IMAGEMAGICK is not set
>>>>>>>>> # BR2_PACKAGE_LINUX_FUSION is not set
>>>>>>>>> # BR2_PACKAGE_SDL is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # other GUIs
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # qt requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_XORG7 is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # X libraries and helper libraries
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBERATION is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # X Window managers
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # X applications
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_GOB2 is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # midori requires C++, WCHAR in toolchain and libgtk2
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Hardware handling
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ACPID is not set
>>>>>>>>> # BR2_PACKAGE_CDRKIT is not set
>>>>>>>>> # BR2_PACKAGE_CRAMFS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # dbus not available (need expat or libxml2)
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_DMRAID is not set
>>>>>>>>> # BR2_PACKAGE_DOSFSTOOLS is not set
>>>>>>>>> BR2_PACKAGE_E2FSPROGS=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_BADBLOCKS=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_CHATTR=y
>>>>>>>>> # BR2_PACKAGE_E2FSPROGS_DEBUGFS is not set
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_DUMPE2FS=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_E2FREEFRAG=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_E2FSCK=y
>>>>>>>>> # BR2_PACKAGE_E2FSPROGS_E2IMAGE is not set
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_E2LABEL=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_E2UNDO=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_FILEFRAG=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_FINDFS=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_FSCK=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_LOGSAVE=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_LSATTR=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_MKE2FS=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND=y
>>>>>>>>> # BR2_PACKAGE_E2FSPROGS_RESIZE2FS is not set
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_TUNE2FS=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_UUIDGEN=y
>>>>>>>>> BR2_PACKAGE_E2FSPROGS_UUIDD=y
>>>>>>>>> # BR2_PACKAGE_EEPROG is not set
>>>>>>>>> # BR2_PACKAGE_FCONFIG is not set
>>>>>>>>> # BR2_PACKAGE_FIS is not set
>>>>>>>>> # BR2_PACKAGE_GADGETFS_TEST is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # gdisk requires a toolchain with LARGEFILE/WCHAR/C++ support
>>>>>>>>> enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_GENEXT2FS is not set
>>>>>>>>> # BR2_PACKAGE_GENROMFS is not set
>>>>>>>>> # BR2_PACKAGE_GPSD is not set
>>>>>>>>> # BR2_PACKAGE_GVFS is not set
>>>>>>>>> # BR2_PACKAGE_HDPARM is not set
>>>>>>>>> # BR2_PACKAGE_HWDATA is not set
>>>>>>>>> # BR2_PACKAGE_I2C_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
>>>>>>>>> # BR2_PACKAGE_INPUT_TOOLS is not set
>>>>>>>>> BR2_PACKAGE_IOSTAT=y
>>>>>>>>> # BR2_PACKAGE_IRDA_UTILS is not set
>>>>>>>>> # BR2_PACKAGE_KBD is not set
>>>>>>>>> # BR2_PACKAGE_LIBV4L is not set
>>>>>>>>> # BR2_PACKAGE_LM_SENSORS is not set
>>>>>>>>> # BR2_PACKAGE_LSUIO is not set
>>>>>>>>> # BR2_PACKAGE_LVM2 is not set
>>>>>>>>> BR2_PACKAGE_MAKEDEVS=y
>>>>>>>>> # BR2_PACKAGE_MDADM is not set
>>>>>>>>> # BR2_PACKAGE_MEMTESTER is not set
>>>>>>>>> # BR2_PACKAGE_MTD is not set
>>>>>>>>> # BR2_PACKAGE_NTFS_3G is not set
>>>>>>>>> # BR2_PACKAGE_NTFSPROGS is not set
>>>>>>>>> BR2_PACKAGE_PCIUTILS=y
>>>>>>>>> # BR2_PACKAGE_RNG_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_SDPARM is not set
>>>>>>>>> BR2_PACKAGE_SETSERIAL=y
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # smartmontools requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_SQUASHFS is not set
>>>>>>>>> # BR2_PACKAGE_SREDIRD is not set
>>>>>>>>> # BR2_PACKAGE_SSHFS is not set
>>>>>>>>> BR2_PACKAGE_STATSERIAL=y
>>>>>>>>> # BR2_PACKAGE_SYSSTAT is not set
>>>>>>>>> # BR2_PACKAGE_TI_UTILS is not set
>>>>>>>>> # BR2_PACKAGE_UBOOT_TOOLS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # udev requires /dev mgmnt set to udev under System configuration
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_USB_MODESWITCH is not set
>>>>>>>>> # BR2_PACKAGE_USBUTILS is not set
>>>>>>>>> # BR2_PACKAGE_WIPE is not set
>>>>>>>>> # BR2_PACKAGE_XFSPROGS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Interpreter languages and scripting
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_HASERL is not set
>>>>>>>>> # BR2_PACKAGE_LUA is not set
>>>>>>>>> # BR2_PACKAGE_MICROPERL is not set
>>>>>>>>> # BR2_PACKAGE_PHP is not set
>>>>>>>>> # BR2_PACKAGE_PYTHON is not set
>>>>>>>>> # BR2_PACKAGE_RUBY is not set
>>>>>>>>> # BR2_PACKAGE_TCL is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Libraries
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Compression and decompression
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBARCHIVE is not set
>>>>>>>>> # BR2_PACKAGE_LZO is not set
>>>>>>>>> BR2_PACKAGE_ZLIB=y
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Crypto
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_BEECRYPT is not set
>>>>>>>>> # BR2_PACKAGE_GNUTLS is not set
>>>>>>>>> # BR2_PACKAGE_LIBGCRYPT is not set
>>>>>>>>> # BR2_PACKAGE_LIBGPG_ERROR is not set
>>>>>>>>> # BR2_PACKAGE_LIBNSS is not set
>>>>>>>>> # BR2_PACKAGE_OPENSSL is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Database
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_BERKELEYDB is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Mysql client requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_SQLITE is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Filesystem
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_GAMIN is not set
>>>>>>>>> # BR2_PACKAGE_LIBCONFIG is not set
>>>>>>>>> # BR2_PACKAGE_LIBCONFUSE is not set
>>>>>>>>> # BR2_PACKAGE_LIBFUSE is not set
>>>>>>>>> # BR2_PACKAGE_LIBLOCKFILE is not set
>>>>>>>>> # BR2_PACKAGE_LIBSYSFS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Graphics
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ATK is not set
>>>>>>>>> # BR2_PACKAGE_CAIRO is not set
>>>>>>>>> # BR2_PACKAGE_FONTCONFIG is not set
>>>>>>>>> # BR2_PACKAGE_FREETYPE is not set
>>>>>>>>> # BR2_PACKAGE_JPEG is not set
>>>>>>>>> # BR2_PACKAGE_LIBART is not set
>>>>>>>>> # BR2_PACKAGE_LIBEXIF is not set
>>>>>>>>> # BR2_PACKAGE_GDK_PIXBUF is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # libgtk2 requires a toolchain with WCHAR and C++ support
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBPNG is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # libraw requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBSVGTINY is not set
>>>>>>>>> # BR2_PACKAGE_LIBUNGIF is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # pango requires a toolchain with WCHAR and C++ support
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_PIXMAN is not set
>>>>>>>>> # BR2_PACKAGE_TIFF is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # webkit requires C++, WCHAR in toolchain and libgtk2
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Hardware handling
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBAIO is not set
>>>>>>>>> # BR2_PACKAGE_LIBRAW1394 is not set
>>>>>>>>> # BR2_PACKAGE_TSLIB is not set
>>>>>>>>> # BR2_PACKAGE_LIBHID is not set
>>>>>>>>> # BR2_PACKAGE_LIBIQRF is not set
>>>>>>>>> # BR2_PACKAGE_LIBUSB is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Networking
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBCGI is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # libcgicc requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBCURL is not set
>>>>>>>>> # BR2_PACKAGE_LIBDNET is not set
>>>>>>>>> # BR2_PACKAGE_LIBEXOSIP2 is not set
>>>>>>>>> # BR2_PACKAGE_LIBIDN is not set
>>>>>>>>> # BR2_PACKAGE_LIBMICROHTTPD is not set
>>>>>>>>> # BR2_PACKAGE_NEON is not set
>>>>>>>>> # BR2_PACKAGE_LIBMNL is not set
>>>>>>>>> # BR2_PACKAGE_LIBNL is not set
>>>>>>>>> # BR2_PACKAGE_LIBPCAP is not set
>>>>>>>>> # BR2_PACKAGE_LIBOSIP2 is not set
>>>>>>>>> # BR2_PACKAGE_LIBRSYNC is not set
>>>>>>>>> # BR2_PACKAGE_LIBSOUP is not set
>>>>>>>>> # BR2_PACKAGE_LIBUPNP is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Other
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_LIBARGTABLE2 is not set
>>>>>>>>> # BR2_PACKAGE_ARGP_STANDALONE is not set
>>>>>>>>> # BR2_PACKAGE_LIBATOMIC_OPS is not set
>>>>>>>>> # BR2_PACKAGE_LIBCAP is not set
>>>>>>>>> # BR2_PACKAGE_LIBDAEMON is not set
>>>>>>>>> BR2_PACKAGE_LIBELF=y
>>>>>>>>> # BR2_PACKAGE_LIBEVENT is not set
>>>>>>>>> # BR2_PACKAGE_LIBFFI is not set
>>>>>>>>> # BR2_PACKAGE_LIBGLIB2 is not set
>>>>>>>>> # BR2_PACKAGE_LIBNSPR is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # libsigc++ requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ORC is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Text and terminal handling
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # enchant requires a toolchain with C++ and WCHAR support enabled
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # icu requires a toolchain with C++ support and WCHAR enabled
>>>>>>>>> #
>>>>>>>>> BR2_PACKAGE_NCURSES=y
>>>>>>>>> # BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
>>>>>>>>> # BR2_PACKAGE_NCURSES_TARGET_FORM is not set
>>>>>>>>> # BR2_PACKAGE_NCURSES_TARGET_MENU is not set
>>>>>>>>> # BR2_PACKAGE_NEWT is not set
>>>>>>>>> # BR2_PACKAGE_PCRE is not set
>>>>>>>>> # BR2_PACKAGE_POPT is not set
>>>>>>>>> # BR2_PACKAGE_READLINE is not set
>>>>>>>>> # BR2_PACKAGE_SLANG is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # JSON/XML
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_EXPAT is not set
>>>>>>>>> # BR2_PACKAGE_EZXML is not set
>>>>>>>>> # BR2_PACKAGE_LIBROXML is not set
>>>>>>>>> # BR2_PACKAGE_LIBXML2 is not set
>>>>>>>>> # BR2_PACKAGE_LIBXSLT is not set
>>>>>>>>> # BR2_PACKAGE_LIBYAML is not set
>>>>>>>>> # BR2_PACKAGE_MXML is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # xerces-c++ requires a toolchain with C++ and WCHAR support
>>>>>>>>> enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_YAJL is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Miscellaneous
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_SHARED_MIME_INFO is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Networking applications
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ARGUS is not set
>>>>>>>>> # BR2_PACKAGE_AVAHI is not set
>>>>>>>>> # BR2_PACKAGE_AXEL is not set
>>>>>>>>> # BR2_PACKAGE_BOA is not set
>>>>>>>>> # BR2_PACKAGE_BIND is not set
>>>>>>>>> # BR2_PACKAGE_BMON is not set
>>>>>>>>> # BR2_PACKAGE_BRIDGE is not set
>>>>>>>>> # BR2_PACKAGE_BWM_NG is not set
>>>>>>>>> # BR2_PACKAGE_CAN_UTILS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # ctorrent requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_CUPS is not set
>>>>>>>>> # BR2_PACKAGE_DHCP is not set
>>>>>>>>> # BR2_PACKAGE_DHCPDUMP is not set
>>>>>>>>> # BR2_PACKAGE_DNSMASQ is not set
>>>>>>>>> BR2_PACKAGE_DROPBEAR=y
>>>>>>>>> # BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS is not set
>>>>>>>>> # BR2_PACKAGE_DROPBEAR_SMALL is not set
>>>>>>>>> # BR2_PACKAGE_EBTABLES is not set
>>>>>>>>> # BR2_PACKAGE_ETHTOOL is not set
>>>>>>>>> # BR2_PACKAGE_HOSTAPD is not set
>>>>>>>>> # BR2_PACKAGE_IFPLUGD is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # iperf requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_IPROUTE2 is not set
>>>>>>>>> # BR2_PACKAGE_IPSEC_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_IPSET is not set
>>>>>>>>> # BR2_PACKAGE_IPTABLES is not set
>>>>>>>>> # BR2_PACKAGE_IW is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Kismet requires a toolchain with C++ support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_XL2TP is not set
>>>>>>>>> # BR2_PACKAGE_LIGHTTPD is not set
>>>>>>>>> # BR2_PACKAGE_LINKS is not set
>>>>>>>>> # BR2_PACKAGE_LRZSZ is not set
>>>>>>>>> # BR2_PACKAGE_MII_DIAG is not set
>>>>>>>>> # BR2_PACKAGE_MROUTED is not set
>>>>>>>>> # BR2_PACKAGE_MUTT is not set
>>>>>>>>> # BR2_PACKAGE_NBD is not set
>>>>>>>>> # BR2_PACKAGE_NCFTP is not set
>>>>>>>>> # BR2_PACKAGE_NETCAT is not set
>>>>>>>>> # BR2_PACKAGE_NETKITBASE is not set
>>>>>>>>> # BR2_PACKAGE_NETKITTELNET is not set
>>>>>>>>> # BR2_PACKAGE_NETPLUG is not set
>>>>>>>>> # BR2_PACKAGE_NETSNMP is not set
>>>>>>>>> # BR2_PACKAGE_NETSTAT_NAT is not set
>>>>>>>>> # BR2_PACKAGE_NFS_UTILS is not set
>>>>>>>>> # BR2_PACKAGE_NGIRCD is not set
>>>>>>>>> BR2_PACKAGE_NTP=y
>>>>>>>>> # BR2_PACKAGE_NTP_SNTP is not set
>>>>>>>>> # BR2_PACKAGE_NTP_NTP_KEYGEN is not set
>>>>>>>>> BR2_PACKAGE_NTP_NTPD=y
>>>>>>>>> BR2_PACKAGE_NTP_NTPDATE=y
>>>>>>>>> # BR2_PACKAGE_NTP_NTPDC is not set
>>>>>>>>> BR2_PACKAGE_NTP_NTPQ=y
>>>>>>>>> BR2_PACKAGE_NTP_TICKADJ=y
>>>>>>>>> # BR2_PACKAGE_NUTTCP is not set
>>>>>>>>> # BR2_PACKAGE_OLSR is not set
>>>>>>>>> # BR2_PACKAGE_OPENNTPD is not set
>>>>>>>>> # BR2_PACKAGE_OPENSSH is not set
>>>>>>>>> # BR2_PACKAGE_OPENVPN is not set
>>>>>>>>> # BR2_PACKAGE_PORTMAP is not set
>>>>>>>>> # BR2_PACKAGE_PPPD is not set
>>>>>>>>> # BR2_PACKAGE_RADVD is not set
>>>>>>>>> # BR2_PACKAGE_PPTP_LINUX is not set
>>>>>>>>> # BR2_PACKAGE_PROFTPD is not set
>>>>>>>>> # BR2_PACKAGE_QUAGGA is not set
>>>>>>>>> # BR2_PACKAGE_RSH_REDONE is not set
>>>>>>>>> # BR2_PACKAGE_RSYNC is not set
>>>>>>>>> # BR2_PACKAGE_SAMBA is not set
>>>>>>>>> # BR2_PACKAGE_SER2NET is not set
>>>>>>>>> # BR2_PACKAGE_SOCAT is not set
>>>>>>>>> # BR2_PACKAGE_SPAWN_FCGI is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Squid requires a toolchain with C++ and IPv6 support enabled
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_STUNNEL is not set
>>>>>>>>> # BR2_PACKAGE_TCPDUMP is not set
>>>>>>>>> # BR2_PACKAGE_TCPREPLAY is not set
>>>>>>>>> # BR2_PACKAGE_TFTPD is not set
>>>>>>>>> # BR2_PACKAGE_THTTPD is not set
>>>>>>>>> # BR2_PACKAGE_TINYHTTPD is not set
>>>>>>>>> # BR2_PACKAGE_TN5250 is not set
>>>>>>>>> # BR2_PACKAGE_TTCP is not set
>>>>>>>>> # BR2_PACKAGE_UDPCAST is not set
>>>>>>>>> # BR2_PACKAGE_VPNC is not set
>>>>>>>>> BR2_PACKAGE_VSFTPD=y
>>>>>>>>> # BR2_PACKAGE_VTUN is not set
>>>>>>>>> # BR2_PACKAGE_WGET is not set
>>>>>>>>> # BR2_PACKAGE_WIRELESS_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_WPA_SUPPLICANT is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Package managers
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_IPKG is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # rpm requires libneon with SSL, XML and ZLIB support
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # xz payload support requires a toolchain with c++ support
>>>>>>>>> #
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Shell and utilities
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_AT is not set
>>>>>>>>> # BR2_PACKAGE_BASH is not set
>>>>>>>>> # BR2_PACKAGE_DASH is not set
>>>>>>>>> # BR2_PACKAGE_DIALOG is not set
>>>>>>>>> # BR2_PACKAGE_FILE is not set
>>>>>>>>> # BR2_PACKAGE_INOTIFY_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_LOCKFILE_PROGS is not set
>>>>>>>>> # BR2_PACKAGE_LOGROTATE is not set
>>>>>>>>> # BR2_PACKAGE_SCREEN is not set
>>>>>>>>> # BR2_PACKAGE_SUDO is not set
>>>>>>>>> # BR2_PACKAGE_WHICH is not set
>>>>>>>>> # BR2_PACKAGE_XMLSTARLET is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # System tools
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ACL is not set
>>>>>>>>> # BR2_PACKAGE_ATTR is not set
>>>>>>>>> # BR2_PACKAGE_BOOTUTILS is not set
>>>>>>>>> # BR2_PACKAGE_HTOP is not set
>>>>>>>>> # BR2_PACKAGE_MODULE_INIT_TOOLS is not set
>>>>>>>>> # BR2_PACKAGE_PROCPS is not set
>>>>>>>>> # BR2_PACKAGE_PSMISC is not set
>>>>>>>>> # BR2_PACKAGE_RSYSLOG is not set
>>>>>>>>> # BR2_PACKAGE_SYSKLOGD is not set
>>>>>>>>> # BR2_PACKAGE_SYSVINIT is not set
>>>>>>>>> BR2_PACKAGE_UTIL_LINUX=y
>>>>>>>>> BR2_PACKAGE_UTIL_LINUX_MOUNT=y
>>>>>>>>> BR2_PACKAGE_UTIL_LINUX_FSCK=y
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_LIBMOUNT is not set
>>>>>>>>> BR2_PACKAGE_UTIL_LINUX_LIBUUID=y
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_UUIDD is not set
>>>>>>>>> BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_AGETTY is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_CRAMFS is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_FALLOCATE is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_UNSHARE is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_RENAME is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_WALL is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_ARCH is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_INIT is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_KILL is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_LAST is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_MESG is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_PARTX is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_RAW is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_RESET is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS is not set
>>>>>>>>> # BR2_PACKAGE_UTIL_LINUX_WRITE is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Text editors and viewers
>>>>>>>>> #
>>>>>>>>> # BR2_PACKAGE_ED is not set
>>>>>>>>> # BR2_PACKAGE_LESS is not set
>>>>>>>>> BR2_PACKAGE_NANO=y
>>>>>>>>> # BR2_PACKAGE_UEMACS is not set
>>>>>>>>> # BR2_PACKAGE_VIM is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Filesystem images
>>>>>>>>> #
>>>>>>>>> # BR2_TARGET_ROOTFS_CRAMFS is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_CLOOP is not set
>>>>>>>>> BR2_TARGET_ROOTFS_EXT2=y
>>>>>>>>> BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
>>>>>>>>> BR2_TARGET_ROOTFS_EXT2_INODES=0
>>>>>>>>> BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
>>>>>>>>> BR2_TARGET_ROOTFS_EXT2_NONE=y
>>>>>>>>> # BR2_TARGET_ROOTFS_EXT2_GZIP is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_JFFS2 is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_UBIFS is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_SQUASHFS is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_TAR is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_CPIO is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_ISO9660 is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_INITRAMFS is not set
>>>>>>>>> # BR2_TARGET_ROOTFS_ROMFS is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Bootloaders
>>>>>>>>> #
>>>>>>>>> # BR2_TARGET_BAREBOX is not set
>>>>>>>>> # BR2_TARGET_GRUB is not set
>>>>>>>>> BR2_TARGET_SYSLINUX=y
>>>>>>>>> # BR2_TARGET_SYSLINUX_ISOLINUX is not set
>>>>>>>>> # BR2_TARGET_SYSLINUX_PXELINUX is not set
>>>>>>>>> # BR2_TARGET_UBOOT is not set
>>>>>>>>>
>>>>>>>>> #
>>>>>>>>> # Kernel
>>>>>>>>> #
>>>>>>>>> BR2_LINUX_KERNEL=y
>>>>>>>>> # BR2_LINUX_KERNEL_2_6_39 is not set
>>>>>>>>> # BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
>>>>>>>>> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>>>>>>>> # BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
>>>>>>>>> # BR2_LINUX_KERNEL_CUSTOM_GIT is not set
>>>>>>>>> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.0.4"
>>>>>>>>> BR2_LINUX_KERNEL_VERSION="3.0.4"
>>>>>>>>> BR2_LINUX_KERNEL_PATCH=""
>>>>>>>>> # BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
>>>>>>>>> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>>>>>>>>
>>>>>>>>> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/home/marc/linux-3.0.4/.config"
>>>>>>>>> BR2_LINUX_KERNEL_BZIMAGE=y
>>>>>>>>> # BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
>>>>>>>>> BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> _______________________________________________
>>>>>>>>> buildroot mailing list
>>>>>>>>> buildroot at busybox.net
>>>>>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> buildroot mailing list
>>>>>>> buildroot at busybox.net
>>>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>> _______________________________________________
>>>>>> buildroot mailing list
>>>>>> buildroot at busybox.net
>>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>>>
>>>>>
>>>
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
