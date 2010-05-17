From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 17 May 2010 02:49:42 +0200
Subject: [Buildroot] [PATCH] atngw100_defconfig: update to fix build failure
Message-ID: <1274057382-27365-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

atngw100_defconfig: update to fix build failure:

  * The AVR32 toolchain fails to build with the new uClibc version
    0.9.31.x. Use the older uClibc 0.9.30.x branch instead.
  * Disable linux-fusion as it fails to build
    (why was this selected anyway, when DirectFB was not selected?).
  * U-Boot 2010.03 is broken for AVR32. The build fails with:
      zlib.c:31:27: error: asm/unaligned.h: No such file or directory
    Select the older U-Boot 2009.08 version that builds instead.
  * Disable rsync as it fails to build.
  * host-mtd fails when BR2_JLEVEL=3 and not for BR_JLEVEL=1. Use 1.

Build tested with 'make distclean && make atngw100_defconfig && make'
on an Ubuntu 10.04 x86_64 host.
---
 configs/atngw100_defconfig |  698 ++++++++++++++++++++++----------------------
 1 files changed, 352 insertions(+), 346 deletions(-)

diff --git a/configs/atngw100_defconfig b/configs/atngw100_defconfig
index 995aee1..41bc933 100644
--- a/configs/atngw100_defconfig
+++ b/configs/atngw100_defconfig
@@ -1,9 +1,9 @@
 #
 # Automatically generated make config: don't edit
-# Wed May 13 12:33:57 2009
+# Mon May 17 00:57:05 2010
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_VERSION="2009.05-rc1"
+BR2_VERSION="2010.05-rc2"
 # BR2_alpha is not set
 # BR2_arm is not set
 # BR2_armeb is not set
@@ -14,13 +14,13 @@ BR2_avr32=y
 # BR2_m68k is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
-# BR2_nios2 is not set
 # BR2_powerpc is not set
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
 # BR2_sparc64 is not set
 # BR2_x86_64 is not set
+# BR2_xtensa is not set
 BR2_ARCH="avr32"
 BR2_ENDIAN="BIG"
 
@@ -29,16 +29,8 @@ BR2_ENDIAN="BIG"
 #
 
 #
-# Project Options
-#
-BR2_PROJECT="atngw100"
-BR2_HOSTNAME="ngw.example.net"
-BR2_BANNER="ATNGW100 ($(DATE))"
-
-#
 # Preset Devices
 #
-# BR2_TARGET_AMD is not set
 BR2_BOARD_NAME="atngw100"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
 BR2_TARGET_ATMEL=y
@@ -59,7 +51,6 @@ BR2_TARGET_AT32AP7000=y
 # BR2_TARGET_AVR32_ATSTK1005 is not set
 BR2_TARGET_AVR32_ATNGW100=y
 # BR2_TARGET_AVR32_ATNGW100_BASE is not set
-# BR2_TARGET_AVR32_ATNGW100_EXPANDED is not set
 
 #
 # Package support
@@ -72,27 +63,24 @@ BR2_TARGET_ATMEL_COPYTO=""
 # BR2_TARGET_VALKA is not set
 
 #
-# Generic System Support
-#
-# BR2_TARGET_GENERIC_ACCESS_POINT is not set
-# BR2_TARGET_GENERIC_FIREWALL is not set
-
-#
-# Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support
+# Build options
 #
 
 #
-# Build options
+# Commands
 #
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
+BR2_BZR_CO="bzr co"
+BR2_BZR_UP="bzr up"
 BR2_GIT="git clone"
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
 BR2_DL_DIR="$(TOPDIR)/dl"
 BR2_COPYTO=""
+BR2_STAGING_DIR="$(BASE_DIR)/staging"
 
 #
 # Mirrors and Download locations
@@ -103,19 +91,10 @@ BR2_SOURCEFORGE_MIRROR="easynews"
 BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
 BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
 BR2_DEBIAN_MIRROR="http://ftp.debian.org"
-
-#
-# Atmel Mirrors
-#
 BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot/"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
-BR2_STAGING_DIR="$(BASE_DIR)/staging"
-# BR2_FPU_SUFFIX is not set
-BR2_TOPDIR_PREFIX=""
-BR2_TOPDIR_SUFFIX=""
-BR2_JLEVEL=3
+BR2_JLEVEL=1
 # BR2_DEPRECATED is not set
-BR2_CONFIG_CACHE=y
 # BR2_ENABLE_DEBUG is not set
 BR2_STRIP_strip=y
 # BR2_STRIP_sstrip is not set
@@ -130,6 +109,11 @@ BR2_OPTIMIZE_S=y
 # BR2_HAVE_DEVFILES is not set
 
 #
+# Advanced
+#
+BR2_CONFIG_CACHE=y
+
+#
 # Toolchain
 #
 BR2_TOOLCHAIN_BUILDROOT=y
@@ -138,69 +122,64 @@ BR2_TOOLCHAIN_BUILDROOT=y
 #
 # Kernel Header Options
 #
-# BR2_KERNEL_HEADERS_2_6_23 is not set
-# BR2_KERNEL_HEADERS_2_6_24 is not set
-# BR2_KERNEL_HEADERS_2_6_25 is not set
-# BR2_KERNEL_HEADERS_2_6_26 is not set
 # BR2_KERNEL_HEADERS_2_6_27 is not set
 # BR2_KERNEL_HEADERS_2_6_28 is not set
-BR2_KERNEL_HEADERS_2_6_29=y
+# BR2_KERNEL_HEADERS_2_6_29 is not set
+# BR2_KERNEL_HEADERS_2_6_30 is not set
+# BR2_KERNEL_HEADERS_2_6_31 is not set
+# BR2_KERNEL_HEADERS_2_6_32 is not set
+BR2_KERNEL_HEADERS_2_6_33=y
+# BR2_KERNEL_HEADERS_VERSION is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.29.2"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.33.3"
 
 #
 # uClibc Options
 #
 # BR2_UCLIBC_VERSION_0_9_28_3 is not set
 # BR2_UCLIBC_VERSION_0_9_29 is not set
-# BR2_UCLIBC_VERSION_0_9_30 is not set
-BR2_UCLIBC_VERSION_0_9_30_1=y
+BR2_UCLIBC_VERSION_0_9_30=y
+# BR2_UCLIBC_VERSION_0_9_31 is not set
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_VERSION_STRING="0.9.30.1"
+BR2_UCLIBC_VERSION_STRING="0.9.30.3"
 BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 # BR2_PTHREAD_DEBUG is not set
-# BR2_PROGRAM_INVOCATION is not set
 # BR2_UCLIBC_INSTALL_TEST_SUITE is not set
 
 #
 # Binutils Options
 #
 # BR2_BINUTILS_VERSION_2_17 is not set
-# BR2_BINUTILS_VERSION_2_17_50_0_17 is not set
 # BR2_BINUTILS_VERSION_2_18 is not set
-# BR2_BINUTILS_VERSION_2_18_50_0_1 is not set
-# BR2_BINUTILS_VERSION_2_18_50_0_3 is not set
-# BR2_BINUTILS_VERSION_2_18_50_0_6 is not set
-# BR2_BINUTILS_VERSION_2_18_50_0_8 is not set
-# BR2_BINUTILS_VERSION_2_18_50_0_9 is not set
 BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1=y
 # BR2_BINUTILS_VERSION_2_19 is not set
 # BR2_BINUTILS_VERSION_2_19_1 is not set
+# BR2_BINUTILS_VERSION_2_20 is not set
+# BR2_BINUTILS_VERSION_2_20_1 is not set
 BR2_BINUTILS_VERSION="2.18-avr32-1.0.1"
 BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
 
 #
 # GCC Options
 #
-# BR2_GCC_VERSION_3_4_6 is not set
-# BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
 # BR2_GCC_VERSION_4_2_1 is not set
 # BR2_GCC_VERSION_4_2_2 is not set
 BR2_GCC_VERSION_4_2_2_AVR32_2_1_5=y
 # BR2_GCC_VERSION_4_2_3 is not set
 # BR2_GCC_VERSION_4_2_4 is not set
-# BR2_GCC_VERSION_4_3_1 is not set
 # BR2_GCC_VERSION_4_3_2 is not set
 # BR2_GCC_VERSION_4_3_3 is not set
+# BR2_GCC_VERSION_4_3_4 is not set
 # BR2_GCC_VERSION_4_4_X is not set
+# BR2_GCC_VERSION_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
-# BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2-avr32-2.1.5"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_SHARED_LIBGCC=y
+BR2_GCC_ENABLE_TLS=y
 
 #
 # Ccache Options
@@ -212,14 +191,18 @@ BR2_CCACHE_DIR="$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
 # Gdb Options
 #
 # BR2_PACKAGE_GDB is not set
+
+#
+# Gdb debugger for the target needs WCHAR support in toolchain
+#
 BR2_PACKAGE_GDB_SERVER=y
 BR2_PACKAGE_GDB_HOST=y
-# BR2_GDB_VERSION_6_4 is not set
-# BR2_GDB_VERSION_6_5 is not set
 # BR2_GDB_VERSION_6_6 is not set
 # BR2_GDB_VERSION_6_7_1 is not set
 BR2_GDB_VERSION_6_7_1_AVR32_2_1_5=y
 # BR2_GDB_VERSION_6_8 is not set
+# BR2_GDB_VERSION_7_0_1 is not set
+# BR2_GDB_VERSION_7_1 is not set
 BR2_GDB_VERSION="6.7.1-avr32-2.1.5"
 
 #
@@ -231,12 +214,14 @@ BR2_INET_RPC=y
 BR2_ENABLE_LOCALE=y
 # BR2_ENABLE_LOCALE_PURGE is not set
 BR2_USE_WCHAR=y
+BR2_PREFER_SOFT_FLOAT=y
 BR2_SOFT_FLOAT=y
 BR2_USE_SSP=y
 # BR2_PTHREADS_NONE is not set
 # BR2_PTHREADS is not set
 BR2_PTHREADS_OLD=y
 # BR2_PTHREADS_NATIVE is not set
+# BR2_PROGRAM_INVOCATION is not set
 BR2_GCC_CROSS_CXX=y
 BR2_INSTALL_LIBSTDCPP=y
 BR2_TARGET_OPTIMIZATION="-Os -pipe"
@@ -252,230 +237,159 @@ BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 BR2_PACKAGE_BUSYBOX=y
 # BR2_BUSYBOX_VERSION_1_12_X is not set
 # BR2_BUSYBOX_VERSION_1_13_X is not set
-BR2_BUSYBOX_VERSION_1_14_X=y
+# BR2_BUSYBOX_VERSION_1_14_X is not set
+# BR2_BUSYBOX_VERSION_1_15_X is not set
+BR2_BUSYBOX_VERSION_1_16_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.14.0"
+BR2_BUSYBOX_VERSION="1.16.1"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
 BR2_PACKAGE_BUSYBOX_SKELETON=y
+# BR2_PACKAGE_CUSTOMIZE is not set
 
 #
-# The minimum needed to build a uClibc development system
+# Audio and video libraries and applications
 #
-# BR2_PACKAGE_FLEX is not set
-# BR2_PACKAGE_GCC_TARGET is not set
-# BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_ALSA_LIB is not set
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
+# BR2_PACKAGE_FESTIVAL is not set
+# BR2_PACKAGE_TAGLIB is not set
+# BR2_PACKAGE_TREMOR is not set
 
 #
-# Other development stuff
+# Compressors and decompressors
+#
+# BR2_PACKAGE_LZOP is not set
+# BR2_PACKAGE_LZMA is not set
+
+#
+# Debugging, profiling and benchmark
+#
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LMBENCH is not set
+# BR2_PACKAGE_LSOF is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_NETPERF is not set
+# BR2_PACKAGE_OPROFILE is not set
+BR2_PACKAGE_STRACE=y
+
+#
+# Development tools
 #
 # BR2_PACKAGE_AUTOCONF is not set
 # BR2_PACKAGE_AUTOMAKE is not set
 # BR2_PACKAGE_BISON is not set
-# BR2_PACKAGE_CCACHE_TARGET is not set
+# BR2_PACKAGE_BSDIFF is not set
 # BR2_PACKAGE_CVS is not set
 # BR2_PACKAGE_DISTCC is not set
-# BR2_PACKAGE_DMALLOC is not set
 # BR2_PACKAGE_FAKEROOT is not set
+# BR2_PACKAGE_FLEX is not set
+
+#
+# native toolchain needs development files in target filesystem
+#
 BR2_PACKAGE_GETTEXT=y
 BR2_PACKAGE_LIBINTL=y
 # BR2_PACKAGE_LIBGMP is not set
 # BR2_PACKAGE_GPERF is not set
+# BR2_PACKAGE_INTLTOOL is not set
+# BR2_PACKAGE_MAKE is not set
 # BR2_PACKAGE_LIBMPFR is not set
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
-# BR2_PACKAGE_OPROFILE is not set
 # BR2_PACKAGE_PKG_CONFIG is not set
-# BR2_PACKAGE_READLINE is not set
-# BR2_PACKAGE_PCRE is not set
 
 #
-# Other stuff
+# Games
 #
-# BR2_PACKAGE_AT is not set
-# BR2_PACKAGE_BEECRYPT is not set
-# BR2_PACKAGE_BERKELEYDB is not set
-# BR2_PACKAGE_BSDIFF is not set
-# BR2_PACKAGE_CUPS is not set
-# BR2_PACKAGE_CUSTOMIZE is not set
-# BR2_PACKAGE_FILE is not set
-# BR2_PACKAGE_GAMIN is not set
-# BR2_PACKAGE_ICU is not set
-# BR2_PACKAGE_KEXEC is not set
-# BR2_PACKAGE_LIBCONFIG is not set
-# BR2_PACKAGE_LIBCONFUSE is not set
-BR2_PACKAGE_LIBDAEMON=y
-# BR2_PACKAGE_LIBELF is not set
-# BR2_PACKAGE_LIBEVENT is not set
-# BR2_PACKAGE_LIBGCRYPT is not set
-# BR2_PACKAGE_LIBGPG_ERROR is not set
-BR2_PACKAGE_LIBICONV=y
-# BR2_PACKAGE_LIBIDN is not set
-# BR2_PACKAGE_LIBLOCKFILE is not set
-# BR2_PACKAGE_LIBOIL is not set
-# BR2_PACKAGE_LIBSYSFS is not set
-# BR2_PACKAGE_LOCKFILE_PROGS is not set
-# BR2_PACKAGE_LOGROTATE is not set
-# BR2_PACKAGE_LSOF is not set
-# BR2_PACKAGE_LTP-TESTSUITE is not set
-# BR2_PACKAGE_LTRACE is not set
-# BR2_PACKAGE_MEMSTAT is not set
-# BR2_PACKAGE_NG_SPICE_REWORK is not set
-# BR2_PACKAGE_POPT is not set
-# BR2_PACKAGE_SCREEN is not set
-# BR2_PACKAGE_SHARED_MIME_INFO is not set
-# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
-BR2_PACKAGE_STRACE=y
-# BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_PRBOOM is not set
 
 #
-# Database
+# Graphic libraries and applications (graphic/text)
 #
-# BR2_PACKAGE_MYSQL_CLIENT is not set
-# BR2_PACKAGE_SQLITE is not set
 
 #
-# Networking
+# graphic libraries
 #
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_LINUX_FUSION is not set
+# BR2_PACKAGE_SDL is not set
 
 #
-# Networking applications
+# other GUIs
 #
-# BR2_PACKAGE_ARGUS is not set
-BR2_PACKAGE_AVAHI=y
-BR2_PACKAGE_AVAHI_AUTOIPD=y
-# BR2_PACKAGE_AVAHI_DAEMON is not set
-# BR2_PACKAGE_AXEL is not set
-# BR2_PACKAGE_BIND is not set
-BR2_PACKAGE_BRIDGE=y
-BR2_PACKAGE_DNSMASQ=y
-BR2_PACKAGE_DNSMASQ_TFTP=y
-BR2_PACKAGE_DROPBEAR=y
-# BR2_PACKAGE_ETHTOOL is not set
-BR2_PACKAGE_HASERL=y
-# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
-BR2_PACKAGE_HASERL_VERSION_0_9_X=y
-BR2_PACKAGE_HASERL_VERSION="0.9.25"
-# BR2_PACKAGE_IFPLUGD is not set
-# BR2_PACKAGE_IPERF is not set
-# BR2_PACKAGE_IPROUTE2 is not set
-# BR2_PACKAGE_IPSEC_TOOLS is not set
-BR2_PACKAGE_IPTABLES=y
-# BR2_PACKAGE_KISMET is not set
-# BR2_PACKAGE_L2TP is not set
-# BR2_PACKAGE_LIBCGI is not set
-# BR2_PACKAGE_LIBCGICC is not set
-# BR2_PACKAGE_LIBCURL is not set
-# BR2_PACKAGE_LIBDNET is not set
-# BR2_PACKAGE_LIBEXOSIP2 is not set
-# BR2_PACKAGE_LIBOSIP2 is not set
-# BR2_PACKAGE_LIBPCAP is not set
-# BR2_PACKAGE_LIBSOUP is not set
-# BR2_PACKAGE_LIBUPNP is not set
-# BR2_PACKAGE_LINKS is not set
-BR2_PACKAGE_LRZSZ=y
-# BR2_PACKAGE_MDNSRESPONDER is not set
-# BR2_PACKAGE_MIIDIAG is not set
-# BR2_PACKAGE_MROUTED is not set
-# BR2_PACKAGE_MUTT is not set
-BR2_PACKAGE_NBD=y
-BR2_PACKAGE_NCFTP=y
+# BR2_PACKAGE_QT is not set
+# BR2_PACKAGE_XORG7 is not set
 
 #
-# ncFTP tools selection
+# X libraries and helper libraries
 #
-# BR2_PACKAGE_NCFTP_GET is not set
-# BR2_PACKAGE_NCFTP_PUT is not set
-# BR2_PACKAGE_NCFTP_LS is not set
-# BR2_PACKAGE_NCFTP_BATCH is not set
-# BR2_PACKAGE_NCFTP_BOOKMARKS is not set
-# BR2_PACKAGE_NEON is not set
-# BR2_PACKAGE_NETKITBASE is not set
-# BR2_PACKAGE_NETKITTELNET is not set
-# BR2_PACKAGE_NETPLUG is not set
-# BR2_PACKAGE_NETSNMP is not set
-# BR2_PACKAGE_NFS_UTILS is not set
-BR2_PACKAGE_NTP=y
-# BR2_PACKAGE_NTP_SNTP is not set
-# BR2_PACKAGE_OLSR is not set
-# BR2_PACKAGE_OPENNTPD is not set
-# BR2_PACKAGE_OPENSSH is not set
-# BR2_PACKAGE_OPENSSL is not set
-# BR2_PACKAGE_OPENVPN is not set
-BR2_PACKAGE_PORTMAP=y
-# BR2_PACKAGE_PPPD is not set
-# BR2_PACKAGE_RADVD is not set
-# BR2_PACKAGE_RP_PPPOE is not set
-# BR2_PACKAGE_PPTP_LINUX is not set
-BR2_PACKAGE_PROFTPD=y
+# BR2_PACKAGE_LIBERATION is not set
 
 #
-# quagga suite
+# X Window managers
 #
-# BR2_PACKAGE_QUAGGA_ZEBRA is not set
-# BR2_PACKAGE_QUAGGA_BGPD is not set
-# BR2_PACKAGE_QUAGGA_RIPD is not set
-# BR2_PACKAGE_QUAGGA_RIPNGD is not set
-# BR2_PACKAGE_QUAGGA_OSPFD is not set
-# BR2_PACKAGE_QUAGGA_OSPF6D is not set
-# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
-# BR2_PACKAGE_QUAGGA_ISISD is not set
-BR2_PACKAGE_RSYNC=y
-# BR2_PACKAGE_SAMBA is not set
-# BR2_PACKAGE_SOCAT is not set
-# BR2_PACKAGE_STUNNEL is not set
-# BR2_PACKAGE_TCPDUMP is not set
-# BR2_PACKAGE_DHCPDUMP is not set
-# BR2_PACKAGE_TFTPD is not set
-# BR2_PACKAGE_TN5250 is not set
-# BR2_PACKAGE_TTCP is not set
-# BR2_PACKAGE_UDPCAST is not set
-# BR2_PACKAGE_VPNC is not set
-# BR2_PACKAGE_VSFTPD is not set
-# BR2_PACKAGE_VTUN is not set
-# BR2_PACKAGE_WEBIF is not set
-BR2_PACKAGE_WIRELESS_TOOLS=y
-# BR2_PACKAGE_WPA_SUPPLICANT is not set
 
 #
-# Hardware handling / blockdevices and filesystem maintenance
+# X applications
 #
+# BR2_PACKAGE_GOB2 is not set
+# BR2_PACKAGE_SYLPHEED is not set
 
 #
-# dbus not available (need expat or libxml2)
+# Hardware handling
 #
+# BR2_PACKAGE_CDRKIT is not set
+# BR2_PACKAGE_CRAMFS is not set
 
 #
-# dbus-glib needs dbus to be compiled with expat support
+# dbus not available (need expat or libxml2)
 #
-# BR2_PACKAGE_DEVMEM2 is not set
-# BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
+# BR2_PACKAGE_DOSFSTOOLS is not set
 # BR2_PACKAGE_E2FSPROGS is not set
 # BR2_PACKAGE_EEPROG is not set
 # BR2_PACKAGE_FCONFIG is not set
 # BR2_PACKAGE_FIS is not set
-# BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
+# BR2_PACKAGE_GENEXT2FS is not set
+# BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_GVFS is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
 # BR2_PACKAGE_I2C_TOOLS is not set
 # BR2_PACKAGE_INPUT_TOOLS is not set
 # BR2_PACKAGE_IOSTAT is not set
-# BR2_PACKAGE_LIBAIO is not set
-# BR2_PACKAGE_LIBRAW1394 is not set
-# BR2_PACKAGE_LIBUSB is not set
 # BR2_PACKAGE_LM_SENSORS is not set
 # BR2_PACKAGE_LVM2 is not set
+# BR2_PACKAGE_MAKEDEVS is not set
 # BR2_PACKAGE_MDADM is not set
 # BR2_PACKAGE_MEMTESTER is not set
-# BR2_PACKAGE_MKDOSFS is not set
 BR2_PACKAGE_MTD=y
-BR2_PACKAGE_MTD_UTILS=y
-# BR2_PACKAGE_MTD_20061007 is not set
-# BR2_PACKAGE_MTD_20050122 is not set
-# BR2_PACKAGE_MTD_UTILS_GIT is not set
 
 #
 # MTD tools selection
@@ -487,156 +401,271 @@ BR2_PACKAGE_MTD_FLASH_ERASE=y
 BR2_PACKAGE_MTD_FLASH_ERASEALL=y
 BR2_PACKAGE_MTD_FLASH_INFO=y
 # BR2_PACKAGE_MTD_FLASH_LOCK is not set
+# BR2_PACKAGE_MTD_FLASH_OTP_DUMP is not set
+# BR2_PACKAGE_MTD_FLASH_OTP_INFO is not set
 # BR2_PACKAGE_MTD_FLASH_UNLOCK is not set
 # BR2_PACKAGE_MTD_FTL_CHECK is not set
 # BR2_PACKAGE_MTD_FTL_FORMAT is not set
 # BR2_PACKAGE_MTD_JFFS2DUMP is not set
 # BR2_PACKAGE_MTD_MKFSJFFS2 is not set
-# BR2_PACKAGE_MTD_MKFSJFFS is not set
 BR2_PACKAGE_MTD_MTD_DEBUG=y
 # BR2_PACKAGE_MTD_NANDDUMP is not set
+BR2_PACKAGE_MTD_NANDTEST=y
 # BR2_PACKAGE_MTD_NANDWRITE is not set
-# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
 # BR2_PACKAGE_MTD_NFTLDUMP is not set
+# BR2_PACKAGE_MTD_NFTL_FORMAT is not set
+# BR2_PACKAGE_MTD_RECV_IMAGE is not set
+# BR2_PACKAGE_MTD_RFDDUMP is not set
+# BR2_PACKAGE_MTD_RFDFORMAT is not set
+# BR2_PACKAGE_MTD_SERVE_IMAGE is not set
 # BR2_PACKAGE_MTD_SUMTOOL is not set
+BR2_PACKAGE_MTD_MTDINFO=y
+BR2_PACKAGE_MTD_UBIATTACH=y
+BR2_PACKAGE_MTD_UBICRC32=y
+BR2_PACKAGE_MTD_UBIDETACH=y
+BR2_PACKAGE_MTD_UBIFORMAT=y
+BR2_PACKAGE_MTD_UBIMKVOL=y
+BR2_PACKAGE_MTD_UBINFO=y
+BR2_PACKAGE_MTD_UBINIZE=y
+BR2_PACKAGE_MTD_UBIRENAME=y
+BR2_PACKAGE_MTD_UBIRMVOL=y
+BR2_PACKAGE_MTD_UBIRSVOL=y
+BR2_PACKAGE_MTD_UBIUPDATEVOL=y
 # BR2_PACKAGE_NTFS_3G is not set
+# BR2_PACKAGE_NTFSPROGS is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_SETSERIAL is not set
 # BR2_PACKAGE_SMARTMONTOOLS is not set
+# BR2_PACKAGE_SQUASHFS is not set
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_USB_MODESWITCH is not set
 # BR2_PACKAGE_USBMOUNT is not set
 # BR2_PACKAGE_USBUTILS is not set
 # BR2_PACKAGE_WIPE is not set
 # BR2_PACKAGE_XFSPROGS is not set
 
 #
-# Audio and video libraries and applications
+# Interpreter languages and scripting
 #
-# BR2_PACKAGE_ALSA_LIB is not set
+BR2_PACKAGE_HASERL=y
+# BR2_PACKAGE_HASERL_WITH_LUA is not set
+# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
+BR2_PACKAGE_HASERL_VERSION_0_9_X=y
+BR2_PACKAGE_HASERL_VERSION="0.9.26"
+# BR2_PACKAGE_LUA is not set
+# BR2_PACKAGE_MICROPERL is not set
+# BR2_PACKAGE_PHP is not set
+# BR2_PACKAGE_PYTHON is not set
+# BR2_PACKAGE_RUBY is not set
+# BR2_PACKAGE_TCL is not set
 
 #
-# asterisk	- disabled (required openssl and mpg123)
+# Libraries
 #
-# BR2_PACKAGE_AUMIX is not set
-# BR2_PACKAGE_FLAC is not set
-# BR2_PACKAGE_GSTREAMER is not set
-# BR2_PACKAGE_LIBID3TAG is not set
-# BR2_PACKAGE_LIBMAD is not set
-# BR2_PACKAGE_LIBMPD is not set
-# BR2_PACKAGE_LIBOGG is not set
-# BR2_PACKAGE_LIBSNDFILE is not set
-# BR2_PACKAGE_LIBTHEORA is not set
-# BR2_PACKAGE_LIBVORBIS is not set
-# BR2_PACKAGE_MADPLAY is not set
-# BR2_PACKAGE_MPG123 is not set
-# BR2_PACKAGE_MPLAYER is not set
-# BR2_PACKAGE_SPEEX is not set
-# BR2_PACKAGE_FESTIVAL is not set
-# BR2_PACKAGE_TAGLIB is not set
-# BR2_PACKAGE_VLC is not set
 
 #
-# Graphic libraries and applications (graphic/text)
+# Compression and decompression
 #
+# BR2_PACKAGE_LIBARCHIVE is not set
+BR2_PACKAGE_LZO=y
+BR2_PACKAGE_ZLIB=y
 
 #
-# text rendering libraries
+# Crypto
 #
-# BR2_PACKAGE_NCURSES is not set
-# BR2_PACKAGE_NEWT is not set
-# BR2_PACKAGE_SLANG is not set
+# BR2_PACKAGE_BEECRYPT is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
+# BR2_PACKAGE_OPENSSL is not set
 
 #
-# text rendering applications
+# Database
 #
-# BR2_PACKAGE_DIALOG is not set
+# BR2_PACKAGE_BERKELEYDB is not set
+# BR2_PACKAGE_MYSQL_CLIENT is not set
+# BR2_PACKAGE_SQLITE is not set
 
 #
-# graphic libraries
+# Filesystem
 #
-# BR2_PACKAGE_DIRECTFB is not set
-# BR2_PACKAGE_FBDUMP is not set
-# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_GAMIN is not set
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
+# BR2_PACKAGE_LIBFUSE is not set
+# BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBSYSFS is not set
+
+#
+# Graphics
+#
+# BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
 # BR2_PACKAGE_JPEG is not set
 # BR2_PACKAGE_LIBART is not set
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
-BR2_PACKAGE_LINUX_FUSION=y
+# BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_PIXMAN is not set
-# BR2_PACKAGE_SDL is not set
 # BR2_PACKAGE_TIFF is not set
+# BR2_PACKAGE_WEBKIT is not set
 
 #
-# busybox graphic applications
+# Hardware handling
 #
+# BR2_PACKAGE_LIBAIO is not set
+# BR2_PACKAGE_LIBRAW1394 is not set
+# BR2_PACKAGE_TSLIB is not set
+# BR2_PACKAGE_LIBUSB is not set
 
 #
-# --> May be broken in busybox
+# Java
 #
-# BR2_PACKAGE_FBV is not set
-# BR2_PACKAGE_FBSET is not set
+# BR2_PACKAGE_CLASSPATH is not set
 
 #
-# other GUIs
+# Networking
 #
-# BR2_PACKAGE_QT is not set
-BR2_PACKAGE_XSERVER_none=y
-# BR2_PACKAGE_XSERVER_xorg is not set
-# BR2_PACKAGE_XSERVER_tinyx is not set
+# BR2_PACKAGE_LIBCGI is not set
+# BR2_PACKAGE_LIBCGICC is not set
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBMICROHTTPD is not set
+# BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_LIBNL is not set
+# BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBRSYNC is not set
+# BR2_PACKAGE_LIBSOUP is not set
+# BR2_PACKAGE_LIBUPNP is not set
 
 #
-# X libraries and helper libraries
+# Other
 #
-# BR2_PACKAGE_ATK is not set
-# BR2_PACKAGE_CAIRO is not set
-# BR2_PACKAGE_PANGO is not set
-# BR2_PACKAGE_LIBDRM is not set
-# BR2_PACKAGE_LIBERATION is not set
+# BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBCAP is not set
+BR2_PACKAGE_LIBDAEMON=y
+# BR2_PACKAGE_LIBELF is not set
+# BR2_PACKAGE_LIBEVENT is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
-# BR2_PACKAGE_OPENMOTIF is not set
-# BR2_PACKAGE_FONTCONFIG is not set
-# BR2_PACKAGE_FREETYPE is not set
-# BR2_PACKAGE_TSLIB is not set
-# BR2_PACKAGE_WEBKIT is not set
+# BR2_PACKAGE_LIBOIL is not set
+# BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 
 #
-# X Window managers
+# Text and terminal handling
 #
-# BR2_PACKAGE_MATCHBOX is not set
+# BR2_PACKAGE_ENCHANT is not set
+# BR2_PACKAGE_ICU is not set
+BR2_PACKAGE_LIBICONV=y
+# BR2_PACKAGE_NCURSES is not set
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_PCRE is not set
+# BR2_PACKAGE_POPT is not set
+# BR2_PACKAGE_READLINE is not set
+# BR2_PACKAGE_SLANG is not set
 
 #
-# X applications
+# XML
 #
-# BR2_PACKAGE_ALSAMIXERGUI is not set
+# BR2_PACKAGE_EXPAT is not set
+# BR2_PACKAGE_EZXML is not set
+# BR2_PACKAGE_LIBXML_PARSER_PERL is not set
+# BR2_PACKAGE_LIBXML2 is not set
+# BR2_PACKAGE_LIBXSLT is not set
+# BR2_PACKAGE_XERCES is not set
 
 #
-# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
+# Miscellaneous
 #
-# BR2_PACKAGE_GQVIEW is not set
-# BR2_PACKAGE_GOB2 is not set
-# BR2_PACKAGE_LEAFPAD is not set
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
 
 #
-# midori		- disabled (requires Xorg(7))
+# Networking applications
 #
-# BR2_PACKAGE_PCMANFM is not set
-# BR2_PACKAGE_SYLPHEED is not set
-# BR2_PACKAGE_TORSMO is not set
-# BR2_PACKAGE_X11VNC is not set
-# BR2_PACKAGE_XPDF is not set
-# BR2_PACKAGE_XSTROKE is not set
-# BR2_PACKAGE_XVKBD is not set
+# BR2_PACKAGE_ARGUS is not set
+BR2_PACKAGE_AVAHI=y
+BR2_PACKAGE_AVAHI_AUTOIPD=y
+# BR2_PACKAGE_AVAHI_DAEMON is not set
+# BR2_PACKAGE_AXEL is not set
+# BR2_PACKAGE_BIND is not set
+# BR2_PACKAGE_BMON is not set
+BR2_PACKAGE_BRIDGE=y
+# BR2_PACKAGE_CTORRENT is not set
+# BR2_PACKAGE_CUPS is not set
+BR2_PACKAGE_DNSMASQ=y
+BR2_PACKAGE_DNSMASQ_TFTP=y
+BR2_PACKAGE_DNSMASQ_DHCP=y
+# BR2_PACKAGE_DNSMASQ_IDN is not set
+BR2_PACKAGE_DROPBEAR=y
+# BR2_PACKAGE_ETHTOOL is not set
+# BR2_PACKAGE_HOSTAPD is not set
+# BR2_PACKAGE_IFPLUGD is not set
+# BR2_PACKAGE_IPERF is not set
+# BR2_PACKAGE_IPROUTE2 is not set
+# BR2_PACKAGE_IPSEC_TOOLS is not set
+BR2_PACKAGE_IPTABLES=y
+# BR2_PACKAGE_IW is not set
+# BR2_PACKAGE_KISMET is not set
+# BR2_PACKAGE_L2TP is not set
+# BR2_PACKAGE_LINKS is not set
+BR2_PACKAGE_LRZSZ=y
+# BR2_PACKAGE_MIIDIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MUTT is not set
+BR2_PACKAGE_NBD=y
+BR2_NBD_CLIENT=y
+# BR2_NBD_SERVER is not set
+BR2_PACKAGE_NCFTP=y
 
 #
-# Compressors / decompressors
+# ncFTP tools selection
 #
-BR2_PACKAGE_LZO=y
-# BR2_PACKAGE_LZOP is not set
-# BR2_PACKAGE_LZMA is not set
-# BR2_PACKAGE_LZMA_HOST is not set
-BR2_PACKAGE_ZLIB=y
-# BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
+# BR2_PACKAGE_NCFTP_GET is not set
+# BR2_PACKAGE_NCFTP_PUT is not set
+# BR2_PACKAGE_NCFTP_LS is not set
+# BR2_PACKAGE_NCFTP_BATCH is not set
+# BR2_PACKAGE_NCFTP_BOOKMARKS is not set
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+# BR2_PACKAGE_NFS_UTILS is not set
+BR2_PACKAGE_NTP=y
+# BR2_PACKAGE_NTP_SNTP is not set
+# BR2_PACKAGE_OLSR is not set
+# BR2_PACKAGE_OPENNTPD is not set
+# BR2_PACKAGE_OPENSSH is not set
+# BR2_PACKAGE_OPENVPN is not set
+BR2_PACKAGE_PORTMAP=y
+# BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RADVD is not set
+# BR2_PACKAGE_RP_PPPOE is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
+BR2_PACKAGE_PROFTPD=y
+# BR2_PACKAGE_QUAGGA is not set
+# BR2_PACKAGE_RSYNC is not set
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+# BR2_PACKAGE_SQUID is not set
+# BR2_PACKAGE_STUNNEL is not set
+# BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_TTCP is not set
+# BR2_PACKAGE_UDPCAST is not set
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
+# BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WEBIF is not set
+BR2_PACKAGE_WIRELESS_TOOLS=y
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
 
 #
 # Package managers
@@ -645,47 +674,32 @@ BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_PORTAGE is not set
 
 #
-# Interpreter languages / Scripting
-#
-# BR2_PACKAGE_LUA is not set
-# BR2_PACKAGE_MICROPERL is not set
-# BR2_PACKAGE_PYTHON is not set
-# BR2_PACKAGE_RUBY is not set
-# BR2_PACKAGE_TCL is not set
-# BR2_PACKAGE_PHP is not set
-
-#
-# XML handling
+# Shell and utilities
 #
-# BR2_PACKAGE_EXPAT is not set
-# BR2_PACKAGE_EZXML is not set
-# BR2_PACKAGE_LIBXML2 is not set
-# BR2_PACKAGE_LIBXSLT is not set
-# BR2_PACKAGE_XERCES is not set
+# BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_DIALOG is not set
+# BR2_PACKAGE_FILE is not set
+# BR2_PACKAGE_LOCKFILE_PROGS is not set
+# BR2_PACKAGE_LOGROTATE is not set
+# BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_WHICH is not set
 
 #
-# Java
+# System tools
 #
-# BR2_PACKAGE_CLASSPATH is not set
 
 #
-# Games
+# Text editors and viewers
 #
-# BR2_PACKAGE_GNUCHESS is not set
-# BR2_PACKAGE_MAGICCUBE4D is not set
-# BR2_PACKAGE_PRBOOM is not set
-# BR2_PACKAGE_RUBIX is not set
-# BR2_PACKAGE_VICE is not set
-# BR2_PACKAGE_XBOARD is not set
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_UEMACS is not set
 
 #
 # Target filesystem options
 #
-BR2_ROOTFS_PREFIX="rootfs"
-
-#
-# filesystem for target device
-#
+BR2_ROOTFS_POST_BUILD_SCRIPT=""
 BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atngw100/device_table.txt"
 # BR2_TARGET_ROOTFS_CRAMFS is not set
 # BR2_TARGET_ROOTFS_CLOOP is not set
@@ -693,6 +707,7 @@ BR2_ROOTFS_DEVICE_TABLE="target/device/Atmel/atngw100/device_table.txt"
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
+# BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_512_16K is not set
 # BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K is not set
 BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
 # BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
@@ -705,8 +720,6 @@ BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 # BR2_TARGET_ROOTFS_JFFS2_LE is not set
 BR2_TARGET_ROOTFS_JFFS2_BE=y
 # BR2_TARGET_ROOTFS_JFFS2_SUMMARY is not set
-
-
 # BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
@@ -715,22 +728,24 @@ BR2_TARGET_ROOTFS_TAR_NONE=y
 # BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
 # BR2_TARGET_ROOTFS_TAR_LZMA is not set
 BR2_TARGET_ROOTFS_TAR_OPTIONS=""
-
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
 # BR2_TARGET_ROOTFS_ROMFS is not set
 
 #
-# bootloader for target device
+# Bootloaders
 #
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="atngw100"
+# BR2_TARGET_UBOOT_2010_03 is not set
+# BR2_TARGET_UBOOT_2009_11 is not set
+BR2_TARGET_UBOOT_2009_08=y
+# BR2_TARGET_UBOOT_2009_06 is not set
 # BR2_TARGET_UBOOT_2009_03 is not set
 # BR2_TARGET_UBOOT_2009_01 is not set
-BR2_TARGET_UBOOT_2008_10=y
-# BR2_TARGET_UBOOT_1_3_4 is not set
+# BR2_TARGET_UBOOT_2008_10 is not set
 # BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
-BR2_UBOOT_VERSION="2008.10"
+BR2_UBOOT_VERSION="2009.08"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 # BR2_TARGET_U_BOOT_ARCH_PATCH is not set
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
@@ -771,34 +786,27 @@ BR2_KERNEL_LINUX_ADVANCED=y
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.29.2.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.29.2"
-BR2_KERNEL_LATEST_2_6_29="2"
-BR2_KERNEL_LATEST_2_6_28="7"
-BR2_KERNEL_LATEST_2_6_27="13"
-BR2_KERNEL_LATEST_2_6_26="8"
-BR2_KERNEL_LATEST_2_6_25="19"
-BR2_KERNEL_LATEST_2_6_24="7"
-BR2_KERNEL_LATEST_2_6_23="17"
-BR2_KERNEL_LATEST_2_6_22="19"
-BR2_KERNEL_LATEST_2_6_21="7"
-BR2_KERNEL_LATEST_2_6_20="21"
-BR2_KERNEL_PATCH_LEVEL="2"
+BR2_KERNEL_CURRENT_VERSION="2.6.33.2"
+BR2_KERNEL_LATEST_2_6_33="2"
+BR2_KERNEL_LATEST_2_6_32="11"
+BR2_KERNEL_LATEST_2_6_31="13"
+BR2_KERNEL_LATEST_2_6_30="10"
+BR2_KERNEL_LATEST_2_6_29="6"
+BR2_KERNEL_LATEST_2_6_28="10"
+BR2_KERNEL_LATEST_2_6_27="46"
+BR2_KERNEL_PATCH_LEVEL="6"
+BR2_KERNEL_NEXT_VERSION="2.6.30"
 BR2_KERNEL_THIS_VERSION="2.6.29"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6"
-BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
-BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 BR2_KERNEL_PATCH_SITE="$(BR2_KERNEL_SITE)"
 # BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_33 is not set
+# BR2_LINUX_2_6_32 is not set
+# BR2_LINUX_2_6_31 is not set
+# BR2_LINUX_2_6_30 is not set
 BR2_LINUX_2_6_29=y
 # BR2_LINUX_2_6_28 is not set
 # BR2_LINUX_2_6_27 is not set
-# BR2_LINUX_2_6_26 is not set
-# BR2_LINUX_2_6_25 is not set
-# BR2_LINUX_2_6_24 is not set
-# BR2_LINUX_2_6_23 is not set
-# BR2_LINUX_2_6_22 is not set
-# BR2_LINUX_2_6_21 is not set
-# BR2_LINUX_2_6_20 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
@@ -812,8 +820,6 @@ BR2_KERNEL_ADD_LATEST_MINORPATCH=y
 # BR2_KERNEL_ADD_RC_PATCH is not set
 # BR2_KERNEL_ADD_LATEST_SNAPSHOT is not set
 # BR2_KERNEL_ADD_SNAPSHOT is not set
-# BR2_KERNEL_ADD_LATEST_MM_PATCH is not set
-# BR2_KERNEL_ADD_MM_PATCH is not set
 BR2_KERNEL_ADD_PATCH=y
 # BR2_KERNEL_ARCH_PATCH_ENABLED is not set
 BR2_LINUX_BSP_PATCH=""
-- 
1.7.0.4
