From: Sam Ravnborg <sam@ravnborg.org>
Date: Tue, 27 Jul 2010 21:03:10 +0200
Subject: [Buildroot] build failed - cannot stat libz.so*
Message-ID: <20100727190310.GA10996@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While trying to do a sparc build of buildroot I hit
the following issue:

cp: cannot stat `/home/sam/devel/buildroot.git/output/build/zlib-1.2.3/libz.so*': No such file or directory
make: *** [/home/sam/devel/buildroot.git/output/build/zlib-1.2.3/.stamp_staging_installed] Error 1

I checked and there is no lib*.so file in that dir.


I only took a very short look at this.
It looks like a problem in the zlib support files.

This is reproduced with a fresh pull of master from git://git.buildroot.net/buildroot


	Sam

Bigger log snip:
/home/sam/devel/buildroot.git/output/staging/usr/bin/sparc-unknown-linux-uclibc-gcc --sysroot=/home/sam/devel/buildroot.git/output/staging -pipe -Os  -mtune=v8 -I/home/sam/devel/buildroot.git/output/staging/usr/include -I/home/sam/devel/buildroot.git/output/staging/include  -DUSE_MMAP   -c -o minigzip.o minigzip.c
/home/sam/devel/buildroot.git/output/staging/usr/bin/sparc-unknown-linux-uclibc-ar rc libz.a adler32.o compress.o crc32.o gzio.o uncompr.o deflate.o trees.o zutil.o inflate.o infback.o inftrees.o inffast.o
/home/sam/devel/buildroot.git/output/staging/usr/bin/sparc-unknown-linux-uclibc-gcc --sysroot=/home/sam/devel/buildroot.git/output/staging -pipe -Os  -mtune=v8 -I/home/sam/devel/buildroot.git/output/staging/usr/include -I/home/sam/devel/buildroot.git/output/staging/include  -DUSE_MMAP -o example example.o -L. libz.a
make[1]: `libz.a' is up to date.
/home/sam/devel/buildroot.git/output/staging/usr/bin/sparc-unknown-linux-uclibc-gcc --sysroot=/home/sam/devel/buildroot.git/output/staging -pipe -Os  -mtune=v8 -I/home/sam/devel/buildroot.git/output/staging/usr/include -I/home/sam/devel/buildroot.git/output/staging/include  -DUSE_MMAP -o minigzip minigzip.o -L. libz.a
make[1]: Leaving directory `/home/sam/devel/buildroot.git/output/build/zlib-1.2.3'
>>> zlib 1.2.3 'Installing to staging directory'
/usr/bin/install -D /home/sam/devel/buildroot.git/output/build/zlib-1.2.3/libz.a /home/sam/devel/buildroot.git/output/staging/usr/lib/libz.a
/usr/bin/install -D /home/sam/devel/buildroot.git/output/build/zlib-1.2.3/zlib.h /home/sam/devel/buildroot.git/output/staging/usr/include/zlib.h
/usr/bin/install /home/sam/devel/buildroot.git/output/build/zlib-1.2.3/zconf.h /home/sam/devel/buildroot.git/output/staging/usr/include/
cp -dpf /home/sam/devel/buildroot.git/output/build/zlib-1.2.3/libz.so* /home/sam/devel/buildroot.git/output/staging/usr/lib/
cp: cannot stat `/home/sam/devel/buildroot.git/output/build/zlib-1.2.3/libz.so*': No such file or directory
make: *** [/home/sam/devel/buildroot.git/output/build/zlib-1.2.3/.stamp_staging_installed] Error 1


Config:
#
# Automatically generated make config: don't edit
# Sat Jul 24 14:54:36 2010
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2010.08-git"
# BR2_alpha is not set
# BR2_arm is not set
# BR2_armeb is not set
# BR2_avr32 is not set
# BR2_cris is not set
# BR2_ia64 is not set
# BR2_i386 is not set
# BR2_m68k is not set
# BR2_mips is not set
# BR2_mipsel is not set
# BR2_powerpc is not set
# BR2_sh is not set
# BR2_sh64 is not set
BR2_sparc=y
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_xtensa is not set
# BR2_sparc_v7 is not set
# BR2_sparc_cypress is not set
BR2_sparc_v8=y
# BR2_sparc_supersparc is not set
# BR2_sparc_sparclite is not set
# BR2_sparc_f930 is not set
# BR2_sparc_f934 is not set
# BR2_sparc_hypersparc is not set
# BR2_sparc_sparclite86x is not set
# BR2_sparc_sparclet is not set
# BR2_sparc_tsc701 is not set
# BR2_sparc_v9 is not set
# BR2_sparc_v9a is not set
# BR2_sparc_v9b is not set
# BR2_sparc_ultrasparc is not set
# BR2_sparc_ultrasparc3 is not set
# BR2_sparc_niagara is not set
BR2_SPARC_TYPE="V8"
BR2_ARCH="sparc"
BR2_ENDIAN="BIG"
BR2_GCC_TARGET_TUNE="v8"

#
# Target options
#

#
# Preset Devices
#
BR2_TARGET_GENERIC_HOSTNAME="buildroot"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
# BR2_TARGET_GENERIC_GETTY is not set

#
# Build options
#

#
# Commands
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_BZR_CO="bzr co"
BR2_BZR_UP="bzr up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_STAGING_DIR="$(BASE_DIR)/staging"

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=2
# BR2_DEPRECATED is not set
# BR2_ENABLE_DEBUG is not set
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
# BR2_HAVE_DEVFILES is not set

#
# Advanced
#
BR2_CONFIG_CACHE=y

#
# Toolchain
#
BR2_TOOLCHAIN_BUILDROOT=y
# BR2_TOOLCHAIN_EXTERNAL is not set

#
# Kernel Header Options
#
# BR2_KERNEL_HEADERS_2_6_27 is not set
# BR2_KERNEL_HEADERS_2_6_28 is not set
# BR2_KERNEL_HEADERS_2_6_29 is not set
# BR2_KERNEL_HEADERS_2_6_30 is not set
# BR2_KERNEL_HEADERS_2_6_31 is not set
# BR2_KERNEL_HEADERS_2_6_32 is not set
# BR2_KERNEL_HEADERS_2_6_33 is not set
BR2_KERNEL_HEADERS_2_6_34=y
# BR2_KERNEL_HEADERS_VERSION is not set
# BR2_KERNEL_HEADERS_SNAP is not set
BR2_DEFAULT_KERNEL_HEADERS="2.6.34.1"

#
# uClibc Options
#
# BR2_UCLIBC_VERSION_0_9_28_3 is not set
# BR2_UCLIBC_VERSION_0_9_29 is not set
# BR2_UCLIBC_VERSION_0_9_30 is not set
BR2_UCLIBC_VERSION_0_9_31=y
# BR2_UCLIBC_VERSION_SNAPSHOT is not set
BR2_UCLIBC_VERSION_STRING="0.9.31"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"
# BR2_PTHREAD_DEBUG is not set
# BR2_UCLIBC_INSTALL_TEST_SUITE is not set

#
# Binutils Options
#
# BR2_BINUTILS_VERSION_2_17 is not set
# BR2_BINUTILS_VERSION_2_18 is not set
# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
# BR2_BINUTILS_VERSION_2_19 is not set
# BR2_BINUTILS_VERSION_2_19_1 is not set
# BR2_BINUTILS_VERSION_2_20 is not set
BR2_BINUTILS_VERSION_2_20_1=y
BR2_BINUTILS_VERSION="2.20.1"
BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""

#
# GCC Options
#
# BR2_GCC_VERSION_4_2_1 is not set
# BR2_GCC_VERSION_4_2_2 is not set
# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
# BR2_GCC_VERSION_4_2_3 is not set
# BR2_GCC_VERSION_4_2_4 is not set
BR2_GCC_VERSION_4_3_X=y
# BR2_GCC_VERSION_4_4_X is not set
# BR2_GCC_VERSION_SNAP is not set
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.5"
# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
# BR2_GCC_CROSS_FORTRAN is not set
# BR2_INSTALL_OBJC is not set
# BR2_INSTALL_FORTRAN is not set
BR2_GCC_ENABLE_TLS=y

#
# Ccache Options
#
# BR2_CCACHE is not set

#
# Gdb Options
#

#
# Gdb debugger for the target needs WCHAR support in toolchain
#
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set
# BR2_GDB_VERSION_6_6 is not set
# BR2_GDB_VERSION_6_7_1 is not set
# BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 is not set
# BR2_GDB_VERSION_6_8 is not set
# BR2_GDB_VERSION_7_0_1 is not set
# BR2_GDB_VERSION_7_1 is not set

#
# Common Toolchain Options
#
# BR2_LARGEFILE is not set
# BR2_INET_IPV6 is not set
# BR2_INET_RPC is not set
# BR2_ENABLE_LOCALE is not set
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_NEEDS_GETTEXT=y
# BR2_USE_WCHAR is not set
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
BR2_PTHREADS_OLD=y
# BR2_PTHREADS_NATIVE is not set
# BR2_PROGRAM_INVOCATION is not set
# BR2_INSTALL_LIBSTDCPP is not set
BR2_TARGET_OPTIMIZATION="-pipe"
# BR2_ELF2FLT is not set
# BR2_MKLIBS is not set
# BR2_PACKAGE_SSTRIP_TARGET is not set
# BR2_PACKAGE_SSTRIP_HOST is not set
# BR2_ENABLE_MULTILIB is not set
BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y

#
# Package Selection for the target
#
BR2_PACKAGE_BUSYBOX=y
# BR2_BUSYBOX_VERSION_1_13_X is not set
# BR2_BUSYBOX_VERSION_1_14_X is not set
# BR2_BUSYBOX_VERSION_1_15_X is not set
# BR2_BUSYBOX_VERSION_1_16_X is not set
BR2_BUSYBOX_VERSION_1_17_X=y
# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
BR2_BUSYBOX_VERSION="1.17.0"
BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.17.x.config"
# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
# BR2_PACKAGE_CUSTOMIZE is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# alsa-utils requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set

#
# ffmpeg requires a toolchain with LARGEFILE support
#

#
# gstreamer requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LIBCDAUDIO is not set

#
# libdvdread requires a toolchain with LARGEFILE support
#

#
# libdvdnav requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set

#
# libmms requires a toolchain with WCHAR support
#

#
# libmpd requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_SPEEX is not set

#
# swfdec requires a toolchain with WCHAR support
#

#
# festival requires a toolchain with C++ support enabled
#

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_TREMOR is not set

#
# Compressors and decompressors
#
# BR2_PACKAGE_LZOP is not set

#
# lzma requires a toolchain with C++ support
#

#
# Debugging, profiling and benchmark
#
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_KEXEC is not set

#
# lmbench requires a toolchain with RPC support
#

#
# lsof requires a toolchain with RPC support
#
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_NETPERF is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_STRACE is not set

#
# Development tools
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_FAKEROOT is not set
# BR2_PACKAGE_FLEX is not set

#
# native toolchain needs development files in target filesystem
#

#
# gettext requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LIBINTL is not set
# BR2_PACKAGE_LIBGMP is not set

#
# gperf requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_INTLTOOL is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set

#
# pkg-config requires a toolchain with WCHAR support
#

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_PRBOOM is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# graphic libraries
#
# BR2_PACKAGE_DIRECTFB is not set
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_SDL is not set

#
# other GUIs
#

#
# qt requires a toolchain with C++ support enabled
#

#
# X.org requires a toolchain with WCHAR support
#

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

#
# gob2 requires a toolchain with WCHAR support
#

#
# Hardware handling
#

#
# cdrkit requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_CRAMFS is not set

#
# dbus not available (need expat or libxml2)
#

#
# dmraid requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_DOSFSTOOLS is not set

#
# e2fsprogs requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_GENEXT2FS is not set
# BR2_PACKAGE_GENROMFS is not set

#
# gvfs requires a toolchain with LARGEFILE and WCHAR support
#

#
# hal requires a toolchain with WCHAR support
#
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
# BR2_PACKAGE_IOSTAT is not set
# BR2_PACKAGE_LM_SENSORS is not set

#
# lvm2 requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_MAKEDEVS is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
# BR2_PACKAGE_MTD is not set

#
# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
#

#
# ntfsprogs requires a toolchain with WCHAR and LARGEFILE support
#
# BR2_PACKAGE_PCIUTILS is not set
# BR2_PACKAGE_SETSERIAL is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set

#
# squashfs requires a toolchain with LARGEFILE support
#

#
# sshfs requires a toolchain with LARGEFILE and WCHAR support
#
# BR2_PACKAGE_SYSSTAT is not set
# BR2_PACKAGE_USB_MODESWITCH is not set
# BR2_PACKAGE_USBMOUNT is not set
# BR2_PACKAGE_USBUTILS is not set
# BR2_PACKAGE_WIPE is not set

#
# xfsprogs requires a toolchain with LARGEFILE support
#

#
# Interpreter languages and scripting
#
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PHP is not set

#
# python requires a toolchain with WCHAR support
#

#
# ruby requires a toolchain with WCHAR support
#
# BR2_PACKAGE_TCL is not set

#
# Libraries
#

#
# Compression and decompression
#

#
# libarchive requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LZO is not set
BR2_PACKAGE_ZLIB=y

#
# Crypto
#
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
# BR2_PACKAGE_OPENSSL is not set

#
# Database
#
# BR2_PACKAGE_BERKELEYDB is not set

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLITE is not set

#
# Filesystem
#

#
# gamin requires a toolchain with WCHAR support
#
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

#
# atk requires a toolchain with WCHAR support
#
# BR2_PACKAGE_CAIRO is not set
# BR2_PACKAGE_FONTCONFIG is not set
# BR2_PACKAGE_FREETYPE is not set
# BR2_PACKAGE_JPEG is not set
# BR2_PACKAGE_LIBART is not set

#
# libgtk2 requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LIBPNG is not set
# BR2_PACKAGE_LIBSVGTINY is not set
# BR2_PACKAGE_LIBUNGIF is not set

#
# pango requires a toolchain with WCHAR support
#
# BR2_PACKAGE_PIXMAN is not set
# BR2_PACKAGE_TIFF is not set

#
# webkit requires a toolchain with C++ support and WCHAR enabled
#

#
# Hardware handling
#
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
# BR2_PACKAGE_TSLIB is not set
# BR2_PACKAGE_LIBUSB is not set

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Networking
#
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_LIBCURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBIDN is not set
# BR2_PACKAGE_LIBMICROHTTPD is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_LIBNL is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBRSYNC is not set

#
# libsoup requires a toolchain with WCHAR support
#

#
# libupnp requires a toolchain with LARGEFILE support
#

#
# Other
#
# BR2_PACKAGE_LIBATOMIC_OPS is not set
# BR2_PACKAGE_LIBCAP is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set

#
# libglib2 requires a toolchain with WCHAR support
#
# BR2_PACKAGE_LIBOIL is not set

#
# Text and terminal handling
#

#
# enchant requires a toolchain with C++ and WCHAR support enabled
#

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_LIBICONV is not set
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_PCRE is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_SLANG is not set

#
# XML
#
# BR2_PACKAGE_EXPAT is not set
# BR2_PACKAGE_EZXML is not set
# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
# BR2_PACKAGE_LIBXML2 is not set
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ support enabled
#

#
# Miscellaneous
#

#
# shared-mime-info requires a toolchain with WCHAR support
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set

#
# bind requires a toolchain with LARGEFILE support
#

#
# bmon requires a toolchain with IPv6 support
#
# BR2_PACKAGE_BRIDGE is not set

#
# ctorrent requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_DNSMASQ is not set
BR2_PACKAGE_DROPBEAR=y
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HOSTAPD is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#

#
# iproute2 requires a toolchain with IPv6 support
#
# BR2_PACKAGE_IPSEC_TOOLS is not set

#
# iptables requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_IW is not set

#
# Kismet requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set

#
# mutt requires a toolchain with WCHAR support
#

#
# nbd requires a toolchain with WCHAR support
#

#
# ncftp requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NETSTAT_NAT is not set

#
# nfs-utils requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_NTP is not set

#
# olsr requires a toolchain with IPv6 support
#
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENVPN is not set

#
# portmap requires a toolchain with 'Enable RPC' selected
#
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set
# BR2_PACKAGE_QUAGGA is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SER2NET is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_SPAWN_FCGI is not set

#
# Squid requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TCPREPLAY is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set

#
# udpcast requires a toolchain with LARGEFILE support
#
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set

#
# Shell and utilities
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_DIALOG is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_LOCKFILE_PROGS is not set

#
# logrotate requires a toolchain with WCHAR support
#
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_WHICH is not set

#
# System tools
#

#
# Text editors and viewers
#
# BR2_PACKAGE_ED is not set
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_UEMACS is not set

#
# Target filesystem options
#
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
# BR2_ROOTFS_SKELETON_CUSTOM is not set
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
BR2_TARGET_ROOTFS_EXT2_INODES=0
BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
BR2_TARGET_ROOTFS_EXT2_SQUASH=y
BR2_TARGET_ROOTFS_EXT2_NONE=y
# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_UBIFS is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
# BR2_TARGET_ROOTFS_TAR is not set
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# Bootloaders
#
# BR2_TARGET_BAREBOX is not set
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_2_6_34 is not set
# BR2_LINUX_KERNEL_SAME_AS_HEADERS is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.34"
BR2_LINUX_KERNEL_VERSION="2.6.34"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_DEFCONFIG=y
# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
BR2_LINUX_KERNEL_DEFCONFIG=""
BR2_LINUX_KERNEL_UIMAGE=y
# BR2_LINUX_KERNEL_BZIMAGE is not set
# BR2_LINUX_KERNEL_ZIMAGE is not set
# BR2_LINUX_KERNEL_VMLINUX is not set
