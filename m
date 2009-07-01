From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Wed, 01 Jul 2009 23:43:34 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <20090701160513.2ce29151@surf>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr>  <20090701160513.2ce29151@surf>
Message-ID: <1246484614.21132.36.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mercredi 01 juillet 2009 ? 16:05 +0200, Thomas Petazzoni a ?crit :
> Hi Lionel,
> 
> Le Wed, 01 Jul 2009 01:54:33 +0200,
> Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :
> 
> > I'm interested by your patches, I'm using a STLinux external toolchain
> > (Linux for SH4 SetTop Boxes).
> 
> Ok. Nice to see interest in external toolchain support, which is still
> experimental, as you saw.
> 
> > The problem is that copying only libraries is not enough to build
> > even a simple program like this one :
> 
> I'm not sure which Buildroot version you're using, but 2009.05 and
> current Git don't only copy the libraries. Here is what we do :
> 
>  1) Copy + strip the libraries to the target space
>     (project_build_ARCH/PROJECT/root). Only the files needed for
>     execution need to be copied to the target space.
> 
>  2) Copy the full sysroot to the staging space (build_ARCH/staging_dir).

Ok, I had another look at the ext-tool.mk makefile, and the sysroot dir
is not copied because of the locale...

This current command to get the sysroot dir is :

SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=`;

which call (in my case) sh4-linux-gcc using the default locale and as my
email address could suggest, my current locale is fr_FR.UTF-8. So grep
^Configured just fails.

Please apply the attached patch to your external-toolchain branch.

> 
> This is done in toolchain/external-toolchain/ext-took.mk.
> 
> > int main (void) { return 0; }
> > 
> > With my current toolchain, I also need :
> > 
> >       * crt1.o crti.o crtn.o
> >       * All headers from the libc & linux
> 
> In current Buildroot, all these are copied to the staging directory. In
> an example build, I have :
> 
> $ find . -name '*crt*'
> ./build_arm/staging_dir/usr/lib/Scrt1.o
> ./build_arm/staging_dir/usr/lib/crt1.o
> ./build_arm/staging_dir/usr/lib/crti.o
> ./build_arm/staging_dir/usr/lib/crtn.o
> 
> $ find build_arm/staging_dir/ -name '*.h' | head -5
> build_arm/staging_dir/usr/include/neteconet/ec.h
> build_arm/staging_dir/usr/include/strings.h
> build_arm/staging_dir/usr/include/ttyent.h
> build_arm/staging_dir/usr/include/pty.h
> build_arm/staging_dir/usr/include/mntent.h
> 
> > After that, I also have problems with packages using pkg-config.
> > Pkg-config returns paths relatives to the build directory ( -L/usr/lib
> > for example). Gcc tries to link with host libraries...
> 
> This should theorically not happen since we should pass --sysroot to
> every gcc/ld compilation step, and therefore all paths should be
> interpreted relative to the sysroot (which is in fact the staging dir).
> 
> > We probably need a double --sysroot parameter to look first where the
> > toolchain is installed and then in the given sysroot path.
> 
> Could you give more details about what you're doing :
> 
>  * Buildroot version

Your external-toolchain branch

>  * Buildroot .config file

Attached

>  * Error messages

I will try to retry with the fix on the locale first.

>  * External toolchain used

SH4 toolchain from STLinux-2.3 distribution, available freely at the
stlinux.com website.

> 
> Thanks !
> 

You're welcome !

-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-sysroot-copy-when-current-locale-is-not-set-to-e.patch
Type: text/x-patch
Size: 1112 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090701/c9f9c487/attachment-0001.bin>
-------------- next part --------------
#
# Automatically generated make config: don't edit
# Wed Jul  1 01:17:33 2009
#
BR2_HAVE_DOT_CONFIG=y
BR2_VERSION="2009.08-git"
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
# BR2_nios2 is not set
# BR2_powerpc is not set
BR2_sh=y
# BR2_sh64 is not set
# BR2_sparc is not set
# BR2_sparc64 is not set
# BR2_x86_64 is not set
# BR2_sh2a_nofpueb is not set
# BR2_sh2eb is not set
# BR2_sh3 is not set
# BR2_sh3eb is not set
BR2_sh4=y
# BR2_sh4eb is not set
BR2_ARCH="sh4"
BR2_ENDIAN="LITTLE"

#
# Target options
#

#
# Project Options
#
BR2_PROJECT="uclibc"
BR2_HOSTNAME="uclibc"
BR2_BANNER="Welcome to Buildroot"

#
# Preset Devices
#
# BR2_TARGET_AMD is not set

#
# Generic System Support
#
# BR2_TARGET_GENERIC_ACCESS_POINT is not set
# BR2_TARGET_GENERIC_FIREWALL is not set

#
# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#
# BR2_TARGET_GENERIC_GETTY is not set

#
# Build options
#
BR2_WGET="wget --passive-ftp -nd"
BR2_SVN_CO="svn co"
BR2_SVN_UP="svn up"
BR2_GIT="git clone"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(BASE_DIR)/dl"
BR2_COPYTO=""

#
# Mirrors and Download locations
#
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
BR2_SOURCEFORGE_MIRROR="easynews"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"

#
# Atmel Mirrors
#
BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
# BR2_FPU_SUFFIX is not set
BR2_TOPDIR_PREFIX=""
BR2_TOPDIR_SUFFIX=""
BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"
BR2_JLEVEL=1
# BR2_PREFER_IMA is not set
# BR2_DEPRECATED is not set
BR2_RECENT=y
# BR2_CONFIG_CACHE is not set
# BR2_ENABLE_DEBUG is not set
BR2_STRIP_strip=y
# BR2_STRIP_sstrip is not set
# BR2_STRIP_none is not set
# BR2_OPTIMIZE_0 is not set
# BR2_OPTIMIZE_1 is not set
# BR2_OPTIMIZE_2 is not set
# BR2_OPTIMIZE_3 is not set
BR2_OPTIMIZE_S=y
# BR2_PREFER_STATIC_LIB is not set
# BR2_HAVE_MANPAGES is not set
# BR2_HAVE_INFOPAGES is not set
# BR2_HAVE_DOCUMENTATION is not set
# BR2_HAVE_DEVFILES is not set
BR2_UPDATE_CONFIG=y

#
# Toolchain
#
# BR2_TOOLCHAIN_BUILDROOT is not set
BR2_TOOLCHAIN_EXTERNAL=y
# BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
# BR2_TOOLCHAIN_SOURCE is not set
BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_GCC_VERSION_4_2_2=y
BR2_EXT_GCC_VERSION_4_2_3=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_BINUTILS_VERSION_2_18=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_30=y
BR2_EXT_UCLIBC_VERSION_0_9_30_1=y
# BR2_TOOLCHAIN_EXTERNAL_UCLIBC is not set
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
# BR2_TOOLCHAIN_EXTERNAL_STRIP is not set

#
# Gdb Options
#
# BR2_PACKAGE_GDB is not set
# BR2_PACKAGE_GDB_SERVER is not set
# BR2_PACKAGE_GDB_HOST is not set

#
# Common Toolchain Options
#
BR2_LARGEFILE=y
BR2_INET_IPV6=y
BR2_INET_RPC=y
BR2_ENABLE_LOCALE=y
# BR2_ENABLE_LOCALE_PURGE is not set
BR2_USE_WCHAR=y
# BR2_USE_SSP is not set
# BR2_PTHREADS_NONE is not set
# BR2_PTHREADS is not set
# BR2_PTHREADS_OLD is not set
BR2_PTHREADS_NATIVE=y
# BR2_INSTALL_LIBSTDCPP is not set
BR2_TARGET_OPTIMIZATION="-O2 -pipe"
BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/STM/STLinux-2.3/devkit/sh4"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"

#
# Package Selection for the target
#
# BR2_PACKAGE_BUSYBOX is not set

#
# The minimum needed to build a uClibc development system
#
BR2_PACKAGE_BASH=y
# BR2_PACKAGE_BZIP2 is not set

#
# coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#
# BR2_PACKAGE_DIFFUTILS is not set
# BR2_PACKAGE_FINDUTILS is not set
# BR2_PACKAGE_FLEX is not set
# BR2_PACKAGE_GAWK is not set
# BR2_PACKAGE_GCC_TARGET is not set
# BR2_PACKAGE_GREP is not set
# BR2_PACKAGE_MAKE is not set
# BR2_PACKAGE_PATCH is not set
# BR2_PACKAGE_SED is not set

#
# tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support
#

#
# Other development stuff
#
# BR2_PACKAGE_AUTOCONF is not set
# BR2_PACKAGE_AUTOMAKE is not set
# BR2_PACKAGE_BISON is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
# BR2_PACKAGE_CVS is not set
# BR2_PACKAGE_DISTCC is not set
# BR2_PACKAGE_DMALLOC is not set
# BR2_PACKAGE_FAKEROOT is not set
BR2_HOST_FAKEROOT=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
# BR2_PACKAGE_LIBGMP is not set
# BR2_PACKAGE_GPERF is not set
# BR2_PACKAGE_LIBMPFR is not set
# BR2_PACKAGE_LIBTOOL is not set
# BR2_PACKAGE_M4 is not set

#
# oprofile requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_PKG_CONFIG is not set
# BR2_PACKAGE_READLINE is not set
# BR2_PACKAGE_PCRE is not set

#
# Other stuff
#
# BR2_PACKAGE_AT is not set
# BR2_PACKAGE_BEECRYPT is not set
# BR2_PACKAGE_BERKELEYDB is not set
# BR2_PACKAGE_BSDIFF is not set
# BR2_PACKAGE_BOOTUTILS is not set
# BR2_PACKAGE_CUPS is not set
# BR2_PACKAGE_CUSTOMIZE is not set
# BR2_PACKAGE_DASH is not set
# BR2_PACKAGE_FILE is not set
# BR2_PACKAGE_GAMIN is not set

#
# icu requires a toolchain with C++ support and WCHAR enabled
#
# BR2_PACKAGE_KEXEC is not set
# BR2_PACKAGE_LESS is not set
# BR2_PACKAGE_LIBCONFIG is not set
# BR2_PACKAGE_LIBCONFUSE is not set
# BR2_PACKAGE_LIBDAEMON is not set
# BR2_PACKAGE_LIBELF is not set
# BR2_PACKAGE_LIBEVENT is not set
# BR2_PACKAGE_LIBGCRYPT is not set
# BR2_PACKAGE_LIBGPG_ERROR is not set
BR2_PACKAGE_LIBICONV=y
# BR2_PACKAGE_LIBIDN is not set
BR2_PACKAGE_LIBLOCKFILE=y
# BR2_PACKAGE_LIBOIL is not set
# BR2_PACKAGE_LIBSYSFS is not set
BR2_PACKAGE_LOCKFILE_PROGS=y
# BR2_PACKAGE_LOGROTATE is not set
# BR2_PACKAGE_LSOF is not set
# BR2_PACKAGE_LTP-TESTSUITE is not set
# BR2_PACKAGE_LTRACE is not set
# BR2_PACKAGE_MEMSTAT is not set
# BR2_PACKAGE_MODULE_INIT_TOOLS is not set
# BR2_PACKAGE_NG_SPICE_REWORK is not set
# BR2_PACKAGE_POPT is not set
# BR2_PACKAGE_PROCPS is not set
# BR2_PACKAGE_PSMISC is not set
# BR2_PACKAGE_SCREEN is not set
# BR2_PACKAGE_SHARED_MIME_INFO is not set
# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
# BR2_PACKAGE_STRACE is not set
# BR2_PACKAGE_SUDO is not set
# BR2_PACKAGE_SYSKLOGD is not set
# BR2_PACKAGE_SYSVINIT is not set
# BR2_PACKAGE_UTIL-LINUX is not set
# BR2_PACKAGE_WHICH is not set

#
# Database
#

#
# Mysql client requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_SQLITE is not set

#
# Text editors
#
# BR2_PACKAGE_ED is not set
# BR2_PACKAGE_NANO is not set
# BR2_PACKAGE_UEMACS is not set
# BR2_PACKAGE_VIM is not set

#
# Networking
#

#
# Networking applications
#
# BR2_PACKAGE_ARGUS is not set
# BR2_PACKAGE_AVAHI is not set
# BR2_PACKAGE_AXEL is not set
# BR2_PACKAGE_BOA is not set
# BR2_PACKAGE_BIND is not set
# BR2_PACKAGE_BRIDGE is not set
# BR2_PACKAGE_ISC_DHCP is not set
# BR2_PACKAGE_DNSMASQ is not set
# BR2_PACKAGE_DROPBEAR is not set
# BR2_PACKAGE_ETHTOOL is not set
# BR2_PACKAGE_HASERL is not set
# BR2_PACKAGE_IFPLUGD is not set

#
# iperf requires a toolchain with C++ support enabled
#
BR2_PACKAGE_IPROUTE2=y
# BR2_PACKAGE_IPSEC_TOOLS is not set
BR2_PACKAGE_IPTABLES=y
# BR2_PACKAGE_KISMET is not set
# BR2_PACKAGE_L2TP is not set
# BR2_PACKAGE_LIBCGI is not set

#
# libcgicc requires a toolchain with C++ support enabled
#
BR2_PACKAGE_LIBCURL=y
# BR2_PACKAGE_CURL is not set
# BR2_PACKAGE_LIBDNET is not set
# BR2_PACKAGE_LIBEXOSIP2 is not set
# BR2_PACKAGE_LIBOSIP2 is not set
# BR2_PACKAGE_LIBPCAP is not set
# BR2_PACKAGE_LIBSOUP is not set
# BR2_PACKAGE_LIBUPNP is not set
# BR2_PACKAGE_LIGHTTPD is not set
# BR2_PACKAGE_LINKS is not set
# BR2_PACKAGE_LRZSZ is not set
# BR2_PACKAGE_MDNSRESPONDER is not set
# BR2_PACKAGE_MIIDIAG is not set
# BR2_PACKAGE_MROUTED is not set
# BR2_PACKAGE_MUTT is not set
# BR2_PACKAGE_NBD is not set
# BR2_PACKAGE_NCFTP is not set
# BR2_PACKAGE_NEON is not set
# BR2_PACKAGE_NETCAT is not set
# BR2_PACKAGE_NETKITBASE is not set
# BR2_PACKAGE_NETKITTELNET is not set
# BR2_PACKAGE_NETPLUG is not set
# BR2_PACKAGE_NETSNMP is not set
# BR2_PACKAGE_NFS_UTILS is not set
# BR2_PACKAGE_NTP is not set
# BR2_PACKAGE_OLSR is not set
# BR2_PACKAGE_OPENNTPD is not set
# BR2_PACKAGE_OPENSSH is not set
# BR2_PACKAGE_OPENSSL is not set
# BR2_PACKAGE_OPENVPN is not set
# BR2_PACKAGE_PORTMAP is not set
# BR2_PACKAGE_PPPD is not set
# BR2_PACKAGE_RADVD is not set
# BR2_PACKAGE_RP_PPPOE is not set
# BR2_PACKAGE_PPTP_LINUX is not set
# BR2_PACKAGE_PROFTPD is not set

#
# quagga suite
#
# BR2_PACKAGE_QUAGGA_ZEBRA is not set
# BR2_PACKAGE_QUAGGA_BGPD is not set
# BR2_PACKAGE_QUAGGA_RIPD is not set
# BR2_PACKAGE_QUAGGA_RIPNGD is not set
# BR2_PACKAGE_QUAGGA_OSPFD is not set
# BR2_PACKAGE_QUAGGA_OSPF6D is not set
# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
# BR2_PACKAGE_QUAGGA_ISISD is not set
# BR2_PACKAGE_RSYNC is not set
# BR2_PACKAGE_SAMBA is not set
# BR2_PACKAGE_SOCAT is not set
# BR2_PACKAGE_STUNNEL is not set
# BR2_PACKAGE_TCPDUMP is not set
# BR2_PACKAGE_DHCPDUMP is not set
# BR2_PACKAGE_TFTPD is not set
# BR2_PACKAGE_THTTPD is not set
# BR2_PACKAGE_TINYHTTPD is not set
# BR2_PACKAGE_TN5250 is not set
# BR2_PACKAGE_TTCP is not set
# BR2_PACKAGE_UDPCAST is not set
# BR2_PACKAGE_VPNC is not set
# BR2_PACKAGE_VSFTPD is not set
# BR2_PACKAGE_VTUN is not set
# BR2_PACKAGE_WEBIF is not set
# BR2_PACKAGE_WGET is not set
# BR2_PACKAGE_WIRELESS_TOOLS is not set
# BR2_PACKAGE_WPA_SUPPLICANT is not set

#
# Hardware handling / blockdevices and filesystem maintenance
#
BR2_PACKAGE_DBUS=y
# BR2_DBUS_EXPAT is not set
BR2_DBUS_LIBXML2=y
BR2_PACKAGE_DBUS_GLIB=y
# BR2_PACKAGE_DEVMEM2 is not set
# BR2_PACKAGE_DM is not set
# BR2_PACKAGE_DMRAID is not set
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_BADBLOCKS=y
BR2_PACKAGE_E2FSPROGS_BLKID=y
BR2_PACKAGE_E2FSPROGS_CHATTR=y
BR2_PACKAGE_E2FSPROGS_DUMPE2FS=y
BR2_PACKAGE_E2FSPROGS_E2FSCK=y
BR2_PACKAGE_E2FSPROGS_E2LABEL=y
BR2_PACKAGE_E2FSPROGS_FILEFRAG=y
BR2_PACKAGE_E2FSPROGS_FINDFS=y
BR2_PACKAGE_E2FSPROGS_FSCK=y
BR2_PACKAGE_E2FSPROGS_LOGSAVE=y
BR2_PACKAGE_E2FSPROGS_LSATTR=y
BR2_PACKAGE_E2FSPROGS_MKE2FS=y
BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND=y
BR2_PACKAGE_E2FSPROGS_TUNE2FS=y
BR2_PACKAGE_E2FSPROGS_UUIDGEN=y
# BR2_PACKAGE_EEPROG is not set
# BR2_PACKAGE_FCONFIG is not set
# BR2_PACKAGE_FIS is not set
# BR2_PACKAGE_LIBFUSE is not set
# BR2_PACKAGE_GADGETFS_TEST is not set
# BR2_PACKAGE_HAL is not set
# BR2_PACKAGE_HDPARM is not set
# BR2_PACKAGE_HOTPLUG is not set
# BR2_PACKAGE_HWDATA is not set
# BR2_PACKAGE_I2C_TOOLS is not set
# BR2_PACKAGE_INPUT_TOOLS is not set
BR2_PACKAGE_IOSTAT=y
# BR2_PACKAGE_LIBAIO is not set
# BR2_PACKAGE_LIBRAW1394 is not set
BR2_PACKAGE_LIBUSB=y
# BR2_PACKAGE_LM_SENSORS is not set
# BR2_PACKAGE_LVM2 is not set
# BR2_PACKAGE_MDADM is not set
# BR2_PACKAGE_MEMTESTER is not set
BR2_PACKAGE_MKDOSFS=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_UTILS=y
# BR2_PACKAGE_MTD_20061007 is not set
# BR2_PACKAGE_MTD_20050122 is not set
# BR2_PACKAGE_MTD_UTILS_GIT is not set

#
# MTD tools selection
#
# BR2_PACKAGE_MTD_DOCFDISK is not set
# BR2_PACKAGE_MTD_DOC_LOADBIOS is not set
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_FTL_CHECK=y
BR2_PACKAGE_MTD_FTL_FORMAT=y
BR2_PACKAGE_MTD_JFFS2DUMP=y
BR2_PACKAGE_MTD_MKFSJFFS2=y
# BR2_PACKAGE_MTD_MKFSJFFS is not set
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_NANDDUMP=y
BR2_PACKAGE_MTD_NANDWRITE=y
# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
# BR2_PACKAGE_MTD_NFTLDUMP is not set
BR2_PACKAGE_MTD_SUMTOOL=y
# BR2_PACKAGE_NTFS_3G is not set
BR2_PACKAGE_PCIUTILS=y
BR2_PACKAGE_SETSERIAL=y
# BR2_PACKAGE_SFDISK is not set
# BR2_PACKAGE_SMARTMONTOOLS is not set
# BR2_PACKAGE_UDEV is not set
BR2_PACKAGE_UDEV_VOLUME_ID=y
BR2_PACKAGE_UDEV_SCSI_ID=y
BR2_PACKAGE_USBMOUNT=y
BR2_PACKAGE_USBUTILS=y
# BR2_PACKAGE_WIPE is not set
# BR2_PACKAGE_XFSPROGS is not set

#
# Audio and video libraries and applications
#
# BR2_PACKAGE_ALSA_LIB is not set

#
# asterisk	- disabled (required openssl and mpg123)
#
# BR2_PACKAGE_AUMIX is not set
# BR2_PACKAGE_FLAC is not set
# BR2_PACKAGE_GSTREAMER is not set
# BR2_PACKAGE_LIBID3TAG is not set
# BR2_PACKAGE_LIBMAD is not set
# BR2_PACKAGE_LIBMPD is not set
# BR2_PACKAGE_LIBOGG is not set
# BR2_PACKAGE_LIBSNDFILE is not set
# BR2_PACKAGE_LIBTHEORA is not set
# BR2_PACKAGE_LIBVORBIS is not set
# BR2_PACKAGE_MADPLAY is not set
# BR2_PACKAGE_MPG123 is not set
# BR2_PACKAGE_MPLAYER is not set
# BR2_PACKAGE_SPEEX is not set
# BR2_PACKAGE_FESTIVAL is not set

#
# taglib requires a toolchain with C++ support enabled
#
# BR2_PACKAGE_VLC is not set

#
# Graphic libraries and applications (graphic/text)
#

#
# text rendering libraries
#
BR2_PACKAGE_NCURSES=y
# BR2_PACKAGE_NCURSES_TARGET_PANEL is not set
# BR2_PACKAGE_NCURSES_TARGET_FORM is not set
# BR2_PACKAGE_NCURSES_TARGET_MENU is not set
# BR2_PACKAGE_NCURSES_TARGET_HEADERS is not set
# BR2_PACKAGE_NEWT is not set
# BR2_PACKAGE_SLANG is not set

#
# text rendering applications
#
# BR2_PACKAGE_DIALOG is not set

#
# graphic libraries
#
BR2_PACKAGE_DIRECTFB=y
# BR2_PACKAGE_DIRECTFB_MULTI is not set
# BR2_PACKAGE_DIRECTFB_LINUXINPUT is not set
# BR2_PACKAGE_DIRECTFB_KEYBOARD is not set
# BR2_PACKAGE_DIRECTFB_SERIALMOUSE is not set
BR2_PACKAGE_DIRECTFB_PNG=y
# BR2_PACKAGE_DIRECTFB_TSLIB is not set
BR2_PACKAGE_DIRECTFB_GIF=y
BR2_PACKAGE_DIRECTFB_JPEG=y
BR2_PACKAGE_DIRECTFB_EXAMPLES=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE=y
BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW=y
# BR2_PACKAGE_FBDUMP is not set
# BR2_PACKAGE_IMAGEMAGICK is not set
BR2_PACKAGE_JPEG=y
# BR2_PACKAGE_LIBART is not set
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_LIBUNGIF=y
# BR2_PACKAGE_LINUX_FUSION is not set
# BR2_PACKAGE_LITE is not set
BR2_PACKAGE_PIXMAN=y
# BR2_PACKAGE_SAWMAN is not set
# BR2_PACKAGE_SDL is not set
# BR2_PACKAGE_TIFF is not set

#
# busybox graphic applications
#

#
# --> May be broken in busybox
#
# BR2_PACKAGE_FBV is not set
# BR2_PACKAGE_FBSET is not set

#
# other GUIs
#

#
# qtopia4 requires a toolchain with C++ support enabled
#
BR2_PACKAGE_XSERVER_none=y
# BR2_PACKAGE_XSERVER_xorg is not set
# BR2_PACKAGE_XSERVER_tinyx is not set

#
# xorg requires a toolchain with C++, LOCALE, LARGEFILE and WCHAR support
#

#
# X libraries and helper libraries
#
BR2_PACKAGE_ATK=y
BR2_PACKAGE_CAIRO=y
BR2_PACKAGE_CAIRO_PS=y
BR2_PACKAGE_CAIRO_PDF=y
# BR2_PACKAGE_CAIRO_PNG is not set
# BR2_PACKAGE_CAIRO_SVG is not set
BR2_PACKAGE_PANGO=y
# BR2_PACKAGE_LIBDRM is not set
# BR2_PACKAGE_LIBERATION is not set
# BR2_PACKAGE_LIBGLADE is not set
# BR2_PACKAGE_LIBGLIB12 is not set
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_LIBGTK2=y
BR2_PACKAGE_LIBGTK2_ENGINES=y

#
# GTK Themes
#
# BR2_PACKAGE_GTK2_THEME_HICOLOR is not set
BR2_PACKAGE_LIBSEXY=y
# BR2_PACKAGE_OPENMOTIF is not set
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
# BR2_PACKAGE_TSLIB is not set

#
# webkit requires a toolchain with C++ support and WCHAR enabled
#

#
# X Window managers
#
# BR2_PACKAGE_MATCHBOX is not set

#
# X applications
#
# BR2_PACKAGE_ALSAMIXERGUI is not set

#
# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
#
# BR2_PACKAGE_GQVIEW is not set
# BR2_PACKAGE_GMPC is not set
# BR2_PACKAGE_GOB2 is not set
# BR2_PACKAGE_GTKPERF is not set
# BR2_PACKAGE_LEAFPAD is not set

#
# midori		- disabled (requires Xorg(7))
#
# BR2_PACKAGE_PCMANFM is not set
# BR2_PACKAGE_SYLPHEED is not set
# BR2_PACKAGE_TORSMO is not set
# BR2_PACKAGE_X11VNC is not set
# BR2_PACKAGE_XPDF is not set
# BR2_PACKAGE_XSTROKE is not set
# BR2_PACKAGE_XVKBD is not set

#
# Compressors / decompressors
#
# BR2_PACKAGE_GZIP is not set
BR2_PACKAGE_LZO=y
BR2_PACKAGE_LZOP=y

#
# lzma requires a toolchain with C++ support
#
# BR2_PACKAGE_LZMA_HOST is not set
BR2_PACKAGE_ZLIB=y
# BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set

#
# Package managers
#
# BR2_PACKAGE_IPKG is not set
# BR2_PACKAGE_PORTAGE is not set
# BR2_PACKAGE_RPM is not set

#
# Interpreter languages / Scripting
#
# BR2_PACKAGE_LUA is not set
# BR2_PACKAGE_MICROPERL is not set
# BR2_PACKAGE_PYTHON is not set
BR2_PACKAGE_RUBY=y
# BR2_PACKAGE_TCL is not set
# BR2_PACKAGE_PHP is not set

#
# XML handling
#
BR2_PACKAGE_EXPAT=y
# BR2_PACKAGE_EZXML is not set
BR2_PACKAGE_LIBXML2=y
# BR2_PACKAGE_LIBXSLT is not set

#
# xerces-c++ requires a toolchain with C++ support enabled
#

#
# Java
#
# BR2_PACKAGE_CLASSPATH is not set

#
# Games
#
# BR2_PACKAGE_GNUCHESS is not set
# BR2_PACKAGE_MAGICCUBE4D is not set
# BR2_PACKAGE_PRBOOM is not set
# BR2_PACKAGE_RUBIX is not set
# BR2_PACKAGE_VICE is not set
# BR2_PACKAGE_XBOARD is not set

#
# Target filesystem options
#
BR2_ROOTFS_PREFIX="rootfs"
BR2_ROOTFS_SUFFIX=""

#
# filesystem for target device
#
# BR2_TARGET_ROOTFS_CRAMFS is not set
# BR2_TARGET_ROOTFS_CLOOP is not set
# BR2_TARGET_ROOTFS_EXT2 is not set
# BR2_TARGET_ROOTFS_JFFS2 is not set
# BR2_TARGET_ROOTFS_SQUASHFS is not set
BR2_TARGET_ROOTFS_TAR=y
# BR2_TARGET_ROOTFS_TAR_NONE is not set
BR2_TARGET_ROOTFS_TAR_GZIP=y
# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
# BR2_TARGET_ROOTFS_TAR_LZMA is not set
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
BR2_TARGET_ROOTFS_TAR_COPYTO=""
# BR2_TARGET_ROOTFS_CPIO is not set
# BR2_TARGET_ROOTFS_INITRAMFS is not set
# BR2_TARGET_ROOTFS_ROMFS is not set

#
# bootloader for target device
#
# BR2_TARGET_UBOOT is not set

#
# Kernel
#
BR2_KERNEL_none=y
# BR2_KERNEL_LINUX_ADVANCED is not set
# BR2_KERNEL_LINUX is not set
# BR2_KERNEL_HURD is not set
