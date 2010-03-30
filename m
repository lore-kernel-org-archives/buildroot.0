From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
Date: Tue, 30 Mar 2010 16:59:35 +0200
Subject: [Buildroot] [PATCH] [RFC] Add mx25_3stack support
Message-ID: <1269961175-11233-1-git-send-email-mchazaux@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Micka?l CHAZAUX <mickael.chazaux@gmail.com>

This patch adds support for the i.MX25pdk board. It is based on the
kernel and U-Boot patches released by Freescale in LTIB.
---
 configs/mx25_3stack_defconfig                      |  865 ++++++++++
 target/device/Config.in                            |    1 +
 target/device/Freescale/Config.in                  |   16 +
 target/device/Freescale/Makefile.in                |    4 +
 target/device/Freescale/imx25/Makefile.in          |    5 +
 target/device/Freescale/imx25/linux-2.26.28.config | 1725 ++++++++++++++++++++
 .../device/Freescale/imx25/target_device_table.txt |  185 +++
 target/u-boot/Config.in                            |    8 +
 target/u-boot/Makefile.in                          |   16 +-
 .../linux-2.6.28-unifdef-getline.patch             |   56 +
 10 files changed, 2879 insertions(+), 2 deletions(-)
 create mode 100644 configs/mx25_3stack_defconfig
 create mode 100644 target/device/Freescale/Config.in
 create mode 100644 target/device/Freescale/Makefile.in
 create mode 100644 target/device/Freescale/imx25/Makefile.in
 create mode 100644 target/device/Freescale/imx25/linux-2.26.28.config
 create mode 100644 target/device/Freescale/imx25/target_device_table.txt
 create mode 100644 toolchain/kernel-headers/linux-2.6.28-unifdef-getline.patch

diff --git a/configs/mx25_3stack_defconfig b/configs/mx25_3stack_defconfig
new file mode 100644
index 0000000..1f2cfd0
--- /dev/null
+++ b/configs/mx25_3stack_defconfig
@@ -0,0 +1,865 @@
+#
+# Automatically generated make config: don't edit
+# Tue Mar 30 15:19:42 2010
+#
+BR2_HAVE_DOT_CONFIG=y
+BR2_VERSION="2010.05-git"
+# BR2_alpha is not set
+BR2_arm=y
+# BR2_armeb is not set
+# BR2_avr32 is not set
+# BR2_cris is not set
+# BR2_ia64 is not set
+# BR2_i386 is not set
+# BR2_m68k is not set
+# BR2_mips is not set
+# BR2_mipsel is not set
+# BR2_nios2 is not set
+# BR2_powerpc is not set
+# BR2_sh is not set
+# BR2_sh64 is not set
+# BR2_sparc is not set
+# BR2_sparc64 is not set
+# BR2_x86_64 is not set
+# BR2_xtensa is not set
+# BR2_generic_arm is not set
+# BR2_arm7tdmi is not set
+# BR2_arm610 is not set
+# BR2_arm710 is not set
+# BR2_arm720t is not set
+# BR2_arm920t is not set
+# BR2_arm922t is not set
+BR2_arm926t=y
+# BR2_arm10t is not set
+# BR2_arm1136jf_s is not set
+# BR2_arm1176jz_s is not set
+# BR2_arm1176jzf_s is not set
+
+#
+# cortex-A8 needs gcc >= 4.4.x
+#
+# BR2_cortex_a8 is not set
+# BR2_sa110 is not set
+# BR2_sa1100 is not set
+# BR2_xscale is not set
+# BR2_iwmmxt is not set
+BR2_ARM_TYPE="ARM926T"
+BR2_ARM_EABI=y
+# BR2_ARM_OABI is not set
+BR2_ARCH="arm"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_TUNE="arm9tdmi"
+BR2_GCC_TARGET_ARCH="armv5te"
+BR2_GCC_TARGET_ABI="aapcs-linux"
+
+#
+# Target options
+#
+
+#
+# Preset Devices
+#
+# BR2_TARGET_ARMLTD is not set
+# BR2_TARGET_ATMEL is not set
+# BR2_TARGET_KWIKBYTE is not set
+BR2_TARGET_FREESCALE_BOARDS=y
+BR2_TARGET_FREESCALE_BOARDS_IMX25=y
+BR2_DEPRECATED=y
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
+BR2_TARGET_GENERIC_GETTY=y
+# BR2_TARGET_GENERIC_GETTY_NONE is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYS3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYAMA3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYSAC3 is not set
+BR2_TARGET_GENERIC_GETTY_TTYMXC0=y
+# BR2_TARGET_GENERIC_GETTY_TTYMXC1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYMXC2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYUL3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYPSC3 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM0 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM1 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM2 is not set
+# BR2_TARGET_GENERIC_GETTY_TTYCPM3 is not set
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
+
+#
+# Build options
+#
+BR2_WGET="wget --passive-ftp -nd"
+BR2_SVN_CO="svn co"
+BR2_SVN_UP="svn up"
+BR2_BZR_CO="bzr co"
+BR2_BZR_UP="bzr up"
+BR2_GIT="git clone"
+BR2_ZCAT="gzip -d -c"
+BR2_BZCAT="bzcat"
+BR2_TAR_OPTIONS=""
+BR2_DL_DIR="$(TOPDIR)/dl"
+BR2_COPYTO=""
+
+#
+# Mirrors and Download locations
+#
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://buildroot.net/downloads/sources/"
+BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
+BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
+BR2_GNU_TARGET_SUFFIX="linux-uclibcgnueabi"
+BR2_JLEVEL=1
+# BR2_PREFER_IMA is not set
+BR2_RECENT=y
+BR2_CONFIG_CACHE=y
+# BR2_ENABLE_DEBUG is not set
+BR2_STRIP_strip=y
+# BR2_STRIP_sstrip is not set
+# BR2_STRIP_none is not set
+# BR2_OPTIMIZE_0 is not set
+# BR2_OPTIMIZE_1 is not set
+# BR2_OPTIMIZE_2 is not set
+# BR2_OPTIMIZE_3 is not set
+BR2_OPTIMIZE_S=y
+# BR2_PREFER_STATIC_LIB is not set
+# BR2_HAVE_MANPAGES is not set
+# BR2_HAVE_INFOPAGES is not set
+# BR2_HAVE_DOCUMENTATION is not set
+# BR2_HAVE_DEVFILES is not set
+BR2_UPDATE_CONFIG=y
+
+#
+# Toolchain
+#
+BR2_TOOLCHAIN_BUILDROOT=y
+# BR2_TOOLCHAIN_EXTERNAL is not set
+
+#
+# Kernel Header Options
+#
+# BR2_KERNEL_HEADERS_2_6_27 is not set
+# BR2_KERNEL_HEADERS_2_6_28 is not set
+# BR2_KERNEL_HEADERS_2_6_29 is not set
+# BR2_KERNEL_HEADERS_2_6_30 is not set
+# BR2_KERNEL_HEADERS_2_6_31 is not set
+# BR2_KERNEL_HEADERS_2_6_32 is not set
+# BR2_KERNEL_HEADERS_2_6_33 is not set
+BR2_KERNEL_HEADERS_VERSION=y
+# BR2_KERNEL_HEADERS_SNAP is not set
+BR2_DEFAULT_KERNEL_VERSION="2.6.28"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.28"
+
+#
+# uClibc Options
+#
+# BR2_UCLIBC_VERSION_0_9_28_3 is not set
+# BR2_UCLIBC_VERSION_0_9_29 is not set
+BR2_UCLIBC_VERSION_0_9_30=y
+# BR2_UCLIBC_VERSION_SNAPSHOT is not set
+BR2_UCLIBC_VERSION_STRING="0.9.30.3"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
+# BR2_PTHREAD_DEBUG is not set
+# BR2_UCLIBC_INSTALL_TEST_SUITE is not set
+
+#
+# Binutils Options
+#
+# BR2_BINUTILS_VERSION_2_17 is not set
+# BR2_BINUTILS_VERSION_2_18 is not set
+# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
+# BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1 is not set
+# BR2_BINUTILS_VERSION_2_19 is not set
+# BR2_BINUTILS_VERSION_2_19_1 is not set
+BR2_BINUTILS_VERSION_2_20=y
+BR2_BINUTILS_VERSION="2.20"
+BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
+
+#
+# GCC Options
+#
+# BR2_GCC_VERSION_4_1_2 is not set
+# BR2_GCC_VERSION_4_2_1 is not set
+# BR2_GCC_VERSION_4_2_2 is not set
+# BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 is not set
+# BR2_GCC_VERSION_4_2_3 is not set
+# BR2_GCC_VERSION_4_2_4 is not set
+# BR2_GCC_VERSION_4_3_2 is not set
+# BR2_GCC_VERSION_4_3_3 is not set
+BR2_GCC_VERSION_4_3_4=y
+# BR2_GCC_VERSION_4_4_X is not set
+# BR2_GCC_VERSION_SNAP is not set
+BR2_GCC_SUPPORTS_SYSROOT=y
+BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
+BR2_GCC_VERSION="4.3.4"
+BR2_TOOLCHAIN_SYSROOT=y
+# BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
+BR2_EXTRA_GCC_CONFIG_OPTIONS=""
+# BR2_GCC_CROSS_FORTRAN is not set
+# BR2_INSTALL_OBJC is not set
+# BR2_INSTALL_FORTRAN is not set
+BR2_GCC_SHARED_LIBGCC=y
+BR2_GCC_ENABLE_TLS=y
+
+#
+# Ccache Options
+#
+# BR2_CCACHE is not set
+
+#
+# Gdb Options
+#
+# BR2_PACKAGE_GDB is not set
+# BR2_PACKAGE_GDB_SERVER is not set
+# BR2_PACKAGE_GDB_HOST is not set
+
+#
+# Common Toolchain Options
+#
+# BR2_LARGEFILE is not set
+# BR2_INET_IPV6 is not set
+# BR2_INET_RPC is not set
+# BR2_ENABLE_LOCALE is not set
+# BR2_ENABLE_LOCALE_PURGE is not set
+# BR2_USE_WCHAR is not set
+BR2_PREFER_SOFT_FLOAT=y
+BR2_SOFT_FLOAT=y
+# BR2_USE_SSP is not set
+# BR2_PTHREADS_NONE is not set
+# BR2_PTHREADS is not set
+BR2_PTHREADS_OLD=y
+# BR2_PTHREADS_NATIVE is not set
+# BR2_PROGRAM_INVOCATION is not set
+# BR2_INSTALL_LIBSTDCPP is not set
+BR2_TARGET_OPTIMIZATION="-Os -pipe"
+# BR2_ELF2FLT is not set
+# BR2_MKLIBS is not set
+# BR2_PACKAGE_SSTRIP_TARGET is not set
+# BR2_PACKAGE_SSTRIP_HOST is not set
+# BR2_ENABLE_MULTILIB is not set
+BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
+
+#
+# Package Selection for the target
+#
+BR2_PACKAGE_BUSYBOX=y
+# BR2_BUSYBOX_VERSION_1_12_X is not set
+# BR2_BUSYBOX_VERSION_1_13_X is not set
+# BR2_BUSYBOX_VERSION_1_14_X is not set
+# BR2_BUSYBOX_VERSION_1_15_X is not set
+BR2_BUSYBOX_VERSION_1_16_X=y
+# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
+BR2_BUSYBOX_VERSION="1.16.0"
+BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.16.x.config"
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_BUSYBOX_SKELETON is not set
+
+#
+# The minimum needed to build a uClibc development system
+#
+# BR2_PACKAGE_FLEX is not set
+
+#
+# native toolchain needs development files in target filesystem
+#
+# BR2_PACKAGE_MAKE is not set
+
+#
+# Other development stuff
+#
+# BR2_PACKAGE_AUTOCONF is not set
+# BR2_PACKAGE_AUTOMAKE is not set
+# BR2_PACKAGE_BISON is not set
+# BR2_PACKAGE_CCACHE_TARGET is not set
+# BR2_PACKAGE_DISTCC is not set
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_FAKEROOT is not set
+BR2_HOST_FAKEROOT=y
+# BR2_PACKAGE_GETTEXT is not set
+# BR2_PACKAGE_LIBINTL is not set
+# BR2_PACKAGE_LIBGMP is not set
+
+#
+# gperf requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBMPFR is not set
+# BR2_PACKAGE_LIBTOOL is not set
+# BR2_PACKAGE_M4 is not set
+
+#
+# oprofile requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_PKG_CONFIG is not set
+# BR2_PACKAGE_READLINE is not set
+# BR2_PACKAGE_PCRE is not set
+# BR2_PACKAGE_INTLTOOL is not set
+
+#
+# Other stuff
+#
+# BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_BEECRYPT is not set
+# BR2_PACKAGE_BERKELEYDB is not set
+# BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CUPS is not set
+# BR2_PACKAGE_CUSTOMIZE is not set
+# BR2_PACKAGE_FILE is not set
+# BR2_PACKAGE_GAMIN is not set
+
+#
+# icu requires a toolchain with C++ support and WCHAR enabled
+#
+# BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
+# BR2_PACKAGE_LIBDAEMON is not set
+# BR2_PACKAGE_LIBELF is not set
+# BR2_PACKAGE_LIBEVENT is not set
+# BR2_PACKAGE_LIBFLOAT is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
+# BR2_PACKAGE_LIBICONV is not set
+# BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBOIL is not set
+# BR2_PACKAGE_LIBSYSFS is not set
+# BR2_PACKAGE_LOCKFILE_PROGS is not set
+
+#
+# logrotate     - disabled (requires wchar support)
+#
+# BR2_PACKAGE_LSOF is not set
+# BR2_PACKAGE_LTP-TESTSUITE is not set
+# BR2_PACKAGE_LTRACE is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_POPT is not set
+# BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
+# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
+# BR2_PACKAGE_STRACE is not set
+# BR2_PACKAGE_SUDO is not set
+
+#
+# Database
+#
+
+#
+# Mysql client requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_SQLITE is not set
+
+#
+# Text editors
+#
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_UEMACS is not set
+
+#
+# Networking
+#
+
+#
+# Networking applications
+#
+# BR2_PACKAGE_ARGUS is not set
+# BR2_PACKAGE_AVAHI is not set
+# BR2_PACKAGE_AXEL is not set
+
+#
+# bind requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_BMON is not set
+# BR2_PACKAGE_BRIDGE is not set
+
+#
+# ctorrent requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_DNSMASQ is not set
+# BR2_PACKAGE_DROPBEAR is not set
+# BR2_PACKAGE_ETHTOOL is not set
+# BR2_PACKAGE_HASERL is not set
+# BR2_PACKAGE_HOSTAPD is not set
+# BR2_PACKAGE_IFPLUGD is not set
+
+#
+# iperf requires a toolchain with C++ support enabled
+#
+
+#
+# iproute2 requires a toolchain with IPv6 support
+#
+# BR2_PACKAGE_IPSEC_TOOLS is not set
+
+#
+# iptables requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_IW is not set
+
+#
+# Kismet requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_L2TP is not set
+# BR2_PACKAGE_LIBCGI is not set
+
+#
+# libcgicc requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBMICROHTTPD is not set
+# BR2_PACKAGE_LIBNL is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBSOUP is not set
+
+#
+# libupnp requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_LINKS is not set
+# BR2_PACKAGE_LRZSZ is not set
+# BR2_PACKAGE_MIIDIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MUTT is not set
+# BR2_PACKAGE_NBD is not set
+
+#
+# ncftp requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+
+#
+# nfs-utils requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_NTP is not set
+# BR2_PACKAGE_OLSR is not set
+# BR2_PACKAGE_OPENNTPD is not set
+# BR2_PACKAGE_OPENSSH is not set
+# BR2_PACKAGE_OPENSSL is not set
+# BR2_PACKAGE_OPENVPN is not set
+
+#
+# portmap requires a toolchain with 'Enable RPC' selected
+#
+# BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RP_PPPOE is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
+# BR2_PACKAGE_PROFTPD is not set
+# BR2_PACKAGE_QUAGGA is not set
+# BR2_PACKAGE_RSYNC is not set
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+# BR2_PACKAGE_STUNNEL is not set
+# BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_TTCP is not set
+
+#
+# udpcast requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
+# BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WEBIF is not set
+# BR2_PACKAGE_WIRELESS_TOOLS is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
+
+#
+# Hardware handling / blockdevices and filesystem maintenance
+#
+
+#
+# dbus not available (need expat or libxml2)
+#
+
+#
+# dmraid requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_DOSFSTOOLS is not set
+
+#
+# e2fsprogs requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+
+#
+# libfuse requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_GADGETFS_TEST is not set
+
+#
+# gvfs requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_HAL is not set
+# BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
+# BR2_PACKAGE_IOSTAT is not set
+# BR2_PACKAGE_LIBAIO is not set
+# BR2_PACKAGE_LIBRAW1394 is not set
+# BR2_PACKAGE_LIBUSB is not set
+# BR2_PACKAGE_LM_SENSORS is not set
+
+#
+# lvm2 requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MEMTESTER is not set
+# BR2_PACKAGE_MTD is not set
+
+#
+# ntfs-3g requires a toolchain with LARGEFILE and WCHAR support
+#
+
+#
+# ntfsprogs requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_PCIUTILS is not set
+# BR2_PACKAGE_PCMCIA is not set
+# BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SMARTMONTOOLS is not set
+
+#
+# sshfs requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_USB_MODESWITCH is not set
+# BR2_PACKAGE_USBMOUNT is not set
+# BR2_PACKAGE_USBUTILS is not set
+# BR2_PACKAGE_WIPE is not set
+
+#
+# xfsprogs requires a toolchain with LARGEFILE support
+#
+
+#
+# Audio and video libraries and applications
+#
+# BR2_PACKAGE_ALSA_LIB is not set
+
+#
+# alsa-utils requires a toolchain with LARGEFILE support
+#
+# BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FLAC is not set
+# BR2_PACKAGE_GSTREAMER is not set
+# BR2_PACKAGE_LIBCDAUDIO is not set
+# BR2_PACKAGE_LIBDVDREAD is not set
+# BR2_PACKAGE_LIBDVDNAV is not set
+# BR2_PACKAGE_LIBID3TAG is not set
+# BR2_PACKAGE_LIBMAD is not set
+# BR2_PACKAGE_LIBMMS is not set
+# BR2_PACKAGE_LIBMPD is not set
+# BR2_PACKAGE_LIBOGG is not set
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBTHEORA is not set
+# BR2_PACKAGE_LIBVORBIS is not set
+# BR2_PACKAGE_MADPLAY is not set
+# BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_MPLAYER is not set
+# BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_SWFDEC is not set
+
+#
+# festival requires a toolchain with C++ support enabled
+#
+
+#
+# taglib requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_TREMOR is not set
+# BR2_PACKAGE_VLC is not set
+
+#
+# Graphic libraries and applications (graphic/text)
+#
+
+#
+# text rendering libraries
+#
+# BR2_PACKAGE_NCURSES is not set
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_SLANG is not set
+
+#
+# text rendering applications
+#
+# BR2_PACKAGE_DIALOG is not set
+
+#
+# graphic libraries
+#
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+# BR2_PACKAGE_LINUX_FUSION is not set
+# BR2_PACKAGE_PIXMAN is not set
+# BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_TIFF is not set
+
+#
+# busybox graphic applications
+#
+
+#
+# --> May be broken in busybox
+#
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_FBSET is not set
+
+#
+# other GUIs
+#
+
+#
+# qt requires a toolchain with C++ support enabled
+#
+
+#
+# X.org requires a toolchain with WCHAR support
+#
+
+#
+# X libraries and helper libraries
+#
+# BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_PANGO is not set
+# BR2_PACKAGE_LIBDRM is not set
+# BR2_PACKAGE_LIBERATION is not set
+# BR2_PACKAGE_LIBGLIB12 is not set
+# BR2_PACKAGE_LIBGLIB2 is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_TSLIB is not set
+
+#
+# webkit requires a toolchain with C++ support and WCHAR enabled
+#
+
+#
+# X Window managers
+#
+
+#
+# X applications
+#
+# BR2_PACKAGE_GOB2 is not set
+# BR2_PACKAGE_SYLPHEED is not set
+
+#
+# Compressors / decompressors
+#
+
+#
+# libarchive requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_LZO is not set
+# BR2_PACKAGE_LZOP is not set
+
+#
+# lzma requires a toolchain with C++ support
+#
+BR2_PACKAGE_ZLIB=y
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+# BR2_PACKAGE_PORTAGE is not set
+
+#
+# Interpreter languages / Scripting
+#
+# BR2_PACKAGE_LUA is not set
+# BR2_PACKAGE_MICROPERL is not set
+# BR2_PACKAGE_PYTHON is not set
+
+#
+# ruby requires a toolchain with WCHAR support
+#
+# BR2_PACKAGE_TCL is not set
+# BR2_PACKAGE_PHP is not set
+
+#
+# XML handling
+#
+# BR2_PACKAGE_EXPAT is not set
+# BR2_PACKAGE_EZXML is not set
+# BR2_PACKAGE_LIBXML2 is not set
+# BR2_PACKAGE_LIBXSLT is not set
+
+#
+# xerces-c++ requires a toolchain with C++ support enabled
+#
+# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
+
+#
+# Java
+#
+# BR2_PACKAGE_CLASSPATH is not set
+
+#
+# Games
+#
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_PRBOOM is not set
+
+#
+# Target filesystem options
+#
+BR2_ROOTFS_PREFIX="rootfs"
+BR2_ROOTFS_SUFFIX=""
+BR2_ROOTFS_POST_BUILD_SCRIPT=""
+
+#
+# filesystem for target device
+#
+# BR2_TARGET_ROOTFS_CRAMFS is not set
+# BR2_TARGET_ROOTFS_CLOOP is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=0
+BR2_TARGET_ROOTFS_EXT2_INODES=0
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=0
+BR2_TARGET_ROOTFS_EXT2_SQUASH=y
+BR2_TARGET_ROOTFS_EXT2_OUTPUT="$(IMAGE).ext2"
+BR2_TARGET_ROOTFS_EXT2_NONE=y
+# BR2_TARGET_ROOTFS_EXT2_GZIP is not set
+# BR2_TARGET_ROOTFS_EXT2_BZIP2 is not set
+# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
+BR2_TARGET_ROOTFS_EXT2_COPYTO=""
+# BR2_TARGET_ROOTFS_JFFS2 is not set
+# BR2_TARGET_ROOTFS_SQUASHFS is not set
+BR2_TARGET_ROOTFS_TAR=y
+# BR2_TARGET_ROOTFS_TAR_NONE is not set
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
+# BR2_TARGET_ROOTFS_TAR_LZMA is not set
+BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+BR2_TARGET_ROOTFS_TAR_COPYTO=""
+# BR2_TARGET_ROOTFS_CPIO is not set
+# BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
+
+#
+# bootloader for target device
+#
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
+# BR2_TARGET_UBOOT_2009_11 is not set
+# BR2_TARGET_UBOOT_2009_08 is not set
+# BR2_TARGET_UBOOT_2009_06 is not set
+# BR2_TARGET_UBOOT_2009_03 is not set
+BR2_TARGET_UBOOT_2009_01=y
+# BR2_TARGET_UBOOT_2008_10 is not set
+# BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
+BR2_UBOOT_VERSION="2009.01"
+BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
+# BR2_TARGET_U_BOOT_ARCH_PATCH is not set
+BR2_TARGET_UBOOT_CUSTOM_PATCH="u-boot-v2009.01-imx_4.5.1.patch.bz2"
+BR2_TARGET_UBOOT_CUSTOM_PATCH_SITE="http://download.berlios.de/mx25patches/"
+# BR2_TARGET_UBOOT_SILENT is not set
+# BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
+# BR2_TARGET_UBOOT_TOOL_ENV is not set
+# BR2_TARGET_UBOOT_DEFAULT_ENV is not set
+
+#
+# Kernel
+#
+# BR2_KERNEL_none is not set
+BR2_KERNEL_LINUX_ADVANCED=y
+# BR2_KERNEL_LINUX is not set
+BR2_PACKAGE_LINUX=y
+BR2_PACKAGE_LINUX_KCONFIG="target/device/Freescale/imx25/kernel-2.6.28.config"
+BR2_PACKAGE_LINUX_FORMAT="uImage"
+BR2_KERNEL_CURRENT_VERSION="2.6.33"
+BR2_KERNEL_LATEST_2_6_33=""
+BR2_KERNEL_LATEST_2_6_32="9"
+BR2_KERNEL_LATEST_2_6_31="12"
+BR2_KERNEL_LATEST_2_6_30="10"
+BR2_KERNEL_LATEST_2_6_29="6"
+BR2_KERNEL_LATEST_2_6_28="10"
+BR2_KERNEL_LATEST_2_6_27="45"
+BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
+BR2_KERNEL_PATCH_SITE="http://download.berlios.de/mx25patches/"
+# BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_33 is not set
+# BR2_LINUX_2_6_32 is not set
+# BR2_LINUX_2_6_31 is not set
+# BR2_LINUX_2_6_30 is not set
+# BR2_LINUX_2_6_29 is not set
+# BR2_LINUX_2_6_28 is not set
+# BR2_LINUX_2_6_27 is not set
+BR2_LINUX26_CUSTOM=y
+BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION="2.6.28"
+BR2_CUSTOM_LINUX26_VERSION="2.6.28"
+BR2_CUSTOM_LINUX26_PATCH="linux-2.6.28-imx_4.5.1.patch.bz2"
+BR2_CUSTOM_LINUX26_PATCH_SITE="http://download.berlios.de/mx25patches/"
+
+#
+# Patches
+#
+# BR2_KERNEL_ARCH_PATCH_ENABLED is not set
+BR2_LINUX_BSP_PATCH=""
+BR2_KERNEL_PATCH="$(BR2_CUSTOM_LINUX26_PATCH)"
+BR2_EXTRA_VERSION="$(BR2_CUSTOM_LINUX26_VERSION)"
+BR2_DOWNLOAD_LINUX26_VERSION="2.6.28"
+BR2_LINUX26_VERSION="$(BR2_CUSTOM_LINUX26_VERSION)"
+
+#
+# Linux Kernel Configuration
+#
+BR2_PACKAGE_LINUX_USE_KCONFIG=y
+# BR2_PACKAGE_LINUX_USE_DEFCONFIG is not set
+# BR2_PACKAGE_LINUX_USE_XCONFIG is not set
+# BR2_LINUX_BIN_BZIMAGE is not set
+BR2_LINUX_BIN_UIMAGE=y
+# BR2_LINUX_BIN_VMLINUX is not set
+# BR2_LINUX_BIN_ZIMAGE is not set
+# BR2_LINUX_BIN_CUSTOM is not set
+
+#
+# Destinations for linux kernel binaries
+#
+# BR2_LINUX_COPYTO_ROOTFS is not set
+# BR2_LINUX_COPYTO_TFTPBOOT is not set
+BR2_LINUX_COPYTO=""
+# BR2_LINUX_COPY_CONFIGURATION is not set
diff --git a/target/device/Config.in b/target/device/Config.in
index 6b7f11a..95d2fa6 100644
--- a/target/device/Config.in
+++ b/target/device/Config.in
@@ -8,6 +8,7 @@ source "target/device/KwikByte/Config.in"
 source "target/device/valka/Config.in"
 source "target/device/x86/Config.in"
 source "target/device/xtensa/Config.in"
+source "target/device/Freescale/Config.in"
 
 # This must be last
 source "target/generic/Config.in"
diff --git a/target/device/Freescale/Config.in b/target/device/Freescale/Config.in
new file mode 100644
index 0000000..4b68c7f
--- /dev/null
+++ b/target/device/Freescale/Config.in
@@ -0,0 +1,16 @@
+menuconfig BR2_TARGET_FREESCALE_BOARDS
+       bool "Freescale board support"
+
+if BR2_TARGET_FREESCALE_BOARDS
+
+config BR2_TARGET_FREESCALE_BOARDS_IMX25
+       bool "Support for Freescale i.MX25 evaluation kit"
+       help
+         This option enables support for the Freescale i.MX25 evaluation kit.
+
+config BR2_DEPRECATED 
+	bool 
+	default y
+
+endif
+
diff --git a/target/device/Freescale/Makefile.in b/target/device/Freescale/Makefile.in
new file mode 100644
index 0000000..368833e
--- /dev/null
+++ b/target/device/Freescale/Makefile.in
@@ -0,0 +1,4 @@
+ifeq ($(BR2_TARGET_FREESCALE_BOARDS_IMX25),y)
+include target/device/Freescale/imx25/Makefile.in
+endif
+
diff --git a/target/device/Freescale/imx25/Makefile.in b/target/device/Freescale/imx25/Makefile.in
new file mode 100644
index 0000000..2034b25
--- /dev/null
+++ b/target/device/Freescale/imx25/Makefile.in
@@ -0,0 +1,5 @@
+
+BOARD_PATH="target/device/Freescale/imx25"
+TARGET_DEVICE_TABLE="$(BOARD_PATH)target_device_table.txt"
+BR2_TARGET_UBOOT_BOARDNAME="mx25_3stack"
+#U_BOOT_ARCH_PATCH_DIR=target/device/Freescale/imx25/u-boot-patches
diff --git a/target/device/Freescale/imx25/linux-2.26.28.config b/target/device/Freescale/imx25/linux-2.26.28.config
new file mode 100644
index 0000000..c1e08fd
--- /dev/null
+++ b/target/device/Freescale/imx25/linux-2.26.28.config
@@ -0,0 +1,1725 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.28
+# Mon Mar 15 10:11:06 2010
+#
+CONFIG_ARM=y
+CONFIG_SYS_SUPPORTS_APM_EMULATION=y
+# CONFIG_GENERIC_GPIO is not set
+CONFIG_GENERIC_TIME=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_MMU=y
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_GENERIC_IRQ_PROBE=y
+CONFIG_RWSEM_GENERIC_SPINLOCK=y
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_CALIBRATE_DELAY=y
+CONFIG_ZONE_DMA=y
+CONFIG_ARCH_MTD_XIP=y
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
+CONFIG_VECTORS_BASE=0xffff0000
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_LOCK_KERNEL=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_GROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=y
+CONFIG_SYSFS_DEPRECATED_V2=y
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL=y
+CONFIG_EMBEDDED=y
+CONFIG_UID16=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_COMPAT_BRK=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_ANON_INODES=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+CONFIG_PROFILING=y
+# CONFIG_MARKERS is not set
+CONFIG_OPROFILE=y
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_GENERIC_DMA_COHERENT=y
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_KMOD=y
+CONFIG_BLOCK=y
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_AS=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+# CONFIG_DEFAULT_AS is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
+CONFIG_CLASSIC_RCU=y
+CONFIG_FREEZER=y
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+CONFIG_ARCH_MXC=y
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+# CONFIG_ARCH_MSM is not set
+# CONFIG_ARCH_STMP3XXX is not set
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+
+#
+# Freescale MXC Implementations
+#
+# CONFIG_ARCH_MX37 is not set
+# CONFIG_ARCH_MX35 is not set
+# CONFIG_ARCH_MX51 is not set
+# CONFIG_ARCH_MX3 is not set
+# CONFIG_ARCH_MX27 is not set
+CONFIG_ARCH_MX25=y
+CONFIG_I2C_MXC_SELECT1=y
+# CONFIG_I2C_MXC_SELECT2 is not set
+
+#
+# MX25 Options
+#
+CONFIG_MX25_OPTIONS=y
+CONFIG_MACH_MX25_3DS=y
+# CONFIG_MX25_DOZE_DURING_IDLE is not set
+CONFIG_MXC_SDMA_API=y
+
+#
+# SDMA options
+#
+CONFIG_SDMA_IRAM=y
+CONFIG_SDMA_IRAM_SIZE=0x1000
+CONFIG_ARCH_MXC_HAS_NFC_V2=y
+CONFIG_ARCH_MXC_HAS_NFC_V2_1=y
+
+#
+# Device options
+#
+# CONFIG_I2C_MXC_SELECT3 is not set
+# CONFIG_FLEXCAN_MXC_SELECT1 is not set
+CONFIG_DMA_ZONE_SIZE=24
+CONFIG_UTMI_MXC=y
+CONFIG_UTMI_MXC_OTG=m
+# CONFIG_MXC_PWM is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=y
+CONFIG_CPU_ARM926T=y
+# CONFIG_CPU_V6 is not set
+# CONFIG_CPU_V7 is not set
+CONFIG_CPU_32v5=y
+CONFIG_CPU_ABRT_EV5TJ=y
+CONFIG_CPU_PABRT_NOIFAR=y
+CONFIG_CPU_CACHE_VIVT=y
+CONFIG_CPU_COPY_V4WB=y
+CONFIG_CPU_TLB_V4WBI=y
+CONFIG_CPU_CP15=y
+CONFIG_CPU_CP15_MMU=y
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=y
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
+# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+CONFIG_VMSPLIT_3G=y
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=0xC0000000
+CONFIG_PREEMPT=y
+CONFIG_HZ=100
+CONFIG_AEABI=y
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_FLATMEM_HAS_HOLES=y
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4096
+# CONFIG_RESOURCES_64BIT is not set
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=1
+CONFIG_BOUNCE=y
+CONFIG_VIRT_TO_BUS=y
+CONFIG_UNEVICTABLE_LRU=y
+# CONFIG_LEDS is not set
+CONFIG_ALIGNMENT_TRAP=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CMDLINE="noinitrd console=ttymxc0,115200 root=/dev/mtdblock2 rw rootfstype=jffs2 ip=off"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_TABLE=y
+# CONFIG_CPU_FREQ_DEBUG is not set
+CONFIG_CPU_FREQ_STAT=y
+# CONFIG_CPU_FREQ_STAT_DETAILS is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_IMX=y
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_HAVE_AOUT=y
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=y
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_PACKET_MMAP=y
+CONFIG_UNIX=y
+CONFIG_XFRM=y
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+CONFIG_CAN=y
+CONFIG_CAN_RAW=y
+# CONFIG_CAN_BCM is not set
+
+#
+# CAN Device Drivers
+#
+# CONFIG_CAN_VCAN is not set
+# CONFIG_CAN_DEBUG_DEVICES is not set
+CONFIG_CAN_FLEXCAN=y
+CONFIG_IRDA=m
+
+#
+# IrDA protocols
+#
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
+# CONFIG_IRDA_ULTRA is not set
+
+#
+# IrDA options
+#
+CONFIG_IRDA_CACHE_LAST_LSAP=y
+CONFIG_IRDA_FAST_RR=y
+# CONFIG_IRDA_DEBUG is not set
+
+#
+# Infrared-port device drivers
+#
+
+#
+# SIR device drivers
+#
+CONFIG_IRTTY_SIR=m
+
+#
+# Dongle support
+#
+# CONFIG_DONGLE is not set
+# CONFIG_KINGSUN_DONGLE is not set
+# CONFIG_KSDAZZLE_DONGLE is not set
+# CONFIG_KS959_DONGLE is not set
+
+#
+# FIR device drivers
+#
+# CONFIG_USB_IRDA is not set
+# CONFIG_SIGMATEL_FIR is not set
+# CONFIG_MCS_FIR is not set
+# CONFIG_MXC_FIR is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+# CONFIG_PHONET is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_OLD_REGULATORY=y
+CONFIG_WIRELESS_EXT=y
+CONFIG_WIRELESS_EXT_SYSFS=y
+# CONFIG_MAC80211 is not set
+CONFIG_IEEE80211=y
+# CONFIG_IEEE80211_DEBUG is not set
+# CONFIG_IEEE80211_CRYPT_WEP is not set
+# CONFIG_IEEE80211_CRYPT_CCMP is not set
+# CONFIG_IEEE80211_CRYPT_TKIP is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_SYS_HYPERVISOR is not set
+CONFIG_CONNECTOR=y
+CONFIG_PROC_EVENTS=y
+CONFIG_MTD=y
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=y
+CONFIG_MTD_REDBOOT_PARTS=y
+CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
+# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
+# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+CONFIG_MTD_CFI_ADV_OPTIONS=y
+CONFIG_MTD_CFI_NOSWAP=y
+# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
+# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
+CONFIG_MTD_CFI_GEOMETRY=y
+# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+# CONFIG_MTD_CFI_I2 is not set
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_OTP is not set
+# CONFIG_MTD_CFI_INTELEXT is not set
+CONFIG_MTD_CFI_AMDSTD=y
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+CONFIG_MTD_RAM=y
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+# CONFIG_MTD_XIP is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PHYSMAP is not set
+# CONFIG_MTD_ARM_INTEGRATOR is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_MXC is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+CONFIG_MTD_NAND=y
+# CONFIG_MTD_NAND_VERIFY_WRITE is not set
+# CONFIG_MTD_NAND_ECC_SMC is not set
+# CONFIG_MTD_NAND_MUSEUM_IDS is not set
+CONFIG_MTD_NAND_IDS=y
+# CONFIG_MTD_NAND_DISKONCHIP is not set
+# CONFIG_MTD_NAND_NANDSIM is not set
+# CONFIG_MTD_NAND_IMX_NFC is not set
+CONFIG_MTD_NAND_MXC_V2=y
+# CONFIG_MTD_NAND_MXC_SWECC is not set
+# CONFIG_MTD_NAND_MXC_FORCE_CE is not set
+# CONFIG_MXC_NAND_LOW_LEVEL_ERASE is not set
+# CONFIG_MTD_NAND_PLATFORM is not set
+# CONFIG_MTD_ALAUDA is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=16384
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=y
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_C2PORT is not set
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+CONFIG_SCSI_PROC_FS=y
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+CONFIG_BLK_DEV_SD=y
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+
+#
+# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
+#
+CONFIG_SCSI_MULTI_LUN=y
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=m
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+CONFIG_SCSI_LOWLEVEL=y
+# CONFIG_ISCSI_TCP is not set
+# CONFIG_SCSI_DEBUG is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=y
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=y
+CONFIG_MII=y
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_SMC911X is not set
+CONFIG_SMSC911X=y
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+# CONFIG_CS89x0 is not set
+CONFIG_FEC=m
+# CONFIG_FEC2 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_IWLWIFI_LEDS is not set
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+CONFIG_USB_RTL8150=m
+CONFIG_USB_USBNET=m
+CONFIG_USB_NET_AX8817X=m
+CONFIG_USB_NET_CDCETHER=m
+# CONFIG_USB_NET_DM9601 is not set
+# CONFIG_USB_NET_SMSC95XX is not set
+# CONFIG_USB_NET_GL620A is not set
+# CONFIG_USB_NET_NET1080 is not set
+# CONFIG_USB_NET_PLUSB is not set
+# CONFIG_USB_NET_MCS7830 is not set
+# CONFIG_USB_NET_RNDIS_HOST is not set
+# CONFIG_USB_NET_CDC_SUBSET is not set
+# CONFIG_USB_NET_ZAURUS is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=m
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_SYNC_TTY=m
+CONFIG_PPP_DEFLATE=m
+# CONFIG_PPP_BSDCOMP is not set
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=m
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+
+#
+# Userland interfaces
+#
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+CONFIG_KEYBOARD_MXC=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+CONFIG_TOUCHSCREEN_IMX_ADC=y
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_DEVKMEM=y
+# CONFIG_SERIAL_NONSTANDARD is not set
+CONFIG_MXC_IIM=y
+CONFIG_IMX_SIM=m
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_MXC=y
+CONFIG_SERIAL_MXC_CONSOLE=y
+# CONFIG_SERIAL_IMX is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+CONFIG_UNIX98_PTYS=y
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=y
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_I2C=y
+CONFIG_I2C_BOARDINFO=y
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=y
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+CONFIG_I2C_MXC=y
+# CONFIG_I2C_MXC_HS is not set
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_TINY_USB is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_AT24 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_I2C_SLAVE is not set
+CONFIG_SPI=y
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_BITBANG=y
+CONFIG_SPI_MXC=y
+# CONFIG_SPI_MXC_TEST_LOOPBACK is not set
+CONFIG_SPI_MXC_SELECT1=y
+# CONFIG_SPI_MXC_SELECT2 is not set
+# CONFIG_SPI_MXC_SELECT3 is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_AT25 is not set
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_MXC_WATCHDOG is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+CONFIG_VIDEO_DEV=y
+CONFIG_VIDEO_V4L2_COMMON=y
+CONFIG_VIDEO_ALLOW_V4L1=y
+CONFIG_VIDEO_V4L1_COMPAT=y
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=y
+
+#
+# Multimedia drivers
+#
+# CONFIG_MEDIA_ATTACH is not set
+CONFIG_MEDIA_TUNER=y
+# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
+CONFIG_MEDIA_TUNER_SIMPLE=y
+CONFIG_MEDIA_TUNER_TDA8290=y
+CONFIG_MEDIA_TUNER_TDA9887=y
+CONFIG_MEDIA_TUNER_TEA5761=y
+CONFIG_MEDIA_TUNER_TEA5767=y
+CONFIG_MEDIA_TUNER_MT20XX=y
+CONFIG_MEDIA_TUNER_XC2028=y
+CONFIG_MEDIA_TUNER_XC5000=y
+CONFIG_VIDEO_V4L2=y
+CONFIG_VIDEO_V4L1=y
+CONFIG_VIDEO_CAPTURE_DRIVERS=y
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+CONFIG_VIDEO_HELPER_CHIPS_AUTO=y
+# CONFIG_VIDEO_VIVI is not set
+CONFIG_VIDEO_MXC_CAMERA=m
+
+#
+# MXC Camera/V4L2 PRP Features support
+#
+CONFIG_VIDEO_MXC_CSI_CAMERA=m
+# CONFIG_MXC_CAMERA_MC521DA is not set
+# CONFIG_MXC_EMMA_CAMERA_MICRON111 is not set
+# CONFIG_MXC_CAMERA_OV2640_EMMA is not set
+# CONFIG_MXC_CAMERA_MICRON111 is not set
+CONFIG_MXC_CAMERA_OV2640=m
+# CONFIG_MXC_CAMERA_OV3640 is not set
+# CONFIG_MXC_TVIN_ADV7180 is not set
+# CONFIG_VIDEO_MXC_OUTPUT is not set
+# CONFIG_VIDEO_MXC_OPL is not set
+# CONFIG_VIDEO_CPIA is not set
+# CONFIG_VIDEO_CPIA2 is not set
+# CONFIG_VIDEO_SAA5246A is not set
+# CONFIG_VIDEO_SAA5249 is not set
+# CONFIG_SOC_CAMERA is not set
+# CONFIG_V4L_USB_DRIVERS is not set
+CONFIG_RADIO_ADAPTERS=y
+# CONFIG_USB_DSBR is not set
+# CONFIG_USB_SI470X is not set
+# CONFIG_USB_MR800 is not set
+CONFIG_DAB=y
+# CONFIG_USB_DABUSB is not set
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=y
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+CONFIG_FB_MXC=y
+CONFIG_FB_MXC_SYNC_PANEL=y
+# CONFIG_FB_MXC_EPSON_VGA_SYNC_PANEL is not set
+# CONFIG_FB_MXC_CLAA_WVGA_SYNC_PANEL is not set
+# CONFIG_FB_MXC_CH7026 is not set
+# CONFIG_FB_MXC_TVOUT is not set
+# CONFIG_FB_MXC_TVOUT_CH7024 is not set
+# CONFIG_FB_MXC_ASYNC_PANEL is not set
+# CONFIG_FB_UVESA is not set
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_CORGI is not set
+CONFIG_BACKLIGHT_MXC=y
+CONFIG_BACKLIGHT_MXC_LCDC=y
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x8=y
+CONFIG_FONT_8x16=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_SOUND=y
+CONFIG_SOUND_OSS_CORE=y
+CONFIG_SND=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_PCM=y
+# CONFIG_SND_SEQUENCER is not set
+CONFIG_SND_OSSEMUL=y
+CONFIG_SND_MIXER_OSS=y
+CONFIG_SND_PCM_OSS=y
+CONFIG_SND_PCM_OSS_PLUGINS=y
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=y
+# CONFIG_SND_MXC_SPDIF is not set
+CONFIG_SND_SPI=y
+CONFIG_SND_USB=y
+# CONFIG_SND_USB_AUDIO is not set
+# CONFIG_SND_USB_CAIAQ is not set
+CONFIG_SND_SOC=y
+CONFIG_SND_MXC_SOC=y
+CONFIG_SND_MXC_SOC_SSI=y
+CONFIG_SND_MXC_SOC_ESAI=m
+CONFIG_SND_MXC_SOC_IRAM=y
+CONFIG_SND_SOC_IMX_3STACK_SGTL5000=y
+# CONFIG_SND_SOC_IMX_3STACK_AK4647 is not set
+CONFIG_SND_SOC_IMX_3STACK_WM8580=m
+CONFIG_SND_SOC_IMX_3STACK_AK5702=m
+# CONFIG_SND_SOC_IMX_3STACK_BLUETOOTH is not set
+# CONFIG_SND_SOC_ALL_CODECS is not set
+CONFIG_SND_SOC_AK5702=m
+CONFIG_SND_SOC_WM8580=m
+CONFIG_SND_SOC_SGTL5000=y
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=y
+CONFIG_HID=y
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=y
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+CONFIG_HID_COMPAT=y
+CONFIG_HID_A4TECH=y
+CONFIG_HID_APPLE=y
+CONFIG_HID_BELKIN=y
+CONFIG_HID_BRIGHT=y
+CONFIG_HID_CHERRY=y
+CONFIG_HID_CHICONY=y
+CONFIG_HID_CYPRESS=y
+CONFIG_HID_DELL=y
+CONFIG_HID_EZKEY=y
+CONFIG_HID_GYRATION=y
+CONFIG_HID_LOGITECH=y
+# CONFIG_LOGITECH_FF is not set
+# CONFIG_LOGIRUMBLEPAD2_FF is not set
+CONFIG_HID_MICROSOFT=y
+CONFIG_HID_MONTEREY=y
+CONFIG_HID_PANTHERLORD=y
+# CONFIG_PANTHERLORD_FF is not set
+CONFIG_HID_PETALYNX=y
+CONFIG_HID_SAMSUNG=y
+CONFIG_HID_SONY=y
+CONFIG_HID_SUNPLUS=y
+# CONFIG_THRUSTMASTER_FF is not set
+# CONFIG_ZEROPLUS_FF is not set
+CONFIG_USB_SUPPORT=y
+CONFIG_USB_ARCH_HAS_HCD=y
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+CONFIG_USB_ARCH_HAS_EHCI=y
+CONFIG_USB=y
+# CONFIG_USB_DEBUG is not set
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=y
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+CONFIG_USB_SUSPEND=y
+CONFIG_USB_OTG=y
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+CONFIG_USB_EHCI_HCD=m
+CONFIG_USB_EHCI_ARC=y
+CONFIG_USB_EHCI_ARC_H2=y
+CONFIG_USB_EHCI_ARC_OTG=y
+# CONFIG_USB_STATIC_IRAM is not set
+# CONFIG_USB_EHCI_FSL_MC13783 is not set
+# CONFIG_USB_EHCI_FSL_1301 is not set
+# CONFIG_USB_EHCI_FSL_1504 is not set
+CONFIG_USB_EHCI_FSL_UTMI=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# USB Device Class drivers
+#
+# CONFIG_USB_ACM is not set
+# CONFIG_USB_PRINTER is not set
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
+#
+
+#
+# see USB_STORAGE Help for more information
+#
+CONFIG_USB_STORAGE=y
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_DPCM is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+# CONFIG_USB_LIBUSUAL is not set
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_PHIDGET is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+CONFIG_USB_GADGET=m
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_SELECTED=y
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+CONFIG_USB_GADGET_ARC=y
+CONFIG_USB_STATIC_IRAM_PPH=y
+CONFIG_USB_ARC=m
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=y
+CONFIG_USB_GADGET_ARC_OTG=y
+# CONFIG_USB_GADGET_FSL_MC13783 is not set
+# CONFIG_USB_GADGET_FSL_1301 is not set
+# CONFIG_USB_GADGET_FSL_1504 is not set
+CONFIG_USB_GADGET_FSL_UTMI=y
+# CONFIG_USB_ZERO is not set
+CONFIG_USB_ETH=m
+CONFIG_USB_ETH_RNDIS=y
+# CONFIG_USB_GADGETFS is not set
+CONFIG_USB_FILE_STORAGE=m
+# CONFIG_USB_FILE_STORAGE_TEST is not set
+CONFIG_USB_G_SERIAL=m
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+CONFIG_MMC=y
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=y
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_BOUNCE=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SPI is not set
+# CONFIG_MMC_MXC is not set
+CONFIG_MMC_IMX_ESDHCI=y
+# CONFIG_MMC_IMX_ESDHCI_SELECT2 is not set
+# CONFIG_MMC_IMX_ESDHCI_PIO_MODE is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_NEW_LEDS is not set
+CONFIG_RTC_LIB=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_HCTOSYS=y
+CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=y
+CONFIG_RTC_INTF_PROC=y
+CONFIG_RTC_INTF_DEV=y
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_MXC is not set
+# CONFIG_RTC_DRV_MXC_V2 is not set
+CONFIG_RTC_DRV_IMXDI=y
+# CONFIG_DMADEVICES is not set
+CONFIG_REGULATOR=y
+# CONFIG_REGULATOR_DEBUG is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+CONFIG_REGULATOR_MC34704=y
+# CONFIG_UIO is not set
+
+#
+# MXC support drivers
+#
+
+#
+# MXC SSI support
+#
+# CONFIG_MXC_SSI is not set
+
+#
+# MXC Digital Audio Multiplexer support
+#
+# CONFIG_MXC_DAM is not set
+
+#
+# MXC PMIC support
+#
+CONFIG_MXC_PMIC=y
+# CONFIG_MXC_PMIC_MC13783 is not set
+# CONFIG_MXC_PMIC_MC13892 is not set
+CONFIG_MXC_PMIC_MC34704=y
+# CONFIG_MXC_PMIC_MC9SDZ60 is not set
+CONFIG_MXC_PMIC_CHARDEV=y
+
+#
+# MXC PMIC Client Drivers
+#
+# CONFIG_MXC_PMIC_MC9S08DZ60 is not set
+
+#
+# MXC Security Drivers
+#
+# CONFIG_MXC_SECURITY_SCC is not set
+# CONFIG_MXC_SECURITY_RNG is not set
+# CONFIG_MXC_DRYICE is not set
+
+#
+# MXC MPEG4 Encoder Kernel module support
+#
+# CONFIG_MXC_HMP4E is not set
+
+#
+# MXC HARDWARE EVENT
+#
+# CONFIG_MXC_HWEVENT is not set
+
+#
+# MXC VPU(Video Processing Unit) support
+#
+
+#
+# MXC Asynchronous Sample Rate Converter support
+#
+
+#
+# MXC Bluetooth support
+#
+
+#
+# Broadcom GPS ioctrl support
+#
+
+#
+# MXC Media Local Bus Driver
+#
+
+#
+# i.MX ADC support
+#
+CONFIG_IMX_ADC=y
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+# CONFIG_EXT3_FS is not set
+# CONFIG_EXT4_FS is not set
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+CONFIG_FILE_LOCKING=y
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+CONFIG_AUTOFS4_FS=m
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_FS_DEBUG=0
+CONFIG_JFFS2_FS_WRITEBUFFER=y
+# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
+# CONFIG_JFFS2_SUMMARY is not set
+# CONFIG_JFFS2_FS_XATTR is not set
+# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
+CONFIG_JFFS2_ZLIB=y
+# CONFIG_JFFS2_LZO is not set
+CONFIG_JFFS2_RTIME=y
+# CONFIG_JFFS2_RUBIN is not set
+CONFIG_CRAMFS=y
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_SUNRPC_REGISTER_V4 is not set
+# CONFIG_RPCSEC_GSS_KRB5 is not set
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=y
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=m
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_FRAME_POINTER=y
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+CONFIG_HAVE_FUNCTION_TRACER=y
+
+#
+# Tracers
+#
+# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_DEBUG_USER is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+# CONFIG_CRYPTO_CRYPTODEV is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=y
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_CRC_CCITT=m
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_PLIST=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
diff --git a/target/device/Freescale/imx25/target_device_table.txt b/target/device/Freescale/imx25/target_device_table.txt
new file mode 100644
index 0000000..c054000
--- /dev/null
+++ b/target/device/Freescale/imx25/target_device_table.txt
@@ -0,0 +1,185 @@
+# When building a target filesystem, it is desirable to not have to
+# become root and then run 'mknod' a thousand times.  Using a device 
+# table you can create device nodes and directories "on the fly".
+#
+# This is a sample device table file for use with genext2fs.  You can
+# do all sorts of interesting things with a device table file.  For
+# example, if you want to adjust the permissions on a particular file
+# you can just add an entry like:
+#   /sbin/foobar        f       2755    0       0       -       -       -       -       -
+# and (assuming the file /sbin/foobar exists) it will be made setuid
+# root (regardless of what its permissions are on the host filesystem.
+# Furthermore, you can use a single table entry to create a many device
+# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
+# I could just use the following two table entries:
+#   /dev/hda    b       640     0       0       3       0       0       0       -
+#   /dev/hda    b       640     0       0       3       1       1       1       15
+# 
+# Device table entries take the form of:
+# <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+# where name is the file name,  type can be one of: 
+#       f       A regular file
+#       d       Directory
+#       c       Character special device file
+#       b       Block special device file
+#       p       Fifo (named pipe)
+# uid is the user id for the target file, gid is the group id for the
+# target file.  The rest of the entries (major, minor, etc) apply only 
+# to device special files.
+
+# Have fun
+# -Erik Andersen <andersen@codepoet.org>
+#
+
+#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/dev		d	755	0	0	-	-	-	-	-
+/dev/pts	d	755	0	0	-	-	-	-	-
+/dev/shm	d	755	0	0	-	-	-	-	-
+/tmp		d	1777	0	0	-	-	-	-	-
+/etc		d	755	0	0	-	-	-	-	-
+/home/default	d	2755	1000	1000	-	-	-	-	-
+#<name>					<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/bin/busybox				f	4755	0	0	-	-	-	-	-
+/etc/shadow				f	600	0	0	-	-	-	-	-
+/etc/passwd				f	644	0	0	-	-	-	-	-
+/etc/network/if-up.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
+/etc/network/if-down.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
+/usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
+# uncomment this to allow starting x as non-root
+#/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
+# Normal system devices
+/dev/mem	c	640	0	0	1	1	0	0	-
+/dev/kmem	c	640	0	0	1	2	0	0	-
+/dev/null	c	666	0	0	1	3	0	0	-
+/dev/zero	c	666	0	0	1	5	0	0	-
+/dev/random	c	666	0	0	1	8	0	0	-
+/dev/urandom	c	666	0	0	1	9	0	0	-
+/dev/ram	b	640	0	0	1	1	0	0	-
+/dev/ram	b	640	0	0	1	0	0	1	4
+/dev/loop	b	640	0	0	7	0	0	1	2
+/dev/rtc	c	640	0	0	10	135	-	-	-
+/dev/console	c	666	0	0	5	1	-	-	-
+/dev/tty	c	666	0	0	5	0	-	-	-
+/dev/tty	c	666	0	0	4	0	0	1	8
+/dev/ttyp	c	666	0	0	3	0	0	1	10
+/dev/ptyp	c       666     0       0       2       0       0       1       10
+/dev/ptmx	c	666	0	0	5	2	-	-	-
+/dev/ttyP	c	666	0	0	57	0	0	1	4
+/dev/ttyS	c	666	0	0	4	64	0	1	4
+/dev/fb		c	640	0	5	29	0	0	1	4
+#/dev/ttySA	c	666	0	0	204	5	0	1	3
+/dev/psaux	c	666	0	0	10	1	0	0	-
+#/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyCPM	c	666	0	0	204	46	0	1	4
+/dev/ttyAMA	c	666	0	0	204	64	0	1	4
+/dev/ttySAC	c	666	0	0	204	64	0	1	4
+/dev/ttyPSC	c	666	0	0	204	148	0	1	4
+/dev/ttyUL	c	666	0	0	204	187	0	1	4
+/dev/ttymxc	c	666	0	0	207	16	0	1	3
+
+# Input stuff
+/dev/input		d	755	0	0	-	-	-	-	-
+/dev/input/mice		c	640	0	0	13	63	0	0	-
+/dev/input/mouse	c	660	0	0	13	32	0	1	4
+/dev/input/event	c	660	0	0	13	64	0	1	4
+#/dev/input/js		c	660	0	0	13	0	0	1	4
+
+
+# MTD stuff
+/dev/mtd	c	640	0	0	90	0	0	2	4
+/dev/mtdblock	b	640	0	0	31	0	0	1	4
+
+#Tun/tap driver
+/dev/net	d	755	0	0	-	-	-	-	-
+/dev/net/tun	c	660	0	0	10	200	-	-	-
+
+# Audio stuff
+#/dev/audio	c	666	0	29	14	4	-	-	-
+#/dev/audio1	c	666	0	29	14	20	-	-	-
+#/dev/dsp	c	666	0	29	14	3	-	-	-
+#/dev/dsp1	c	666	0	29	14	19	-	-	-
+#/dev/sndstat	c	666	0	29	14	6	-	-	-
+
+# User-mode Linux stuff
+#/dev/ubda	b	640	0	0	98	0	0	0	-
+#/dev/ubda	b	640	0	0	98	1	1	1	15
+
+# IDE Devices
+/dev/hda	b	640	0	0	3	0	0	0	-
+/dev/hda	b	640	0	0	3	1	1	1	15
+/dev/hdb	b	640	0	0	3	64	0	0	-
+/dev/hdb	b	640	0	0	3	65	1	1	15
+#/dev/hdc	b	640	0	0	22	0	0	0	-
+#/dev/hdc	b	640	0	0	22	1	1	1	15
+#/dev/hdd	b	640	0	0	22	64	0	0	-
+#/dev/hdd	b	640	0	0	22	65	1	1	15
+#/dev/hde	b	640	0	0	33	0	0	0	-
+#/dev/hde	b	640	0	0	33	1	1	1	15
+#/dev/hdf	b	640	0	0	33	64	0	0	-
+#/dev/hdf	b	640	0	0	33	65	1	1	15
+#/dev/hdg	b	640	0	0	34	0	0	0	-
+#/dev/hdg	b	640	0	0	34	1	1	1	15
+#/dev/hdh	b	640	0	0	34	64	0	0	-
+#/dev/hdh	b	640	0	0	34	65	1	1	15
+
+# SCSI Devices
+/dev/sda	b	640	0	0	8	0	0	0	-
+/dev/sda	b	640	0	0	8	1	1	1	15
+/dev/sdb	b	640	0	0	8	16	0	0	-
+/dev/sdb	b	640	0	0	8	17	1	1	15
+#/dev/sdc	b	640	0	0	8	32	0	0	-
+#/dev/sdc	b	640	0	0	8	33	1	1	15
+#/dev/sdd	b	640	0	0	8	48	0	0	-
+#/dev/sdd	b	640	0	0	8	49	1	1	15
+#/dev/sde	b	640	0	0	8	64	0	0	-
+#/dev/sde	b	640	0	0	8	65	1	1	15
+#/dev/sdf	b	640	0	0	8	80	0	0	-
+#/dev/sdf	b	640	0	0	8	81	1	1	15
+#/dev/sdg	b	640	0	0	8	96	0	0	-
+#/dev/sdg	b	640	0	0	8	97	1	1	15
+#/dev/sdh	b	640	0	0	8	112	0	0	-
+#/dev/sdh	b	640	0	0	8	113	1	1	15
+#/dev/sg	c	640	0	0	21	0	0	1	15
+#/dev/scd	b	640	0	0	11	0	0	1	15
+#/dev/st	c	640	0	0	9	0	0	1	8
+#/dev/nst	c	640	0	0	9	128	0	1	8
+#/dev/st	c	640	0	0	9	32	1	1	4
+#/dev/st	c	640	0	0	9	64	1	1	4
+#/dev/st	c	640	0	0	9	96	1	1	4
+
+# USB block devices (ub driver)
+/dev/uba	b	640	0	0	180	0	0	0	-
+/dev/uba	b	640	0	0	180	1	1	1	6
+/dev/ubb	b	640	0	0	180	8	0	0	-
+/dev/ubb	b	640	0	0	180	65	1	1	6
+
+# Floppy disk devices
+#/dev/fd	b	640	0	0	2	0	0	1	2
+#/dev/fd0d360	b	640	0	0	2	4	0	0	-
+#/dev/fd1d360	b	640	0	0	2	5	0	0	-
+#/dev/fd0h1200	b	640	0	0	2	8	0	0	-
+#/dev/fd1h1200	b	640	0	0	2	9	0	0	-
+#/dev/fd0u1440	b	640	0	0	2	28	0	0	-
+#/dev/fd1u1440	b	640	0	0	2	29	0	0	-
+#/dev/fd0u2880	b	640	0	0	2	32	0	0	-
+#/dev/fd1u2880	b	640	0	0	2	33	0	0	-
+
+# All the proprietary cdrom devices in the world
+#/dev/aztcd	b	640	0	0	29	0	0	0	-
+#/dev/bpcd	b	640	0	0	41	0	0	0	-
+#/dev/capi20	c	640	0	0	68	0	0	1	2
+#/dev/cdu31a	b	640	0	0	15	0	0	0	-
+#/dev/cdu535	b	640	0	0	24	0	0	0	-
+#/dev/cm206cd	b	640	0	0	32	0	0	0	-
+#/dev/sjcd	b	640	0	0	18	0	0	0	-
+#/dev/sonycd	b	640	0	0	15	0	0	0	-
+#/dev/gscd	b	640	0	0	16	0	0	0	-
+#/dev/sbpcd	b	640	0	0	25	0	0	0	-
+#/dev/sbpcd	b	640	0	0	25	0	0	1	4
+#/dev/mcd	b	640	0	0	23	0	0	0	-
+#/dev/optcd	b	640	0	0	17	0	0	0	-
+
+# I2C device nodes
+/dev/i2c-	c	666	0	0	89	0	0	1	4
diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index 2689f69..ba51ec5 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -69,6 +69,14 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	  If your board requires a custom patch, add the path to the file here.
 	  Most users may leave this empty
 
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_SITE
+	string "Patch download site"
+	default "http://download.berlios.de/mx25patches/" if BR2_TARGET_FREESCALE_BOARDS_IMX25
+	help 
+	  If your custom patch should automatically be downloaded, enter
+	  the URL here.
+	  Leave empty if unsure.
+
 choice
 	prompt "Bootsource"
 	depends on BR2_BOOTSOURCE
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 5efbd54..d69b231 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -63,13 +63,19 @@ endef
 $(DL_DIR)/$(U_BOOT_SOURCE):
 	 $(call DOWNLOAD,$(U_BOOT_SITE),$(U_BOOT_SOURCE))
 
-$(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
+ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_SITE)),)
+$(DL_DIR)/$(BR2_TARGET_UBOOT_CUSTOM_PATCH):
+	 $(call DOWNLOAD,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_SITE),$(BR2_TARGET_UBOOT_CUSTOM_PATCH))
+UBOOT_CUSTOM_PATCH_LOCATION=$(DL_DIR)/$(BR2_TARGET_UBOOT_CUSTOM_PATCH)
+endif
+
+$(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE) 
 	$(U_BOOT_CAT) $(DL_DIR)/$(U_BOOT_SOURCE) \
 		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	mkdir -p $(U_BOOT_DIR)
 	touch $@
 
-$(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
+$(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked $(UBOOT_CUSTOM_PATCH_LOCATION)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
@@ -78,9 +84,15 @@ ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),)
 endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 	@mkdir -p $(U_BOOT_PATCH_DIR)
+
+ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_SITE)),)
+	cp -dpr $(DL_DIR)/$(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) \*
+else
 	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) \*.patch
 endif
+endif
 	touch $@
 
 $(U_BOOT_DIR)/.configured: $(U_BOOT_DIR)/.patched
diff --git a/toolchain/kernel-headers/linux-2.6.28-unifdef-getline.patch b/toolchain/kernel-headers/linux-2.6.28-unifdef-getline.patch
new file mode 100644
index 0000000..f4a4820
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.28-unifdef-getline.patch
@@ -0,0 +1,56 @@
+From d15bd1067b1fcb2b7250d22bc0c7c7fea0b759f7 Mon Sep 17 00:00:00 2001
+From: Justin P. Mattock <justinmattock@gmail.com>
+Date: Sat, 7 Mar 2009 13:31:29 +0100
+Subject: [PATCH] kbuild: fix C libary confusion in unifdef.c due to getline()
+
+This fixes an error when compiling the kernel.
+
+  CHK     include/linux/version.h
+  HOSTCC  scripts/unifdef
+scripts/unifdef.c:209: error: conflicting types for 'getline'
+/usr/include/stdio.h:651: note: previous declaration of 'getline' was here
+make[1]: *** [scripts/unifdef] Error 1
+make: *** [__headers] Error 2
+
+Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
+Cc:  Frederic Weisbecker <fweisbec@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
+---
+ scripts/unifdef.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/unifdef.c b/scripts/unifdef.c
+index 552025e..05a31a6 100644
+--- a/scripts/unifdef.c
++++ b/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         get_line(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = get_line();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++get_line(void)
+ {
+ 	const char *cp;
+ 	int cursym;
+-- 
+1.6.3.3
+
-- 
1.6.3.3
