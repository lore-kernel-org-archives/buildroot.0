From: Daniel Nilsson <daniel@dnil.se>
Date: Sun, 19 Feb 2012 23:15:30 +0100
Subject: [Buildroot] mysql_client +uClibc segfaults on ARM
Message-ID: <4F417482.10002@dnil.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've played around with buildroot 2011.11 for some time now and I'd like 
to first off express that I'm impressed with the quality and the ease of 
use that you have been able to apply to this piece of software! Nice job!

While I've been able to get an older ARM board working with the help to 
BR I do have some issue with the combination of mysql-client and uClibc. 
I can't find any bugreports related to this so I thought I'd ask for 
advice here.

My custom application uses libmysqlclient to connect to a database, 
however I get a segfault when the application calls mysql_real_connect() 
(running on the target). The mysql-client library also install the mysql 
program in /usr/bin/mysql which also segfault on the target.

I have attempted to use mysql_client on the target with two different BR 
configs, one with uClibc and the other with Code Sourcery 2009.q3 
release and glibc. Using Code Sourcery and glibc both my application and 
"mysql" works as expected.

Back to the uClibc version and GDB proved a little difficult. GDB 7.3 
refused to read to binaries on my x86 host when running GDB in 
client/server mode:

#<host> arm-unknown-linux-uclibcgnueabi-gdb -q <my application>
Reading symbols from <my application>...I'm sorry, Dave, I can't do 
that.  Symbol format `elf32-littlearm' unknown.

So I rebuilt using full GDB 7.1 on the target and debugging symbols left 
on everything.

#<target> gdb --args /usr/bin/mysql -u user -p -h oden myenvtest
GNU gdb (GDB) 7.1
Copyright (C) 2010 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later 
<http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "arm-unknown-linux-uclibcgnueabi".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /usr/bin/mysql...done.
(gdb) run
Starting program: /usr/bin/mysql -u user -p -h oden myenvtest
[Thread debugging using libthread_db enabled]
Enter password:

Program received signal SIGSEGV, Segmentation fault.
0x4031c054 in strcasecmp () from /lib/libc.so.0
(gdb) where
#0  0x4031c054 in strcasecmp () from /lib/libc.so.0
#1  0x4032cd2c in ?? () from /lib/libc.so.0
Cannot access memory at address 0x0
#2  0x4032cd2c in ?? () from /lib/libc.so.0
Cannot access memory at address 0x0
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

I don't understand why I can't get better information out of a 
backtrace? Files are not stripped, I doubleechecked with both objdump 
--syms and file. The output from my custom application looks to same.

Maybe there are two bugs here, one related to either mysql_client or 
uClibc that makes applications using libmysqlclient seg fault. The other 
bug (?) is regarding why GDB 7.3 doesn't work and/or why 7.1 fails to 
produce a backtrace. In any case, since I'm new to BR I thought I'd ask 
here first before filing bug reports. I noticed GDB is upgraded to 7.4 
in GIT so maybe the GDB issues are known (though I failed to find 
relevant bug reports...?).

Below is my config for the uClibc version which is failing:

Regards
Daniel



BR2_HAVE_DOT_CONFIG=y
BR2_arm=y
BR2_arm920t=y
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_WGET="wget --passive-ftp -nd -t 3"
BR2_SVN="svn"
BR2_BZR="bzr"
BR2_GIT="git"
BR2_LOCALFILES="cp"
BR2_ZCAT="gzip -d -c"
BR2_BZCAT="bzcat"
BR2_XZCAT="xzcat"
BR2_TAR_OPTIONS=""
BR2_DL_DIR="$(TOPDIR)/dl"
BR2_HOST_DIR="$(BASE_DIR)/host"
BR2_PRIMARY_SITE=""
BR2_BACKUP_SITE="http://sources.buildroot.net/"
BR2_SOURCEFORGE_MIRROR="kent"
BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
BR2_DEBIAN_MIRROR="http://ftp.debian.org"
BR2_JLEVEL=4
BR2_ENABLE_DEBUG=y
BR2_DEBUG_2=y
BR2_STRIP_none=y
BR2_OPTIMIZE_S=y
BR2_PACKAGE_OVERRIDE_FILE="$(TOPDIR)/local.mk"
BR2_TOOLCHAIN_BUILDROOT=y
BR2_KERNEL_HEADERS_2_6_36=y
BR2_DEFAULT_KERNEL_HEADERS="2.6.36.4"
BR2_UCLIBC_VERSION_0_9_32=y
BR2_UCLIBC_VERSION_STRING="0.9.32"
BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.32.config"
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_21_1=y
BR2_BINUTILS_VERSION="2.21.1"
BR2_BINUTILS_EXTRA_CONFIG_OPTIONS=""
BR2_GCC_VERSION_4_3_X=y
BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE=y
BR2_GCC_VERSION="4.3.6"
BR2_EXTRA_GCC_CONFIG_OPTIONS=""
BR2_GCC_SHARED_LIBGCC=y
BR2_GCC_ENABLE_TLS=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_GDB_SERVER=y
BR2_PACKAGE_GDB_HOST=y
BR2_GDB_VERSION_7_1=y
BR2_GDB_VERSION="7.1a"
BR2_LARGEFILE=y
BR2_INET_RPC=y
BR2_USE_WCHAR=y
BR2_INSTALL_LIBSTDCPP=y
BR2_TOOLCHAIN_HAS_THREADS=y
BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED=y
BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS=y
BR2_ENABLE_LOCALE_PURGE=y
BR2_ENABLE_LOCALE_WHITELIST="C en_US"
BR2_NEEDS_GETTEXT=y
BR2_USE_MMU=y
BR2_PREFER_SOFT_FLOAT=y
BR2_SOFT_FLOAT=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_TARGET_LDFLAGS=""
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PTHREADS_NATIVE=y
BR2_TARGET_GENERIC_HOSTNAME="spitze"
BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt"
BR2_ROOTFS_SKELETON_DEFAULT=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAM0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y
BR2_ROOTFS_POST_BUILD_SCRIPT=""
BR2_PACKAGE_BUSYBOX=y
BR2_BUSYBOX_VERSION_1_19_X=y
BR2_BUSYBOX_VERSION="1.19.3"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.19.x.config"
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_LIBINTL=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_FLASHCP=y
BR2_PACKAGE_MTD_FLASH_ERASE=y
BR2_PACKAGE_MTD_FLASH_ERASEALL=y
BR2_PACKAGE_MTD_FLASH_INFO=y
BR2_PACKAGE_MTD_FLASH_LOCK=y
BR2_PACKAGE_MTD_FLASH_UNLOCK=y
BR2_PACKAGE_MTD_MTD_DEBUG=y
BR2_PACKAGE_MTD_MTDINFO=y
BR2_PACKAGE_MTD_UBIATTACH=y
BR2_PACKAGE_MTD_UBICRC32=y
BR2_PACKAGE_MTD_UBIDETACH=y
BR2_PACKAGE_MTD_UBIFORMAT=y
BR2_PACKAGE_MTD_UBIMKVOL=y
BR2_PACKAGE_MTD_UBINFO=y
BR2_PACKAGE_MTD_UBINIZE=y
BR2_PACKAGE_MTD_UBIRENAME=y
BR2_PACKAGE_MTD_UBIRMVOL=y
BR2_PACKAGE_MTD_UBIRSVOL=y
BR2_PACKAGE_MTD_UBIUPDATEVOL=y
BR2_PACKAGE_UDEV=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_MYSQL_CLIENT=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_LIBICONV=y
BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_READLINE=y
BR2_PACKAGE_DROPBEAR=y
BR2_PACKAGE_DROPBEAR_SMALL=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_SNTP=y
BR2_TARGET_ROOTFS_JFFS2=y
BR2_TARGET_ROOTFS_JFFS2_FLASH_128=y
BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
BR2_TARGET_ROOTFS_JFFS2_LE=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f800
BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2048
BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
BR2_TARGET_ROOTFS_UBIFS_GZIP=y
BR2_TARGET_ROOTFS_TAR=y
BR2_TARGET_ROOTFS_TAR_GZIP=y
BR2_TARGET_ROOTFS_TAR_OPTIONS=""
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="edb9307a"
BR2_TARGET_UBOOT_2010_06=y
BR2_TARGET_UBOOT_VERSION="2010.06"
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR=""
BR2_TARGET_UBOOT_FORMAT_BIN=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
BR2_LINUX_KERNEL_VERSION="2.6.36.4"
BR2_LINUX_KERNEL_PATCH=""
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="/srv/work/proj/envsens/edb9307/configs/kernel-2.6.36-r3"
BR2_LINUX_KERNEL_UIMAGE=y
