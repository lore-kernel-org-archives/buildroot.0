From: Adrian Weiler <a.weiler@aldea.de>
Date: Mon, 16 Mar 2015 19:35:19 +0100
Subject: [Buildroot] [PATCH 1/1] Support for the Lamobo R1 a.k.a.
	BananaPi-R1 router board
In-Reply-To: <1426530919-27935-1-git-send-email-a.weiler@aldea.de>
References: <1426530919-27935-1-git-send-email-a.weiler@aldea.de>
Message-ID: <1426530919-27935-2-git-send-email-a.weiler@aldea.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Weiler <a.weiler@aldea.de>
---
 board/bananapi/r1/busybox.config                   | 1054 ++++
 board/bananapi/r1/fs-overlay/etc/dnsmasq.conf      |  623 ++
 board/bananapi/r1/fs-overlay/etc/hostapd.conf      |   18 +
 board/bananapi/r1/fs-overlay/etc/init.d/S02led     |   32 +
 board/bananapi/r1/fs-overlay/etc/network/eth0.up   |   19 +
 .../bananapi/r1/fs-overlay/etc/network/interfaces  |   10 +
 board/bananapi/r1/fs-overlay/etc/network/wlan0.up  |    9 +
 board/bananapi/r1/fs-overlay/root/.ssh/.empty      |    0
 board/bananapi/r1/linux-3.19.1.config              |  263 +
 .../r1/patches/linux/linux-3.19-001-lamobo.patch   | 6004 ++++++++++++++++++++
 board/bananapi/r1/patches/package/.empty           |    0
 board/bananapi/r1/post-image.sh                    |  108 +
 board/bananapi/r1/uEnv.txt                         |    6 +
 boot/uboot/uboot-001-bananapi.patch                |   50 +
 configs/lamobo_r1_defconfig                        |   62 +
 package/Config.in                                  |    1 +
 package/swconfig/001-no-uci.patch                  |  236 +
 package/swconfig/Config.in                         |   11 +
 package/swconfig/swconfig.mk                       |   24 +
 19 files changed, 8530 insertions(+)
 create mode 100644 board/bananapi/r1/busybox.config
 create mode 100644 board/bananapi/r1/fs-overlay/etc/dnsmasq.conf
 create mode 100644 board/bananapi/r1/fs-overlay/etc/hostapd.conf
 create mode 100644 board/bananapi/r1/fs-overlay/etc/init.d/S02led
 create mode 100644 board/bananapi/r1/fs-overlay/etc/network/eth0.up
 create mode 100644 board/bananapi/r1/fs-overlay/etc/network/interfaces
 create mode 100644 board/bananapi/r1/fs-overlay/etc/network/wlan0.up
 create mode 100644 board/bananapi/r1/fs-overlay/root/.ssh/.empty
 create mode 100644 board/bananapi/r1/linux-3.19.1.config
 create mode 100644 board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch
 create mode 100644 board/bananapi/r1/patches/package/.empty
 create mode 100755 board/bananapi/r1/post-image.sh
 create mode 100644 board/bananapi/r1/uEnv.txt
 create mode 100644 boot/uboot/uboot-001-bananapi.patch
 create mode 100644 configs/lamobo_r1_defconfig
 create mode 100644 package/swconfig/001-no-uci.patch
 create mode 100644 package/swconfig/Config.in
 create mode 100644 package/swconfig/swconfig.mk

diff --git a/board/bananapi/r1/busybox.config b/board/bananapi/r1/busybox.config
new file mode 100644
index 0000000..a0846ae
--- /dev/null
+++ b/board/bananapi/r1/busybox.config
@@ -0,0 +1,1054 @@
+#
+# Automatically generated make config: don't edit
+# Busybox version: 1.23.1
+# Fri Mar 13 18:39:58 2015
+#
+CONFIG_HAVE_DOT_CONFIG=y
+
+#
+# Busybox Settings
+#
+
+#
+# General Configuration
+#
+CONFIG_DESKTOP=y
+# CONFIG_EXTRA_COMPAT is not set
+CONFIG_INCLUDE_SUSv2=y
+# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_PLATFORM_LINUX=y
+CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
+CONFIG_SHOW_USAGE=y
+CONFIG_FEATURE_VERBOSE_USAGE=y
+# CONFIG_FEATURE_COMPRESS_USAGE is not set
+CONFIG_FEATURE_INSTALLER=y
+# CONFIG_INSTALL_NO_USR is not set
+# CONFIG_LOCALE_SUPPORT is not set
+# CONFIG_UNICODE_SUPPORT is not set
+# CONFIG_UNICODE_USING_LOCALE is not set
+# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
+CONFIG_SUBST_WCHAR=0
+CONFIG_LAST_SUPPORTED_WCHAR=0
+# CONFIG_UNICODE_COMBINING_WCHARS is not set
+# CONFIG_UNICODE_WIDE_WCHARS is not set
+# CONFIG_UNICODE_BIDI_SUPPORT is not set
+# CONFIG_UNICODE_NEUTRAL_TABLE is not set
+# CONFIG_UNICODE_PRESERVE_BROKEN is not set
+# CONFIG_PAM is not set
+CONFIG_FEATURE_USE_SENDFILE=y
+CONFIG_LONG_OPTS=y
+CONFIG_FEATURE_DEVPTS=y
+CONFIG_FEATURE_CLEAN_UP=y
+CONFIG_FEATURE_UTMP=y
+CONFIG_FEATURE_WTMP=y
+# CONFIG_FEATURE_PIDFILE is not set
+CONFIG_PID_FILE_PATH=""
+CONFIG_FEATURE_SUID=y
+# CONFIG_FEATURE_SUID_CONFIG is not set
+# CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_PREFER_APPLETS is not set
+CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+CONFIG_FEATURE_SYSLOG=y
+# CONFIG_FEATURE_HAVE_RPC is not set
+
+#
+# Build Options
+#
+# CONFIG_STATIC is not set
+# CONFIG_PIE is not set
+# CONFIG_NOMMU is not set
+# CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_INDIVIDUAL is not set
+# CONFIG_FEATURE_SHARED_BUSYBOX is not set
+CONFIG_LFS=y
+CONFIG_CROSS_COMPILER_PREFIX=""
+CONFIG_SYSROOT=""
+CONFIG_EXTRA_CFLAGS=""
+CONFIG_EXTRA_LDFLAGS=""
+CONFIG_EXTRA_LDLIBS=""
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_UNIT_TEST is not set
+# CONFIG_WERROR is not set
+CONFIG_NO_DEBUG_LIB=y
+# CONFIG_DMALLOC is not set
+# CONFIG_EFENCE is not set
+
+#
+# Installation Options ("make install" behavior)
+#
+CONFIG_INSTALL_APPLET_SYMLINKS=y
+# CONFIG_INSTALL_APPLET_HARDLINKS is not set
+# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
+# CONFIG_INSTALL_APPLET_DONT is not set
+# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
+# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
+# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
+CONFIG_PREFIX="./_install"
+
+#
+# Busybox Library Tuning
+#
+# CONFIG_FEATURE_SYSTEMD is not set
+CONFIG_FEATURE_RTMINMAX=y
+CONFIG_PASSWORD_MINLEN=6
+CONFIG_MD5_SMALL=1
+CONFIG_SHA3_SMALL=1
+# CONFIG_FEATURE_FAST_TOP is not set
+# CONFIG_FEATURE_ETC_NETWORKS is not set
+CONFIG_FEATURE_USE_TERMIOS=y
+CONFIG_FEATURE_EDITING=y
+CONFIG_FEATURE_EDITING_MAX_LEN=1024
+CONFIG_FEATURE_EDITING_VI=y
+CONFIG_FEATURE_EDITING_HISTORY=999
+CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
+CONFIG_FEATURE_REVERSE_SEARCH=y
+CONFIG_FEATURE_TAB_COMPLETION=y
+# CONFIG_FEATURE_USERNAME_COMPLETION is not set
+CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
+# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
+CONFIG_FEATURE_NON_POSIX_CP=y
+# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
+CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_FEATURE_SKIP_ROOTFS=y
+CONFIG_MONOTONIC_SYSCALL=y
+CONFIG_IOCTL_HEX2STR_ERROR=y
+CONFIG_FEATURE_HWIB=y
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+# CONFIG_FEATURE_SEAMLESS_XZ is not set
+# CONFIG_FEATURE_SEAMLESS_LZMA is not set
+# CONFIG_FEATURE_SEAMLESS_BZ2 is not set
+# CONFIG_FEATURE_SEAMLESS_GZ is not set
+# CONFIG_FEATURE_SEAMLESS_Z is not set
+CONFIG_AR=y
+# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
+CONFIG_FEATURE_AR_CREATE=y
+# CONFIG_UNCOMPRESS is not set
+CONFIG_GUNZIP=y
+CONFIG_BUNZIP2=y
+CONFIG_UNLZMA=y
+# CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_LZMA=y
+CONFIG_UNXZ=y
+CONFIG_XZ=y
+# CONFIG_BZIP2 is not set
+CONFIG_CPIO=y
+# CONFIG_FEATURE_CPIO_O is not set
+# CONFIG_FEATURE_CPIO_P is not set
+# CONFIG_DPKG is not set
+# CONFIG_DPKG_DEB is not set
+# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
+CONFIG_GZIP=y
+# CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
+CONFIG_GZIP_FAST=0
+# CONFIG_LZOP is not set
+# CONFIG_LZOP_COMPR_HIGH is not set
+# CONFIG_RPM is not set
+# CONFIG_RPM2CPIO is not set
+CONFIG_TAR=y
+CONFIG_FEATURE_TAR_CREATE=y
+# CONFIG_FEATURE_TAR_AUTODETECT is not set
+CONFIG_FEATURE_TAR_FROM=y
+# CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
+# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
+CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
+CONFIG_FEATURE_TAR_LONG_OPTIONS=y
+CONFIG_FEATURE_TAR_TO_COMMAND=y
+# CONFIG_FEATURE_TAR_UNAME_GNAME is not set
+# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
+# CONFIG_FEATURE_TAR_SELINUX is not set
+CONFIG_UNZIP=y
+
+#
+# Coreutils
+#
+CONFIG_BASENAME=y
+CONFIG_CAT=y
+CONFIG_DATE=y
+CONFIG_FEATURE_DATE_ISOFMT=y
+# CONFIG_FEATURE_DATE_NANO is not set
+CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_HOSTID=y
+CONFIG_ID=y
+# CONFIG_GROUPS is not set
+# CONFIG_SHUF is not set
+CONFIG_TEST=y
+CONFIG_FEATURE_TEST_64=y
+CONFIG_TOUCH=y
+# CONFIG_FEATURE_TOUCH_NODEREF is not set
+CONFIG_FEATURE_TOUCH_SUSV3=y
+CONFIG_TR=y
+CONFIG_FEATURE_TR_CLASSES=y
+CONFIG_FEATURE_TR_EQUIV=y
+CONFIG_UNLINK=y
+# CONFIG_BASE64 is not set
+CONFIG_WHO=y
+# CONFIG_USERS is not set
+# CONFIG_CAL is not set
+CONFIG_CATV=y
+CONFIG_CHGRP=y
+CONFIG_CHMOD=y
+CONFIG_CHOWN=y
+# CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
+CONFIG_CHROOT=y
+CONFIG_CKSUM=y
+# CONFIG_COMM is not set
+CONFIG_CP=y
+# CONFIG_FEATURE_CP_LONG_OPTIONS is not set
+CONFIG_CUT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
+CONFIG_FEATURE_DD_IBS_OBS=y
+CONFIG_DF=y
+# CONFIG_FEATURE_DF_FANCY is not set
+CONFIG_DIRNAME=y
+CONFIG_DOS2UNIX=y
+CONFIG_UNIX2DOS=y
+CONFIG_DU=y
+CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
+CONFIG_ECHO=y
+CONFIG_FEATURE_FANCY_ECHO=y
+CONFIG_ENV=y
+# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
+# CONFIG_EXPAND is not set
+# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
+CONFIG_EXPR=y
+CONFIG_EXPR_MATH_SUPPORT_64=y
+CONFIG_FALSE=y
+CONFIG_FOLD=y
+# CONFIG_FSYNC is not set
+CONFIG_HEAD=y
+CONFIG_FEATURE_FANCY_HEAD=y
+CONFIG_INSTALL=y
+CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
+CONFIG_LN=y
+CONFIG_LOGNAME=y
+CONFIG_LS=y
+CONFIG_FEATURE_LS_FILETYPES=y
+CONFIG_FEATURE_LS_FOLLOWLINKS=y
+CONFIG_FEATURE_LS_RECURSIVE=y
+CONFIG_FEATURE_LS_SORTFILES=y
+CONFIG_FEATURE_LS_TIMESTAMPS=y
+CONFIG_FEATURE_LS_USERNAME=y
+CONFIG_FEATURE_LS_COLOR=y
+CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=y
+CONFIG_MD5SUM=y
+CONFIG_MKDIR=y
+CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
+CONFIG_MKFIFO=y
+CONFIG_MKNOD=y
+CONFIG_MV=y
+CONFIG_FEATURE_MV_LONG_OPTIONS=y
+CONFIG_NICE=y
+CONFIG_NOHUP=y
+CONFIG_OD=y
+CONFIG_PRINTENV=y
+CONFIG_PRINTF=y
+CONFIG_PWD=y
+CONFIG_READLINK=y
+CONFIG_FEATURE_READLINK_FOLLOW=y
+CONFIG_REALPATH=y
+CONFIG_RM=y
+CONFIG_RMDIR=y
+# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
+CONFIG_SEQ=y
+CONFIG_SHA1SUM=y
+CONFIG_SHA256SUM=y
+CONFIG_SHA512SUM=y
+CONFIG_SHA3SUM=y
+CONFIG_SLEEP=y
+# CONFIG_FEATURE_FANCY_SLEEP is not set
+# CONFIG_FEATURE_FLOAT_SLEEP is not set
+CONFIG_SORT=y
+CONFIG_FEATURE_SORT_BIG=y
+# CONFIG_SPLIT is not set
+# CONFIG_FEATURE_SPLIT_FANCY is not set
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STTY=y
+# CONFIG_SUM is not set
+CONFIG_SYNC=y
+# CONFIG_TAC is not set
+CONFIG_TAIL=y
+CONFIG_FEATURE_FANCY_TAIL=y
+CONFIG_TEE=y
+CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
+CONFIG_TRUE=y
+CONFIG_TTY=y
+CONFIG_UNAME=y
+# CONFIG_UNEXPAND is not set
+# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
+CONFIG_UNIQ=y
+CONFIG_USLEEP=y
+CONFIG_UUDECODE=y
+CONFIG_UUENCODE=y
+CONFIG_WC=y
+# CONFIG_FEATURE_WC_LARGE is not set
+CONFIG_WHOAMI=y
+CONFIG_YES=y
+
+#
+# Common options
+#
+CONFIG_FEATURE_VERBOSE=y
+
+#
+# Common options for cp and mv
+#
+CONFIG_FEATURE_PRESERVE_HARDLINKS=y
+
+#
+# Common options for ls, more and telnet
+#
+CONFIG_FEATURE_AUTOWIDTH=y
+
+#
+# Common options for df, du, ls
+#
+CONFIG_FEATURE_HUMAN_READABLE=y
+
+#
+# Common options for md5sum, sha1sum, sha256sum, sha512sum, sha3sum
+#
+CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
+
+#
+# Console Utilities
+#
+CONFIG_CHVT=y
+# CONFIG_FGCONSOLE is not set
+CONFIG_CLEAR=y
+CONFIG_DEALLOCVT=y
+CONFIG_DUMPKMAP=y
+# CONFIG_KBD_MODE is not set
+CONFIG_LOADFONT=y
+CONFIG_LOADKMAP=y
+CONFIG_OPENVT=y
+CONFIG_RESET=y
+CONFIG_RESIZE=y
+CONFIG_FEATURE_RESIZE_PRINT=y
+CONFIG_SETCONSOLE=y
+# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
+# CONFIG_SETFONT is not set
+# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
+CONFIG_DEFAULT_SETFONT_DIR=""
+CONFIG_SETKEYCODES=y
+CONFIG_SETLOGCONS=y
+# CONFIG_SHOWKEY is not set
+
+#
+# Common options for loadfont and setfont
+#
+CONFIG_FEATURE_LOADFONT_PSF2=y
+CONFIG_FEATURE_LOADFONT_RAW=y
+
+#
+# Debian Utilities
+#
+CONFIG_MKTEMP=y
+CONFIG_PIPE_PROGRESS=y
+CONFIG_RUN_PARTS=y
+CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
+CONFIG_START_STOP_DAEMON=y
+CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
+CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+CONFIG_WHICH=y
+
+#
+# Editors
+#
+CONFIG_AWK=y
+# CONFIG_FEATURE_AWK_LIBM is not set
+CONFIG_FEATURE_AWK_GNU_EXTENSIONS=y
+CONFIG_CMP=y
+CONFIG_DIFF=y
+# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
+CONFIG_FEATURE_DIFF_DIR=y
+# CONFIG_ED is not set
+CONFIG_PATCH=y
+CONFIG_SED=y
+CONFIG_VI=y
+CONFIG_FEATURE_VI_MAX_LEN=4096
+CONFIG_FEATURE_VI_8BIT=y
+CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_YANKMARK=y
+CONFIG_FEATURE_VI_SEARCH=y
+# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
+CONFIG_FEATURE_VI_USE_SIGNALS=y
+CONFIG_FEATURE_VI_DOT_CMD=y
+CONFIG_FEATURE_VI_READONLY=y
+CONFIG_FEATURE_VI_SETOPTS=y
+CONFIG_FEATURE_VI_SET=y
+CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_ASK_TERMINAL=y
+CONFIG_FEATURE_VI_UNDO=y
+CONFIG_FEATURE_VI_UNDO_QUEUE=y
+CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=256
+CONFIG_FEATURE_ALLOW_EXEC=y
+
+#
+# Finding Utilities
+#
+CONFIG_FIND=y
+CONFIG_FEATURE_FIND_PRINT0=y
+CONFIG_FEATURE_FIND_MTIME=y
+CONFIG_FEATURE_FIND_MMIN=y
+CONFIG_FEATURE_FIND_PERM=y
+CONFIG_FEATURE_FIND_TYPE=y
+CONFIG_FEATURE_FIND_XDEV=y
+CONFIG_FEATURE_FIND_MAXDEPTH=y
+CONFIG_FEATURE_FIND_NEWER=y
+# CONFIG_FEATURE_FIND_INUM is not set
+CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_FEATURE_FIND_EXEC_PLUS=y
+CONFIG_FEATURE_FIND_USER=y
+CONFIG_FEATURE_FIND_GROUP=y
+CONFIG_FEATURE_FIND_NOT=y
+CONFIG_FEATURE_FIND_DEPTH=y
+CONFIG_FEATURE_FIND_PAREN=y
+CONFIG_FEATURE_FIND_SIZE=y
+CONFIG_FEATURE_FIND_PRUNE=y
+# CONFIG_FEATURE_FIND_DELETE is not set
+CONFIG_FEATURE_FIND_PATH=y
+CONFIG_FEATURE_FIND_REGEX=y
+# CONFIG_FEATURE_FIND_CONTEXT is not set
+# CONFIG_FEATURE_FIND_LINKS is not set
+CONFIG_GREP=y
+CONFIG_FEATURE_GREP_EGREP_ALIAS=y
+CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_FEATURE_GREP_CONTEXT=y
+CONFIG_XARGS=y
+# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
+CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
+CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
+
+#
+# Init Utilities
+#
+# CONFIG_BOOTCHARTD is not set
+# CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
+# CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
+CONFIG_HALT=y
+# CONFIG_FEATURE_CALL_TELINIT is not set
+CONFIG_TELINIT_PATH=""
+CONFIG_INIT=y
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_FEATURE_KILL_REMOVED=y
+CONFIG_FEATURE_KILL_DELAY=0
+CONFIG_FEATURE_INIT_SCTTY=y
+CONFIG_FEATURE_INIT_SYSLOG=y
+CONFIG_FEATURE_EXTRA_QUIET=y
+# CONFIG_FEATURE_INIT_COREDUMPS is not set
+CONFIG_FEATURE_INITRD=y
+CONFIG_INIT_TERMINAL_TYPE="linux"
+CONFIG_MESG=y
+CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP=y
+
+#
+# Login/Password Management Utilities
+#
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
+CONFIG_FEATURE_SHADOWPASSWDS=y
+# CONFIG_USE_BB_PWD_GRP is not set
+# CONFIG_USE_BB_SHADOW is not set
+CONFIG_USE_BB_CRYPT=y
+# CONFIG_USE_BB_CRYPT_SHA is not set
+CONFIG_ADDUSER=y
+# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+# CONFIG_FEATURE_CHECK_NAMES is not set
+CONFIG_LAST_ID=60000
+CONFIG_FIRST_SYSTEM_ID=100
+CONFIG_LAST_SYSTEM_ID=999
+CONFIG_ADDGROUP=y
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
+# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
+CONFIG_GETTY=y
+CONFIG_LOGIN=y
+# CONFIG_LOGIN_SESSION_AS_CHILD is not set
+# CONFIG_LOGIN_SCRIPTS is not set
+CONFIG_FEATURE_NOLOGIN=y
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
+# CONFIG_CRYPTPW is not set
+# CONFIG_CHPASSWD is not set
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
+CONFIG_SU=y
+CONFIG_FEATURE_SU_SYSLOG=y
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
+
+#
+# Linux Ext2 FS Progs
+#
+CONFIG_CHATTR=y
+CONFIG_FSCK=y
+CONFIG_LSATTR=y
+# CONFIG_TUNE2FS is not set
+
+#
+# Linux Module Utilities
+#
+# CONFIG_MODINFO is not set
+# CONFIG_MODPROBE_SMALL is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
+# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
+CONFIG_INSMOD=y
+CONFIG_RMMOD=y
+CONFIG_LSMOD=y
+CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
+CONFIG_MODPROBE=y
+# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
+# CONFIG_DEPMOD is not set
+
+#
+# Options common to multiple modutils
+#
+# CONFIG_FEATURE_2_4_MODULES is not set
+# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
+# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
+# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
+# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
+CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
+CONFIG_FEATURE_MODUTILS_ALIAS=y
+CONFIG_FEATURE_MODUTILS_SYMBOLS=y
+CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
+CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
+
+#
+# Linux System Utilities
+#
+# CONFIG_BLOCKDEV is not set
+# CONFIG_FATATTR is not set
+CONFIG_FSTRIM=y
+CONFIG_MDEV=y
+CONFIG_FEATURE_MDEV_CONF=y
+CONFIG_FEATURE_MDEV_RENAME=y
+# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
+CONFIG_FEATURE_MDEV_EXEC=y
+# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+# CONFIG_REV is not set
+# CONFIG_ACPID is not set
+# CONFIG_FEATURE_ACPID_COMPAT is not set
+CONFIG_BLKID=y
+# CONFIG_FEATURE_BLKID_TYPE is not set
+CONFIG_DMESG=y
+CONFIG_FEATURE_DMESG_PRETTY=y
+CONFIG_FBSET=y
+CONFIG_FEATURE_FBSET_FANCY=y
+CONFIG_FEATURE_FBSET_READMODE=y
+CONFIG_FDFLUSH=y
+CONFIG_FDFORMAT=y
+CONFIG_FDISK=y
+# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
+CONFIG_FEATURE_FDISK_WRITABLE=y
+# CONFIG_FEATURE_AIX_LABEL is not set
+# CONFIG_FEATURE_SGI_LABEL is not set
+# CONFIG_FEATURE_SUN_LABEL is not set
+# CONFIG_FEATURE_OSF_LABEL is not set
+CONFIG_FEATURE_GPT_LABEL=y
+CONFIG_FEATURE_FDISK_ADVANCED=y
+# CONFIG_FINDFS is not set
+# CONFIG_FLOCK is not set
+CONFIG_FREERAMDISK=y
+# CONFIG_FSCK_MINIX is not set
+# CONFIG_MKFS_EXT2 is not set
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
+# CONFIG_MKFS_REISER is not set
+# CONFIG_MKFS_VFAT is not set
+CONFIG_GETOPT=y
+CONFIG_FEATURE_GETOPT_LONG=y
+CONFIG_HEXDUMP=y
+# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
+CONFIG_HD=y
+CONFIG_HWCLOCK=y
+CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
+CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
+CONFIG_IPCRM=y
+CONFIG_IPCS=y
+CONFIG_LOSETUP=y
+CONFIG_LSPCI=y
+CONFIG_LSUSB=y
+CONFIG_MKSWAP=y
+# CONFIG_FEATURE_MKSWAP_UUID is not set
+CONFIG_MORE=y
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+# CONFIG_FEATURE_MOUNT_VERBOSE is not set
+# CONFIG_FEATURE_MOUNT_HELPERS is not set
+# CONFIG_FEATURE_MOUNT_LABEL is not set
+# CONFIG_FEATURE_MOUNT_NFS is not set
+CONFIG_FEATURE_MOUNT_CIFS=y
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+CONFIG_PIVOT_ROOT=y
+CONFIG_RDATE=y
+# CONFIG_RDEV is not set
+CONFIG_READPROFILE=y
+# CONFIG_RTCWAKE is not set
+# CONFIG_SCRIPT is not set
+# CONFIG_SCRIPTREPLAY is not set
+CONFIG_SETARCH=y
+CONFIG_SWAPONOFF=y
+# CONFIG_FEATURE_SWAPON_DISCARD is not set
+# CONFIG_FEATURE_SWAPON_PRI is not set
+CONFIG_SWITCH_ROOT=y
+CONFIG_UMOUNT=y
+CONFIG_FEATURE_UMOUNT_ALL=y
+
+#
+# Common options for mount/umount
+#
+CONFIG_FEATURE_MOUNT_LOOP=y
+CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
+# CONFIG_FEATURE_MTAB_SUPPORT is not set
+CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
+# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+CONFIG_FEATURE_VOLUMEID_EXFAT=y
+CONFIG_FEATURE_VOLUMEID_EXT=y
+CONFIG_FEATURE_VOLUMEID_F2FS=y
+CONFIG_FEATURE_VOLUMEID_FAT=y
+# CONFIG_FEATURE_VOLUMEID_HFS is not set
+# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
+# CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
+# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_NILFS is not set
+# CONFIG_FEATURE_VOLUMEID_NTFS is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
+# CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_UDF is not set
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_CONSPY is not set
+CONFIG_CROND=y
+# CONFIG_FEATURE_CROND_D is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
+CONFIG_LESS=y
+CONFIG_FEATURE_LESS_MAXLINES=9999999
+CONFIG_FEATURE_LESS_BRACKETS=y
+CONFIG_FEATURE_LESS_FLAGS=y
+# CONFIG_FEATURE_LESS_MARKS is not set
+CONFIG_FEATURE_LESS_REGEXP=y
+# CONFIG_FEATURE_LESS_WINCH is not set
+# CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
+# CONFIG_FEATURE_LESS_DASHCMD is not set
+# CONFIG_FEATURE_LESS_LINENUMS is not set
+# CONFIG_NANDWRITE is not set
+# CONFIG_NANDDUMP is not set
+# CONFIG_RFKILL is not set
+CONFIG_SETSERIAL=y
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+# CONFIG_UBIATTACH is not set
+# CONFIG_UBIDETACH is not set
+# CONFIG_UBIMKVOL is not set
+# CONFIG_UBIRMVOL is not set
+# CONFIG_UBIRSVOL is not set
+# CONFIG_UBIUPDATEVOL is not set
+# CONFIG_WALL is not set
+# CONFIG_ADJTIMEX is not set
+# CONFIG_BBCONFIG is not set
+# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
+# CONFIG_BEEP is not set
+CONFIG_FEATURE_BEEP_FREQ=0
+CONFIG_FEATURE_BEEP_LENGTH_MS=0
+# CONFIG_CHAT is not set
+# CONFIG_FEATURE_CHAT_NOFAIL is not set
+# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
+# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
+# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
+# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
+# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
+# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
+CONFIG_CHRT=y
+CONFIG_CRONTAB=y
+CONFIG_DC=y
+# CONFIG_FEATURE_DC_LIBM is not set
+# CONFIG_DEVFSD is not set
+# CONFIG_DEVFSD_MODLOAD is not set
+# CONFIG_DEVFSD_FG_NP is not set
+# CONFIG_DEVFSD_VERBOSE is not set
+# CONFIG_FEATURE_DEVFS is not set
+CONFIG_DEVMEM=y
+CONFIG_EJECT=y
+# CONFIG_FEATURE_EJECT_SCSI is not set
+# CONFIG_FBSPLASH is not set
+# CONFIG_FLASHCP is not set
+# CONFIG_FLASH_LOCK is not set
+# CONFIG_FLASH_UNLOCK is not set
+# CONFIG_FLASH_ERASEALL is not set
+# CONFIG_IONICE is not set
+# CONFIG_INOTIFYD is not set
+CONFIG_LAST=y
+CONFIG_FEATURE_LAST_SMALL=y
+# CONFIG_FEATURE_LAST_FANCY is not set
+CONFIG_HDPARM=y
+CONFIG_FEATURE_HDPARM_GET_IDENTITY=y
+# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
+# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+CONFIG_MAKEDEVS=y
+# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
+CONFIG_FEATURE_MAKEDEVS_TABLE=y
+# CONFIG_MAN is not set
+CONFIG_MICROCOM=y
+CONFIG_MOUNTPOINT=y
+CONFIG_MT=y
+# CONFIG_RAIDAUTORUN is not set
+# CONFIG_READAHEAD is not set
+CONFIG_RUNLEVEL=y
+# CONFIG_RX is not set
+CONFIG_SETSID=y
+CONFIG_STRINGS=y
+CONFIG_TIME=y
+# CONFIG_TIMEOUT is not set
+# CONFIG_TTYSIZE is not set
+# CONFIG_VOLNAME is not set
+CONFIG_WATCHDOG=y
+
+#
+# Networking Utilities
+#
+CONFIG_NAMEIF=y
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+# CONFIG_NBDCLIENT is not set
+# CONFIG_NC is not set
+# CONFIG_NC_SERVER is not set
+# CONFIG_NC_EXTRA is not set
+# CONFIG_NC_110_COMPAT is not set
+CONFIG_PING=y
+# CONFIG_PING6 is not set
+CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_WHOIS is not set
+CONFIG_FEATURE_IPV6=y
+# CONFIG_FEATURE_UNIX_LOCAL is not set
+# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
+# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
+# CONFIG_ARP is not set
+CONFIG_ARPING=y
+# CONFIG_BRCTL is not set
+# CONFIG_FEATURE_BRCTL_FANCY is not set
+# CONFIG_FEATURE_BRCTL_SHOW is not set
+CONFIG_DNSD=y
+CONFIG_ETHER_WAKE=y
+# CONFIG_FAKEIDENTD is not set
+# CONFIG_FTPD is not set
+# CONFIG_FEATURE_FTP_WRITE is not set
+# CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
+# CONFIG_FEATURE_FTP_AUTHENTICATION is not set
+# CONFIG_FTPGET is not set
+# CONFIG_FTPPUT is not set
+# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
+CONFIG_HOSTNAME=y
+# CONFIG_HTTPD is not set
+# CONFIG_FEATURE_HTTPD_RANGES is not set
+# CONFIG_FEATURE_HTTPD_SETUID is not set
+# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
+# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
+# CONFIG_FEATURE_HTTPD_CGI is not set
+# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
+# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
+# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
+# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
+# CONFIG_FEATURE_HTTPD_PROXY is not set
+# CONFIG_FEATURE_HTTPD_GZIP is not set
+CONFIG_IFCONFIG=y
+CONFIG_FEATURE_IFCONFIG_STATUS=y
+CONFIG_FEATURE_IFCONFIG_SLIP=y
+CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ=y
+CONFIG_FEATURE_IFCONFIG_HW=y
+# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
+# CONFIG_IFENSLAVE is not set
+# CONFIG_IFPLUGD is not set
+CONFIG_IFUPDOWN=y
+CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
+CONFIG_FEATURE_IFUPDOWN_IP=y
+# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
+# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
+CONFIG_FEATURE_IFUPDOWN_IPV4=y
+CONFIG_FEATURE_IFUPDOWN_IPV6=y
+CONFIG_FEATURE_IFUPDOWN_MAPPING=y
+# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
+CONFIG_INETD=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
+# CONFIG_FEATURE_INETD_RPC is not set
+CONFIG_IP=y
+CONFIG_FEATURE_IP_ADDRESS=y
+CONFIG_FEATURE_IP_LINK=y
+CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_TUNNEL=y
+CONFIG_FEATURE_IP_RULE=y
+CONFIG_FEATURE_IP_SHORT_FORMS=y
+# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
+CONFIG_IPADDR=y
+CONFIG_IPLINK=y
+CONFIG_IPROUTE=y
+CONFIG_IPTUNNEL=y
+CONFIG_IPRULE=y
+# CONFIG_IPCALC is not set
+# CONFIG_FEATURE_IPCALC_FANCY is not set
+# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+CONFIG_NETSTAT=y
+# CONFIG_FEATURE_NETSTAT_WIDE is not set
+# CONFIG_FEATURE_NETSTAT_PRG is not set
+CONFIG_NSLOOKUP=y
+# CONFIG_NTPD is not set
+# CONFIG_FEATURE_NTPD_SERVER is not set
+# CONFIG_FEATURE_NTPD_CONF is not set
+# CONFIG_PSCAN is not set
+CONFIG_ROUTE=y
+# CONFIG_SLATTACH is not set
+# CONFIG_TCPSVD is not set
+CONFIG_TELNET=y
+CONFIG_FEATURE_TELNET_TTYPE=y
+CONFIG_FEATURE_TELNET_AUTOLOGIN=y
+# CONFIG_TELNETD is not set
+# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
+CONFIG_TFTP=y
+# CONFIG_TFTPD is not set
+
+#
+# Common options for tftp/tftpd
+#
+CONFIG_FEATURE_TFTP_GET=y
+CONFIG_FEATURE_TFTP_PUT=y
+CONFIG_FEATURE_TFTP_BLOCKSIZE=y
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
+# CONFIG_TFTP_DEBUG is not set
+CONFIG_TRACEROUTE=y
+# CONFIG_TRACEROUTE6 is not set
+# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
+# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
+# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
+# CONFIG_TUNCTL is not set
+# CONFIG_FEATURE_TUNCTL_UG is not set
+# CONFIG_UDHCPC6 is not set
+# CONFIG_UDHCPD is not set
+# CONFIG_DHCPRELAY is not set
+# CONFIG_DUMPLEASES is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+# CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
+CONFIG_DHCPD_LEASES_FILE=""
+CONFIG_UDHCPC=y
+CONFIG_FEATURE_UDHCPC_ARPING=y
+CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
+# CONFIG_FEATURE_UDHCP_PORT is not set
+CONFIG_UDHCP_DEBUG=0
+# CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_FEATURE_UDHCP_8021Q=y
+CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
+# CONFIG_UDPSVD is not set
+CONFIG_VCONFIG=y
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
+# CONFIG_ZCIP is not set
+
+#
+# Print Utilities
+#
+# CONFIG_LPD is not set
+# CONFIG_LPR is not set
+# CONFIG_LPQ is not set
+
+#
+# Mail Utilities
+#
+# CONFIG_MAKEMIME is not set
+CONFIG_FEATURE_MIME_CHARSET=""
+# CONFIG_POPMAILDIR is not set
+# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
+# CONFIG_REFORMIME is not set
+# CONFIG_FEATURE_REFORMIME_COMPAT is not set
+# CONFIG_SENDMAIL is not set
+
+#
+# Process Utilities
+#
+# CONFIG_IOSTAT is not set
+CONFIG_LSOF=y
+# CONFIG_MPSTAT is not set
+# CONFIG_NMETER is not set
+# CONFIG_PMAP is not set
+# CONFIG_POWERTOP is not set
+# CONFIG_PSTREE is not set
+# CONFIG_PWDX is not set
+# CONFIG_SMEMCAP is not set
+CONFIG_TOP=y
+CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
+CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
+# CONFIG_FEATURE_TOP_SMP_CPU is not set
+# CONFIG_FEATURE_TOP_DECIMALS is not set
+# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
+# CONFIG_FEATURE_TOPMEM is not set
+CONFIG_UPTIME=y
+# CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
+CONFIG_FREE=y
+CONFIG_FUSER=y
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+CONFIG_KILLALL5=y
+# CONFIG_PGREP is not set
+CONFIG_PIDOF=y
+CONFIG_FEATURE_PIDOF_SINGLE=y
+CONFIG_FEATURE_PIDOF_OMIT=y
+# CONFIG_PKILL is not set
+CONFIG_PS=y
+# CONFIG_FEATURE_PS_WIDE is not set
+# CONFIG_FEATURE_PS_LONG is not set
+# CONFIG_FEATURE_PS_TIME is not set
+# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
+# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
+CONFIG_RENICE=y
+CONFIG_BB_SYSCTL=y
+# CONFIG_FEATURE_SHOW_THREADS is not set
+CONFIG_WATCH=y
+
+#
+# Runit Utilities
+#
+# CONFIG_RUNSV is not set
+# CONFIG_RUNSVDIR is not set
+# CONFIG_FEATURE_RUNSVDIR_LOG is not set
+# CONFIG_SV is not set
+CONFIG_SV_DEFAULT_SERVICE_DIR=""
+# CONFIG_SVLOGD is not set
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
+# CONFIG_CHCON is not set
+# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
+# CONFIG_GETENFORCE is not set
+# CONFIG_GETSEBOOL is not set
+# CONFIG_LOAD_POLICY is not set
+# CONFIG_MATCHPATHCON is not set
+# CONFIG_RESTORECON is not set
+# CONFIG_RUNCON is not set
+# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
+# CONFIG_SELINUXENABLED is not set
+# CONFIG_SETENFORCE is not set
+# CONFIG_SETFILES is not set
+# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
+# CONFIG_SETSEBOOL is not set
+# CONFIG_SESTATUS is not set
+
+#
+# Shells
+#
+CONFIG_ASH=y
+CONFIG_ASH_BASH_COMPAT=y
+CONFIG_ASH_IDLE_TIMEOUT=y
+CONFIG_ASH_JOB_CONTROL=y
+CONFIG_ASH_ALIAS=y
+CONFIG_ASH_GETOPTS=y
+CONFIG_ASH_BUILTIN_ECHO=y
+CONFIG_ASH_BUILTIN_PRINTF=y
+CONFIG_ASH_BUILTIN_TEST=y
+CONFIG_ASH_HELP=y
+CONFIG_ASH_CMDCMD=y
+# CONFIG_ASH_MAIL is not set
+CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
+CONFIG_ASH_RANDOM_SUPPORT=y
+CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_CTTYHACK is not set
+# CONFIG_HUSH is not set
+# CONFIG_HUSH_BASH_COMPAT is not set
+# CONFIG_HUSH_BRACE_EXPANSION is not set
+# CONFIG_HUSH_HELP is not set
+# CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_SAVEHISTORY is not set
+# CONFIG_HUSH_JOB is not set
+# CONFIG_HUSH_TICK is not set
+# CONFIG_HUSH_IF is not set
+# CONFIG_HUSH_LOOPS is not set
+# CONFIG_HUSH_CASE is not set
+# CONFIG_HUSH_FUNCTIONS is not set
+# CONFIG_HUSH_LOCAL is not set
+# CONFIG_HUSH_RANDOM_SUPPORT is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_MODE_X is not set
+# CONFIG_MSH is not set
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+# CONFIG_FEATURE_BASH_IS_ASH is not set
+# CONFIG_FEATURE_BASH_IS_HUSH is not set
+CONFIG_FEATURE_BASH_IS_NONE=y
+CONFIG_SH_MATH_SUPPORT=y
+# CONFIG_SH_MATH_SUPPORT_64 is not set
+CONFIG_FEATURE_SH_EXTRA_QUIET=y
+# CONFIG_FEATURE_SH_STANDALONE is not set
+# CONFIG_FEATURE_SH_NOFORK is not set
+# CONFIG_FEATURE_SH_HISTFILESIZE is not set
+
+#
+# System Logging Utilities
+#
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+CONFIG_FEATURE_REMOTE_LOG=y
+# CONFIG_FEATURE_SYSLOGD_DUP is not set
+# CONFIG_FEATURE_SYSLOGD_CFG is not set
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
+# CONFIG_FEATURE_IPC_SYSLOG is not set
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
+# CONFIG_FEATURE_KMSG_SYSLOG is not set
+CONFIG_KLOGD=y
+CONFIG_FEATURE_KLOGD_KLOGCTL=y
+CONFIG_LOGGER=y
diff --git a/board/bananapi/r1/fs-overlay/etc/dnsmasq.conf b/board/bananapi/r1/fs-overlay/etc/dnsmasq.conf
new file mode 100644
index 0000000..9748ddb
--- /dev/null
+++ b/board/bananapi/r1/fs-overlay/etc/dnsmasq.conf
@@ -0,0 +1,623 @@
+# Configuration file for dnsmasq.
+#
+# Format is one option per line, legal options are the same
+# as the long options legal on the command line. See
+# "/usr/sbin/dnsmasq --help" or "man 8 dnsmasq" for details.
+
+# Listen on this specific port instead of the standard DNS port
+# (53). Setting this to zero completely disables DNS function,
+# leaving only DHCP and/or TFTP.
+#port=5353
+
+# The following two options make you a better netizen, since they
+# tell dnsmasq to filter out queries which the public DNS cannot
+# answer, and which load the servers (especially the root servers)
+# unnecessarily. If you have a dial-on-demand link they also stop
+# these requests from bringing up the link unnecessarily.
+
+# Never forward plain names (without a dot or domain part)
+#domain-needed
+# Never forward addresses in the non-routed address spaces.
+#bogus-priv
+
+# Uncomment this to filter useless windows-originated DNS requests
+# which can trigger dial-on-demand links needlessly.
+# Note that (amongst other things) this blocks all SRV requests,
+# so don't use it if you use eg Kerberos, SIP, XMMP or Google-talk.
+# This option only affects forwarding, SRV records originating for
+# dnsmasq (via srv-host= lines) are not suppressed by it.
+#filterwin2k
+
+# Change this line if you want dns to get its upstream servers from
+# somewhere other that /etc/resolv.conf
+#resolv-file=
+
+# By  default,  dnsmasq  will  send queries to any of the upstream
+# servers it knows about and tries to favour servers to are  known
+# to  be  up.  Uncommenting this forces dnsmasq to try each query
+# with  each  server  strictly  in  the  order  they   appear   in
+# /etc/resolv.conf
+#strict-order
+
+# If you don't want dnsmasq to read /etc/resolv.conf or any other
+# file, getting its servers from this file instead (see below), then
+# uncomment this.
+#no-resolv
+
+# If you don't want dnsmasq to poll /etc/resolv.conf or other resolv
+# files for changes and re-read them then uncomment this.
+#no-poll
+
+# Add other name servers here, with domain specs if they are for
+# non-public domains.
+#server=/localnet/192.168.0.1
+
+# Example of routing PTR queries to nameservers: this will send all
+# address->name queries for 192.168.3/24 to nameserver 10.1.2.3
+#server=/3.168.192.in-addr.arpa/10.1.2.3
+
+# Add local-only domains here, queries in these domains are answered
+# from /etc/hosts or DHCP only.
+#local=/localnet/
+
+# Add domains which you want to force to an IP address here.
+# The example below send any host in double-click.net to a local
+# web-server.
+#address=/double-click.net/127.0.0.1
+
+# --address (and --server) work with IPv6 addresses too.
+#address=/www.thekelleys.org.uk/fe80::20d:60ff:fe36:f83
+
+# You can control how dnsmasq talks to a server: this forces
+# queries to 10.1.2.3 to be routed via eth1
+# server=10.1.2.3 at eth1
+
+# and this sets the source (ie local) address used to talk to
+# 10.1.2.3 to 192.168.1.1 port 55 (there must be a interface with that
+# IP on the machine, obviously).
+# server=10.1.2.3 at 192.168.1.1#55
+
+# If you want dnsmasq to change uid and gid to something other
+# than the default, edit the following lines.
+#user=
+#group=
+
+# If you want dnsmasq to listen for DHCP and DNS requests only on
+# specified interfaces (and the loopback) give the name of the
+# interface (eg eth0) here.
+# Repeat the line for more than one interface.
+#interface=
+# Or you can specify which interface _not_ to listen on
+#except-interface=
+# Or which to listen on by address (remember to include 127.0.0.1 if
+# you use this.)
+#listen-address=
+# If you want dnsmasq to provide only DNS service on an interface,
+# configure it as shown above, and then use the following line to
+# disable DHCP and TFTP on it.
+#no-dhcp-interface=
+
+# On systems which support it, dnsmasq binds the wildcard address,
+# even when it is listening on only some interfaces. It then discards
+# requests that it shouldn't reply to. This has the advantage of
+# working even when interfaces come and go and change address. If you
+# want dnsmasq to really bind only the interfaces it is listening on,
+# uncomment this option. About the only time you may need this is when
+# running another nameserver on the same machine.
+#bind-interfaces
+
+# If you don't want dnsmasq to read /etc/hosts, uncomment the
+# following line.
+#no-hosts
+# or if you want it to read another file, as well as /etc/hosts, use
+# this.
+#addn-hosts=/etc/banner_add_hosts
+
+
+# Set this (and domain: see below) if you want to have a domain
+# automatically added to simple names in a hosts-file.
+#expand-hosts
+
+# Set the domain for dnsmasq. this is optional, but if it is set, it
+# does the following things.
+# 1) Allows DHCP hosts to have fully qualified domain names, as long
+#     as the domain part matches this setting.
+# 2) Sets the "domain" DHCP option thereby potentially setting the
+#    domain of all systems configured by DHCP
+# 3) Provides the domain part for "expand-hosts"
+#domain=thekelleys.org.uk
+
+# Set a different domain for a particular subnet
+#domain=wireless.thekelleys.org.uk,192.168.2.0/24
+
+# Same idea, but range rather then subnet
+#domain=reserved.thekelleys.org.uk,192.68.3.100,192.168.3.200
+
+# Uncomment this to enable the integrated DHCP server, you need
+# to supply the range of addresses available for lease and optionally
+# a lease time. If you have more than one network, you will need to
+# repeat this for each network on which you want to supply DHCP
+# service.
+#dhcp-range=192.168.0.50,192.168.0.150,12h
+dhcp-range=wlan0,10.13.77.50,10.13.77.150,255.255.255.0,12h
+dhcp-range=eth0.1,192.168.1.50,192.168.1.150,255.255.255.0,12h
+interface=wlan0
+interface=eth0.1
+
+# This is an example of a DHCP range where the netmask is given. This
+# is needed for networks we reach the dnsmasq DHCP server via a relay
+# agent. If you don't know what a DHCP relay agent is, you probably
+# don't need to worry about this.
+#dhcp-range=192.168.0.50,192.168.0.150,255.255.255.0,12h
+
+# This is an example of a DHCP range which sets a tag, so that
+# some DHCP options may be set only for this network.
+#dhcp-range=set:red,192.168.0.50,192.168.0.150
+
+# Use this DHCP range only when the tag "green" is set.
+#dhcp-range=tag:green,192.168.0.50,192.168.0.150,12h
+
+# Specify a subnet which can't be used for dynamic address allocation,
+# is available for hosts with matching --dhcp-host lines. Note that
+# dhcp-host declarations will be ignored unless there is a dhcp-range
+# of some type for the subnet in question.
+# In this case the netmask is implied (it comes from the network
+# configuration on the machine running dnsmasq) it is possible to give
+# an explicit netmask instead.
+#dhcp-range=192.168.0.0,static
+
+# Enable DHCPv6. Note that the prefix-length does not need to be specified
+# and defaults to 64 if missing/
+#dhcp-range=1234::2, 1234::500, 64, 12h
+
+# Do Router Advertisements, BUT NOT DHCP for this subnet.
+#dhcp-range=1234::, ra-only
+
+# Do Router Advertisements, BUT NOT DHCP for this subnet, also try and
+# add names to the DNS for the IPv6 address of SLAAC-configured dual-stack
+# hosts. Use the DHCPv4 lease to derive the name, network segment and
+# MAC address and assume that the host will also have an
+# IPv6 address calculated using the SLAAC alogrithm.
+#dhcp-range=1234::, ra-names
+
+# Do Router Advertisements, BUT NOT DHCP for this subnet.
+# Set the lifetime to 46 hours. (Note: minimum lifetime is 2 hours.)
+#dhcp-range=1234::, ra-only, 48h
+
+# Do DHCP and Router Advertisements for this subnet. Set the A bit in the RA
+# so that clients can use SLAAC addresses as well as DHCP ones.
+#dhcp-range=1234::2, 1234::500, slaac
+
+# Do Router Advertisements and stateless DHCP for this subnet. Clients will
+# not get addresses from DHCP, but they will get other configuration information.
+# They will use SLAAC for addresses.
+#dhcp-range=1234::, ra-stateless
+
+# Do stateless DHCP, SLAAC, and generate DNS names for SLAAC addresses
+# from DHCPv4 leases.
+#dhcp-range=1234::, ra-stateless, ra-names
+
+# Do router advertisements for all subnets where we're doing DHCPv6
+# Unless overriden by ra-stateless, ra-names, et al, the router
+# advertisements will have the M and O bits set, so that the clients
+# get addresses and configuration from DHCPv6, and the A bit reset, so the
+# clients don't use SLAAC addresses.
+#enable-ra
+
+# Supply parameters for specified hosts using DHCP. There are lots
+# of valid alternatives, so we will give examples of each. Note that
+# IP addresses DO NOT have to be in the range given above, they just
+# need to be on the same network. The order of the parameters in these
+# do not matter, it's permissible to give name, address and MAC in any
+# order.
+
+# Always allocate the host with Ethernet address 11:22:33:44:55:66
+# The IP address 192.168.0.60
+#dhcp-host=11:22:33:44:55:66,192.168.0.60
+
+# Always set the name of the host with hardware address
+# 11:22:33:44:55:66 to be "fred"
+#dhcp-host=11:22:33:44:55:66,fred
+
+# Always give the host with Ethernet address 11:22:33:44:55:66
+# the name fred and IP address 192.168.0.60 and lease time 45 minutes
+#dhcp-host=11:22:33:44:55:66,fred,192.168.0.60,45m
+
+# Give a host with Ethernet address 11:22:33:44:55:66 or
+# 12:34:56:78:90:12 the IP address 192.168.0.60. Dnsmasq will assume
+# that these two Ethernet interfaces will never be in use at the same
+# time, and give the IP address to the second, even if it is already
+# in use by the first. Useful for laptops with wired and wireless
+# addresses.
+#dhcp-host=11:22:33:44:55:66,12:34:56:78:90:12,192.168.0.60
+
+# Give the machine which says its name is "bert" IP address
+# 192.168.0.70 and an infinite lease
+#dhcp-host=bert,192.168.0.70,infinite
+
+# Always give the host with client identifier 01:02:02:04
+# the IP address 192.168.0.60
+#dhcp-host=id:01:02:02:04,192.168.0.60
+
+# Always give the host with client identifier "marjorie"
+# the IP address 192.168.0.60
+#dhcp-host=id:marjorie,192.168.0.60
+
+# Enable the address given for "judge" in /etc/hosts
+# to be given to a machine presenting the name "judge" when
+# it asks for a DHCP lease.
+#dhcp-host=judge
+
+# Never offer DHCP service to a machine whose Ethernet
+# address is 11:22:33:44:55:66
+#dhcp-host=11:22:33:44:55:66,ignore
+
+# Ignore any client-id presented by the machine with Ethernet
+# address 11:22:33:44:55:66. This is useful to prevent a machine
+# being treated differently when running under different OS's or
+# between PXE boot and OS boot.
+#dhcp-host=11:22:33:44:55:66,id:*
+
+# Send extra options which are tagged as "red" to
+# the machine with Ethernet address 11:22:33:44:55:66
+#dhcp-host=11:22:33:44:55:66,set:red
+
+# Send extra options which are tagged as "red" to
+# any machine with Ethernet address starting 11:22:33:
+#dhcp-host=11:22:33:*:*:*,set:red
+
+# Give a fixed IPv6 address and name to client with
+# DUID 00:01:00:01:16:d2:83:fc:92:d4:19:e2:d8:b2
+# Note the MAC addresses CANNOT be used to identify DHCPv6 clients.
+# Note also the they [] around the IPv6 address are obilgatory.
+#dhcp-host=id:00:01:00:01:16:d2:83:fc:92:d4:19:e2:d8:b2, fred, [1234::5]
+
+# Ignore any clients which are not specified in dhcp-host lines
+# or /etc/ethers. Equivalent to ISC "deny unknown-clients".
+# This relies on the special "known" tag which is set when
+# a host is matched.
+#dhcp-ignore=tag:!known
+
+# Send extra options which are tagged as "red" to any machine whose
+# DHCP vendorclass string includes the substring "Linux"
+#dhcp-vendorclass=set:red,Linux
+
+# Send extra options which are tagged as "red" to any machine one
+# of whose DHCP userclass strings includes the substring "accounts"
+#dhcp-userclass=set:red,accounts
+
+# Send extra options which are tagged as "red" to any machine whose
+# MAC address matches the pattern.
+#dhcp-mac=set:red,00:60:8C:*:*:*
+
+# If this line is uncommented, dnsmasq will read /etc/ethers and act
+# on the ethernet-address/IP pairs found there just as if they had
+# been given as --dhcp-host options. Useful if you keep
+# MAC-address/host mappings there for other purposes.
+#read-ethers
+
+# Send options to hosts which ask for a DHCP lease.
+# See RFC 2132 for details of available options.
+# Common options can be given to dnsmasq by name:
+# run "dnsmasq --help dhcp" to get a list.
+# Note that all the common settings, such as netmask and
+# broadcast address, DNS server and default route, are given
+# sane defaults by dnsmasq. You very likely will not need
+# any dhcp-options. If you use Windows clients and Samba, there
+# are some options which are recommended, they are detailed at the
+# end of this section.
+
+# Override the default route supplied by dnsmasq, which assumes the
+# router is the same machine as the one running dnsmasq.
+#dhcp-option=3,1.2.3.4
+
+# Do the same thing, but using the option name
+#dhcp-option=option:router,1.2.3.4
+
+# Override the default route supplied by dnsmasq and send no default
+# route at all. Note that this only works for the options sent by
+# default (1, 3, 6, 12, 28) the same line will send a zero-length option
+# for all other option numbers.
+#dhcp-option=3
+
+# Set the NTP time server addresses to 192.168.0.4 and 10.10.0.5
+#dhcp-option=option:ntp-server,192.168.0.4,10.10.0.5
+
+# Send DHCPv6 option. Note [] around IPv6 addresses.
+#dhcp-option=option6:dns-server,[1234::77],[1234::88]
+
+# Send DHCPv6 option for namservers as the machine running
+# dnsmasq and another.
+#dhcp-option=option6:dns-server,[::],[1234::88]
+
+# Set the NTP time server address to be the same machine as
+# is running dnsmasq
+#dhcp-option=42,0.0.0.0
+
+# Set the NIS domain name to "welly"
+#dhcp-option=40,welly
+
+# Set the default time-to-live to 50
+#dhcp-option=23,50
+
+# Set the "all subnets are local" flag
+#dhcp-option=27,1
+
+# Send the etherboot magic flag and then etherboot options (a string).
+#dhcp-option=128,e4:45:74:68:00:00
+#dhcp-option=129,NIC=eepro100
+
+# Specify an option which will only be sent to the "red" network
+# (see dhcp-range for the declaration of the "red" network)
+# Note that the tag: part must precede the option: part.
+#dhcp-option = tag:red, option:ntp-server, 192.168.1.1
+
+# The following DHCP options set up dnsmasq in the same way as is specified
+# for the ISC dhcpcd in
+# http://www.samba.org/samba/ftp/docs/textdocs/DHCP-Server-Configuration.txt
+# adapted for a typical dnsmasq installation where the host running
+# dnsmasq is also the host running samba.
+# you may want to uncomment some or all of them if you use
+# Windows clients and Samba.
+#dhcp-option=19,0           # option ip-forwarding off
+#dhcp-option=44,0.0.0.0     # set netbios-over-TCP/IP nameserver(s) aka WINS server(s)
+#dhcp-option=45,0.0.0.0     # netbios datagram distribution server
+#dhcp-option=46,8           # netbios node type
+
+# Send an empty WPAD option. This may be REQUIRED to get windows 7 to behave.
+#dhcp-option=252,"\n"
+
+# Send RFC-3397 DNS domain search DHCP option. WARNING: Your DHCP client
+# probably doesn't support this......
+#dhcp-option=option:domain-search,eng.apple.com,marketing.apple.com
+
+# Send RFC-3442 classless static routes (note the netmask encoding)
+#dhcp-option=121,192.168.1.0/24,1.2.3.4,10.0.0.0/8,5.6.7.8
+
+# Send vendor-class specific options encapsulated in DHCP option 43.
+# The meaning of the options is defined by the vendor-class so
+# options are sent only when the client supplied vendor class
+# matches the class given here. (A substring match is OK, so "MSFT"
+# matches "MSFT" and "MSFT 5.0"). This example sets the
+# mtftp address to 0.0.0.0 for PXEClients.
+#dhcp-option=vendor:PXEClient,1,0.0.0.0
+
+# Send microsoft-specific option to tell windows to release the DHCP lease
+# when it shuts down. Note the "i" flag, to tell dnsmasq to send the
+# value as a four-byte integer - that's what microsoft wants. See
+# http://technet2.microsoft.com/WindowsServer/en/library/a70f1bb7-d2d4-49f0-96d6-4b7414ecfaae1033.mspx?mfr=true
+#dhcp-option=vendor:MSFT,2,1i
+
+# Send the Encapsulated-vendor-class ID needed by some configurations of
+# Etherboot to allow is to recognise the DHCP server.
+#dhcp-option=vendor:Etherboot,60,"Etherboot"
+
+# Send options to PXELinux. Note that we need to send the options even
+# though they don't appear in the parameter request list, so we need
+# to use dhcp-option-force here.
+# See http://syslinux.zytor.com/pxe.php#special for details.
+# Magic number - needed before anything else is recognised
+#dhcp-option-force=208,f1:00:74:7e
+# Configuration file name
+#dhcp-option-force=209,configs/common
+# Path prefix
+#dhcp-option-force=210,/tftpboot/pxelinux/files/
+# Reboot time. (Note 'i' to send 32-bit value)
+#dhcp-option-force=211,30i
+
+# Set the boot filename for netboot/PXE. You will only need
+# this is you want to boot machines over the network and you will need
+# a TFTP server; either dnsmasq's built in TFTP server or an
+# external one. (See below for how to enable the TFTP server.)
+#dhcp-boot=pxelinux.0
+
+# The same as above, but use custom tftp-server instead machine running dnsmasq
+#dhcp-boot=pxelinux,server.name,192.168.1.100
+
+# Boot for Etherboot gPXE. The idea is to send two different
+# filenames, the first loads gPXE, and the second tells gPXE what to
+# load. The dhcp-match sets the gpxe tag for requests from gPXE.
+#dhcp-match=set:gpxe,175 # gPXE sends a 175 option.
+#dhcp-boot=tag:!gpxe,undionly.kpxe
+#dhcp-boot=mybootimage
+
+# Encapsulated options for Etherboot gPXE. All the options are
+# encapsulated within option 175
+#dhcp-option=encap:175, 1, 5b         # priority code
+#dhcp-option=encap:175, 176, 1b       # no-proxydhcp
+#dhcp-option=encap:175, 177, string   # bus-id
+#dhcp-option=encap:175, 189, 1b       # BIOS drive code
+#dhcp-option=encap:175, 190, user     # iSCSI username
+#dhcp-option=encap:175, 191, pass     # iSCSI password
+
+# Test for the architecture of a netboot client. PXE clients are
+# supposed to send their architecture as option 93. (See RFC 4578)
+#dhcp-match=peecees, option:client-arch, 0 #x86-32
+#dhcp-match=itanics, option:client-arch, 2 #IA64
+#dhcp-match=hammers, option:client-arch, 6 #x86-64
+#dhcp-match=mactels, option:client-arch, 7 #EFI x86-64
+
+# Do real PXE, rather than just booting a single file, this is an
+# alternative to dhcp-boot.
+#pxe-prompt="What system shall I netboot?"
+# or with timeout before first available action is taken:
+#pxe-prompt="Press F8 for menu.", 60
+
+# Available boot services. for PXE.
+#pxe-service=x86PC, "Boot from local disk"
+
+# Loads <tftp-root>/pxelinux.0 from dnsmasq TFTP server.
+#pxe-service=x86PC, "Install Linux", pxelinux
+
+# Use bootserver on network, found my multicast or broadcast.
+#pxe-service=x86PC, "Install windows from RIS server", 1
+
+# Use bootserver at a known IP address.
+#pxe-service=x86PC, "Install windows from RIS server", 1, 1.2.3.4
+
+# If you have multicast-FTP available,
+# information for that can be passed in a similar way using options 1
+# to 5. See page 19 of
+# http://download.intel.com/design/archives/wfm/downloads/pxespec.pdf
+
+# Enable dnsmasq's built-in TFTP server
+#enable-tftp
+
+# Set the root directory for files available via FTP.
+#tftp-root=/var/ftpd
+
+# Make the TFTP server more secure: with this set, only files owned by
+# the user dnsmasq is running as will be send over the net.
+#tftp-secure
+
+# This option stops dnsmasq from negotiating a larger blocksize for TFTP
+# transfers. It will slow things down, but may rescue some broken TFTP
+# clients.
+#tftp-no-blocksize
+
+# Set the boot file name only when the "red" tag is set.
+#dhcp-boot=net:red,pxelinux.red-net
+
+# An example of dhcp-boot with an external TFTP server: the name and IP
+# address of the server are given after the filename.
+# Can fail with old PXE ROMS. Overridden by --pxe-service.
+#dhcp-boot=/var/ftpd/pxelinux.0,boothost,192.168.0.3
+
+# If there are multiple external tftp servers having a same name
+# (using /etc/hosts) then that name can be specified as the
+# tftp_servername (the third option to dhcp-boot) and in that
+# case dnsmasq resolves this name and returns the resultant IP
+# addresses in round robin fasion. This facility can be used to
+# load balance the tftp load among a set of servers.
+#dhcp-boot=/var/ftpd/pxelinux.0,boothost,tftp_server_name
+
+# Set the limit on DHCP leases, the default is 150
+#dhcp-lease-max=150
+
+# The DHCP server needs somewhere on disk to keep its lease database.
+# This defaults to a sane location, but if you want to change it, use
+# the line below.
+#dhcp-leasefile=/var/lib/misc/dnsmasq.leases
+
+# Set the DHCP server to authoritative mode. In this mode it will barge in
+# and take over the lease for any client which broadcasts on the network,
+# whether it has a record of the lease or not. This avoids long timeouts
+# when a machine wakes up on a new network. DO NOT enable this if there's
+# the slightest chance that you might end up accidentally configuring a DHCP
+# server for your campus/company accidentally. The ISC server uses
+# the same option, and this URL provides more information:
+# http://www.isc.org/files/auth.html
+#dhcp-authoritative
+
+# Run an executable when a DHCP lease is created or destroyed.
+# The arguments sent to the script are "add" or "del",
+# then the MAC address, the IP address and finally the hostname
+# if there is one.
+#dhcp-script=/bin/echo
+
+# Set the cachesize here.
+#cache-size=150
+
+# If you want to disable negative caching, uncomment this.
+#no-negcache
+
+# Normally responses which come form /etc/hosts and the DHCP lease
+# file have Time-To-Live set as zero, which conventionally means
+# do not cache further. If you are happy to trade lower load on the
+# server for potentially stale date, you can set a time-to-live (in
+# seconds) here.
+#local-ttl=
+
+# If you want dnsmasq to detect attempts by Verisign to send queries
+# to unregistered .com and .net hosts to its sitefinder service and
+# have dnsmasq instead return the correct NXDOMAIN response, uncomment
+# this line. You can add similar lines to do the same for other
+# registries which have implemented wildcard A records.
+#bogus-nxdomain=64.94.110.11
+
+# If you want to fix up DNS results from upstream servers, use the
+# alias option. This only works for IPv4.
+# This alias makes a result of 1.2.3.4 appear as 5.6.7.8
+#alias=1.2.3.4,5.6.7.8
+# and this maps 1.2.3.x to 5.6.7.x
+#alias=1.2.3.0,5.6.7.0,255.255.255.0
+# and this maps 192.168.0.10->192.168.0.40 to 10.0.0.10->10.0.0.40
+#alias=192.168.0.10-192.168.0.40,10.0.0.0,255.255.255.0
+
+# Change these lines if you want dnsmasq to serve MX records.
+
+# Return an MX record named "maildomain.com" with target
+# servermachine.com and preference 50
+#mx-host=maildomain.com,servermachine.com,50
+
+# Set the default target for MX records created using the localmx option.
+#mx-target=servermachine.com
+
+# Return an MX record pointing to the mx-target for all local
+# machines.
+#localmx
+
+# Return an MX record pointing to itself for all local machines.
+#selfmx
+
+# Change the following lines if you want dnsmasq to serve SRV
+# records.  These are useful if you want to serve ldap requests for
+# Active Directory and other windows-originated DNS requests.
+# See RFC 2782.
+# You may add multiple srv-host lines.
+# The fields are <name>,<target>,<port>,<priority>,<weight>
+# If the domain part if missing from the name (so that is just has the
+# service and protocol sections) then the domain given by the domain=
+# config option is used. (Note that expand-hosts does not need to be
+# set for this to work.)
+
+# A SRV record sending LDAP for the example.com domain to
+# ldapserver.example.com port 389
+#srv-host=_ldap._tcp.example.com,ldapserver.example.com,389
+
+# A SRV record sending LDAP for the example.com domain to
+# ldapserver.example.com port 389 (using domain=)
+#domain=example.com
+#srv-host=_ldap._tcp,ldapserver.example.com,389
+
+# Two SRV records for LDAP, each with different priorities
+#srv-host=_ldap._tcp.example.com,ldapserver.example.com,389,1
+#srv-host=_ldap._tcp.example.com,ldapserver.example.com,389,2
+
+# A SRV record indicating that there is no LDAP server for the domain
+# example.com
+#srv-host=_ldap._tcp.example.com
+
+# The following line shows how to make dnsmasq serve an arbitrary PTR
+# record. This is useful for DNS-SD. (Note that the
+# domain-name expansion done for SRV records _does_not
+# occur for PTR records.)
+#ptr-record=_http._tcp.dns-sd-services,"New Employee Page._http._tcp.dns-sd-services"
+
+# Change the following lines to enable dnsmasq to serve TXT records.
+# These are used for things like SPF and zeroconf. (Note that the
+# domain-name expansion done for SRV records _does_not
+# occur for TXT records.)
+
+#Example SPF.
+#txt-record=example.com,"v=spf1 a -all"
+
+#Example zeroconf
+#txt-record=_http._tcp.example.com,name=value,paper=A4
+
+# Provide an alias for a "local" DNS name. Note that this _only_ works
+# for targets which are names from DHCP or /etc/hosts. Give host
+# "bert" another name, bertrand
+#cname=bertand,bert
+
+# For debugging purposes, log each DNS query as it passes through
+# dnsmasq.
+#log-queries
+
+# Log lots of extra information about DHCP transactions.
+#log-dhcp
+
+# Include a another lot of configuration options.
+#conf-file=/etc/dnsmasq.more.conf
+#conf-dir=/etc/dnsmasq.d
+
diff --git a/board/bananapi/r1/fs-overlay/etc/hostapd.conf b/board/bananapi/r1/fs-overlay/etc/hostapd.conf
new file mode 100644
index 0000000..547ce0a
--- /dev/null
+++ b/board/bananapi/r1/fs-overlay/etc/hostapd.conf
@@ -0,0 +1,18 @@
+interface=wlan0
+driver=nl80211
+ctrl_interface=/var/run/hostapd
+ctrl_interface_group=0
+
+ssid=BananaAP
+hw_mode=g
+channel=8
+
+wpa=2
+wpa_passphrase=ch at ng3me
+
+wpa_key_mgmt=WPA-PSK
+wpa_pairwise=CCMP
+rsn_pairwise=CCMP
+beacon_int=100
+auth_algs=3
+wmm_enabled=1
diff --git a/board/bananapi/r1/fs-overlay/etc/init.d/S02led b/board/bananapi/r1/fs-overlay/etc/init.d/S02led
new file mode 100644
index 0000000..01b0541
--- /dev/null
+++ b/board/bananapi/r1/fs-overlay/etc/init.d/S02led
@@ -0,0 +1,32 @@
+#!/bin/sh
+#
+# LED on/off
+#
+
+start() {
+        echo default-on > /sys/class/leds/lamobo\:green\:usr/trigger
+        echo 1 > /sys/class/leds/lamobo\:green\:usr/brightness
+}
+
+stop() {
+        echo 0 > /sys/class/leds/lamobo\:green\:usr/brightness
+        echo none > /sys/class/leds/lamobo\:green\:usr/trigger
+}
+
+case "$1" in
+  start)
+        start
+        ;;
+  stop)
+        stop
+        ;;
+  restart|reload)
+        stop
+        start
+        ;;
+  *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/board/bananapi/r1/fs-overlay/etc/network/eth0.up b/board/bananapi/r1/fs-overlay/etc/network/eth0.up
new file mode 100644
index 0000000..60672fb
--- /dev/null
+++ b/board/bananapi/r1/fs-overlay/etc/network/eth0.up
@@ -0,0 +1,19 @@
+#!/bin/sh
+ifconfig eth0 up
+
+swconfig dev switch0 set reset 1
+swconfig dev switch0 set reset_mib 1
+swconfig dev switch0 set apply 1
+
+vconfig add eth0 1
+vconfig add eth0 2
+
+ifconfig eth0.1 192.168.1.1 netmask 255.255.255.0
+
+swconfig dev switch0 set reset 1
+swconfig dev switch0 set enable_vlan 1
+swconfig dev switch0 vlan 1 set ports "4 0 1 2 8t"
+swconfig dev switch0 vlan 2 set ports "3 8t"
+swconfig dev switch0 set apply 1
+
+
diff --git a/board/bananapi/r1/fs-overlay/etc/network/interfaces b/board/bananapi/r1/fs-overlay/etc/network/interfaces
new file mode 100644
index 0000000..4e9801e
--- /dev/null
+++ b/board/bananapi/r1/fs-overlay/etc/network/interfaces
@@ -0,0 +1,10 @@
+auto lo
+iface lo inet loopback
+
+auto eth0
+iface eth0 inet manual
+up /etc/network/eth0.up 
+
+auto wlan0
+iface wlan0 inet manual
+up /etc/network/wlan0.up
diff --git a/board/bananapi/r1/fs-overlay/etc/network/wlan0.up b/board/bananapi/r1/fs-overlay/etc/network/wlan0.up
new file mode 100644
index 0000000..c7d60c9
--- /dev/null
+++ b/board/bananapi/r1/fs-overlay/etc/network/wlan0.up
@@ -0,0 +1,9 @@
+#!/bin/sh
+NET=10.13.77
+ifconfig wlan0 up ${NET}.1 netmask 255.255.255.0 > /tmp/wlan0.config 2>&1
+iptables -t nat -A POSTROUTING -d ${NET}.0/24 -j SNAT --to-source ${NET}.1
+iptables -t nat -A POSTROUTING -s ${NET}.0/24 -j MASQUERADE
+
+/usr/sbin/hostapd -B -P /var/run/hostapd.pid -t /etc/hostapd.conf
+exit 0
+
diff --git a/board/bananapi/r1/fs-overlay/root/.ssh/.empty b/board/bananapi/r1/fs-overlay/root/.ssh/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/board/bananapi/r1/linux-3.19.1.config b/board/bananapi/r1/linux-3.19.1.config
new file mode 100644
index 0000000..3f1a383
--- /dev/null
+++ b/board/bananapi/r1/linux-3.19.1.config
@@ -0,0 +1,263 @@
+# CONFIG_ARM_APPENDED_DTB is not set
+CONFIG_KERNEL_XZ=y
+CONFIG_SYSVIPC=y
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_RELAY=y
+CONFIG_PERF_EVENTS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_ARCH_SUNXI=y
+# CONFIG_MACH_SUN8I is not set
+# CONFIG_MACH_SUN9I is not set
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_720789=y
+CONFIG_ARM_ERRATA_754322=y
+CONFIG_ARM_ERRATA_775420=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_PREEMPT=y
+CONFIG_AEABI=y
+CONFIG_HIGHMEM=y
+# CONFIG_HW_PERF_EVENTS is not set
+CONFIG_CMDLINE="console=ttyS0,115200 earlyprintk rootwait root=/dev/mmcblk0p2"
+CONFIG_CMDLINE_FORCE=y
+CONFIG_VFP=y
+# CONFIG_SUSPEND is not set
+CONFIG_PM=y
+CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_MROUTE=y
+CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
+CONFIG_SYN_COOKIES=y
+CONFIG_IPV6=y
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+CONFIG_IPV6_SIT=m
+CONFIG_IPV6_SIT_6RD=y
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_IRC=m
+CONFIG_NETFILTER_XT_MARK=m
+CONFIG_NETFILTER_XT_CONNMARK=m
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
+CONFIG_NETFILTER_XT_TARGET_DSCP=m
+CONFIG_NETFILTER_XT_TARGET_HL=m
+CONFIG_NETFILTER_XT_TARGET_LOG=m
+CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_COMMENT=m
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_NETFILTER_XT_MATCH_DSCP=m
+CONFIG_NETFILTER_XT_MATCH_ECN=m
+CONFIG_NETFILTER_XT_MATCH_HELPER=m
+CONFIG_NETFILTER_XT_MATCH_HL=m
+CONFIG_NETFILTER_XT_MATCH_LENGTH=m
+CONFIG_NETFILTER_XT_MATCH_LIMIT=m
+CONFIG_NETFILTER_XT_MATCH_MAC=m
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
+CONFIG_NETFILTER_XT_MATCH_RECENT=m
+CONFIG_NETFILTER_XT_MATCH_STATE=m
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
+CONFIG_NETFILTER_XT_MATCH_STRING=m
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_TIME=m
+CONFIG_NF_CONNTRACK_IPV4=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_NAT=m
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_IP_NF_MANGLE=m
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_RAW=m
+CONFIG_NF_CONNTRACK_IPV6=m
+CONFIG_IP6_NF_IPTABLES=m
+CONFIG_IP6_NF_FILTER=m
+CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP6_NF_MANGLE=m
+CONFIG_IP6_NF_RAW=m
+CONFIG_BRIDGE=y
+CONFIG_VLAN_8021Q=y
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_CBQ=m
+CONFIG_NET_SCH_HFSC=m
+CONFIG_NET_SCH_FQ_CODEL=y
+CONFIG_NET_SCH_FQ=m
+CONFIG_NET_SCH_INGRESS=m
+CONFIG_NET_CLS_TCINDEX=m
+CONFIG_NET_CLS_ROUTE4=m
+CONFIG_NET_CLS_FW=m
+CONFIG_NET_CLS_U32=m
+CONFIG_NET_CLS_FLOW=m
+CONFIG_NET_EMATCH=y
+CONFIG_NET_EMATCH_U32=m
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_MIRRED=m
+CONFIG_NET_ACT_SKBEDIT=m
+CONFIG_NET_CLS_IND=y
+CONFIG_CFG80211=y
+CONFIG_CFG80211_DEBUGFS=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
+CONFIG_MAC80211_LEDS=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_CONNECTOR=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_DATAFLASH=y
+CONFIG_MTD_SST25L=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_UBI=y
+# CONFIG_BLK_DEV is not set
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_SATA_PMP is not set
+CONFIG_AHCI_SUNXI=m
+# CONFIG_ATA_SFF is not set
+CONFIG_NETDEVICES=y
+CONFIG_TUN=m
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_QUALCOMM is not set
+# CONFIG_NET_VENDOR_ROCKER is not set
+# CONFIG_NET_VENDOR_SAMSUNG is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+CONFIG_STMMAC_ETH=y
+# CONFIG_NET_VENDOR_VIA is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_SWCONFIG=y
+CONFIG_MDIO_SUN4I=y
+CONFIG_B53=y
+CONFIG_B53_PHY_DRIVER=y
+CONFIG_RTL_CARDS=m
+CONFIG_RTL8192CU=m
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_EVDEV=m
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=8
+CONFIG_SERIAL_8250_RUNTIME_UARTS=8
+CONFIG_SERIAL_8250_DW=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_MUX=y
+CONFIG_I2C_MUX_PINCTRL=y
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_SPI=y
+CONFIG_SPI_SUN4I=y
+CONFIG_SPI_SUN6I=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=y
+CONFIG_MFD_AXP20X=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_FB=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HRTIMER=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=y
+# CONFIG_HID_PLANTRONICS is not set
+CONFIG_USB_HID=m
+CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_MMC=y
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_MMC_SUNXI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_RTC_CLASS=y
+CONFIG_DMADEVICES=y
+# CONFIG_IOMMU_SUPPORT is not set
+CONFIG_PWM=y
+CONFIG_PHY_SUN4I_USB=y
+CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_MSDOS_FS=m
+CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_CONFIGFS_FS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_CIFS=m
+CONFIG_CIFS_STATS=y
+CONFIG_PRINTK_TIME=y
+CONFIG_FRAME_WARN=2048
+CONFIG_UNUSED_SYMBOLS=y
+CONFIG_DEBUG_FS=y
+CONFIG_STRICT_DEVMEM=y
+CONFIG_DEBUG_USER=y
+CONFIG_KEYS=y
+CONFIG_CRYPTO_MD5=y
+CONFIG_CRYPTO_SHA1=y
+CONFIG_CRYPTO_DES=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRC_CCITT=m
+CONFIG_CRC_T10DIF=y
+CONFIG_CRC32_SARWATE=y
+CONFIG_FONTS=y
diff --git a/board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch b/board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch
new file mode 100644
index 0000000..f35676d
--- /dev/null
+++ b/board/bananapi/r1/patches/linux/linux-3.19-001-lamobo.patch
@@ -0,0 +1,6004 @@
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 91bd5bd..c8672de 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -468,6 +468,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
+ 	sun7i-a20-cubietruck.dtb \
+ 	sun7i-a20-hummingbird.dtb \
+ 	sun7i-a20-i12-tvbox.dtb \
++	sun7i-a20-lamobo-r1.dtb \
+ 	sun7i-a20-m3.dtb \
+ 	sun7i-a20-olinuxino-lime.dtb \
+ 	sun7i-a20-olinuxino-lime2.dtb \
+diff --git a/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+new file mode 100644
+index 0000000..b39c416
+--- /dev/null
++++ b/arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts
+@@ -0,0 +1,235 @@
++/*
++ * Copyright 2015 Daniel Golle <daniel@makrotopia.org>
++ * Copyright 2014 Hans de Goede <hdegoede@redhat.com>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This library is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This library is distributed in the hope that it will be useful,
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ *     You should have received a copy of the GNU General Public
++ *     License along with this library; if not, write to the Free
++ *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
++ *     MA 02110-1301 USA
++ *
++ * Or, alternatively,
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use,
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/dts-v1/;
++/include/ "sun7i-a20.dtsi"
++/include/ "sunxi-common-regulators.dtsi"
++#include <dt-bindings/input/input.h>
++
++/ {
++	model = "Lamobo R1";
++	compatible = "lamobo,lamobo-r1", "allwinner,sun7i-a20";
++
++	soc at 01c00000 {
++		spi0: spi at 01c05000 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&spi0_pins_a>;
++			status = "okay";
++		};
++
++		mmc0: mmc at 01c0f000 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_lamobo>;
++			vmmc-supply = <&reg_vcc3v3>;
++			bus-width = <4>;
++			cd-gpios = <&pio 7 10 0>; /* PH10 */
++			cd-inverted;
++			status = "okay";
++		};
++
++		usbphy: phy at 01c13400 {
++			usb1_vbus-supply = <&reg_usb1_vbus>;
++			usb2_vbus-supply = <&reg_usb2_vbus>;
++			status = "okay";
++		};
++
++		ehci0: usb at 01c14000 {
++			status = "okay";
++		};
++
++		ohci0: usb at 01c14400 {
++			status = "okay";
++		};
++
++		ahci: sata at 01c18000 {
++			target-supply = <&reg_ahci_5v>;
++			status = "okay";
++		};
++
++		ehci1: usb at 01c1c000 {
++			status = "okay";
++		};
++
++		ohci1: usb at 01c1c400 {
++			status = "okay";
++		};
++
++		pinctrl at 01c20800 {
++			mmc0_cd_pin_lamobo: mmc0_cd_pin at 0 {
++				allwinner,pins = "PH10";
++				allwinner,function = "gpio_in";
++				allwinner,drive = <0>;
++				allwinner,pull = <1>;
++			};
++
++			gmac_power_pin_lamobo: gmac_power_pin at 0 {
++				allwinner,pins = "PH23";
++				allwinner,function = "gpio_out";
++				allwinner,drive = <0>;
++				allwinner,pull = <0>;
++			};
++
++			led_pins_lamobo: led_pins at 0 {
++				allwinner,pins = "PH2";
++				allwinner,function = "gpio_out";
++				allwinner,drive = <1>;
++				allwinner,pull = <0>;
++			};
++		};
++
++		lradc: lradc at 01c22800 {
++			allwinner,chan0-step = <200>;
++			linux,chan0-keycodes = <KEY_VOLUMEUP KEY_VOLUMEDOWN
++						KEY_MENU KEY_SEARCH KEY_HOME
++						KEY_ESC KEY_ENTER>;
++			status = "okay";
++		};
++
++		ir0: ir at 01c21800 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&ir0_pins_a>;
++			status = "okay";
++		};
++
++		uart0: serial at 01c28000 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&uart0_pins_a>;
++			status = "okay";
++		};
++
++		uart3: serial at 01c28c00 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&uart3_pins_b>;
++			status = "okay";
++		};
++
++		uart7: serial at 01c29c00 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&uart7_pins_a>;
++			status = "okay";
++		};
++
++		i2c0: i2c at 01c2ac00 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&i2c0_pins_a>;
++			status = "okay";
++
++			axp209: pmic at 34 {
++				compatible = "x-powers,axp209";
++				reg = <0x34>;
++				interrupt-parent = <&nmi_intc>;
++				interrupts = <0 8>;
++
++				interrupt-controller;
++				#interrupt-cells = <1>;
++			};
++		};
++
++		i2c1: i2c at 01c2b000 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&i2c1_pins_a>;
++			status = "okay";
++		};
++
++		i2c2: i2c at 01c2b400 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&i2c2_pins_a>;
++			status = "okay";
++		};
++
++		gmac: ethernet at 01c50000 {
++			pinctrl-names = "default";
++			pinctrl-0 = <&gmac_pins_rgmii_a>;
++			phy = <&phy1>;
++			phy-mode = "rgmii";
++			phy-supply = <&reg_gmac_3v3>;
++			status = "okay";
++
++			phy1: ethernet-phy at 1 {
++				reg = <1>;
++			};
++		};
++	};
++
++	leds {
++		compatible = "gpio-leds";
++		pinctrl-names = "default";
++		pinctrl-0 = <&led_pins_lamobo>;
++
++		green {
++			label = "lamobo:green:usr";
++			gpios = <&pio 7 24 0>;
++			default-state = "on";
++		};
++	};
++
++	reg_ahci_5v: ahci-5v {
++		status = "okay";
++	};
++
++	reg_usb1_vbus: usb1-vbus {
++		status = "okay";
++	};
++
++	reg_usb2_vbus: usb2-vbus {
++		status = "okay";
++	};
++
++	reg_gmac_3v3: gmac-3v3 {
++		compatible = "regulator-fixed";
++		pinctrl-names = "default";
++		pinctrl-0 = <&gmac_power_pin_lamobo>;
++		regulator-name = "gmac-3v3";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		startup-delay-us = <100000>;
++		enable-active-high;
++		gpio = <&pio 7 23 0>;
++		status = "okay";
++	};
++};
+diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
+index 89749ce..3560e32 100644
+--- a/arch/arm/boot/dts/sun7i-a20.dtsi
++++ b/arch/arm/boot/dts/sun7i-a20.dtsi
+@@ -575,6 +575,14 @@
+ 			status = "disabled";
+ 		};
+ 
++		crypto: crypto-engine at 01c15000 {
++			compatible = "allwinner,sun7i-a20-crypto";
++			reg = <0x01c15000 0x1000>;
++			interrupts = <0 86 4>;
++			clocks = <&ahb_gates 5>, <&ss_clk>;
++			clock-names = "ahb", "mod";
++		};
++
+ 		spi2: spi at 01c17000 {
+ 			compatible = "allwinner,sun4i-a10-spi";
+ 			reg = <0x01c17000 0x1000>;
+@@ -909,13 +917,20 @@
+ 			status = "disabled";
+ 		};
+ 
++		lradc: lradc at 01c22800 {
++			compatible = "allwinner,sun4i-a10-lradc-keys";
++			reg = <0x01c22800 0x100>;
++			interrupts = <0 31 4>;
++			status = "disabled";
++		};
++
+ 		sid: eeprom at 01c23800 {
+ 			compatible = "allwinner,sun7i-a20-sid";
+ 			reg = <0x01c23800 0x200>;
+ 		};
+ 
+ 		rtp: rtp at 01c25000 {
+-			compatible = "allwinner,sun4i-a10-ts";
++			compatible = "allwinner,sun5i-a13-ts";
+ 			reg = <0x01c25000 0x100>;
+ 			interrupts = <0 29 4>;
+ 		};
+diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
+index 7a342d2..7852ab3 100644
+--- a/arch/arm/configs/sunxi_defconfig
++++ b/arch/arm/configs/sunxi_defconfig
+@@ -7,8 +7,7 @@ CONFIG_SMP=y
+ CONFIG_AEABI=y
+ CONFIG_HIGHMEM=y
+ CONFIG_HIGHPTE=y
+-CONFIG_ARM_APPENDED_DTB=y
+-CONFIG_ARM_ATAG_DTB_COMPAT=y
++# CONFIG_ARM_APPENDED_DTB is not set
+ CONFIG_VFP=y
+ CONFIG_NEON=y
+ CONFIG_PM=y
+diff --git a/drivers/net/Makefile b/drivers/net/Makefile
+index e25fdd7..81d97d7 100644
+--- a/drivers/net/Makefile
++++ b/drivers/net/Makefile
+@@ -16,7 +16,7 @@ obj-$(CONFIG_MII) += mii.o
+ obj-$(CONFIG_MDIO) += mdio.o
+ obj-$(CONFIG_NET) += Space.o loopback.o
+ obj-$(CONFIG_NETCONSOLE) += netconsole.o
+-obj-$(CONFIG_PHYLIB) += phy/
++obj-y += phy/
+ obj-$(CONFIG_RIONET) += rionet.o
+ obj-$(CONFIG_NET_TEAM) += team/
+ obj-$(CONFIG_TUN) += tun.o
+diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
+index a3c251b..205db58 100644
+--- a/drivers/net/phy/Kconfig
++++ b/drivers/net/phy/Kconfig
+@@ -12,6 +12,20 @@ menuconfig PHYLIB
+ 
+ if PHYLIB
+ 
++config MDIO_BOARDINFO
++	bool
++	default y
++
++config SWCONFIG
++	tristate "Switch configuration API"
++	---help---
++	  Switch configuration API using netlink. This allows
++	  you to configure the VLAN features of certain switches.
++
++config SWCONFIG_LEDS
++	bool "Switch LED trigger support"
++	depends on (SWCONFIG && LEDS_TRIGGERS)
++
+ comment "MII PHY device drivers"
+ 
+ config AT803X_PHY
+@@ -212,6 +226,8 @@ config MDIO_BCM_UNIMAC
+ 	  controllers as well as some Broadcom Ethernet switches such as the
+ 	  Starfighter 2 switches.
+ 
++source "drivers/net/phy/b53/Kconfig"
++
+ endif # PHYLIB
+ 
+ config MICREL_KS8995MA
+diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
+index 501ea76..4a60cb1 100644
+--- a/drivers/net/phy/Makefile
++++ b/drivers/net/phy/Makefile
+@@ -2,7 +2,10 @@
+ 
+ libphy-objs			:= phy.o phy_device.o mdio_bus.o
+ 
++obj-$(CONFIG_MDIO_BOARDINFO)	+= mdio-boardinfo.o
++
+ obj-$(CONFIG_PHYLIB)		+= libphy.o
++obj-$(CONFIG_SWCONFIG)		+= swconfig.o
+ obj-$(CONFIG_MARVELL_PHY)	+= marvell.o
+ obj-$(CONFIG_DAVICOM_PHY)	+= davicom.o
+ obj-$(CONFIG_CICADA_PHY)	+= cicada.o
+@@ -17,6 +20,7 @@ obj-$(CONFIG_BCM87XX_PHY)	+= bcm87xx.o
+ obj-$(CONFIG_ICPLUS_PHY)	+= icplus.o
+ obj-$(CONFIG_REALTEK_PHY)	+= realtek.o
+ obj-$(CONFIG_LSI_ET1011C_PHY)	+= et1011c.o
++obj-$(CONFIG_B53)		+= b53/
+ obj-$(CONFIG_FIXED_PHY)		+= fixed_phy.o
+ obj-$(CONFIG_MDIO_BITBANG)	+= mdio-bitbang.o
+ obj-$(CONFIG_MDIO_GPIO)		+= mdio-gpio.o
+diff --git a/drivers/net/phy/b53/Kconfig b/drivers/net/phy/b53/Kconfig
+new file mode 100644
+index 0000000..67e053e
+--- /dev/null
++++ b/drivers/net/phy/b53/Kconfig
+@@ -0,0 +1,37 @@
++menuconfig B53
++	tristate "Broadcom bcm53xx managed switch support"
++	depends on SWCONFIG
++	help
++	  This driver adds support for Broadcom managed switch chips. It supports
++	  BCM5325E, BCM5365, BCM539x, BCM53115 and BCM53125 as well as BCM63XX
++	  integrated switches.
++
++config B53_SPI_DRIVER
++	tristate "B53 SPI connected switch driver"
++	depends on B53 && SPI
++	help
++	  Select to enable support for registering switches configured through SPI.
++
++config B53_PHY_DRIVER
++	tristate "B53 MDIO connected switch driver"
++	depends on B53
++	select B53_PHY_FIXUP
++	help
++	  Select to enable support for registering switches configured through MDIO.
++
++config B53_MMAP_DRIVER
++	tristate "B53 MMAP connected switch driver"
++	depends on B53
++	help
++	  Select to enable support for memory-mapped switches like the BCM63XX
++	  integrated switches.
++
++config B53_SRAB_DRIVER
++	tristate "B53 SRAB connected switch driver"
++	depends on B53
++	help
++	  Select to enable support for memory-mapped Switch Register Access
++	  Bridge Registers (SRAB) like it is found on the BCM53010
++
++config B53_PHY_FIXUP
++	bool
+diff --git a/drivers/net/phy/b53/Makefile b/drivers/net/phy/b53/Makefile
+new file mode 100644
+index 0000000..7cc39c7
+--- /dev/null
++++ b/drivers/net/phy/b53/Makefile
+@@ -0,0 +1,10 @@
++obj-$(CONFIG_B53)		+= b53_common.o
++
++obj-$(CONFIG_B53_PHY_FIXUP)	+= b53_phy_fixup.o
++
++obj-$(CONFIG_B53_MMAP_DRIVER)	+= b53_mmap.o
++obj-$(CONFIG_B53_SRAB_DRIVER)	+= b53_srab.o
++obj-$(CONFIG_B53_PHY_DRIVER)	+= b53_mdio.o
++obj-$(CONFIG_B53_SPI_DRIVER)	+= b53_spi.o
++
++ccflags-y			+= -Werror
+diff --git a/drivers/net/phy/b53/b53_common.c b/drivers/net/phy/b53/b53_common.c
+new file mode 100644
+index 0000000..b82bc93
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_common.c
+@@ -0,0 +1,1428 @@
++/*
++ * B53 switch driver main logic
++ *
++ * Copyright (C) 2011-2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
++
++#include <linux/delay.h>
++#include <linux/export.h>
++#include <linux/gpio.h>
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/switch.h>
++#include <linux/platform_data/b53.h>
++
++#include "b53_regs.h"
++#include "b53_priv.h"
++
++/* buffer size needed for displaying all MIBs with max'd values */
++#define B53_BUF_SIZE	1188
++
++struct b53_mib_desc {
++	u8 size;
++	u8 offset;
++	const char *name;
++};
++
++
++/* BCM5365 MIB counters */
++static const struct b53_mib_desc b53_mibs_65[] = {
++	{ 8, 0x00, "TxOctets" },
++	{ 4, 0x08, "TxDropPkts" },
++	{ 4, 0x10, "TxBroadcastPkts" },
++	{ 4, 0x14, "TxMulticastPkts" },
++	{ 4, 0x18, "TxUnicastPkts" },
++	{ 4, 0x1c, "TxCollisions" },
++	{ 4, 0x20, "TxSingleCollision" },
++	{ 4, 0x24, "TxMultipleCollision" },
++	{ 4, 0x28, "TxDeferredTransmit" },
++	{ 4, 0x2c, "TxLateCollision" },
++	{ 4, 0x30, "TxExcessiveCollision" },
++	{ 4, 0x38, "TxPausePkts" },
++	{ 8, 0x44, "RxOctets" },
++	{ 4, 0x4c, "RxUndersizePkts" },
++	{ 4, 0x50, "RxPausePkts" },
++	{ 4, 0x54, "Pkts64Octets" },
++	{ 4, 0x58, "Pkts65to127Octets" },
++	{ 4, 0x5c, "Pkts128to255Octets" },
++	{ 4, 0x60, "Pkts256to511Octets" },
++	{ 4, 0x64, "Pkts512to1023Octets" },
++	{ 4, 0x68, "Pkts1024to1522Octets" },
++	{ 4, 0x6c, "RxOversizePkts" },
++	{ 4, 0x70, "RxJabbers" },
++	{ 4, 0x74, "RxAlignmentErrors" },
++	{ 4, 0x78, "RxFCSErrors" },
++	{ 8, 0x7c, "RxGoodOctets" },
++	{ 4, 0x84, "RxDropPkts" },
++	{ 4, 0x88, "RxUnicastPkts" },
++	{ 4, 0x8c, "RxMulticastPkts" },
++	{ 4, 0x90, "RxBroadcastPkts" },
++	{ 4, 0x94, "RxSAChanges" },
++	{ 4, 0x98, "RxFragments" },
++	{ },
++};
++
++/* BCM63xx MIB counters */
++static const struct b53_mib_desc b53_mibs_63xx[] = {
++	{ 8, 0x00, "TxOctets" },
++	{ 4, 0x08, "TxDropPkts" },
++	{ 4, 0x0c, "TxQoSPkts" },
++	{ 4, 0x10, "TxBroadcastPkts" },
++	{ 4, 0x14, "TxMulticastPkts" },
++	{ 4, 0x18, "TxUnicastPkts" },
++	{ 4, 0x1c, "TxCollisions" },
++	{ 4, 0x20, "TxSingleCollision" },
++	{ 4, 0x24, "TxMultipleCollision" },
++	{ 4, 0x28, "TxDeferredTransmit" },
++	{ 4, 0x2c, "TxLateCollision" },
++	{ 4, 0x30, "TxExcessiveCollision" },
++	{ 4, 0x38, "TxPausePkts" },
++	{ 8, 0x3c, "TxQoSOctets" },
++	{ 8, 0x44, "RxOctets" },
++	{ 4, 0x4c, "RxUndersizePkts" },
++	{ 4, 0x50, "RxPausePkts" },
++	{ 4, 0x54, "Pkts64Octets" },
++	{ 4, 0x58, "Pkts65to127Octets" },
++	{ 4, 0x5c, "Pkts128to255Octets" },
++	{ 4, 0x60, "Pkts256to511Octets" },
++	{ 4, 0x64, "Pkts512to1023Octets" },
++	{ 4, 0x68, "Pkts1024to1522Octets" },
++	{ 4, 0x6c, "RxOversizePkts" },
++	{ 4, 0x70, "RxJabbers" },
++	{ 4, 0x74, "RxAlignmentErrors" },
++	{ 4, 0x78, "RxFCSErrors" },
++	{ 8, 0x7c, "RxGoodOctets" },
++	{ 4, 0x84, "RxDropPkts" },
++	{ 4, 0x88, "RxUnicastPkts" },
++	{ 4, 0x8c, "RxMulticastPkts" },
++	{ 4, 0x90, "RxBroadcastPkts" },
++	{ 4, 0x94, "RxSAChanges" },
++	{ 4, 0x98, "RxFragments" },
++	{ 4, 0xa0, "RxSymbolErrors" },
++	{ 4, 0xa4, "RxQoSPkts" },
++	{ 8, 0xa8, "RxQoSOctets" },
++	{ 4, 0xb0, "Pkts1523to2047Octets" },
++	{ 4, 0xb4, "Pkts2048to4095Octets" },
++	{ 4, 0xb8, "Pkts4096to8191Octets" },
++	{ 4, 0xbc, "Pkts8192to9728Octets" },
++	{ 4, 0xc0, "RxDiscarded" },
++	{ }
++};
++
++/* MIB counters */
++static const struct b53_mib_desc b53_mibs[] = {
++	{ 8, 0x00, "TxOctets" },
++	{ 4, 0x08, "TxDropPkts" },
++	{ 4, 0x10, "TxBroadcastPkts" },
++	{ 4, 0x14, "TxMulticastPkts" },
++	{ 4, 0x18, "TxUnicastPkts" },
++	{ 4, 0x1c, "TxCollisions" },
++	{ 4, 0x20, "TxSingleCollision" },
++	{ 4, 0x24, "TxMultipleCollision" },
++	{ 4, 0x28, "TxDeferredTransmit" },
++	{ 4, 0x2c, "TxLateCollision" },
++	{ 4, 0x30, "TxExcessiveCollision" },
++	{ 4, 0x38, "TxPausePkts" },
++	{ 8, 0x50, "RxOctets" },
++	{ 4, 0x58, "RxUndersizePkts" },
++	{ 4, 0x5c, "RxPausePkts" },
++	{ 4, 0x60, "Pkts64Octets" },
++	{ 4, 0x64, "Pkts65to127Octets" },
++	{ 4, 0x68, "Pkts128to255Octets" },
++	{ 4, 0x6c, "Pkts256to511Octets" },
++	{ 4, 0x70, "Pkts512to1023Octets" },
++	{ 4, 0x74, "Pkts1024to1522Octets" },
++	{ 4, 0x78, "RxOversizePkts" },
++	{ 4, 0x7c, "RxJabbers" },
++	{ 4, 0x80, "RxAlignmentErrors" },
++	{ 4, 0x84, "RxFCSErrors" },
++	{ 8, 0x88, "RxGoodOctets" },
++	{ 4, 0x90, "RxDropPkts" },
++	{ 4, 0x94, "RxUnicastPkts" },
++	{ 4, 0x98, "RxMulticastPkts" },
++	{ 4, 0x9c, "RxBroadcastPkts" },
++	{ 4, 0xa0, "RxSAChanges" },
++	{ 4, 0xa4, "RxFragments" },
++	{ 4, 0xa8, "RxJumboPkts" },
++	{ 4, 0xac, "RxSymbolErrors" },
++	{ 4, 0xc0, "RxDiscarded" },
++	{ }
++};
++
++static int b53_do_vlan_op(struct b53_device *dev, u8 op)
++{
++	unsigned int i;
++
++	b53_write8(dev, B53_ARLIO_PAGE, dev->vta_regs[0], VTA_START_CMD | op);
++
++	for (i = 0; i < 10; i++) {
++		u8 vta;
++
++		b53_read8(dev, B53_ARLIO_PAGE, dev->vta_regs[0], &vta);
++		if (!(vta & VTA_START_CMD))
++			return 0;
++
++		usleep_range(100, 200);
++	}
++
++	return -EIO;
++}
++
++static void b53_set_vlan_entry(struct b53_device *dev, u16 vid, u16 members,
++			       u16 untag)
++{
++	if (is5325(dev)) {
++		u32 entry = 0;
++
++		if (members) {
++			entry = ((untag & VA_UNTAG_MASK_25) << VA_UNTAG_S_25) |
++				members;
++			if (dev->core_rev >= 3)
++				entry |= VA_VALID_25_R4 | vid << VA_VID_HIGH_S;
++			else
++				entry |= VA_VALID_25;
++		}
++
++		b53_write32(dev, B53_VLAN_PAGE, B53_VLAN_WRITE_25, entry);
++		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_TABLE_ACCESS_25, vid |
++			    VTA_RW_STATE_WR | VTA_RW_OP_EN);
++	} else if (is5365(dev)) {
++		u16 entry = 0;
++
++		if (members)
++			entry = ((untag & VA_UNTAG_MASK_65) << VA_UNTAG_S_65) |
++				members | VA_VALID_65;
++
++		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_WRITE_65, entry);
++		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_TABLE_ACCESS_65, vid |
++			    VTA_RW_STATE_WR | VTA_RW_OP_EN);
++	} else {
++		b53_write16(dev, B53_ARLIO_PAGE, dev->vta_regs[1], vid);
++		b53_write32(dev, B53_ARLIO_PAGE, dev->vta_regs[2],
++			    (untag << VTE_UNTAG_S) | members);
++
++		b53_do_vlan_op(dev, VTA_CMD_WRITE);
++	}
++}
++
++void b53_set_forwarding(struct b53_device *dev, int enable)
++{
++	u8 mgmt;
++
++	b53_read8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, &mgmt);
++
++	if (enable)
++		mgmt |= SM_SW_FWD_EN;
++	else
++		mgmt &= ~SM_SW_FWD_EN;
++
++	b53_write8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, mgmt);
++}
++
++static void b53_enable_vlan(struct b53_device *dev, int enable)
++{
++	u8 mgmt, vc0, vc1, vc4 = 0, vc5;
++
++	b53_read8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, &mgmt);
++	b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL0, &vc0);
++	b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL1, &vc1);
++
++	if (is5325(dev) || is5365(dev)) {
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4_25, &vc4);
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL5_25, &vc5);
++	} else if (is63xx(dev)) {
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4_63XX, &vc4);
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL5_63XX, &vc5);
++	} else {
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4, &vc4);
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL5, &vc5);
++	}
++
++	mgmt &= ~SM_SW_FWD_MODE;
++
++	if (enable) {
++		vc0 |= VC0_VLAN_EN | VC0_VID_CHK_EN | VC0_VID_HASH_VID;
++		vc1 |= VC1_RX_MCST_UNTAG_EN | VC1_RX_MCST_FWD_EN;
++		vc4 &= ~VC4_ING_VID_CHECK_MASK;
++		vc4 |= VC4_ING_VID_VIO_DROP << VC4_ING_VID_CHECK_S;
++		vc5 |= VC5_DROP_VTABLE_MISS;
++
++		if (is5325(dev))
++			vc0 &= ~VC0_RESERVED_1;
++
++		if (is5325(dev) || is5365(dev))
++			vc1 |= VC1_RX_MCST_TAG_EN;
++
++		if (!is5325(dev) && !is5365(dev)) {
++			if (dev->allow_vid_4095)
++				vc5 |= VC5_VID_FFF_EN;
++			else
++				vc5 &= ~VC5_VID_FFF_EN;
++		}
++	} else {
++		vc0 &= ~(VC0_VLAN_EN | VC0_VID_CHK_EN | VC0_VID_HASH_VID);
++		vc1 &= ~(VC1_RX_MCST_UNTAG_EN | VC1_RX_MCST_FWD_EN);
++		vc4 &= ~VC4_ING_VID_CHECK_MASK;
++		vc5 &= ~VC5_DROP_VTABLE_MISS;
++
++		if (is5325(dev) || is5365(dev))
++			vc4 |= VC4_ING_VID_VIO_FWD << VC4_ING_VID_CHECK_S;
++		else
++			vc4 |= VC4_ING_VID_VIO_TO_IMP << VC4_ING_VID_CHECK_S;
++
++		if (is5325(dev) || is5365(dev))
++			vc1 &= ~VC1_RX_MCST_TAG_EN;
++
++		if (!is5325(dev) && !is5365(dev))
++			vc5 &= ~VC5_VID_FFF_EN;
++	}
++
++	b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL0, vc0);
++	b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL1, vc1);
++
++	if (is5325(dev) || is5365(dev)) {
++		/* enable the high 8 bit vid check on 5325 */
++		if (is5325(dev) && enable)
++			b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL3,
++				   VC3_HIGH_8BIT_EN);
++		else
++			b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL3, 0);
++
++		b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4_25, vc4);
++		b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL5_25, vc5);
++	} else if (is63xx(dev)) {
++		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_CTRL3_63XX, 0);
++		b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4_63XX, vc4);
++		b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL5_63XX, vc5);
++	} else {
++		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_CTRL3, 0);
++		b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4, vc4);
++		b53_write8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL5, vc5);
++	}
++
++	b53_write8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, mgmt);
++}
++
++static int b53_set_jumbo(struct b53_device *dev, int enable, int allow_10_100)
++{
++	u32 port_mask = 0;
++	u16 max_size = JMS_MIN_SIZE;
++
++	if (is5325(dev) || is5365(dev))
++		return -EINVAL;
++
++	if (enable) {
++		port_mask = dev->enabled_ports;
++		max_size = JMS_MAX_SIZE;
++		if (allow_10_100)
++			port_mask |= JPM_10_100_JUMBO_EN;
++	}
++
++	b53_write32(dev, B53_JUMBO_PAGE, dev->jumbo_pm_reg, port_mask);
++	return b53_write16(dev, B53_JUMBO_PAGE, dev->jumbo_size_reg, max_size);
++}
++
++static int b53_flush_arl(struct b53_device *dev)
++{
++	unsigned int i;
++
++	b53_write8(dev, B53_CTRL_PAGE, B53_FAST_AGE_CTRL,
++		   FAST_AGE_DONE | FAST_AGE_DYNAMIC | FAST_AGE_STATIC);
++
++	for (i = 0; i < 10; i++) {
++		u8 fast_age_ctrl;
++
++		b53_read8(dev, B53_CTRL_PAGE, B53_FAST_AGE_CTRL,
++			  &fast_age_ctrl);
++
++		if (!(fast_age_ctrl & FAST_AGE_DONE))
++			return 0;
++
++		mdelay(1);
++	}
++
++	pr_warn("time out while flushing ARL\n");
++
++	return -EINVAL;
++}
++
++static void b53_enable_ports(struct b53_device *dev)
++{
++	unsigned i;
++
++	b53_for_each_port(dev, i) {
++		u8 port_ctrl;
++		u16 pvlan_mask;
++
++		/*
++		 * prevent leaking packets between wan and lan in unmanaged
++		 * mode through port vlans.
++		 */
++		if (dev->enable_vlan || is_cpu_port(dev, i))
++			pvlan_mask = 0x1ff;
++		else if (is531x5(dev) || is5301x(dev))
++			/* BCM53115 may use a different port as cpu port */
++			pvlan_mask = BIT(dev->sw_dev.cpu_port);
++		else
++			pvlan_mask = BIT(B53_CPU_PORT);
++
++		/* BCM5325 CPU port is at 8 */
++		if ((is5325(dev) || is5365(dev)) && i == B53_CPU_PORT_25)
++			i = B53_CPU_PORT;
++
++		if (dev->chip_id == BCM5398_DEVICE_ID && (i == 6 || i == 7))
++			/* disable unused ports 6 & 7 */
++			port_ctrl = PORT_CTRL_RX_DISABLE | PORT_CTRL_TX_DISABLE;
++		else if (i == B53_CPU_PORT)
++			port_ctrl = PORT_CTRL_RX_BCST_EN |
++				    PORT_CTRL_RX_MCST_EN |
++				    PORT_CTRL_RX_UCST_EN;
++		else
++			port_ctrl = 0;
++
++		b53_write16(dev, B53_PVLAN_PAGE, B53_PVLAN_PORT_MASK(i),
++			    pvlan_mask);
++
++		/* port state is handled by bcm63xx_enet driver */
++		if (!is63xx(dev) && !(is5301x(dev) && i == 6))
++			b53_write8(dev, B53_CTRL_PAGE, B53_PORT_CTRL(i),
++				   port_ctrl);
++	}
++}
++
++static void b53_enable_mib(struct b53_device *dev)
++{
++	u8 gc;
++
++	b53_read8(dev, B53_CTRL_PAGE, B53_GLOBAL_CONFIG, &gc);
++
++	gc &= ~(GC_RESET_MIB | GC_MIB_AC_EN);
++
++	b53_write8(dev, B53_CTRL_PAGE, B53_GLOBAL_CONFIG, gc);
++}
++
++static int b53_apply(struct b53_device *dev)
++{
++	int i;
++
++	/* clear all vlan entries */
++	if (is5325(dev) || is5365(dev)) {
++		for (i = 1; i < dev->sw_dev.vlans; i++)
++			b53_set_vlan_entry(dev, i, 0, 0);
++	} else {
++		b53_do_vlan_op(dev, VTA_CMD_CLEAR);
++	}
++
++	b53_enable_vlan(dev, dev->enable_vlan);
++
++	/* fill VLAN table */
++	if (dev->enable_vlan) {
++		for (i = 0; i < dev->sw_dev.vlans; i++) {
++			struct b53_vlan *vlan = &dev->vlans[i];
++
++			if (!vlan->members)
++				continue;
++
++			b53_set_vlan_entry(dev, i, vlan->members, vlan->untag);
++		}
++
++		b53_for_each_port(dev, i)
++			b53_write16(dev, B53_VLAN_PAGE,
++				    B53_VLAN_PORT_DEF_TAG(i),
++				    dev->ports[i].pvid);
++	} else {
++		b53_for_each_port(dev, i)
++			b53_write16(dev, B53_VLAN_PAGE,
++				    B53_VLAN_PORT_DEF_TAG(i), 1);
++
++	}
++
++	b53_enable_ports(dev);
++
++	if (!is5325(dev) && !is5365(dev))
++		b53_set_jumbo(dev, dev->enable_jumbo, 1);
++
++	return 0;
++}
++
++static void b53_switch_reset_gpio(struct b53_device *dev)
++{
++	int gpio = dev->reset_gpio;
++
++	if (gpio < 0)
++		return;
++
++	/*
++	 * Reset sequence: RESET low(50ms)->high(20ms)
++	 */
++	gpio_set_value(gpio, 0);
++	mdelay(50);
++
++	gpio_set_value(gpio, 1);
++	mdelay(20);
++
++	dev->current_page = 0xff;
++}
++
++static int b53_switch_reset(struct b53_device *dev)
++{
++	u8 mgmt;
++
++	b53_switch_reset_gpio(dev);
++
++	if (is539x(dev)) {
++		b53_write8(dev, B53_CTRL_PAGE, B53_SOFTRESET, 0x83);
++		b53_write8(dev, B53_CTRL_PAGE, B53_SOFTRESET, 0x00);
++	}
++
++	b53_read8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, &mgmt);
++
++	if (!(mgmt & SM_SW_FWD_EN)) {
++		mgmt &= ~SM_SW_FWD_MODE;
++		mgmt |= SM_SW_FWD_EN;
++
++		b53_write8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, mgmt);
++		b53_read8(dev, B53_CTRL_PAGE, B53_SWITCH_MODE, &mgmt);
++
++		if (!(mgmt & SM_SW_FWD_EN)) {
++			pr_err("Failed to enable switch!\n");
++			return -EINVAL;
++		}
++	}
++
++	/* enable all ports */
++	b53_enable_ports(dev);
++
++	/* configure MII port if necessary */
++	if (is5325(dev)) {
++		u8 mii_port_override;
++
++		b53_read8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
++			  &mii_port_override);
++		/* reverse mii needs to be enabled */
++		if (!(mii_port_override & PORT_OVERRIDE_RV_MII_25)) {
++			b53_write8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
++				   mii_port_override | PORT_OVERRIDE_RV_MII_25);
++			b53_read8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
++				  &mii_port_override);
++
++			if (!(mii_port_override & PORT_OVERRIDE_RV_MII_25)) {
++				pr_err("Failed to enable reverse MII mode\n");
++				return -EINVAL;
++			}
++		}
++	} else if ((is531x5(dev) || is5301x(dev)) && dev->sw_dev.cpu_port == B53_CPU_PORT) {
++		u8 mii_port_override;
++
++		b53_read8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
++			  &mii_port_override);
++		b53_write8(dev, B53_CTRL_PAGE, B53_PORT_OVERRIDE_CTRL,
++			   mii_port_override | PORT_OVERRIDE_EN |
++			   PORT_OVERRIDE_LINK);
++	}
++
++	b53_enable_mib(dev);
++
++	return b53_flush_arl(dev);
++}
++
++/*
++ * Swconfig glue functions
++ */
++
++static int b53_global_get_vlan_enable(struct switch_dev *dev,
++				      const struct switch_attr *attr,
++				      struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	val->value.i = priv->enable_vlan;
++
++	return 0;
++}
++
++static int b53_global_set_vlan_enable(struct switch_dev *dev,
++				      const struct switch_attr *attr,
++				      struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	priv->enable_vlan = val->value.i;
++
++	return 0;
++}
++
++static int b53_global_get_jumbo_enable(struct switch_dev *dev,
++				       const struct switch_attr *attr,
++				       struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	val->value.i = priv->enable_jumbo;
++
++	return 0;
++}
++
++static int b53_global_set_jumbo_enable(struct switch_dev *dev,
++				       const struct switch_attr *attr,
++				       struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	priv->enable_jumbo = val->value.i;
++
++	return 0;
++}
++
++static int b53_global_get_4095_enable(struct switch_dev *dev,
++				      const struct switch_attr *attr,
++				      struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	val->value.i = priv->allow_vid_4095;
++
++	return 0;
++}
++
++static int b53_global_set_4095_enable(struct switch_dev *dev,
++				      const struct switch_attr *attr,
++				      struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	priv->allow_vid_4095 = val->value.i;
++
++	return 0;
++}
++
++static int b53_global_get_ports(struct switch_dev *dev,
++				const struct switch_attr *attr,
++				struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	val->len = snprintf(priv->buf, B53_BUF_SIZE, "0x%04x",
++			    priv->enabled_ports);
++	val->value.s = priv->buf;
++
++	return 0;
++}
++
++static int b53_port_get_pvid(struct switch_dev *dev, int port, int *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	*val = priv->ports[port].pvid;
++
++	return 0;
++}
++
++static int b53_port_set_pvid(struct switch_dev *dev, int port, int val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	if (val > 15 && is5325(priv))
++		return -EINVAL;
++	if (val == 4095 && !priv->allow_vid_4095)
++		return -EINVAL;
++
++	priv->ports[port].pvid = val;
++
++	return 0;
++}
++
++static int b53_vlan_get_ports(struct switch_dev *dev, struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++	struct switch_port *port = &val->value.ports[0];
++	struct b53_vlan *vlan = &priv->vlans[val->port_vlan];
++	int i;
++
++	val->len = 0;
++
++	if (!vlan->members)
++		return 0;
++
++	for (i = 0; i < dev->ports; i++) {
++		if (!(vlan->members & BIT(i)))
++			continue;
++
++
++		if (!(vlan->untag & BIT(i)))
++			port->flags = BIT(SWITCH_PORT_FLAG_TAGGED);
++		else
++			port->flags = 0;
++
++		port->id = i;
++		val->len++;
++		port++;
++	}
++
++	return 0;
++}
++
++static int b53_vlan_set_ports(struct switch_dev *dev, struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++	struct switch_port *port;
++	struct b53_vlan *vlan = &priv->vlans[val->port_vlan];
++	int i;
++
++	/* only BCM5325 and BCM5365 supports VID 0 */
++	if (val->port_vlan == 0 && !is5325(priv) && !is5365(priv))
++		return -EINVAL;
++
++	/* VLAN 4095 needs special handling */
++	if (val->port_vlan == 4095 && !priv->allow_vid_4095)
++		return -EINVAL;
++
++	port = &val->value.ports[0];
++	vlan->members = 0;
++	vlan->untag = 0;
++	for (i = 0; i < val->len; i++, port++) {
++		vlan->members |= BIT(port->id);
++
++		if (!(port->flags & BIT(SWITCH_PORT_FLAG_TAGGED))) {
++			vlan->untag |= BIT(port->id);
++			priv->ports[port->id].pvid = val->port_vlan;
++		};
++	}
++
++	/* ignore disabled ports */
++	vlan->members &= priv->enabled_ports;
++	vlan->untag &= priv->enabled_ports;
++
++	return 0;
++}
++
++static int b53_port_get_link(struct switch_dev *dev, int port,
++			     struct switch_port_link *link)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	if (is_cpu_port(priv, port)) {
++		link->link = 1;
++		link->duplex = 1;
++		link->speed = is5325(priv) || is5365(priv) ?
++				SWITCH_PORT_SPEED_100 : SWITCH_PORT_SPEED_1000;
++		link->aneg = 0;
++	} else if (priv->enabled_ports & BIT(port)) {
++		u32 speed;
++		u16 lnk, duplex;
++
++		b53_read16(priv, B53_STAT_PAGE, B53_LINK_STAT, &lnk);
++		b53_read16(priv, B53_STAT_PAGE, priv->duplex_reg, &duplex);
++
++		lnk = (lnk >> port) & 1;
++		duplex = (duplex >> port) & 1;
++
++		if (is5325(priv) || is5365(priv)) {
++			u16 tmp;
++
++			b53_read16(priv, B53_STAT_PAGE, B53_SPEED_STAT, &tmp);
++			speed = SPEED_PORT_FE(tmp, port);
++		} else {
++			b53_read32(priv, B53_STAT_PAGE, B53_SPEED_STAT, &speed);
++			speed = SPEED_PORT_GE(speed, port);
++		}
++
++		link->link = lnk;
++		if (lnk) {
++			link->duplex = duplex;
++			switch (speed) {
++			case SPEED_STAT_10M:
++				link->speed = SWITCH_PORT_SPEED_10;
++				break;
++			case SPEED_STAT_100M:
++				link->speed = SWITCH_PORT_SPEED_100;
++				break;
++			case SPEED_STAT_1000M:
++				link->speed = SWITCH_PORT_SPEED_1000;
++				break;
++			}
++		}
++
++		link->aneg = 1;
++	} else {
++		link->link = 0;
++	}
++
++	return 0;
++
++}
++
++static int b53_global_reset_switch(struct switch_dev *dev)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	/* reset vlans */
++	priv->enable_vlan = 0;
++	priv->enable_jumbo = 0;
++	priv->allow_vid_4095 = 0;
++
++	memset(priv->vlans, 0, sizeof(priv->vlans) * dev->vlans);
++	memset(priv->ports, 0, sizeof(priv->ports) * dev->ports);
++
++	return b53_switch_reset(priv);
++}
++
++static int b53_global_apply_config(struct switch_dev *dev)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++
++	/* disable switching */
++	b53_set_forwarding(priv, 0);
++
++	b53_apply(priv);
++
++	/* enable switching */
++	b53_set_forwarding(priv, 1);
++
++	return 0;
++}
++
++
++static int b53_global_reset_mib(struct switch_dev *dev,
++				const struct switch_attr *attr,
++				struct switch_val *val)
++{
++	struct b53_device *priv = sw_to_b53(dev);
++	u8 gc;
++
++	b53_read8(priv, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, &gc);
++
++	b53_write8(priv, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, gc | GC_RESET_MIB);
++	mdelay(1);
++	b53_write8(priv, B53_MGMT_PAGE, B53_GLOBAL_CONFIG, gc & ~GC_RESET_MIB);
++	mdelay(1);
++
++	return 0;
++}
++
++static int b53_port_get_mib(struct switch_dev *sw_dev,
++			    const struct switch_attr *attr,
++			    struct switch_val *val)
++{
++	struct b53_device *dev = sw_to_b53(sw_dev);
++	const struct b53_mib_desc *mibs;
++	int port = val->port_vlan;
++	int len = 0;
++
++	if (!(BIT(port) & dev->enabled_ports))
++		return -1;
++
++	if (is5365(dev)) {
++		if (port == 5)
++			port = 8;
++
++		mibs = b53_mibs_65;
++	} else if (is63xx(dev)) {
++		mibs = b53_mibs_63xx;
++	} else {
++		mibs = b53_mibs;
++	}
++
++	dev->buf[0] = 0;
++
++	for (; mibs->size > 0; mibs++) {
++		u64 val;
++
++		if (mibs->size == 8) {
++			b53_read64(dev, B53_MIB_PAGE(port), mibs->offset, &val);
++		} else {
++			u32 val32;
++
++			b53_read32(dev, B53_MIB_PAGE(port), mibs->offset,
++				   &val32);
++			val = val32;
++		}
++
++		len += snprintf(dev->buf + len, B53_BUF_SIZE - len,
++				"%-20s: %llu\n", mibs->name, val);
++	}
++
++	val->len = len;
++	val->value.s = dev->buf;
++
++	return 0;
++}
++
++static struct switch_attr b53_global_ops_25[] = {
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "enable_vlan",
++		.description = "Enable VLAN mode",
++		.set = b53_global_set_vlan_enable,
++		.get = b53_global_get_vlan_enable,
++		.max = 1,
++	},
++	{
++		.type = SWITCH_TYPE_STRING,
++		.name = "ports",
++		.description = "Available ports (as bitmask)",
++		.get = b53_global_get_ports,
++	},
++};
++
++static struct switch_attr b53_global_ops_65[] = {
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "enable_vlan",
++		.description = "Enable VLAN mode",
++		.set = b53_global_set_vlan_enable,
++		.get = b53_global_get_vlan_enable,
++		.max = 1,
++	},
++	{
++		.type = SWITCH_TYPE_STRING,
++		.name = "ports",
++		.description = "Available ports (as bitmask)",
++		.get = b53_global_get_ports,
++	},
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "reset_mib",
++		.description = "Reset MIB counters",
++		.set = b53_global_reset_mib,
++	},
++};
++
++static struct switch_attr b53_global_ops[] = {
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "enable_vlan",
++		.description = "Enable VLAN mode",
++		.set = b53_global_set_vlan_enable,
++		.get = b53_global_get_vlan_enable,
++		.max = 1,
++	},
++	{
++		.type = SWITCH_TYPE_STRING,
++		.name = "ports",
++		.description = "Available Ports (as bitmask)",
++		.get = b53_global_get_ports,
++	},
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "reset_mib",
++		.description = "Reset MIB counters",
++		.set = b53_global_reset_mib,
++	},
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "enable_jumbo",
++		.description = "Enable Jumbo Frames",
++		.set = b53_global_set_jumbo_enable,
++		.get = b53_global_get_jumbo_enable,
++		.max = 1,
++	},
++	{
++		.type = SWITCH_TYPE_INT,
++		.name = "allow_vid_4095",
++		.description = "Allow VID 4095",
++		.set = b53_global_set_4095_enable,
++		.get = b53_global_get_4095_enable,
++		.max = 1,
++	},
++};
++
++static struct switch_attr b53_port_ops[] = {
++	{
++		.type = SWITCH_TYPE_STRING,
++		.name = "mib",
++		.description = "Get port's MIB counters",
++		.get = b53_port_get_mib,
++	},
++};
++
++static struct switch_attr b53_no_ops[] = {
++};
++
++static const struct switch_dev_ops b53_switch_ops_25 = {
++	.attr_global = {
++		.attr = b53_global_ops_25,
++		.n_attr = ARRAY_SIZE(b53_global_ops_25),
++	},
++	.attr_port = {
++		.attr = b53_no_ops,
++		.n_attr = ARRAY_SIZE(b53_no_ops),
++	},
++	.attr_vlan = {
++		.attr = b53_no_ops,
++		.n_attr = ARRAY_SIZE(b53_no_ops),
++	},
++
++	.get_vlan_ports = b53_vlan_get_ports,
++	.set_vlan_ports = b53_vlan_set_ports,
++	.get_port_pvid = b53_port_get_pvid,
++	.set_port_pvid = b53_port_set_pvid,
++	.apply_config = b53_global_apply_config,
++	.reset_switch = b53_global_reset_switch,
++	.get_port_link = b53_port_get_link,
++};
++
++static const struct switch_dev_ops b53_switch_ops_65 = {
++	.attr_global = {
++		.attr = b53_global_ops_65,
++		.n_attr = ARRAY_SIZE(b53_global_ops_65),
++	},
++	.attr_port = {
++		.attr = b53_port_ops,
++		.n_attr = ARRAY_SIZE(b53_port_ops),
++	},
++	.attr_vlan = {
++		.attr = b53_no_ops,
++		.n_attr = ARRAY_SIZE(b53_no_ops),
++	},
++
++	.get_vlan_ports = b53_vlan_get_ports,
++	.set_vlan_ports = b53_vlan_set_ports,
++	.get_port_pvid = b53_port_get_pvid,
++	.set_port_pvid = b53_port_set_pvid,
++	.apply_config = b53_global_apply_config,
++	.reset_switch = b53_global_reset_switch,
++	.get_port_link = b53_port_get_link,
++};
++
++static const struct switch_dev_ops b53_switch_ops = {
++	.attr_global = {
++		.attr = b53_global_ops,
++		.n_attr = ARRAY_SIZE(b53_global_ops),
++	},
++	.attr_port = {
++		.attr = b53_port_ops,
++		.n_attr = ARRAY_SIZE(b53_port_ops),
++	},
++	.attr_vlan = {
++		.attr = b53_no_ops,
++		.n_attr = ARRAY_SIZE(b53_no_ops),
++	},
++
++	.get_vlan_ports = b53_vlan_get_ports,
++	.set_vlan_ports = b53_vlan_set_ports,
++	.get_port_pvid = b53_port_get_pvid,
++	.set_port_pvid = b53_port_set_pvid,
++	.apply_config = b53_global_apply_config,
++	.reset_switch = b53_global_reset_switch,
++	.get_port_link = b53_port_get_link,
++};
++
++struct b53_chip_data {
++	u32 chip_id;
++	const char *dev_name;
++	const char *alias;
++	u16 vlans;
++	u16 enabled_ports;
++	u8 cpu_port;
++	u8 vta_regs[3];
++	u8 duplex_reg;
++	u8 jumbo_pm_reg;
++	u8 jumbo_size_reg;
++	const struct switch_dev_ops *sw_ops;
++};
++
++#define B53_VTA_REGS	\
++	{ B53_VT_ACCESS, B53_VT_INDEX, B53_VT_ENTRY }
++#define B53_VTA_REGS_9798 \
++	{ B53_VT_ACCESS_9798, B53_VT_INDEX_9798, B53_VT_ENTRY_9798 }
++#define B53_VTA_REGS_63XX \
++	{ B53_VT_ACCESS_63XX, B53_VT_INDEX_63XX, B53_VT_ENTRY_63XX }
++
++static const struct b53_chip_data b53_switch_chips[] = {
++	{
++		.chip_id = BCM5325_DEVICE_ID,
++		.dev_name = "BCM5325",
++		.alias = "bcm5325",
++		.vlans = 16,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25,
++		.duplex_reg = B53_DUPLEX_STAT_FE,
++		.sw_ops = &b53_switch_ops_25,
++	},
++	{
++		.chip_id = BCM5365_DEVICE_ID,
++		.dev_name = "BCM5365",
++		.alias = "bcm5365",
++		.vlans = 256,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25,
++		.duplex_reg = B53_DUPLEX_STAT_FE,
++		.sw_ops = &b53_switch_ops_65,
++	},
++	{
++		.chip_id = BCM5395_DEVICE_ID,
++		.dev_name = "BCM5395",
++		.alias = "bcm5395",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT,
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM5397_DEVICE_ID,
++		.dev_name = "BCM5397",
++		.alias = "bcm5397",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT,
++		.vta_regs = B53_VTA_REGS_9798,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM5398_DEVICE_ID,
++		.dev_name = "BCM5398",
++		.alias = "bcm5398",
++		.vlans = 4096,
++		.enabled_ports = 0x7f,
++		.cpu_port = B53_CPU_PORT,
++		.vta_regs = B53_VTA_REGS_9798,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53115_DEVICE_ID,
++		.dev_name = "BCM53115",
++		.alias = "bcm53115",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.vta_regs = B53_VTA_REGS,
++		.cpu_port = B53_CPU_PORT,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53125_DEVICE_ID,
++		.dev_name = "BCM53125",
++		.alias = "bcm53125",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT,
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53128_DEVICE_ID,
++		.dev_name = "BCM53128",
++		.alias = "bcm53128",
++		.vlans = 4096,
++		.enabled_ports = 0x1ff,
++		.cpu_port = B53_CPU_PORT,
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM63XX_DEVICE_ID,
++		.dev_name = "BCM63xx",
++		.alias = "bcm63xx",
++		.vlans = 4096,
++		.enabled_ports = 0, /* pdata must provide them */
++		.cpu_port = B53_CPU_PORT,
++		.vta_regs = B53_VTA_REGS_63XX,
++		.duplex_reg = B53_DUPLEX_STAT_63XX,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK_63XX,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE_63XX,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53010_DEVICE_ID,
++		.dev_name = "BCM53010",
++		.alias = "bcm53011",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25, // TODO: auto detect
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53011_DEVICE_ID,
++		.dev_name = "BCM53011",
++		.alias = "bcm53011",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25, // TODO: auto detect
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53012_DEVICE_ID,
++		.dev_name = "BCM53012",
++		.alias = "bcm53011",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25, // TODO: auto detect
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53018_DEVICE_ID,
++		.dev_name = "BCM53018",
++		.alias = "bcm53018",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25, // TODO: auto detect
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++	{
++		.chip_id = BCM53019_DEVICE_ID,
++		.dev_name = "BCM53019",
++		.alias = "bcm53019",
++		.vlans = 4096,
++		.enabled_ports = 0x1f,
++		.cpu_port = B53_CPU_PORT_25, // TODO: auto detect
++		.vta_regs = B53_VTA_REGS,
++		.duplex_reg = B53_DUPLEX_STAT_GE,
++		.jumbo_pm_reg = B53_JUMBO_PORT_MASK,
++		.jumbo_size_reg = B53_JUMBO_MAX_SIZE,
++		.sw_ops = &b53_switch_ops,
++	},
++};
++
++static int b53_switch_init(struct b53_device *dev)
++{
++	struct switch_dev *sw_dev = &dev->sw_dev;
++	unsigned i;
++	int ret;
++
++	for (i = 0; i < ARRAY_SIZE(b53_switch_chips); i++) {
++		const struct b53_chip_data *chip = &b53_switch_chips[i];
++
++		if (chip->chip_id == dev->chip_id) {
++			sw_dev->name = chip->dev_name;
++			if (!sw_dev->alias)
++				sw_dev->alias = chip->alias;
++			if (!dev->enabled_ports)
++				dev->enabled_ports = chip->enabled_ports;
++			dev->duplex_reg = chip->duplex_reg;
++			dev->vta_regs[0] = chip->vta_regs[0];
++			dev->vta_regs[1] = chip->vta_regs[1];
++			dev->vta_regs[2] = chip->vta_regs[2];
++			dev->jumbo_pm_reg = chip->jumbo_pm_reg;
++			sw_dev->ops = chip->sw_ops;
++			sw_dev->cpu_port = chip->cpu_port;
++			sw_dev->vlans = chip->vlans;
++			break;
++		}
++	}
++
++	if (!sw_dev->name)
++		return -EINVAL;
++
++	/* check which BCM5325x version we have */
++	if (is5325(dev)) {
++		u8 vc4;
++
++		b53_read8(dev, B53_VLAN_PAGE, B53_VLAN_CTRL4_25, &vc4);
++
++		/* check reserved bits */
++		switch (vc4 & 3) {
++		case 1:
++			/* BCM5325E */
++			break;
++		case 3:
++			/* BCM5325F - do not use port 4 */
++			dev->enabled_ports &= ~BIT(4);
++			break;
++		default:
++/* On the BCM47XX SoCs this is the supported internal switch.*/
++#ifndef CONFIG_BCM47XX
++			/* BCM5325M */
++			return -EINVAL;
++#else
++			break;
++#endif
++		}
++	} else if (dev->chip_id == BCM53115_DEVICE_ID) {
++		u64 strap_value;
++
++		b53_read48(dev, B53_STAT_PAGE, B53_STRAP_VALUE, &strap_value);
++		/* use second IMP port if GMII is enabled */
++		if (strap_value & SV_GMII_CTRL_115)
++			sw_dev->cpu_port = 5;
++	}
++
++	/* cpu port is always last */
++	sw_dev->ports = sw_dev->cpu_port + 1;
++	dev->enabled_ports |= BIT(sw_dev->cpu_port);
++
++	dev->ports = devm_kzalloc(dev->dev,
++				  sizeof(struct b53_port) * sw_dev->ports,
++				  GFP_KERNEL);
++	if (!dev->ports)
++		return -ENOMEM;
++
++	dev->vlans = devm_kzalloc(dev->dev,
++				  sizeof(struct b53_vlan) * sw_dev->vlans,
++				  GFP_KERNEL);
++	if (!dev->vlans)
++		return -ENOMEM;
++
++	dev->buf = devm_kzalloc(dev->dev, B53_BUF_SIZE, GFP_KERNEL);
++	if (!dev->buf)
++		return -ENOMEM;
++
++	dev->reset_gpio = b53_switch_get_reset_gpio(dev);
++	if (dev->reset_gpio >= 0) {
++		ret = devm_gpio_request_one(dev->dev, dev->reset_gpio, GPIOF_OUT_INIT_HIGH, "robo_reset");
++		if (ret)
++			return ret;
++	}
++
++	return b53_switch_reset(dev);
++}
++
++struct b53_device *b53_switch_alloc(struct device *base, struct b53_io_ops *ops,
++				    void *priv)
++{
++	struct b53_device *dev;
++
++	dev = devm_kzalloc(base, sizeof(*dev), GFP_KERNEL);
++	if (!dev)
++		return NULL;
++
++	dev->dev = base;
++	dev->ops = ops;
++	dev->priv = priv;
++	mutex_init(&dev->reg_mutex);
++
++	return dev;
++}
++EXPORT_SYMBOL(b53_switch_alloc);
++
++int b53_switch_detect(struct b53_device *dev)
++{
++	u32 id32;
++	u16 tmp;
++	u8 id8;
++	int ret;
++
++	ret = b53_read8(dev, B53_MGMT_PAGE, B53_DEVICE_ID, &id8);
++	if (ret)
++		return ret;
++
++	switch (id8) {
++	case 0:
++		/*
++		 * BCM5325 and BCM5365 do not have this register so reads
++		 * return 0. But the read operation did succeed, so assume
++		 * this is one of them.
++		 *
++		 * Next check if we can write to the 5325's VTA register; for
++		 * 5365 it is read only.
++		 */
++
++		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_TABLE_ACCESS_25, 0xf);
++		b53_read16(dev, B53_VLAN_PAGE, B53_VLAN_TABLE_ACCESS_25, &tmp);
++
++		if (tmp == 0xf)
++			dev->chip_id = BCM5325_DEVICE_ID;
++		else
++			dev->chip_id = BCM5365_DEVICE_ID;
++		break;
++	case BCM5395_DEVICE_ID:
++	case BCM5397_DEVICE_ID:
++	case BCM5398_DEVICE_ID:
++		dev->chip_id = id8;
++		break;
++	default:
++		ret = b53_read32(dev, B53_MGMT_PAGE, B53_DEVICE_ID, &id32);
++		if (ret)
++			return ret;
++
++		switch (id32) {
++		case BCM53115_DEVICE_ID:
++		case BCM53125_DEVICE_ID:
++		case BCM53128_DEVICE_ID:
++		case BCM53010_DEVICE_ID:
++		case BCM53011_DEVICE_ID:
++		case BCM53012_DEVICE_ID:
++		case BCM53018_DEVICE_ID:
++		case BCM53019_DEVICE_ID:
++			dev->chip_id = id32;
++			break;
++		default:
++			pr_err("unsupported switch detected (BCM53%02x/BCM%x)\n",
++			       id8, id32);
++			return -ENODEV;
++		}
++	}
++
++	if (dev->chip_id == BCM5325_DEVICE_ID)
++		return b53_read8(dev, B53_STAT_PAGE, B53_REV_ID_25,
++				 &dev->core_rev);
++	else
++		return b53_read8(dev, B53_MGMT_PAGE, B53_REV_ID,
++				 &dev->core_rev);
++}
++EXPORT_SYMBOL(b53_switch_detect);
++
++int b53_switch_register(struct b53_device *dev)
++{
++	int ret;
++
++	if (dev->pdata) {
++		dev->chip_id = dev->pdata->chip_id;
++		dev->enabled_ports = dev->pdata->enabled_ports;
++		dev->sw_dev.alias = dev->pdata->alias;
++	}
++
++	if (!dev->chip_id && b53_switch_detect(dev))
++		return -EINVAL;
++
++	ret = b53_switch_init(dev);
++	if (ret)
++		return ret;
++
++	pr_info("found switch: %s, rev %i\n", dev->sw_dev.name, dev->core_rev);
++
++	return register_switch(&dev->sw_dev, NULL);
++}
++EXPORT_SYMBOL(b53_switch_register);
++
++MODULE_AUTHOR("Jonas Gorski <jogo@openwrt.org>");
++MODULE_DESCRIPTION("B53 switch library");
++MODULE_LICENSE("Dual BSD/GPL");
+diff --git a/drivers/net/phy/b53/b53_mdio.c b/drivers/net/phy/b53/b53_mdio.c
+new file mode 100644
+index 0000000..3c25f0e
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_mdio.c
+@@ -0,0 +1,425 @@
++/*
++ * B53 register access through MII registers
++ *
++ * Copyright (C) 2011-2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <linux/kernel.h>
++#include <linux/phy.h>
++#include <linux/module.h>
++
++#include "b53_priv.h"
++
++#define B53_PSEUDO_PHY	0x1e /* Register Access Pseudo PHY */
++
++/* MII registers */
++#define REG_MII_PAGE    0x10    /* MII Page register */
++#define REG_MII_ADDR    0x11    /* MII Address register */
++#define REG_MII_DATA0   0x18    /* MII Data register 0 */
++#define REG_MII_DATA1   0x19    /* MII Data register 1 */
++#define REG_MII_DATA2   0x1a    /* MII Data register 2 */
++#define REG_MII_DATA3   0x1b    /* MII Data register 3 */
++
++#define REG_MII_PAGE_ENABLE     BIT(0)
++#define REG_MII_ADDR_WRITE      BIT(0)
++#define REG_MII_ADDR_READ       BIT(1)
++
++static int b53_mdio_op(struct b53_device *dev, u8 page, u8 reg, u16 op)
++{
++	int i;
++	u16 v;
++	int ret;
++	struct mii_bus *bus = dev->priv;
++
++	if (dev->current_page != page) {
++		/* set page number */
++		v = (page << 8) | REG_MII_PAGE_ENABLE;
++		ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_PAGE, v);
++		if (ret)
++			return ret;
++		dev->current_page = page;
++	}
++
++	/* set register address */
++	v = (reg << 8) | op;
++	ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_ADDR, v);
++	if (ret)
++		return ret;
++
++	/* check if operation completed */
++	for (i = 0; i < 5; ++i) {
++		v = mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_ADDR);
++		if (!(v & (REG_MII_ADDR_WRITE | REG_MII_ADDR_READ)))
++			break;
++		usleep_range(10, 100);
++	}
++
++	if (WARN_ON(i == 5))
++		return -EIO;
++
++	return 0;
++}
++
++static int b53_mdio_read8(struct b53_device *dev, u8 page, u8 reg, u8 *val)
++{
++	struct mii_bus *bus = dev->priv;
++	int ret;
++
++	ret = b53_mdio_op(dev, page, reg, REG_MII_ADDR_READ);
++	if (ret)
++		return ret;
++
++	*val = mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_DATA0) & 0xff;
++
++	return 0;
++}
++
++static int b53_mdio_read16(struct b53_device *dev, u8 page, u8 reg, u16 *val)
++{
++	struct mii_bus *bus = dev->priv;
++	int ret;
++
++	ret = b53_mdio_op(dev, page, reg, REG_MII_ADDR_READ);
++	if (ret)
++		return ret;
++
++	*val = mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_DATA0);
++
++	return 0;
++}
++
++static int b53_mdio_read32(struct b53_device *dev, u8 page, u8 reg, u32 *val)
++{
++	struct mii_bus *bus = dev->priv;
++	int ret;
++
++	ret = b53_mdio_op(dev, page, reg, REG_MII_ADDR_READ);
++	if (ret)
++		return ret;
++
++	*val = mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_DATA0);
++	*val |= mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_DATA1) << 16;
++
++	return 0;
++}
++
++static int b53_mdio_read48(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	struct mii_bus *bus = dev->priv;
++	u64 temp = 0;
++	int i;
++	int ret;
++
++	ret = b53_mdio_op(dev, page, reg, REG_MII_ADDR_READ);
++	if (ret)
++		return ret;
++
++	for (i = 2; i >= 0; i--) {
++		temp <<= 16;
++		temp |= mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_DATA0 + i);
++	}
++
++	*val = temp;
++
++	return 0;
++}
++
++static int b53_mdio_read64(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	struct mii_bus *bus = dev->priv;
++	u64 temp = 0;
++	int i;
++	int ret;
++
++	ret = b53_mdio_op(dev, page, reg, REG_MII_ADDR_READ);
++	if (ret)
++		return ret;
++
++	for (i = 3; i >= 0; i--) {
++		temp <<= 16;
++		temp |= mdiobus_read(bus, B53_PSEUDO_PHY, REG_MII_DATA0 + i);
++	}
++
++	*val = temp;
++
++	return 0;
++}
++
++static int b53_mdio_write8(struct b53_device *dev, u8 page, u8 reg, u8 value)
++{
++	struct mii_bus *bus = dev->priv;
++	int ret;
++
++	ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_DATA0, value);
++	if (ret)
++		return ret;
++
++	return b53_mdio_op(dev, page, reg, REG_MII_ADDR_WRITE);
++}
++
++static int b53_mdio_write16(struct b53_device *dev, u8 page, u8 reg,
++			     u16 value)
++{
++	struct mii_bus *bus = dev->priv;
++	int ret;
++
++	ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_DATA0, value);
++	if (ret)
++		return ret;
++
++	return b53_mdio_op(dev, page, reg, REG_MII_ADDR_WRITE);
++}
++
++static int b53_mdio_write32(struct b53_device *dev, u8 page, u8 reg,
++				    u32 value)
++{
++	struct mii_bus *bus = dev->priv;
++	unsigned int i;
++	u32 temp = value;
++
++	for (i = 0; i < 2; i++) {
++		int ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_DATA0 + i,
++				    temp & 0xffff);
++		if (ret)
++			return ret;
++		temp >>= 16;
++	}
++
++	return b53_mdio_op(dev, page, reg, REG_MII_ADDR_WRITE);
++
++}
++
++static int b53_mdio_write48(struct b53_device *dev, u8 page, u8 reg,
++				    u64 value)
++{
++	struct mii_bus *bus = dev->priv;
++	unsigned i;
++	u64 temp = value;
++
++	for (i = 0; i < 3; i++) {
++		int ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_DATA0 + i,
++				    temp & 0xffff);
++		if (ret)
++			return ret;
++		temp >>= 16;
++	}
++
++	return b53_mdio_op(dev, page, reg, REG_MII_ADDR_WRITE);
++
++}
++
++static int b53_mdio_write64(struct b53_device *dev, u8 page, u8 reg,
++			     u64 value)
++{
++	struct mii_bus *bus = dev->priv;
++	unsigned i;
++	u64 temp = value;
++
++	for (i = 0; i < 4; i++) {
++		int ret = mdiobus_write(bus, B53_PSEUDO_PHY, REG_MII_DATA0 + i,
++				    temp & 0xffff);
++		if (ret)
++			return ret;
++		temp >>= 16;
++	}
++
++	return b53_mdio_op(dev, page, reg, REG_MII_ADDR_WRITE);
++}
++
++static struct b53_io_ops b53_mdio_ops = {
++	.read8 = b53_mdio_read8,
++	.read16 = b53_mdio_read16,
++	.read32 = b53_mdio_read32,
++	.read48 = b53_mdio_read48,
++	.read64 = b53_mdio_read64,
++	.write8 = b53_mdio_write8,
++	.write16 = b53_mdio_write16,
++	.write32 = b53_mdio_write32,
++	.write48 = b53_mdio_write48,
++	.write64 = b53_mdio_write64,
++};
++
++static int b53_phy_probe(struct phy_device *phydev)
++{
++	struct b53_device dev;
++	int ret;
++
++	/* allow the generic phy driver to take over */
++	if (phydev->addr != B53_PSEUDO_PHY && phydev->addr != 0)
++		return -ENODEV;
++
++	dev.current_page = 0xff;
++	dev.priv = phydev->bus;
++	dev.ops = &b53_mdio_ops;
++	dev.pdata = NULL;
++	mutex_init(&dev.reg_mutex);
++
++	ret = b53_switch_detect(&dev);
++	if (ret)
++		return ret;
++
++	if (is5325(&dev) || is5365(&dev))
++		phydev->supported = SUPPORTED_100baseT_Full;
++	else
++		phydev->supported = SUPPORTED_1000baseT_Full;
++
++	phydev->advertising = phydev->supported;
++
++	return 0;
++}
++
++static int b53_phy_config_init(struct phy_device *phydev)
++{
++	struct b53_device *dev;
++	int ret;
++
++	dev = b53_switch_alloc(&phydev->dev, &b53_mdio_ops, phydev->bus);
++	if (!dev)
++		return -ENOMEM;
++
++	/* we don't use page 0xff, so force a page set */
++	dev->current_page = 0xff;
++	/* force the ethX as alias */
++	dev->sw_dev.alias = phydev->attached_dev->name;
++
++	ret = b53_switch_register(dev);
++	if (ret) {
++		dev_err(dev->dev, "failed to register switch: %i\n", ret);
++		return ret;
++	}
++
++	phydev->priv = dev;
++
++	return 0;
++}
++
++static void b53_phy_remove(struct phy_device *phydev)
++{
++	struct b53_device *priv = phydev->priv;
++
++	if (!priv)
++		return;
++
++	b53_switch_remove(priv);
++
++	phydev->priv = NULL;
++}
++
++static int b53_phy_config_aneg(struct phy_device *phydev)
++{
++	return 0;
++}
++
++static int b53_phy_read_status(struct phy_device *phydev)
++{
++	struct b53_device *priv = phydev->priv;
++
++	if (is5325(priv) || is5365(priv))
++		phydev->speed = 100;
++	else
++		phydev->speed = 1000;
++
++	phydev->duplex = DUPLEX_FULL;
++	phydev->link = 1;
++	phydev->state = PHY_RUNNING;
++
++	netif_carrier_on(phydev->attached_dev);
++	phydev->adjust_link(phydev->attached_dev);
++
++	return 0;
++}
++
++/* BCM5325, BCM539x */
++static struct phy_driver b53_phy_driver_id1 = {
++	.phy_id		= 0x0143bc00,
++	.name		= "Broadcom B53 (1)",
++	.phy_id_mask	= 0x1ffffc00,
++	.features	= 0,
++	.probe		= b53_phy_probe,
++	.remove		= b53_phy_remove,
++	.config_aneg	= b53_phy_config_aneg,
++	.config_init	= b53_phy_config_init,
++	.read_status	= b53_phy_read_status,
++	.driver = {
++		.owner = THIS_MODULE,
++	},
++};
++
++/* BCM53125, BCM53128 */
++static struct phy_driver b53_phy_driver_id2 = {
++	.phy_id		= 0x03625c00,
++	.name		= "Broadcom B53 (2)",
++	.phy_id_mask	= 0x1ffffc00,
++	.features	= 0,
++	.probe		= b53_phy_probe,
++	.remove		= b53_phy_remove,
++	.config_aneg	= b53_phy_config_aneg,
++	.config_init	= b53_phy_config_init,
++	.read_status	= b53_phy_read_status,
++	.driver = {
++		.owner = THIS_MODULE,
++	},
++};
++
++/* BCM5365 */
++static struct phy_driver b53_phy_driver_id3 = {
++	.phy_id		= 0x00406000,
++	.name		= "Broadcom B53 (3)",
++	.phy_id_mask	= 0x1ffffc00,
++	.features	= 0,
++	.probe		= b53_phy_probe,
++	.remove		= b53_phy_remove,
++	.config_aneg	= b53_phy_config_aneg,
++	.config_init	= b53_phy_config_init,
++	.read_status	= b53_phy_read_status,
++	.driver = {
++		.owner = THIS_MODULE,
++	},
++};
++
++int __init b53_phy_driver_register(void)
++{
++	int ret;
++
++	ret = phy_driver_register(&b53_phy_driver_id1);
++	if (ret)
++		return ret;
++
++	ret = phy_driver_register(&b53_phy_driver_id2);
++	if (ret)
++		goto err1;
++
++	ret = phy_driver_register(&b53_phy_driver_id3);
++	if (!ret)
++		return 0;
++
++	phy_driver_unregister(&b53_phy_driver_id2);
++err1:
++	phy_driver_unregister(&b53_phy_driver_id1);
++	return ret;
++}
++
++void __exit b53_phy_driver_unregister(void)
++{
++	phy_driver_unregister(&b53_phy_driver_id3);
++	phy_driver_unregister(&b53_phy_driver_id2);
++	phy_driver_unregister(&b53_phy_driver_id1);
++}
++
++module_init(b53_phy_driver_register);
++module_exit(b53_phy_driver_unregister);
++
++MODULE_DESCRIPTION("B53 MDIO access driver");
++MODULE_LICENSE("Dual BSD/GPL");
+diff --git a/drivers/net/phy/b53/b53_mmap.c b/drivers/net/phy/b53/b53_mmap.c
+new file mode 100644
+index 0000000..b868166
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_mmap.c
+@@ -0,0 +1,242 @@
++/*
++ * B53 register access through memory mapped registers
++ *
++ * Copyright (C) 2012-2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/platform_data/b53.h>
++
++#include "b53_priv.h"
++
++static int b53_mmap_read8(struct b53_device *dev, u8 page, u8 reg, u8 *val)
++{
++	u8 __iomem *regs = dev->priv;
++
++	*val = readb(regs + (page << 8) + reg);
++
++	return 0;
++}
++
++static int b53_mmap_read16(struct b53_device *dev, u8 page, u8 reg, u16 *val)
++{
++	u8 __iomem *regs = dev->priv;
++
++	if (WARN_ON(reg % 2))
++		return -EINVAL;
++
++	if (dev->pdata && dev->pdata->big_endian)
++		*val = readw_be(regs + (page << 8) + reg);
++	else
++		*val = readw(regs + (page << 8) + reg);
++
++	return 0;
++}
++
++static int b53_mmap_read32(struct b53_device *dev, u8 page, u8 reg, u32 *val)
++{
++	u8 __iomem *regs = dev->priv;
++
++	if (WARN_ON(reg % 4))
++		return -EINVAL;
++
++	if (dev->pdata && dev->pdata->big_endian)
++		*val = readl_be(regs + (page << 8) + reg);
++	else
++		*val = readl(regs + (page << 8) + reg);
++
++	return 0;
++}
++
++static int b53_mmap_read48(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	if (WARN_ON(reg % 2))
++		return -EINVAL;
++
++	if (reg % 4) {
++		u16 lo;
++		u32 hi;
++
++		b53_mmap_read16(dev, page, reg, &lo);
++		b53_mmap_read32(dev, page, reg + 2, &hi);
++
++		*val = ((u64)hi << 16) | lo;
++	} else {
++		u32 lo;
++		u16 hi;
++
++		b53_mmap_read32(dev, page, reg, &lo);
++		b53_mmap_read16(dev, page, reg + 4, &hi);
++
++		*val = ((u64)hi << 32) | lo;
++	}
++
++	return 0;
++}
++
++static int b53_mmap_read64(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	u32 hi, lo;
++
++	if (WARN_ON(reg % 4))
++		return -EINVAL;
++
++	b53_mmap_read32(dev, page, reg, &lo);
++	b53_mmap_read32(dev, page, reg + 4, &hi);
++
++	*val = ((u64)hi << 32) | lo;
++
++	return 0;
++}
++
++static int b53_mmap_write8(struct b53_device *dev, u8 page, u8 reg, u8 value)
++{
++	u8 __iomem *regs = dev->priv;
++
++	writeb(value, regs + (page << 8) + reg);
++
++	return 0;
++}
++
++static int b53_mmap_write16(struct b53_device *dev, u8 page, u8 reg,
++			     u16 value)
++{
++	u8 __iomem *regs = dev->priv;
++
++	if (WARN_ON(reg % 2))
++		return -EINVAL;
++
++	if (dev->pdata && dev->pdata->big_endian)
++		writew_be(value, regs + (page << 8) + reg);
++	else
++		writew(value, regs + (page << 8) + reg);
++
++	return 0;
++}
++
++static int b53_mmap_write32(struct b53_device *dev, u8 page, u8 reg,
++				    u32 value)
++{
++	u8 __iomem *regs = dev->priv;
++
++	if (WARN_ON(reg % 4))
++		return -EINVAL;
++
++	if (dev->pdata && dev->pdata->big_endian)
++		writel_be(value, regs + (page << 8) + reg);
++	else
++		writel(value, regs + (page << 8) + reg);
++
++	return 0;
++}
++
++static int b53_mmap_write48(struct b53_device *dev, u8 page, u8 reg,
++				    u64 value)
++{
++	if (WARN_ON(reg % 2))
++		return -EINVAL;
++
++	if (reg % 4) {
++		u32 hi = (u32)(value >> 16);
++		u16 lo = (u16)value;
++
++		b53_mmap_write16(dev, page, reg, lo);
++		b53_mmap_write32(dev, page, reg + 2, hi);
++	} else {
++		u16 hi = (u16)(value >> 32);
++		u32 lo = (u32)value;
++
++		b53_mmap_write32(dev, page, reg, lo);
++		b53_mmap_write16(dev, page, reg + 4, hi);
++	}
++
++	return 0;
++}
++
++static int b53_mmap_write64(struct b53_device *dev, u8 page, u8 reg,
++			     u64 value)
++{
++	u32 hi, lo;
++
++	hi = (u32)(value >> 32);
++	lo = (u32)value;
++
++	if (WARN_ON(reg % 4))
++		return -EINVAL;
++
++	b53_mmap_write32(dev, page, reg, lo);
++	b53_mmap_write32(dev, page, reg + 4, hi);
++
++	return 0;
++}
++
++static struct b53_io_ops b53_mmap_ops = {
++	.read8 = b53_mmap_read8,
++	.read16 = b53_mmap_read16,
++	.read32 = b53_mmap_read32,
++	.read48 = b53_mmap_read48,
++	.read64 = b53_mmap_read64,
++	.write8 = b53_mmap_write8,
++	.write16 = b53_mmap_write16,
++	.write32 = b53_mmap_write32,
++	.write48 = b53_mmap_write48,
++	.write64 = b53_mmap_write64,
++};
++
++static int b53_mmap_probe(struct platform_device *pdev)
++{
++	struct b53_platform_data *pdata = pdev->dev.platform_data;
++	struct b53_device *dev;
++
++	if (!pdata)
++		return -EINVAL;
++
++	dev = b53_switch_alloc(&pdev->dev, &b53_mmap_ops, pdata->regs);
++	if (!dev)
++		return -ENOMEM;
++
++	if (pdata)
++		dev->pdata = pdata;
++
++	platform_set_drvdata(pdev, dev);
++
++	return b53_switch_register(dev);
++}
++
++static int b53_mmap_remove(struct platform_device *pdev)
++{
++	struct b53_device *dev = platform_get_drvdata(pdev);
++
++	if (dev) {
++		b53_switch_remove(dev);
++	}
++
++	return 0;
++}
++
++static struct platform_driver b53_mmap_driver = {
++	.probe = b53_mmap_probe,
++	.remove = b53_mmap_remove,
++	.driver = {
++		.name = "b53-switch",
++	},
++};
++
++module_platform_driver(b53_mmap_driver);
++MODULE_AUTHOR("Jonas Gorski <jogo@openwrt.org>");
++MODULE_DESCRIPTION("B53 MMAP access driver");
++MODULE_LICENSE("Dual BSD/GPL");
+diff --git a/drivers/net/phy/b53/b53_phy_fixup.c b/drivers/net/phy/b53/b53_phy_fixup.c
+new file mode 100644
+index 0000000..72d1373
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_phy_fixup.c
+@@ -0,0 +1,55 @@
++/*
++ * B53 PHY Fixup call
++ *
++ * Copyright (C) 2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <linux/init.h>
++#include <linux/kernel.h>
++#include <linux/phy.h>
++
++#define B53_PSEUDO_PHY	0x1e /* Register Access Pseudo PHY */
++
++#define B53_BRCM_OUI_1	0x0143bc00
++#define B53_BRCM_OUI_2	0x03625c00
++#define B53_BRCM_OUI_3	0x00406000
++
++static int b53_phy_fixup(struct phy_device *dev)
++{
++	u32 phy_id;
++	struct mii_bus *bus = dev->bus;
++
++	if (dev->addr != B53_PSEUDO_PHY)
++		return 0;
++
++	/* read the first port's id */
++	phy_id = mdiobus_read(bus, 0, 2) << 16;
++	phy_id |= mdiobus_read(bus, 0, 3);
++
++	if ((phy_id & 0xfffffc00) == B53_BRCM_OUI_1 ||
++	    (phy_id & 0xfffffc00) == B53_BRCM_OUI_2 ||
++	    (phy_id & 0xfffffc00) == B53_BRCM_OUI_3) {
++		dev->phy_id = phy_id;
++	}
++
++	return 0;
++}
++
++int __init b53_phy_fixup_register(void)
++{
++	return phy_register_fixup_for_id(PHY_ANY_ID, b53_phy_fixup);
++}
++
++subsys_initcall(b53_phy_fixup_register);
+diff --git a/drivers/net/phy/b53/b53_priv.h b/drivers/net/phy/b53/b53_priv.h
+new file mode 100644
+index 0000000..bc9b533
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_priv.h
+@@ -0,0 +1,324 @@
++/*
++ * B53 common definitions
++ *
++ * Copyright (C) 2011-2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#ifndef __B53_PRIV_H
++#define __B53_PRIV_H
++
++#include <linux/kernel.h>
++#include <linux/mutex.h>
++#include <linux/switch.h>
++
++struct b53_device;
++
++struct b53_io_ops {
++	int (*read8)(struct b53_device *dev, u8 page, u8 reg, u8 *value);
++	int (*read16)(struct b53_device *dev, u8 page, u8 reg, u16 *value);
++	int (*read32)(struct b53_device *dev, u8 page, u8 reg, u32 *value);
++	int (*read48)(struct b53_device *dev, u8 page, u8 reg, u64 *value);
++	int (*read64)(struct b53_device *dev, u8 page, u8 reg, u64 *value);
++	int (*write8)(struct b53_device *dev, u8 page, u8 reg, u8 value);
++	int (*write16)(struct b53_device *dev, u8 page, u8 reg, u16 value);
++	int (*write32)(struct b53_device *dev, u8 page, u8 reg, u32 value);
++	int (*write48)(struct b53_device *dev, u8 page, u8 reg, u64 value);
++	int (*write64)(struct b53_device *dev, u8 page, u8 reg, u64 value);
++};
++
++enum {
++	BCM5325_DEVICE_ID = 0x25,
++	BCM5365_DEVICE_ID = 0x65,
++	BCM5395_DEVICE_ID = 0x95,
++	BCM5397_DEVICE_ID = 0x97,
++	BCM5398_DEVICE_ID = 0x98,
++	BCM53115_DEVICE_ID = 0x53115,
++	BCM53125_DEVICE_ID = 0x53125,
++	BCM53128_DEVICE_ID = 0x53128,
++	BCM63XX_DEVICE_ID = 0x6300,
++	BCM53010_DEVICE_ID = 0x53010,
++	BCM53011_DEVICE_ID = 0x53011,
++	BCM53012_DEVICE_ID = 0x53012,
++	BCM53018_DEVICE_ID = 0x53018,
++	BCM53019_DEVICE_ID = 0x53019,
++};
++
++#define B53_N_PORTS	9
++#define B53_N_PORTS_25	6
++
++struct b53_vlan {
++	unsigned int	members:B53_N_PORTS;
++	unsigned int	untag:B53_N_PORTS;
++};
++
++struct b53_port {
++	unsigned int	pvid:12;
++};
++
++struct b53_device {
++	struct switch_dev sw_dev;
++	struct b53_platform_data *pdata;
++
++	struct mutex reg_mutex;
++	const struct b53_io_ops *ops;
++
++	/* chip specific data */
++	u32 chip_id;
++	u8 core_rev;
++	u8 vta_regs[3];
++	u8 duplex_reg;
++	u8 jumbo_pm_reg;
++	u8 jumbo_size_reg;
++	int reset_gpio;
++
++	/* used ports mask */
++	u16 enabled_ports;
++
++	/* connect specific data */
++	u8 current_page;
++	struct device *dev;
++	void *priv;
++
++	/* run time configuration */
++	unsigned enable_vlan:1;
++	unsigned enable_jumbo:1;
++	unsigned allow_vid_4095:1;
++
++	struct b53_port *ports;
++	struct b53_vlan *vlans;
++
++	char *buf;
++};
++
++#define b53_for_each_port(dev, i) \
++	for (i = 0; i < B53_N_PORTS; i++) \
++		if (dev->enabled_ports & BIT(i))
++
++
++
++static inline int is5325(struct b53_device *dev)
++{
++	return dev->chip_id == BCM5325_DEVICE_ID;
++}
++
++static inline int is5365(struct b53_device *dev)
++{
++#ifdef CONFIG_BCM47XX
++	return dev->chip_id == BCM5365_DEVICE_ID;
++#else
++	return 0;
++#endif
++}
++
++static inline int is5397_98(struct b53_device *dev)
++{
++	return dev->chip_id == BCM5397_DEVICE_ID ||
++		dev->chip_id == BCM5398_DEVICE_ID;
++}
++
++static inline int is539x(struct b53_device *dev)
++{
++	return dev->chip_id == BCM5395_DEVICE_ID ||
++		dev->chip_id == BCM5397_DEVICE_ID ||
++		dev->chip_id == BCM5398_DEVICE_ID;
++}
++
++static inline int is531x5(struct b53_device *dev)
++{
++	return dev->chip_id == BCM53115_DEVICE_ID ||
++		dev->chip_id == BCM53125_DEVICE_ID ||
++		dev->chip_id == BCM53128_DEVICE_ID;
++}
++
++static inline int is63xx(struct b53_device *dev)
++{
++#ifdef CONFIG_BCM63XX
++	return dev->chip_id == BCM63XX_DEVICE_ID;
++#else
++	return 0;
++#endif
++}
++	
++static inline int is5301x(struct b53_device *dev)
++{
++	return dev->chip_id == BCM53010_DEVICE_ID ||
++		dev->chip_id == BCM53011_DEVICE_ID ||
++		dev->chip_id == BCM53012_DEVICE_ID ||
++		dev->chip_id == BCM53018_DEVICE_ID ||
++		dev->chip_id == BCM53019_DEVICE_ID;
++}
++
++#define B53_CPU_PORT_25	5
++#define B53_CPU_PORT	8
++
++static inline int is_cpu_port(struct b53_device *dev, int port)
++{
++	return dev->sw_dev.cpu_port == port;
++}
++
++static inline struct b53_device *sw_to_b53(struct switch_dev *sw)
++{
++	return container_of(sw, struct b53_device, sw_dev);
++}
++
++struct b53_device *b53_switch_alloc(struct device *base, struct b53_io_ops *ops,
++				    void *priv);
++
++int b53_switch_detect(struct b53_device *dev);
++
++int b53_switch_register(struct b53_device *dev);
++
++static inline void b53_switch_remove(struct b53_device *dev)
++{
++	unregister_switch(&dev->sw_dev);
++}
++
++static inline int b53_read8(struct b53_device *dev, u8 page, u8 reg, u8 *val)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->read8(dev, page, reg, val);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_read16(struct b53_device *dev, u8 page, u8 reg, u16 *val)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->read16(dev, page, reg, val);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_read32(struct b53_device *dev, u8 page, u8 reg, u32 *val)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->read32(dev, page, reg, val);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_read48(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->read48(dev, page, reg, val);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_read64(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->read64(dev, page, reg, val);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_write8(struct b53_device *dev, u8 page, u8 reg, u8 value)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->write8(dev, page, reg, value);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_write16(struct b53_device *dev, u8 page, u8 reg,
++			      u16 value)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->write16(dev, page, reg, value);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_write32(struct b53_device *dev, u8 page, u8 reg,
++			      u32 value)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->write32(dev, page, reg, value);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_write48(struct b53_device *dev, u8 page, u8 reg,
++			      u64 value)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->write48(dev, page, reg, value);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++static inline int b53_write64(struct b53_device *dev, u8 page, u8 reg,
++			       u64 value)
++{
++	int ret;
++
++	mutex_lock(&dev->reg_mutex);
++	ret = dev->ops->write64(dev, page, reg, value);
++	mutex_unlock(&dev->reg_mutex);
++
++	return ret;
++}
++
++#ifdef CONFIG_BCM47XX
++
++#include <bcm47xx_nvram.h>
++#include <bcm47xx_board.h>
++static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
++{
++	enum bcm47xx_board board = bcm47xx_board_get();
++
++	switch (board) {
++	case BCM47XX_BOARD_LINKSYS_WRT300NV11:
++	case BCM47XX_BOARD_LINKSYS_WRT310NV1:
++		return 8;
++	default:
++		return bcm47xx_nvram_gpio_pin("robo_reset");
++	}
++}
++#else
++static inline int b53_switch_get_reset_gpio(struct b53_device *dev)
++{
++	return -ENOENT;
++}
++#endif
++#endif
+diff --git a/drivers/net/phy/b53/b53_regs.h b/drivers/net/phy/b53/b53_regs.h
+new file mode 100644
+index 0000000..ba50915
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_regs.h
+@@ -0,0 +1,313 @@
++/*
++ * B53 register definitions
++ *
++ * Copyright (C) 2004 Broadcom Corporation
++ * Copyright (C) 2011-2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#ifndef __B53_REGS_H
++#define __B53_REGS_H
++
++/* Management Port (SMP) Page offsets */
++#define B53_CTRL_PAGE			0x00 /* Control */
++#define B53_STAT_PAGE			0x01 /* Status */
++#define B53_MGMT_PAGE			0x02 /* Management Mode */
++#define B53_MIB_AC_PAGE			0x03 /* MIB Autocast */
++#define B53_ARLCTRL_PAGE		0x04 /* ARL Control */
++#define B53_ARLIO_PAGE			0x05 /* ARL Access */
++#define B53_FRAMEBUF_PAGE		0x06 /* Management frame access */
++#define B53_MEM_ACCESS_PAGE		0x08 /* Memory access */
++
++/* PHY Registers */
++#define B53_PORT_MII_PAGE(i)		(0x10 + i) /* Port i MII Registers */
++#define B53_IM_PORT_PAGE		0x18 /* Inverse MII Port (to EMAC) */
++#define B53_ALL_PORT_PAGE		0x19 /* All ports MII (broadcast) */
++
++/* MIB registers */
++#define B53_MIB_PAGE(i)			(0x20 + i)
++
++/* Quality of Service (QoS) Registers */
++#define B53_QOS_PAGE			0x30
++
++/* Port VLAN Page */
++#define B53_PVLAN_PAGE			0x31
++
++/* VLAN Registers */
++#define B53_VLAN_PAGE			0x34
++
++/* Jumbo Frame Registers */
++#define B53_JUMBO_PAGE			0x40
++
++/*************************************************************************
++ * Control Page registers
++ *************************************************************************/
++
++/* Port Control Register (8 bit) */
++#define B53_PORT_CTRL(i)		(0x00 + i)
++#define   PORT_CTRL_RX_DISABLE		BIT(0)
++#define   PORT_CTRL_TX_DISABLE		BIT(1)
++#define   PORT_CTRL_RX_BCST_EN		BIT(2) /* Broadcast RX (P8 only) */
++#define   PORT_CTRL_RX_MCST_EN		BIT(3) /* Multicast RX (P8 only) */
++#define   PORT_CTRL_RX_UCST_EN		BIT(4) /* Unicast RX (P8 only) */
++#define	  PORT_CTRL_STP_STATE_S		5
++#define   PORT_CTRL_STP_STATE_MASK	(0x3 << PORT_CTRL_STP_STATE_S)
++
++/* SMP Control Register (8 bit) */
++#define B53_SMP_CTRL			0x0a
++
++/* Switch Mode Control Register (8 bit) */
++#define B53_SWITCH_MODE			0x0b
++#define   SM_SW_FWD_MODE		BIT(0)	/* 1 = Managed Mode */
++#define   SM_SW_FWD_EN			BIT(1)	/* Forwarding Enable */
++
++/* IMP Port state override register (8 bit) */
++#define B53_PORT_OVERRIDE_CTRL		0x0e
++#define   PORT_OVERRIDE_LINK		BIT(0)
++#define   PORT_OVERRIDE_HALF_DUPLEX	BIT(1) /* 0 = Full Duplex */
++#define   PORT_OVERRIDE_SPEED_S		2
++#define   PORT_OVERRIDE_SPEED_10M	(0 << PORT_OVERRIDE_SPEED_S)
++#define   PORT_OVERRIDE_SPEED_100M	(1 << PORT_OVERRIDE_SPEED_S)
++#define   PORT_OVERRIDE_SPEED_1000M	(2 << PORT_OVERRIDE_SPEED_S)
++#define   PORT_OVERRIDE_RV_MII_25	BIT(4) /* BCM5325 only */
++#define   PORT_OVERRIDE_RX_FLOW		BIT(4)
++#define   PORT_OVERRIDE_TX_FLOW		BIT(5)
++#define   PORT_OVERRIDE_EN		BIT(7) /* Use the register contents */
++
++/* Power-down mode control */
++#define B53_PD_MODE_CTRL_25		0x0f
++
++/* IP Multicast control (8 bit) */
++#define B53_IP_MULTICAST_CTRL		0x21
++#define  B53_IPMC_FWD_EN		BIT(1)
++#define  B53_UC_FWD_EN			BIT(6)
++#define  B53_MC_FWD_EN			BIT(7)
++
++/* (16 bit) */
++#define B53_UC_FLOOD_MASK		0x32
++#define B53_MC_FLOOD_MASK		0x34
++#define B53_IPMC_FLOOD_MASK		0x36
++
++/* Software reset register (8 bit) */
++#define B53_SOFTRESET			0x79
++
++/* Fast Aging Control register (8 bit) */
++#define B53_FAST_AGE_CTRL		0x88
++#define   FAST_AGE_STATIC		BIT(0)
++#define   FAST_AGE_DYNAMIC		BIT(1)
++#define   FAST_AGE_PORT			BIT(2)
++#define   FAST_AGE_VLAN			BIT(3)
++#define   FAST_AGE_STP			BIT(4)
++#define   FAST_AGE_MC			BIT(5)
++#define   FAST_AGE_DONE			BIT(7)
++
++/*************************************************************************
++ * Status Page registers
++ *************************************************************************/
++
++/* Link Status Summary Register (16bit) */
++#define B53_LINK_STAT			0x00
++
++/* Link Status Change Register (16 bit) */
++#define B53_LINK_STAT_CHANGE		0x02
++
++/* Port Speed Summary Register (16 bit for FE, 32 bit for GE) */
++#define B53_SPEED_STAT			0x04
++#define  SPEED_PORT_FE(reg, port)	(((reg) >> (port)) & 1)
++#define  SPEED_PORT_GE(reg, port)	(((reg) >> 2 * (port)) & 3)
++#define  SPEED_STAT_10M			0
++#define  SPEED_STAT_100M		1
++#define  SPEED_STAT_1000M		2
++
++/* Duplex Status Summary (16 bit) */
++#define B53_DUPLEX_STAT_FE		0x06
++#define B53_DUPLEX_STAT_GE		0x08
++#define B53_DUPLEX_STAT_63XX		0x0c
++
++/* Revision ID register for BCM5325 */
++#define B53_REV_ID_25			0x50
++
++/* Strap Value (48 bit) */
++#define B53_STRAP_VALUE			0x70
++#define   SV_GMII_CTRL_115		BIT(27)
++
++/*************************************************************************
++ * Management Mode Page Registers
++ *************************************************************************/
++
++/* Global Management Config Register (8 bit) */
++#define B53_GLOBAL_CONFIG		0x00
++#define   GC_RESET_MIB			0x01
++#define   GC_RX_BPDU_EN			0x02
++#define   GC_MIB_AC_HDR_EN		0x10
++#define   GC_MIB_AC_EN			0x20
++#define   GC_FRM_MGMT_PORT_M		0xC0
++#define   GC_FRM_MGMT_PORT_04		0x00
++#define   GC_FRM_MGMT_PORT_MII		0x80
++
++/* Device ID register (8 or 32 bit) */
++#define B53_DEVICE_ID			0x30
++
++/* Revision ID register (8 bit) */
++#define B53_REV_ID			0x40
++
++/*************************************************************************
++ * ARL Access Page Registers
++ *************************************************************************/
++
++/* VLAN Table Access Register (8 bit) */
++#define B53_VT_ACCESS			0x80
++#define B53_VT_ACCESS_9798		0x60 /* for BCM5397/BCM5398 */
++#define B53_VT_ACCESS_63XX		0x60 /* for BCM6328/62/68 */
++#define   VTA_CMD_WRITE			0
++#define   VTA_CMD_READ			1
++#define   VTA_CMD_CLEAR			2
++#define   VTA_START_CMD			BIT(7)
++
++/* VLAN Table Index Register (16 bit) */
++#define B53_VT_INDEX			0x81
++#define B53_VT_INDEX_9798		0x61
++#define B53_VT_INDEX_63XX		0x62
++
++/* VLAN Table Entry Register (32 bit) */
++#define B53_VT_ENTRY			0x83
++#define B53_VT_ENTRY_9798		0x63
++#define B53_VT_ENTRY_63XX		0x64
++#define   VTE_MEMBERS			0x1ff
++#define   VTE_UNTAG_S			9
++#define   VTE_UNTAG			(0x1ff << 9)
++
++/*************************************************************************
++ * Port VLAN Registers
++ *************************************************************************/
++
++/* Port VLAN mask (16 bit) IMP port is always 8, also on 5325 & co */
++#define B53_PVLAN_PORT_MASK(i)		((i) * 2)
++
++/*************************************************************************
++ * 802.1Q Page Registers
++ *************************************************************************/
++
++/* Global QoS Control (8 bit) */
++#define B53_QOS_GLOBAL_CTL		0x00
++
++/* Enable 802.1Q for individual Ports (16 bit) */
++#define B53_802_1P_EN			0x04
++
++/*************************************************************************
++ * VLAN Page Registers
++ *************************************************************************/
++
++/* VLAN Control 0 (8 bit) */
++#define B53_VLAN_CTRL0			0x00
++#define   VC0_8021PF_CTRL_MASK		0x3
++#define   VC0_8021PF_CTRL_NONE		0x0
++#define   VC0_8021PF_CTRL_CHANGE_PRI	0x1
++#define   VC0_8021PF_CTRL_CHANGE_VID	0x2
++#define   VC0_8021PF_CTRL_CHANGE_BOTH	0x3
++#define   VC0_8021QF_CTRL_MASK		0xc
++#define   VC0_8021QF_CTRL_CHANGE_PRI	0x1
++#define   VC0_8021QF_CTRL_CHANGE_VID	0x2
++#define   VC0_8021QF_CTRL_CHANGE_BOTH	0x3
++#define   VC0_RESERVED_1		BIT(1)
++#define   VC0_DROP_VID_MISS		BIT(4)
++#define   VC0_VID_HASH_VID		BIT(5)
++#define   VC0_VID_CHK_EN		BIT(6)	/* Use VID,DA or VID,SA */
++#define   VC0_VLAN_EN			BIT(7)	/* 802.1Q VLAN Enabled */
++
++/* VLAN Control 1 (8 bit) */
++#define B53_VLAN_CTRL1			0x01
++#define   VC1_RX_MCST_TAG_EN		BIT(1)
++#define   VC1_RX_MCST_FWD_EN		BIT(2)
++#define   VC1_RX_MCST_UNTAG_EN		BIT(3)
++
++/* VLAN Control 2 (8 bit) */
++#define B53_VLAN_CTRL2			0x02
++
++/* VLAN Control 3 (8 bit when BCM5325, 16 bit else) */
++#define B53_VLAN_CTRL3			0x03
++#define B53_VLAN_CTRL3_63XX		0x04
++#define   VC3_MAXSIZE_1532		BIT(6) /* 5325 only */
++#define   VC3_HIGH_8BIT_EN		BIT(7) /* 5325 only */
++
++/* VLAN Control 4 (8 bit) */
++#define B53_VLAN_CTRL4			0x05
++#define B53_VLAN_CTRL4_25		0x04
++#define B53_VLAN_CTRL4_63XX		0x06
++#define   VC4_ING_VID_CHECK_S		6
++#define   VC4_ING_VID_CHECK_MASK	(0x3 << VC4_ING_VID_CHECK_S)
++#define   VC4_ING_VID_VIO_FWD		0 /* forward, but do not learn */
++#define   VC4_ING_VID_VIO_DROP		1 /* drop VID violations */
++#define   VC4_NO_ING_VID_CHK		2 /* do not check */
++#define   VC4_ING_VID_VIO_TO_IMP	3 /* redirect to MII port */
++
++/* VLAN Control 5 (8 bit) */
++#define B53_VLAN_CTRL5			0x06
++#define B53_VLAN_CTRL5_25		0x05
++#define B53_VLAN_CTRL5_63XX		0x07
++#define   VC5_VID_FFF_EN		BIT(2)
++#define   VC5_DROP_VTABLE_MISS		BIT(3)
++
++/* VLAN Control 6 (8 bit) */
++#define B53_VLAN_CTRL6			0x07
++#define B53_VLAN_CTRL6_63XX		0x08
++
++/* VLAN Table Access Register (16 bit) */
++#define B53_VLAN_TABLE_ACCESS_25	0x06	/* BCM5325E/5350 */
++#define B53_VLAN_TABLE_ACCESS_65	0x08	/* BCM5365 */
++#define   VTA_VID_LOW_MASK_25		0xf
++#define   VTA_VID_LOW_MASK_65		0xff
++#define   VTA_VID_HIGH_S_25		4
++#define   VTA_VID_HIGH_S_65		8
++#define   VTA_VID_HIGH_MASK_25		(0xff << VTA_VID_HIGH_S_25E)
++#define   VTA_VID_HIGH_MASK_65		(0xf << VTA_VID_HIGH_S_65)
++#define   VTA_RW_STATE			BIT(12)
++#define   VTA_RW_STATE_RD		0
++#define   VTA_RW_STATE_WR		BIT(12)
++#define   VTA_RW_OP_EN			BIT(13)
++
++/* VLAN Read/Write Registers for (16/32 bit) */
++#define B53_VLAN_WRITE_25		0x08
++#define B53_VLAN_WRITE_65		0x0a
++#define B53_VLAN_READ			0x0c
++#define   VA_MEMBER_MASK		0x3f
++#define   VA_UNTAG_S_25			6
++#define   VA_UNTAG_MASK_25		0x3f
++#define   VA_UNTAG_S_65			7
++#define   VA_UNTAG_MASK_65		0x1f
++#define   VA_VID_HIGH_S			12
++#define   VA_VID_HIGH_MASK		(0xffff << VA_VID_HIGH_S)
++#define   VA_VALID_25			BIT(20)
++#define   VA_VALID_25_R4		BIT(24)
++#define   VA_VALID_65			BIT(14)
++
++/* VLAN Port Default Tag (16 bit) */
++#define B53_VLAN_PORT_DEF_TAG(i)	(0x10 + 2 * (i))
++
++/*************************************************************************
++ * Jumbo Frame Page Registers
++ *************************************************************************/
++
++/* Jumbo Enable Port Mask (bit i == port i enabled) (32 bit) */
++#define B53_JUMBO_PORT_MASK		0x01
++#define B53_JUMBO_PORT_MASK_63XX	0x04
++#define   JPM_10_100_JUMBO_EN		BIT(24) /* GigE always enabled */
++
++/* Good Frame Max Size without 802.1Q TAG (16 bit) */
++#define B53_JUMBO_MAX_SIZE		0x05
++#define B53_JUMBO_MAX_SIZE_63XX		0x08
++#define   JMS_MIN_SIZE			1518
++#define   JMS_MAX_SIZE			9724
++
++#endif /* !__B53_REGS_H */
+diff --git a/drivers/net/phy/b53/b53_spi.c b/drivers/net/phy/b53/b53_spi.c
+new file mode 100644
+index 0000000..8c6b171
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_spi.c
+@@ -0,0 +1,327 @@
++/*
++ * B53 register access through SPI
++ *
++ * Copyright (C) 2011-2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <asm/unaligned.h>
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/spi/spi.h>
++#include <linux/platform_data/b53.h>
++
++#include "b53_priv.h"
++
++#define B53_SPI_DATA		0xf0
++
++#define B53_SPI_STATUS		0xfe
++#define B53_SPI_CMD_SPIF	BIT(7)
++#define B53_SPI_CMD_RACK	BIT(5)
++
++#define B53_SPI_CMD_READ	0x00
++#define B53_SPI_CMD_WRITE	0x01
++#define B53_SPI_CMD_NORMAL	0x60
++#define B53_SPI_CMD_FAST	0x10
++
++#define B53_SPI_PAGE_SELECT	0xff
++
++static inline int b53_spi_read_reg(struct spi_device *spi, u8 reg, u8 *val,
++				     unsigned len)
++{
++	u8 txbuf[2];
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_READ;
++	txbuf[1] = reg;
++
++	return spi_write_then_read(spi, txbuf, 2, val, len);
++}
++
++static inline int b53_spi_clear_status(struct spi_device *spi)
++{
++	unsigned int i;
++	u8 rxbuf;
++	int ret;
++
++	for (i = 0; i < 10; i++) {
++		ret = b53_spi_read_reg(spi, B53_SPI_STATUS, &rxbuf, 1);
++		if (ret)
++			return ret;
++
++		if (!(rxbuf & B53_SPI_CMD_SPIF))
++			break;
++
++		mdelay(1);
++	}
++
++	if (i == 10)
++		return -EIO;
++
++	return 0;
++}
++
++static inline int b53_spi_set_page(struct spi_device *spi, u8 page)
++{
++	u8 txbuf[3];
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_WRITE;
++	txbuf[1] = B53_SPI_PAGE_SELECT;
++	txbuf[2] = page;
++
++	return spi_write(spi, txbuf, sizeof(txbuf));
++}
++
++static inline int b53_prepare_reg_access(struct spi_device *spi, u8 page)
++{
++	int ret = b53_spi_clear_status(spi);
++	if (ret)
++		return ret;
++
++	return b53_spi_set_page(spi, page);
++}
++
++static int b53_spi_prepare_reg_read(struct spi_device *spi, u8 reg)
++{
++	u8 rxbuf;
++	int retry_count;
++	int ret;
++
++	ret = b53_spi_read_reg(spi, reg, &rxbuf, 1);
++	if (ret)
++		return ret;
++
++	for (retry_count = 0; retry_count < 10; retry_count++) {
++		ret = b53_spi_read_reg(spi, B53_SPI_STATUS, &rxbuf, 1);
++		if (ret)
++			return ret;
++
++		if (rxbuf & B53_SPI_CMD_RACK)
++			break;
++
++		mdelay(1);
++	}
++
++	if (retry_count == 10)
++		return -EIO;
++
++	return 0;
++}
++
++static int b53_spi_read(struct b53_device *dev, u8 page, u8 reg, u8 *data,
++			unsigned len)
++{
++	struct spi_device *spi = dev->priv;
++	int ret;
++
++	ret = b53_prepare_reg_access(spi, page);
++	if (ret)
++		return ret;
++
++	ret = b53_spi_prepare_reg_read(spi, reg);
++	if (ret)
++		return ret;
++
++	return b53_spi_read_reg(spi, B53_SPI_DATA, data, len);
++}
++
++static int b53_spi_read8(struct b53_device *dev, u8 page, u8 reg, u8 *val)
++{
++	return b53_spi_read(dev, page, reg, val, 1);
++}
++
++static int b53_spi_read16(struct b53_device *dev, u8 page, u8 reg, u16 *val)
++{
++	int ret = b53_spi_read(dev, page, reg, (u8 *)val, 2);
++	if (!ret)
++		*val = le16_to_cpu(*val);
++
++	return ret;
++}
++
++static int b53_spi_read32(struct b53_device *dev, u8 page, u8 reg, u32 *val)
++{
++	int ret = b53_spi_read(dev, page, reg, (u8 *)val, 4);
++	if (!ret)
++		*val = le32_to_cpu(*val);
++
++	return ret;
++}
++
++static int b53_spi_read48(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	int ret;
++
++	*val = 0;
++	ret = b53_spi_read(dev, page, reg, (u8 *)val, 6);
++	if (!ret)
++		*val = le64_to_cpu(*val);
++
++	return ret;
++}
++
++static int b53_spi_read64(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	int ret = b53_spi_read(dev, page, reg, (u8 *)val, 8);
++	if (!ret)
++		*val = le64_to_cpu(*val);
++
++	return ret;
++}
++
++static int b53_spi_write8(struct b53_device *dev, u8 page, u8 reg, u8 value)
++{
++	struct spi_device *spi = dev->priv;
++	int ret;
++	u8 txbuf[3];
++
++	ret = b53_prepare_reg_access(spi, page);
++	if (ret)
++		return ret;
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_WRITE;
++	txbuf[1] = reg;
++	txbuf[2] = value;
++
++	return spi_write(spi, txbuf, sizeof(txbuf));
++}
++
++static int b53_spi_write16(struct b53_device *dev, u8 page, u8 reg, u16 value)
++{
++	struct spi_device *spi = dev->priv;
++	int ret;
++	u8 txbuf[4];
++
++	ret = b53_prepare_reg_access(spi, page);
++	if (ret)
++		return ret;
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_WRITE;
++	txbuf[1] = reg;
++	put_unaligned_le16(value, &txbuf[2]);
++
++	return spi_write(spi, txbuf, sizeof(txbuf));
++}
++
++static int b53_spi_write32(struct b53_device *dev, u8 page, u8 reg, u32 value)
++{
++	struct spi_device *spi = dev->priv;
++	int ret;
++	u8 txbuf[6];
++
++	ret = b53_prepare_reg_access(spi, page);
++	if (ret)
++		return ret;
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_WRITE;
++	txbuf[1] = reg;
++	put_unaligned_le32(value, &txbuf[2]);
++
++	return spi_write(spi, txbuf, sizeof(txbuf));
++}
++
++static int b53_spi_write48(struct b53_device *dev, u8 page, u8 reg, u64 value)
++{
++	struct spi_device *spi = dev->priv;
++	int ret;
++	u8 txbuf[10];
++
++	ret = b53_prepare_reg_access(spi, page);
++	if (ret)
++		return ret;
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_WRITE;
++	txbuf[1] = reg;
++	put_unaligned_le64(value, &txbuf[2]);
++
++	return spi_write(spi, txbuf, sizeof(txbuf) - 2);
++}
++
++static int b53_spi_write64(struct b53_device *dev, u8 page, u8 reg, u64 value)
++{
++	struct spi_device *spi = dev->priv;
++	int ret;
++	u8 txbuf[10];
++
++	ret = b53_prepare_reg_access(spi, page);
++	if (ret)
++		return ret;
++
++	txbuf[0] = B53_SPI_CMD_NORMAL | B53_SPI_CMD_WRITE;
++	txbuf[1] = reg;
++	put_unaligned_le64(value, &txbuf[2]);
++
++	return spi_write(spi, txbuf, sizeof(txbuf));
++}
++
++static struct b53_io_ops b53_spi_ops = {
++	.read8 = b53_spi_read8,
++	.read16 = b53_spi_read16,
++	.read32 = b53_spi_read32,
++	.read48 = b53_spi_read48,
++	.read64 = b53_spi_read64,
++	.write8 = b53_spi_write8,
++	.write16 = b53_spi_write16,
++	.write32 = b53_spi_write32,
++	.write48 = b53_spi_write48,
++	.write64 = b53_spi_write64,
++};
++
++static int b53_spi_probe(struct spi_device *spi)
++{
++	struct b53_device *dev;
++	int ret;
++
++	dev = b53_switch_alloc(&spi->dev, &b53_spi_ops, spi);
++	if (!dev)
++		return -ENOMEM;
++
++	if (spi->dev.platform_data)
++		dev->pdata = spi->dev.platform_data;
++
++	ret = b53_switch_register(dev);
++	if (ret)
++		return ret;
++
++	spi_set_drvdata(spi, dev);
++
++	return 0;
++}
++
++static int b53_spi_remove(struct spi_device *spi)
++{
++	struct b53_device *dev = spi_get_drvdata(spi);
++
++	if (dev) {
++		b53_switch_remove(dev);
++	}
++
++	return 0;
++}
++
++static struct spi_driver b53_spi_driver = {
++	.driver = {
++		.name	= "b53-switch",
++		.bus	= &spi_bus_type,
++		.owner	= THIS_MODULE,
++	},
++	.probe	= b53_spi_probe,
++	.remove	= b53_spi_remove,
++};
++
++module_spi_driver(b53_spi_driver);
++
++MODULE_AUTHOR("Jonas Gorski <jogo@openwrt.org>");
++MODULE_DESCRIPTION("B53 SPI access driver");
++MODULE_LICENSE("Dual BSD/GPL");
+diff --git a/drivers/net/phy/b53/b53_srab.c b/drivers/net/phy/b53/b53_srab.c
+new file mode 100644
+index 0000000..a68e275
+--- /dev/null
++++ b/drivers/net/phy/b53/b53_srab.c
+@@ -0,0 +1,379 @@
++/*
++ * B53 register access through Switch Register Access Bridge Registers
++ *
++ * Copyright (C) 2013 Hauke Mehrtens <hauke@hauke-m.de>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#include <linux/kernel.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/platform_data/b53.h>
++
++#include "b53_priv.h"
++
++/* command and status register of the SRAB */
++#define B53_SRAB_CMDSTAT		0x2c
++#define  B53_SRAB_CMDSTAT_RST		BIT(2)
++#define  B53_SRAB_CMDSTAT_WRITE		BIT(1)
++#define  B53_SRAB_CMDSTAT_GORDYN	BIT(0)
++#define  B53_SRAB_CMDSTAT_PAGE		24
++#define  B53_SRAB_CMDSTAT_REG		16
++
++/* high order word of write data to switch registe */
++#define B53_SRAB_WD_H			0x30
++
++/* low order word of write data to switch registe */
++#define B53_SRAB_WD_L			0x34
++
++/* high order word of read data from switch register */
++#define B53_SRAB_RD_H			0x38
++
++/* low order word of read data from switch register */
++#define B53_SRAB_RD_L			0x3c
++
++/* command and status register of the SRAB */
++#define B53_SRAB_CTRLS			0x40
++#define  B53_SRAB_CTRLS_RCAREQ		BIT(3)
++#define  B53_SRAB_CTRLS_RCAGNT		BIT(4)
++#define  B53_SRAB_CTRLS_SW_INIT_DONE	BIT(6)
++
++/* the register captures interrupt pulses from the switch */
++#define B53_SRAB_INTR			0x44
++
++static int b53_srab_request_grant(struct b53_device *dev)
++{
++	u8 __iomem *regs = dev->priv;
++	u32 ctrls;
++	int i;
++
++	ctrls = readl(regs + B53_SRAB_CTRLS);
++	ctrls |= B53_SRAB_CTRLS_RCAREQ;
++	writel(ctrls, regs + B53_SRAB_CTRLS);
++
++	for (i = 0; i < 20; i++) {
++		ctrls = readl(regs + B53_SRAB_CTRLS);
++		if (ctrls & B53_SRAB_CTRLS_RCAGNT)
++			break;
++		usleep_range(10, 100);
++	}
++	if (WARN_ON(i == 5))
++		return -EIO;
++
++	return 0;
++}
++
++static void b53_srab_release_grant(struct b53_device *dev)
++{
++	u8 __iomem *regs = dev->priv;
++	u32 ctrls;
++
++	ctrls = readl(regs + B53_SRAB_CTRLS);
++	ctrls &= ~B53_SRAB_CTRLS_RCAREQ;
++	writel(ctrls, regs + B53_SRAB_CTRLS);
++}
++
++static int b53_srab_op(struct b53_device *dev, u8 page, u8 reg, u32 op)
++{
++	int i;
++	u32 cmdstat;
++	u8 __iomem *regs = dev->priv;
++
++	/* set register address */
++	cmdstat = (page << B53_SRAB_CMDSTAT_PAGE) |
++		  (reg << B53_SRAB_CMDSTAT_REG) |
++		  B53_SRAB_CMDSTAT_GORDYN |
++		  op;
++	writel(cmdstat, regs + B53_SRAB_CMDSTAT);
++	
++	/* check if operation completed */
++	for (i = 0; i < 5; ++i) {
++		cmdstat = readl(regs + B53_SRAB_CMDSTAT);
++		if (!(cmdstat & B53_SRAB_CMDSTAT_GORDYN))
++			break;
++		usleep_range(10, 100);
++	}
++
++	if (WARN_ON(i == 5))
++		return -EIO;
++
++	return 0;
++}
++
++static int b53_srab_read8(struct b53_device *dev, u8 page, u8 reg, u8 *val)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	ret = b53_srab_op(dev, page, reg, 0);
++	if (ret)
++		goto err;
++
++	*val = readl(regs + B53_SRAB_RD_L) & 0xff;
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_read16(struct b53_device *dev, u8 page, u8 reg, u16 *val)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	ret = b53_srab_op(dev, page, reg, 0);
++	if (ret)
++		goto err;
++
++	*val = readl(regs + B53_SRAB_RD_L) & 0xffff;
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_read32(struct b53_device *dev, u8 page, u8 reg, u32 *val)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	ret = b53_srab_op(dev, page, reg, 0);
++	if (ret)
++		goto err;
++
++	*val = readl(regs + B53_SRAB_RD_L);
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_read48(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	ret = b53_srab_op(dev, page, reg, 0);
++	if (ret)
++		goto err;
++
++	*val = readl(regs + B53_SRAB_RD_L);
++	*val += ((u64)readl(regs + B53_SRAB_RD_H) & 0xffff) << 32;
++	
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_read64(struct b53_device *dev, u8 page, u8 reg, u64 *val)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	ret = b53_srab_op(dev, page, reg, 0);
++	if (ret)
++		goto err;
++
++	*val = readl(regs + B53_SRAB_RD_L);
++	*val += (u64)readl(regs + B53_SRAB_RD_H) << 32;
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_write8(struct b53_device *dev, u8 page, u8 reg, u8 value)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	writel(value, regs + B53_SRAB_WD_L);
++
++	ret = b53_srab_op(dev, page, reg, B53_SRAB_CMDSTAT_WRITE);
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_write16(struct b53_device *dev, u8 page, u8 reg,
++			     u16 value)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	writel(value, regs + B53_SRAB_WD_L);
++
++	ret = b53_srab_op(dev, page, reg, B53_SRAB_CMDSTAT_WRITE);
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static int b53_srab_write32(struct b53_device *dev, u8 page, u8 reg,
++				    u32 value)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	writel(value, regs + B53_SRAB_WD_L);
++
++	ret = b53_srab_op(dev, page, reg, B53_SRAB_CMDSTAT_WRITE);
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++
++}
++
++static int b53_srab_write48(struct b53_device *dev, u8 page, u8 reg,
++				    u64 value)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	writel((u32)value, regs + B53_SRAB_WD_L);
++	writel((u16)(value >> 32), regs + B53_SRAB_WD_H);
++
++	ret = b53_srab_op(dev, page, reg, B53_SRAB_CMDSTAT_WRITE);
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++
++}
++
++static int b53_srab_write64(struct b53_device *dev, u8 page, u8 reg,
++			     u64 value)
++{
++	u8 __iomem *regs = dev->priv;
++	int ret = 0;
++
++	ret = b53_srab_request_grant(dev);
++	if (ret)
++		goto err;
++
++	writel((u32)value, regs + B53_SRAB_WD_L);
++	writel((u32)(value >> 32), regs + B53_SRAB_WD_H);
++
++	ret = b53_srab_op(dev, page, reg, B53_SRAB_CMDSTAT_WRITE);
++
++err:
++	b53_srab_release_grant(dev);
++
++	return ret;
++}
++
++static struct b53_io_ops b53_srab_ops = {
++	.read8 = b53_srab_read8,
++	.read16 = b53_srab_read16,
++	.read32 = b53_srab_read32,
++	.read48 = b53_srab_read48,
++	.read64 = b53_srab_read64,
++	.write8 = b53_srab_write8,
++	.write16 = b53_srab_write16,
++	.write32 = b53_srab_write32,
++	.write48 = b53_srab_write48,
++	.write64 = b53_srab_write64,
++};
++
++static int b53_srab_probe(struct platform_device *pdev)
++{
++	struct b53_platform_data *pdata = pdev->dev.platform_data;
++	struct b53_device *dev;
++
++	if (!pdata)
++		return -EINVAL;
++
++	dev = b53_switch_alloc(&pdev->dev, &b53_srab_ops, pdata->regs);
++	if (!dev)
++		return -ENOMEM;
++
++	if (pdata)
++		dev->pdata = pdata;
++
++	platform_set_drvdata(pdev, dev);
++
++	return b53_switch_register(dev);
++}
++
++static int b53_srab_remove(struct platform_device *pdev)
++{
++	struct b53_device *dev = platform_get_drvdata(pdev);
++
++	if (dev) {
++		b53_switch_remove(dev);
++	}
++
++	return 0;
++}
++
++static struct platform_driver b53_srab_driver = {
++	.probe = b53_srab_probe,
++	.remove = b53_srab_remove,
++	.driver = {
++		.name = "b53-srab-switch",
++	},
++};
++
++module_platform_driver(b53_srab_driver);
++MODULE_AUTHOR("Hauke Mehrtens <hauke@hauke-m.de>");
++MODULE_DESCRIPTION("B53 Switch Register Access Bridge Registers (SRAB) access driver");
++MODULE_LICENSE("Dual BSD/GPL");
+diff --git a/drivers/net/phy/mdio-boardinfo.c b/drivers/net/phy/mdio-boardinfo.c
+new file mode 100644
+index 0000000..9b8aaed
+--- /dev/null
++++ b/drivers/net/phy/mdio-boardinfo.c
+@@ -0,0 +1,58 @@
++/*
++ * mdio-boardinfo.c - collect pre-declarations of PHY devices
++ *
++ * This program is free software; you can redistribute  it and/or modify it
++ * under  the terms of  the GNU General  Public License as published by the
++ * Free Software Foundation;  either version 2 of the  License, or (at your
++ * option) any later version.
++ *
++ */
++
++#include <linux/kernel.h>
++#include <linux/phy.h>
++#include <linux/slab.h>
++#include <linux/export.h>
++#include <linux/mutex.h>
++#include <linux/phy.h>
++
++#include "mdio-boardinfo.h"
++
++/*
++ * These symbols are exported ONLY FOR the mdio_bus component.
++ * No other users will be supported.
++ */
++
++LIST_HEAD(__mdio_board_list);
++EXPORT_SYMBOL_GPL(__mdio_board_list);
++
++DEFINE_MUTEX(__mdio_board_lock);
++EXPORT_SYMBOL_GPL(__mdio_board_lock);
++
++/**
++ * mdio_register_board_info - register PHY devices for a given board
++ * @info: array of chip descriptors
++ * @n: how many descriptors are provided
++ * Context: can sleep
++ *
++ * The board info passed can safely be __initdata ... but be careful of
++ * any embedded pointers (platform_data, etc), they're copied as-is.
++ */
++int __init
++mdiobus_register_board_info(struct mdio_board_info const *info, unsigned n)
++{
++	struct mdio_board_entry *be;
++	int i;
++
++	be = kzalloc(n * sizeof(*be), GFP_KERNEL);
++	if (!be)
++		return -ENOMEM;
++
++	for (i = 0; i < n; i++, be++, info++) {
++		memcpy(&be->board_info, info, sizeof(*info));
++		mutex_lock(&__mdio_board_lock);
++		list_add_tail(&be->list, &__mdio_board_list);
++		mutex_unlock(&__mdio_board_lock);
++	}
++
++	return 0;
++}
+diff --git a/drivers/net/phy/mdio-boardinfo.h b/drivers/net/phy/mdio-boardinfo.h
+new file mode 100644
+index 0000000..28fbc0d
+--- /dev/null
++++ b/drivers/net/phy/mdio-boardinfo.h
+@@ -0,0 +1,22 @@
++/*
++ * mdio-boardinfo.h - boardinfo interface internal to the mdio_bus component
++ *
++ * This program is free software; you can redistribute  it and/or modify it
++ * under  the terms of  the GNU General  Public License as published by the
++ * Free Software Foundation;  either version 2 of the  License, or (at your
++ * option) any later version.
++ *
++ */
++
++#include <linux/mutex.h>
++
++struct mdio_board_entry {
++	struct list_head	list;
++	struct mdio_board_info	board_info;
++};
++
++/* __mdio_board_lock protects __mdio_board_list
++ * only mdio_bus components are allowed to use these symbols.
++ */
++extern struct mutex __mdio_board_lock;
++extern struct list_head __mdio_board_list;
+diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
+index 50051f2..a1aed51 100644
+--- a/drivers/net/phy/mdio_bus.c
++++ b/drivers/net/phy/mdio_bus.c
+@@ -38,6 +38,8 @@
+ 
+ #include <asm/irq.h>
+ 
++#include "mdio-boardinfo.h"
++
+ /**
+  * mdiobus_alloc_size - allocate a mii_bus structure
+  * @size: extra amount of memory to allocate for private storage.
+@@ -335,9 +337,21 @@ void mdiobus_free(struct mii_bus *bus)
+ }
+ EXPORT_SYMBOL(mdiobus_free);
+ 
++static void mdiobus_setup_phydev_from_boardinfo(struct mii_bus *bus,
++						struct phy_device *phydev,
++						struct mdio_board_info *bi)
++{
++	if (strcmp(bus->id, bi->bus_id) ||
++	    bi->phy_addr != phydev->addr)
++	    return;
++
++	phydev->dev.platform_data = (void *) bi->platform_data;
++}
++
+ struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
+ {
+ 	struct phy_device *phydev;
++	struct mdio_board_entry *be;
+ 	int err;
+ 
+ 	phydev = get_phy_device(bus, addr, false);
+@@ -350,6 +364,12 @@ struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
+ 	 */
+ 	of_mdiobus_link_phydev(bus, phydev);
+ 
++	mutex_lock(&__mdio_board_lock);
++	list_for_each_entry(be, &__mdio_board_list, list)
++		mdiobus_setup_phydev_from_boardinfo(bus, phydev,
++						    &be->board_info);
++	mutex_unlock(&__mdio_board_lock);
++
+ 	err = phy_device_register(phydev);
+ 	if (err) {
+ 		phy_device_free(phydev);
+diff --git a/drivers/net/phy/swconfig.c b/drivers/net/phy/swconfig.c
+new file mode 100644
+index 0000000..6bb3be1
+--- /dev/null
++++ b/drivers/net/phy/swconfig.c
+@@ -0,0 +1,1153 @@
++/*
++ * swconfig.c: Switch configuration API
++ *
++ * Copyright (C) 2008 Felix Fietkau <nbd@openwrt.org>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++#include <linux/types.h>
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/list.h>
++#include <linux/if.h>
++#include <linux/if_ether.h>
++#include <linux/capability.h>
++#include <linux/skbuff.h>
++#include <linux/switch.h>
++#include <linux/of.h>
++#include <linux/version.h>
++
++#define SWCONFIG_DEVNAME	"switch%d"
++
++#include "swconfig_leds.c"
++
++MODULE_AUTHOR("Felix Fietkau <nbd@openwrt.org>");
++MODULE_LICENSE("GPL");
++
++static int swdev_id;
++static struct list_head swdevs;
++static DEFINE_SPINLOCK(swdevs_lock);
++struct swconfig_callback;
++
++struct swconfig_callback {
++	struct sk_buff *msg;
++	struct genlmsghdr *hdr;
++	struct genl_info *info;
++	int cmd;
++
++	/* callback for filling in the message data */
++	int (*fill)(struct swconfig_callback *cb, void *arg);
++
++	/* callback for closing the message before sending it */
++	int (*close)(struct swconfig_callback *cb, void *arg);
++
++	struct nlattr *nest[4];
++	int args[4];
++};
++
++/* defaults */
++
++static int
++swconfig_get_vlan_ports(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	int ret;
++	if (val->port_vlan >= dev->vlans)
++		return -EINVAL;
++
++	if (!dev->ops->get_vlan_ports)
++		return -EOPNOTSUPP;
++
++	ret = dev->ops->get_vlan_ports(dev, val);
++	return ret;
++}
++
++static int
++swconfig_set_vlan_ports(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	struct switch_port *ports = val->value.ports;
++	const struct switch_dev_ops *ops = dev->ops;
++	int i;
++
++	if (val->port_vlan >= dev->vlans)
++		return -EINVAL;
++
++	/* validate ports */
++	if (val->len > dev->ports)
++		return -EINVAL;
++
++	if (!ops->set_vlan_ports)
++		return -EOPNOTSUPP;
++
++	for (i = 0; i < val->len; i++) {
++		if (ports[i].id >= dev->ports)
++			return -EINVAL;
++
++		if (ops->set_port_pvid &&
++		    !(ports[i].flags & (1 << SWITCH_PORT_FLAG_TAGGED)))
++			ops->set_port_pvid(dev, ports[i].id, val->port_vlan);
++	}
++
++	return ops->set_vlan_ports(dev, val);
++}
++
++static int
++swconfig_set_pvid(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	if (val->port_vlan >= dev->ports)
++		return -EINVAL;
++
++	if (!dev->ops->set_port_pvid)
++		return -EOPNOTSUPP;
++
++	return dev->ops->set_port_pvid(dev, val->port_vlan, val->value.i);
++}
++
++static int
++swconfig_get_pvid(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	if (val->port_vlan >= dev->ports)
++		return -EINVAL;
++
++	if (!dev->ops->get_port_pvid)
++		return -EOPNOTSUPP;
++
++	return dev->ops->get_port_pvid(dev, val->port_vlan, &val->value.i);
++}
++
++static const char *
++swconfig_speed_str(enum switch_port_speed speed)
++{
++	switch (speed) {
++	case SWITCH_PORT_SPEED_10:
++		return "10baseT";
++	case SWITCH_PORT_SPEED_100:
++		return "100baseT";
++	case SWITCH_PORT_SPEED_1000:
++		return "1000baseT";
++	default:
++		break;
++	}
++
++	return "unknown";
++}
++
++static int
++swconfig_get_link(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	struct switch_port_link link;
++	int len;
++	int ret;
++
++	if (val->port_vlan >= dev->ports)
++		return -EINVAL;
++
++	if (!dev->ops->get_port_link)
++		return -EOPNOTSUPP;
++
++	memset(&link, 0, sizeof(link));
++	ret = dev->ops->get_port_link(dev, val->port_vlan, &link);
++	if (ret)
++		return ret;
++
++	memset(dev->buf, 0, sizeof(dev->buf));
++
++	if (link.link)
++		len = snprintf(dev->buf, sizeof(dev->buf),
++			       "port:%d link:up speed:%s %s-duplex %s%s%s%s%s",
++			       val->port_vlan,
++			       swconfig_speed_str(link.speed),
++			       link.duplex ? "full" : "half",
++			       link.tx_flow ? "txflow " : "",
++			       link.rx_flow ?	"rxflow " : "",
++			       link.eee & ADVERTISED_100baseT_Full ? "eee100 " : "",
++			       link.eee & ADVERTISED_1000baseT_Full ? "eee1000 " : "",
++			       link.aneg ? "auto" : "");
++	else
++		len = snprintf(dev->buf, sizeof(dev->buf), "port:%d link:down",
++			       val->port_vlan);
++
++	val->value.s = dev->buf;
++	val->len = len;
++
++	return 0;
++}
++
++static int
++swconfig_apply_config(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	/* don't complain if not supported by the switch driver */
++	if (!dev->ops->apply_config)
++		return 0;
++
++	return dev->ops->apply_config(dev);
++}
++
++static int
++swconfig_reset_switch(struct switch_dev *dev, const struct switch_attr *attr,
++			struct switch_val *val)
++{
++	/* don't complain if not supported by the switch driver */
++	if (!dev->ops->reset_switch)
++		return 0;
++
++	return dev->ops->reset_switch(dev);
++}
++
++enum global_defaults {
++	GLOBAL_APPLY,
++	GLOBAL_RESET,
++};
++
++enum vlan_defaults {
++	VLAN_PORTS,
++};
++
++enum port_defaults {
++	PORT_PVID,
++	PORT_LINK,
++};
++
++static struct switch_attr default_global[] = {
++	[GLOBAL_APPLY] = {
++		.type = SWITCH_TYPE_NOVAL,
++		.name = "apply",
++		.description = "Activate changes in the hardware",
++		.set = swconfig_apply_config,
++	},
++	[GLOBAL_RESET] = {
++		.type = SWITCH_TYPE_NOVAL,
++		.name = "reset",
++		.description = "Reset the switch",
++		.set = swconfig_reset_switch,
++	}
++};
++
++static struct switch_attr default_port[] = {
++	[PORT_PVID] = {
++		.type = SWITCH_TYPE_INT,
++		.name = "pvid",
++		.description = "Primary VLAN ID",
++		.set = swconfig_set_pvid,
++		.get = swconfig_get_pvid,
++	},
++	[PORT_LINK] = {
++		.type = SWITCH_TYPE_STRING,
++		.name = "link",
++		.description = "Get port link information",
++		.set = NULL,
++		.get = swconfig_get_link,
++	}
++};
++
++static struct switch_attr default_vlan[] = {
++	[VLAN_PORTS] = {
++		.type = SWITCH_TYPE_PORTS,
++		.name = "ports",
++		.description = "VLAN port mapping",
++		.set = swconfig_set_vlan_ports,
++		.get = swconfig_get_vlan_ports,
++	},
++};
++
++static const struct switch_attr *
++swconfig_find_attr_by_name(const struct switch_attrlist *alist,
++				const char *name)
++{
++	int i;
++
++	for (i = 0; i < alist->n_attr; i++)
++		if (strcmp(name, alist->attr[i].name) == 0)
++			return &alist->attr[i];
++
++	return NULL;
++}
++
++static void swconfig_defaults_init(struct switch_dev *dev)
++{
++	const struct switch_dev_ops *ops = dev->ops;
++
++	dev->def_global = 0;
++	dev->def_vlan = 0;
++	dev->def_port = 0;
++
++	if (ops->get_vlan_ports || ops->set_vlan_ports)
++		set_bit(VLAN_PORTS, &dev->def_vlan);
++
++	if (ops->get_port_pvid || ops->set_port_pvid)
++		set_bit(PORT_PVID, &dev->def_port);
++
++	if (ops->get_port_link &&
++	    !swconfig_find_attr_by_name(&ops->attr_port, "link"))
++		set_bit(PORT_LINK, &dev->def_port);
++
++	/* always present, can be no-op */
++	set_bit(GLOBAL_APPLY, &dev->def_global);
++	set_bit(GLOBAL_RESET, &dev->def_global);
++}
++
++
++static struct genl_family switch_fam = {
++	.id = GENL_ID_GENERATE,
++	.name = "switch",
++	.hdrsize = 0,
++	.version = 1,
++	.maxattr = SWITCH_ATTR_MAX,
++};
++
++static const struct nla_policy switch_policy[SWITCH_ATTR_MAX+1] = {
++	[SWITCH_ATTR_ID] = { .type = NLA_U32 },
++	[SWITCH_ATTR_OP_ID] = { .type = NLA_U32 },
++	[SWITCH_ATTR_OP_PORT] = { .type = NLA_U32 },
++	[SWITCH_ATTR_OP_VLAN] = { .type = NLA_U32 },
++	[SWITCH_ATTR_OP_VALUE_INT] = { .type = NLA_U32 },
++	[SWITCH_ATTR_OP_VALUE_STR] = { .type = NLA_NUL_STRING },
++	[SWITCH_ATTR_OP_VALUE_PORTS] = { .type = NLA_NESTED },
++	[SWITCH_ATTR_TYPE] = { .type = NLA_U32 },
++};
++
++static const struct nla_policy port_policy[SWITCH_PORT_ATTR_MAX+1] = {
++	[SWITCH_PORT_ID] = { .type = NLA_U32 },
++	[SWITCH_PORT_FLAG_TAGGED] = { .type = NLA_FLAG },
++};
++
++static inline void
++swconfig_lock(void)
++{
++	spin_lock(&swdevs_lock);
++}
++
++static inline void
++swconfig_unlock(void)
++{
++	spin_unlock(&swdevs_lock);
++}
++
++static struct switch_dev *
++swconfig_get_dev(struct genl_info *info)
++{
++	struct switch_dev *dev = NULL;
++	struct switch_dev *p;
++	int id;
++
++	if (!info->attrs[SWITCH_ATTR_ID])
++		goto done;
++
++	id = nla_get_u32(info->attrs[SWITCH_ATTR_ID]);
++	swconfig_lock();
++	list_for_each_entry(p, &swdevs, dev_list) {
++		if (id != p->id)
++			continue;
++
++		dev = p;
++		break;
++	}
++	if (dev)
++		mutex_lock(&dev->sw_mutex);
++	else
++		pr_debug("device %d not found\n", id);
++	swconfig_unlock();
++done:
++	return dev;
++}
++
++static inline void
++swconfig_put_dev(struct switch_dev *dev)
++{
++	mutex_unlock(&dev->sw_mutex);
++}
++
++static int
++swconfig_dump_attr(struct swconfig_callback *cb, void *arg)
++{
++	struct switch_attr *op = arg;
++	struct genl_info *info = cb->info;
++	struct sk_buff *msg = cb->msg;
++	int id = cb->args[0];
++	void *hdr;
++
++	hdr = genlmsg_put(msg, info->snd_portid, info->snd_seq, &switch_fam,
++			NLM_F_MULTI, SWITCH_CMD_NEW_ATTR);
++	if (IS_ERR(hdr))
++		return -1;
++
++	if (nla_put_u32(msg, SWITCH_ATTR_OP_ID, id))
++		goto nla_put_failure;
++	if (nla_put_u32(msg, SWITCH_ATTR_OP_TYPE, op->type))
++		goto nla_put_failure;
++	if (nla_put_string(msg, SWITCH_ATTR_OP_NAME, op->name))
++		goto nla_put_failure;
++	if (op->description)
++		if (nla_put_string(msg, SWITCH_ATTR_OP_DESCRIPTION,
++			op->description))
++			goto nla_put_failure;
++
++	genlmsg_end(msg, hdr);
++	return msg->len;
++nla_put_failure:
++	genlmsg_cancel(msg, hdr);
++	return -EMSGSIZE;
++}
++
++/* spread multipart messages across multiple message buffers */
++static int
++swconfig_send_multipart(struct swconfig_callback *cb, void *arg)
++{
++	struct genl_info *info = cb->info;
++	int restart = 0;
++	int err;
++
++	do {
++		if (!cb->msg) {
++			cb->msg = nlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
++			if (cb->msg == NULL)
++				goto error;
++		}
++
++		if (!(cb->fill(cb, arg) < 0))
++			break;
++
++		/* fill failed, check if this was already the second attempt */
++		if (restart)
++			goto error;
++
++		/* try again in a new message, send the current one */
++		restart = 1;
++		if (cb->close) {
++			if (cb->close(cb, arg) < 0)
++				goto error;
++		}
++		err = genlmsg_reply(cb->msg, info);
++		cb->msg = NULL;
++		if (err < 0)
++			goto error;
++
++	} while (restart);
++
++	return 0;
++
++error:
++	if (cb->msg)
++		nlmsg_free(cb->msg);
++	return -1;
++}
++
++static int
++swconfig_list_attrs(struct sk_buff *skb, struct genl_info *info)
++{
++	struct genlmsghdr *hdr = nlmsg_data(info->nlhdr);
++	const struct switch_attrlist *alist;
++	struct switch_dev *dev;
++	struct swconfig_callback cb;
++	int err = -EINVAL;
++	int i;
++
++	/* defaults */
++	struct switch_attr *def_list;
++	unsigned long *def_active;
++	int n_def;
++
++	dev = swconfig_get_dev(info);
++	if (!dev)
++		return -EINVAL;
++
++	switch (hdr->cmd) {
++	case SWITCH_CMD_LIST_GLOBAL:
++		alist = &dev->ops->attr_global;
++		def_list = default_global;
++		def_active = &dev->def_global;
++		n_def = ARRAY_SIZE(default_global);
++		break;
++	case SWITCH_CMD_LIST_VLAN:
++		alist = &dev->ops->attr_vlan;
++		def_list = default_vlan;
++		def_active = &dev->def_vlan;
++		n_def = ARRAY_SIZE(default_vlan);
++		break;
++	case SWITCH_CMD_LIST_PORT:
++		alist = &dev->ops->attr_port;
++		def_list = default_port;
++		def_active = &dev->def_port;
++		n_def = ARRAY_SIZE(default_port);
++		break;
++	default:
++		WARN_ON(1);
++		goto out;
++	}
++
++	memset(&cb, 0, sizeof(cb));
++	cb.info = info;
++	cb.fill = swconfig_dump_attr;
++	for (i = 0; i < alist->n_attr; i++) {
++		if (alist->attr[i].disabled)
++			continue;
++		cb.args[0] = i;
++		err = swconfig_send_multipart(&cb, (void *) &alist->attr[i]);
++		if (err < 0)
++			goto error;
++	}
++
++	/* defaults */
++	for (i = 0; i < n_def; i++) {
++		if (!test_bit(i, def_active))
++			continue;
++		cb.args[0] = SWITCH_ATTR_DEFAULTS_OFFSET + i;
++		err = swconfig_send_multipart(&cb, (void *) &def_list[i]);
++		if (err < 0)
++			goto error;
++	}
++	swconfig_put_dev(dev);
++
++	if (!cb.msg)
++		return 0;
++
++	return genlmsg_reply(cb.msg, info);
++
++error:
++	if (cb.msg)
++		nlmsg_free(cb.msg);
++out:
++	swconfig_put_dev(dev);
++	return err;
++}
++
++static const struct switch_attr *
++swconfig_lookup_attr(struct switch_dev *dev, struct genl_info *info,
++		struct switch_val *val)
++{
++	struct genlmsghdr *hdr = nlmsg_data(info->nlhdr);
++	const struct switch_attrlist *alist;
++	const struct switch_attr *attr = NULL;
++	int attr_id;
++
++	/* defaults */
++	struct switch_attr *def_list;
++	unsigned long *def_active;
++	int n_def;
++
++	if (!info->attrs[SWITCH_ATTR_OP_ID])
++		goto done;
++
++	switch (hdr->cmd) {
++	case SWITCH_CMD_SET_GLOBAL:
++	case SWITCH_CMD_GET_GLOBAL:
++		alist = &dev->ops->attr_global;
++		def_list = default_global;
++		def_active = &dev->def_global;
++		n_def = ARRAY_SIZE(default_global);
++		break;
++	case SWITCH_CMD_SET_VLAN:
++	case SWITCH_CMD_GET_VLAN:
++		alist = &dev->ops->attr_vlan;
++		def_list = default_vlan;
++		def_active = &dev->def_vlan;
++		n_def = ARRAY_SIZE(default_vlan);
++		if (!info->attrs[SWITCH_ATTR_OP_VLAN])
++			goto done;
++		val->port_vlan = nla_get_u32(info->attrs[SWITCH_ATTR_OP_VLAN]);
++		if (val->port_vlan >= dev->vlans)
++			goto done;
++		break;
++	case SWITCH_CMD_SET_PORT:
++	case SWITCH_CMD_GET_PORT:
++		alist = &dev->ops->attr_port;
++		def_list = default_port;
++		def_active = &dev->def_port;
++		n_def = ARRAY_SIZE(default_port);
++		if (!info->attrs[SWITCH_ATTR_OP_PORT])
++			goto done;
++		val->port_vlan = nla_get_u32(info->attrs[SWITCH_ATTR_OP_PORT]);
++		if (val->port_vlan >= dev->ports)
++			goto done;
++		break;
++	default:
++		WARN_ON(1);
++		goto done;
++	}
++
++	if (!alist)
++		goto done;
++
++	attr_id = nla_get_u32(info->attrs[SWITCH_ATTR_OP_ID]);
++	if (attr_id >= SWITCH_ATTR_DEFAULTS_OFFSET) {
++		attr_id -= SWITCH_ATTR_DEFAULTS_OFFSET;
++		if (attr_id >= n_def)
++			goto done;
++		if (!test_bit(attr_id, def_active))
++			goto done;
++		attr = &def_list[attr_id];
++	} else {
++		if (attr_id >= alist->n_attr)
++			goto done;
++		attr = &alist->attr[attr_id];
++	}
++
++	if (attr->disabled)
++		attr = NULL;
++
++done:
++	if (!attr)
++		pr_debug("attribute lookup failed\n");
++	val->attr = attr;
++	return attr;
++}
++
++static int
++swconfig_parse_ports(struct sk_buff *msg, struct nlattr *head,
++		struct switch_val *val, int max)
++{
++	struct nlattr *nla;
++	int rem;
++
++	val->len = 0;
++	nla_for_each_nested(nla, head, rem) {
++		struct nlattr *tb[SWITCH_PORT_ATTR_MAX+1];
++		struct switch_port *port = &val->value.ports[val->len];
++
++		if (val->len >= max)
++			return -EINVAL;
++
++		if (nla_parse_nested(tb, SWITCH_PORT_ATTR_MAX, nla,
++				port_policy))
++			return -EINVAL;
++
++		if (!tb[SWITCH_PORT_ID])
++			return -EINVAL;
++
++		port->id = nla_get_u32(tb[SWITCH_PORT_ID]);
++		if (tb[SWITCH_PORT_FLAG_TAGGED])
++			port->flags |= (1 << SWITCH_PORT_FLAG_TAGGED);
++		val->len++;
++	}
++
++	return 0;
++}
++
++static int
++swconfig_set_attr(struct sk_buff *skb, struct genl_info *info)
++{
++	const struct switch_attr *attr;
++	struct switch_dev *dev;
++	struct switch_val val;
++	int err = -EINVAL;
++
++	dev = swconfig_get_dev(info);
++	if (!dev)
++		return -EINVAL;
++
++	memset(&val, 0, sizeof(val));
++	attr = swconfig_lookup_attr(dev, info, &val);
++	if (!attr || !attr->set)
++		goto error;
++
++	val.attr = attr;
++	switch (attr->type) {
++	case SWITCH_TYPE_NOVAL:
++		break;
++	case SWITCH_TYPE_INT:
++		if (!info->attrs[SWITCH_ATTR_OP_VALUE_INT])
++			goto error;
++		val.value.i =
++			nla_get_u32(info->attrs[SWITCH_ATTR_OP_VALUE_INT]);
++		break;
++	case SWITCH_TYPE_STRING:
++		if (!info->attrs[SWITCH_ATTR_OP_VALUE_STR])
++			goto error;
++		val.value.s =
++			nla_data(info->attrs[SWITCH_ATTR_OP_VALUE_STR]);
++		break;
++	case SWITCH_TYPE_PORTS:
++		val.value.ports = dev->portbuf;
++		memset(dev->portbuf, 0,
++			sizeof(struct switch_port) * dev->ports);
++
++		/* TODO: implement multipart? */
++		if (info->attrs[SWITCH_ATTR_OP_VALUE_PORTS]) {
++			err = swconfig_parse_ports(skb,
++				info->attrs[SWITCH_ATTR_OP_VALUE_PORTS],
++				&val, dev->ports);
++			if (err < 0)
++				goto error;
++		} else {
++			val.len = 0;
++			err = 0;
++		}
++		break;
++	default:
++		goto error;
++	}
++
++	err = attr->set(dev, attr, &val);
++error:
++	swconfig_put_dev(dev);
++	return err;
++}
++
++static int
++swconfig_close_portlist(struct swconfig_callback *cb, void *arg)
++{
++	if (cb->nest[0])
++		nla_nest_end(cb->msg, cb->nest[0]);
++	return 0;
++}
++
++static int
++swconfig_send_port(struct swconfig_callback *cb, void *arg)
++{
++	const struct switch_port *port = arg;
++	struct nlattr *p = NULL;
++
++	if (!cb->nest[0]) {
++		cb->nest[0] = nla_nest_start(cb->msg, cb->cmd);
++		if (!cb->nest[0])
++			return -1;
++	}
++
++	p = nla_nest_start(cb->msg, SWITCH_ATTR_PORT);
++	if (!p)
++		goto error;
++
++	if (nla_put_u32(cb->msg, SWITCH_PORT_ID, port->id))
++		goto nla_put_failure;
++	if (port->flags & (1 << SWITCH_PORT_FLAG_TAGGED)) {
++		if (nla_put_flag(cb->msg, SWITCH_PORT_FLAG_TAGGED))
++			goto nla_put_failure;
++	}
++
++	nla_nest_end(cb->msg, p);
++	return 0;
++
++nla_put_failure:
++		nla_nest_cancel(cb->msg, p);
++error:
++	nla_nest_cancel(cb->msg, cb->nest[0]);
++	return -1;
++}
++
++static int
++swconfig_send_ports(struct sk_buff **msg, struct genl_info *info, int attr,
++		const struct switch_val *val)
++{
++	struct swconfig_callback cb;
++	int err = 0;
++	int i;
++
++	if (!val->value.ports)
++		return -EINVAL;
++
++	memset(&cb, 0, sizeof(cb));
++	cb.cmd = attr;
++	cb.msg = *msg;
++	cb.info = info;
++	cb.fill = swconfig_send_port;
++	cb.close = swconfig_close_portlist;
++
++	cb.nest[0] = nla_nest_start(cb.msg, cb.cmd);
++	for (i = 0; i < val->len; i++) {
++		err = swconfig_send_multipart(&cb, &val->value.ports[i]);
++		if (err)
++			goto done;
++	}
++	err = val->len;
++	swconfig_close_portlist(&cb, NULL);
++	*msg = cb.msg;
++
++done:
++	return err;
++}
++
++static int
++swconfig_get_attr(struct sk_buff *skb, struct genl_info *info)
++{
++	struct genlmsghdr *hdr = nlmsg_data(info->nlhdr);
++	const struct switch_attr *attr;
++	struct switch_dev *dev;
++	struct sk_buff *msg = NULL;
++	struct switch_val val;
++	int err = -EINVAL;
++	int cmd = hdr->cmd;
++
++	dev = swconfig_get_dev(info);
++	if (!dev)
++		return -EINVAL;
++
++	memset(&val, 0, sizeof(val));
++	attr = swconfig_lookup_attr(dev, info, &val);
++	if (!attr || !attr->get)
++		goto error;
++
++	if (attr->type == SWITCH_TYPE_PORTS) {
++		val.value.ports = dev->portbuf;
++		memset(dev->portbuf, 0,
++			sizeof(struct switch_port) * dev->ports);
++	}
++
++	err = attr->get(dev, attr, &val);
++	if (err)
++		goto error;
++
++	msg = nlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
++	if (!msg)
++		goto error;
++
++	hdr = genlmsg_put(msg, info->snd_portid, info->snd_seq, &switch_fam,
++			0, cmd);
++	if (IS_ERR(hdr))
++		goto nla_put_failure;
++
++	switch (attr->type) {
++	case SWITCH_TYPE_INT:
++		if (nla_put_u32(msg, SWITCH_ATTR_OP_VALUE_INT, val.value.i))
++			goto nla_put_failure;
++		break;
++	case SWITCH_TYPE_STRING:
++		if (nla_put_string(msg, SWITCH_ATTR_OP_VALUE_STR, val.value.s))
++			goto nla_put_failure;
++		break;
++	case SWITCH_TYPE_PORTS:
++		err = swconfig_send_ports(&msg, info,
++				SWITCH_ATTR_OP_VALUE_PORTS, &val);
++		if (err < 0)
++			goto nla_put_failure;
++		break;
++	default:
++		pr_debug("invalid type in attribute\n");
++		err = -EINVAL;
++		goto error;
++	}
++	genlmsg_end(msg, hdr);
++	err = msg->len;
++	if (err < 0)
++		goto nla_put_failure;
++
++	swconfig_put_dev(dev);
++	return genlmsg_reply(msg, info);
++
++nla_put_failure:
++	if (msg)
++		nlmsg_free(msg);
++error:
++	swconfig_put_dev(dev);
++	if (!err)
++		err = -ENOMEM;
++	return err;
++}
++
++static int
++swconfig_send_switch(struct sk_buff *msg, u32 pid, u32 seq, int flags,
++		const struct switch_dev *dev)
++{
++	struct nlattr *p = NULL, *m = NULL;
++	void *hdr;
++	int i;
++
++	hdr = genlmsg_put(msg, pid, seq, &switch_fam, flags,
++			SWITCH_CMD_NEW_ATTR);
++	if (IS_ERR(hdr))
++		return -1;
++
++	if (nla_put_u32(msg, SWITCH_ATTR_ID, dev->id))
++		goto nla_put_failure;
++	if (nla_put_string(msg, SWITCH_ATTR_DEV_NAME, dev->devname))
++		goto nla_put_failure;
++	if (nla_put_string(msg, SWITCH_ATTR_ALIAS, dev->alias))
++		goto nla_put_failure;
++	if (nla_put_string(msg, SWITCH_ATTR_NAME, dev->name))
++		goto nla_put_failure;
++	if (nla_put_u32(msg, SWITCH_ATTR_VLANS, dev->vlans))
++		goto nla_put_failure;
++	if (nla_put_u32(msg, SWITCH_ATTR_PORTS, dev->ports))
++		goto nla_put_failure;
++	if (nla_put_u32(msg, SWITCH_ATTR_CPU_PORT, dev->cpu_port))
++		goto nla_put_failure;
++
++	m = nla_nest_start(msg, SWITCH_ATTR_PORTMAP);
++	if (!m)
++		goto nla_put_failure;
++	for (i = 0; i < dev->ports; i++) {
++		p = nla_nest_start(msg, SWITCH_ATTR_PORTS);
++		if (!p)
++			continue;
++		if (dev->portmap[i].s) {
++			if (nla_put_string(msg, SWITCH_PORTMAP_SEGMENT,
++						dev->portmap[i].s))
++				goto nla_put_failure;
++			if (nla_put_u32(msg, SWITCH_PORTMAP_VIRT,
++						dev->portmap[i].virt))
++				goto nla_put_failure;
++		}
++		nla_nest_end(msg, p);
++	}
++	nla_nest_end(msg, m);
++	genlmsg_end(msg, hdr);
++	return msg->len;
++nla_put_failure:
++	genlmsg_cancel(msg, hdr);
++	return -EMSGSIZE;
++}
++
++static int swconfig_dump_switches(struct sk_buff *skb,
++		struct netlink_callback *cb)
++{
++	struct switch_dev *dev;
++	int start = cb->args[0];
++	int idx = 0;
++
++	swconfig_lock();
++	list_for_each_entry(dev, &swdevs, dev_list) {
++		if (++idx <= start)
++			continue;
++		if (swconfig_send_switch(skb, NETLINK_CB(cb->skb).portid,
++				cb->nlh->nlmsg_seq, NLM_F_MULTI,
++				dev) < 0)
++			break;
++	}
++	swconfig_unlock();
++	cb->args[0] = idx;
++
++	return skb->len;
++}
++
++static int
++swconfig_done(struct netlink_callback *cb)
++{
++	return 0;
++}
++
++static struct genl_ops swconfig_ops[] = {
++	{
++		.cmd = SWITCH_CMD_LIST_GLOBAL,
++		.doit = swconfig_list_attrs,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_LIST_VLAN,
++		.doit = swconfig_list_attrs,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_LIST_PORT,
++		.doit = swconfig_list_attrs,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_GET_GLOBAL,
++		.doit = swconfig_get_attr,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_GET_VLAN,
++		.doit = swconfig_get_attr,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_GET_PORT,
++		.doit = swconfig_get_attr,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_SET_GLOBAL,
++		.doit = swconfig_set_attr,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_SET_VLAN,
++		.doit = swconfig_set_attr,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_SET_PORT,
++		.doit = swconfig_set_attr,
++		.policy = switch_policy,
++	},
++	{
++		.cmd = SWITCH_CMD_GET_SWITCH,
++		.dumpit = swconfig_dump_switches,
++		.policy = switch_policy,
++		.done = swconfig_done,
++	}
++};
++
++#ifdef CONFIG_OF
++void
++of_switch_load_portmap(struct switch_dev *dev)
++{
++	struct device_node *port;
++
++	if (!dev->of_node)
++		return;
++
++	for_each_child_of_node(dev->of_node, port) {
++		const __be32 *prop;
++		const char *segment;
++		int size, phys;
++
++		if (!of_device_is_compatible(port, "swconfig,port"))
++			continue;
++
++		if (of_property_read_string(port, "swconfig,segment", &segment))
++			continue;
++
++		prop = of_get_property(port, "swconfig,portmap", &size);
++		if (!prop)
++			continue;
++
++		if (size != (2 * sizeof(*prop))) {
++			pr_err("%s: failed to parse port mapping\n",
++					port->name);
++			continue;
++		}
++
++		phys = be32_to_cpup(prop++);
++		if ((phys < 0) | (phys >= dev->ports)) {
++			pr_err("%s: physical port index out of range\n",
++					port->name);
++			continue;
++		}
++
++		dev->portmap[phys].s = kstrdup(segment, GFP_KERNEL);
++		dev->portmap[phys].virt = be32_to_cpup(prop);
++		pr_debug("Found port: %s, physical: %d, virtual: %d\n",
++			segment, phys, dev->portmap[phys].virt);
++	}
++}
++#endif
++
++int
++register_switch(struct switch_dev *dev, struct net_device *netdev)
++{
++	struct switch_dev *sdev;
++	const int max_switches = 8 * sizeof(unsigned long);
++	unsigned long in_use = 0;
++	int err;
++	int i;
++
++	INIT_LIST_HEAD(&dev->dev_list);
++	if (netdev) {
++		dev->netdev = netdev;
++		if (!dev->alias)
++			dev->alias = netdev->name;
++	}
++	BUG_ON(!dev->alias);
++
++	if (dev->ports > 0) {
++		dev->portbuf = kzalloc(sizeof(struct switch_port) *
++				dev->ports, GFP_KERNEL);
++		if (!dev->portbuf)
++			return -ENOMEM;
++		dev->portmap = kzalloc(sizeof(struct switch_portmap) *
++				dev->ports, GFP_KERNEL);
++		if (!dev->portmap) {
++			kfree(dev->portbuf);
++			return -ENOMEM;
++		}
++	}
++	swconfig_defaults_init(dev);
++	mutex_init(&dev->sw_mutex);
++	swconfig_lock();
++	dev->id = ++swdev_id;
++
++	list_for_each_entry(sdev, &swdevs, dev_list) {
++		if (!sscanf(sdev->devname, SWCONFIG_DEVNAME, &i))
++			continue;
++		if (i < 0 || i > max_switches)
++			continue;
++
++		set_bit(i, &in_use);
++	}
++	i = find_first_zero_bit(&in_use, max_switches);
++
++	if (i == max_switches) {
++		swconfig_unlock();
++		return -ENFILE;
++	}
++
++#ifdef CONFIG_OF
++	if (dev->ports)
++		of_switch_load_portmap(dev);
++#endif
++
++	/* fill device name */
++	snprintf(dev->devname, IFNAMSIZ, SWCONFIG_DEVNAME, i);
++
++	list_add_tail(&dev->dev_list, &swdevs);
++	swconfig_unlock();
++
++	err = swconfig_create_led_trigger(dev);
++	if (err)
++		return err;
++
++	return 0;
++}
++EXPORT_SYMBOL_GPL(register_switch);
++
++void
++unregister_switch(struct switch_dev *dev)
++{
++	swconfig_destroy_led_trigger(dev);
++	kfree(dev->portbuf);
++	mutex_lock(&dev->sw_mutex);
++	swconfig_lock();
++	list_del(&dev->dev_list);
++	swconfig_unlock();
++	mutex_unlock(&dev->sw_mutex);
++}
++EXPORT_SYMBOL_GPL(unregister_switch);
++
++
++static int __init
++swconfig_init(void)
++{
++	int err;
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,13,0))
++	int i;
++#endif
++
++	INIT_LIST_HEAD(&swdevs);
++	
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(3,13,0))
++	err = genl_register_family(&switch_fam);
++	if (err)
++		return err;
++
++	for (i = 0; i < ARRAY_SIZE(swconfig_ops); i++) {
++		err = genl_register_ops(&switch_fam, &swconfig_ops[i]);
++		if (err)
++			goto unregister;
++	}
++	return 0;
++
++unregister:
++	genl_unregister_family(&switch_fam);
++	return err;
++#else
++	err = genl_register_family_with_ops(&switch_fam, swconfig_ops);
++	if (err)
++		return err;
++	return 0;
++#endif
++}
++
++static void __exit
++swconfig_exit(void)
++{
++	genl_unregister_family(&switch_fam);
++}
++
++module_init(swconfig_init);
++module_exit(swconfig_exit);
++
+diff --git a/drivers/net/phy/swconfig_leds.c b/drivers/net/phy/swconfig_leds.c
+new file mode 100644
+index 0000000..abd7bed
+--- /dev/null
++++ b/drivers/net/phy/swconfig_leds.c
+@@ -0,0 +1,354 @@
++/*
++ * swconfig_led.c: LED trigger support for the switch configuration API
++ *
++ * Copyright (C) 2011 Gabor Juhos <juhosg@openwrt.org>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ *
++ */
++
++#ifdef CONFIG_SWCONFIG_LEDS
++
++#include <linux/leds.h>
++#include <linux/ctype.h>
++#include <linux/device.h>
++#include <linux/workqueue.h>
++
++#define SWCONFIG_LED_TIMER_INTERVAL	(HZ / 10)
++#define SWCONFIG_LED_NUM_PORTS		32
++
++struct switch_led_trigger {
++	struct led_trigger trig;
++	struct switch_dev *swdev;
++
++	struct delayed_work sw_led_work;
++	u32 port_mask;
++	u32 port_link;
++	unsigned long port_traffic[SWCONFIG_LED_NUM_PORTS];
++};
++
++struct swconfig_trig_data {
++	struct led_classdev *led_cdev;
++	struct switch_dev *swdev;
++
++	rwlock_t lock;
++	u32 port_mask;
++
++	bool prev_link;
++	unsigned long prev_traffic;
++	enum led_brightness prev_brightness;
++};
++
++static void
++swconfig_trig_set_brightness(struct swconfig_trig_data *trig_data,
++			     enum led_brightness brightness)
++{
++	led_set_brightness(trig_data->led_cdev, brightness);
++	trig_data->prev_brightness = brightness;
++}
++
++static void
++swconfig_trig_update_port_mask(struct led_trigger *trigger)
++{
++	struct list_head *entry;
++	struct switch_led_trigger *sw_trig;
++	u32 port_mask;
++
++	if (!trigger)
++		return;
++
++	sw_trig = (void *) trigger;
++
++	port_mask = 0;
++	read_lock(&trigger->leddev_list_lock);
++	list_for_each(entry, &trigger->led_cdevs) {
++		struct led_classdev *led_cdev;
++		struct swconfig_trig_data *trig_data;
++
++		led_cdev = list_entry(entry, struct led_classdev, trig_list);
++		trig_data = led_cdev->trigger_data;
++		if (trig_data) {
++			read_lock(&trig_data->lock);
++			port_mask |= trig_data->port_mask;
++			read_unlock(&trig_data->lock);
++		}
++	}
++	read_unlock(&trigger->leddev_list_lock);
++
++	sw_trig->port_mask = port_mask;
++
++	if (port_mask)
++		schedule_delayed_work(&sw_trig->sw_led_work,
++				      SWCONFIG_LED_TIMER_INTERVAL);
++	else
++		cancel_delayed_work_sync(&sw_trig->sw_led_work);
++}
++
++static ssize_t
++swconfig_trig_port_mask_store(struct device *dev, struct device_attribute *attr,
++			      const char *buf, size_t size)
++{
++	struct led_classdev *led_cdev = dev_get_drvdata(dev);
++	struct swconfig_trig_data *trig_data = led_cdev->trigger_data;
++	unsigned long port_mask;
++	ssize_t ret = -EINVAL;
++	char *after;
++	size_t count;
++
++	port_mask = simple_strtoul(buf, &after, 16);
++	count =	after - buf;
++
++	if (*after && isspace(*after))
++		count++;
++
++	if (count == size) {
++		bool changed;
++
++		write_lock(&trig_data->lock);
++
++		changed = (trig_data->port_mask != port_mask);
++		if (changed) {
++			trig_data->port_mask = port_mask;
++			if (port_mask == 0)
++				swconfig_trig_set_brightness(trig_data, LED_OFF);
++		}
++
++		write_unlock(&trig_data->lock);
++
++		if (changed)
++			swconfig_trig_update_port_mask(led_cdev->trigger);
++
++		ret = count;
++	}
++
++	return ret;
++}
++
++static ssize_t
++swconfig_trig_port_mask_show(struct device *dev, struct device_attribute *attr,
++			     char *buf)
++{
++	struct led_classdev *led_cdev = dev_get_drvdata(dev);
++	struct swconfig_trig_data *trig_data = led_cdev->trigger_data;
++
++	read_lock(&trig_data->lock);
++	sprintf(buf, "%#x\n", trig_data->port_mask);
++	read_unlock(&trig_data->lock);
++
++	return strlen(buf) + 1;
++}
++
++static DEVICE_ATTR(port_mask, 0644, swconfig_trig_port_mask_show,
++		   swconfig_trig_port_mask_store);
++
++static void
++swconfig_trig_activate(struct led_classdev *led_cdev)
++{
++	struct switch_led_trigger *sw_trig;
++	struct swconfig_trig_data *trig_data;
++	int err;
++
++	if (led_cdev->trigger->activate != swconfig_trig_activate)
++		return;
++
++	trig_data = kzalloc(sizeof(struct swconfig_trig_data), GFP_KERNEL);
++	if (!trig_data)
++		return;
++
++	sw_trig = (void *) led_cdev->trigger;
++
++	rwlock_init(&trig_data->lock);
++	trig_data->led_cdev = led_cdev;
++	trig_data->swdev = sw_trig->swdev;
++	led_cdev->trigger_data = trig_data;
++
++	err = device_create_file(led_cdev->dev, &dev_attr_port_mask);
++	if (err)
++		goto err_free;
++
++	return;
++
++err_free:
++	led_cdev->trigger_data = NULL;
++	kfree(trig_data);
++}
++
++static void
++swconfig_trig_deactivate(struct led_classdev *led_cdev)
++{
++	struct swconfig_trig_data *trig_data;
++
++	swconfig_trig_update_port_mask(led_cdev->trigger);
++
++	trig_data = (void *) led_cdev->trigger_data;
++	if (trig_data) {
++		device_remove_file(led_cdev->dev, &dev_attr_port_mask);
++		kfree(trig_data);
++	}
++}
++
++static void
++swconfig_trig_led_event(struct switch_led_trigger *sw_trig,
++			struct led_classdev *led_cdev)
++{
++	struct swconfig_trig_data *trig_data;
++	u32 port_mask;
++	bool link;
++
++	trig_data = led_cdev->trigger_data;
++	if (!trig_data)
++		return;
++
++	read_lock(&trig_data->lock);
++	port_mask = trig_data->port_mask;
++	read_unlock(&trig_data->lock);
++
++	link = !!(sw_trig->port_link & port_mask);
++	if (!link) {
++		if (link != trig_data->prev_link)
++			swconfig_trig_set_brightness(trig_data, LED_OFF);
++	} else {
++		unsigned long traffic;
++		int i;
++
++		traffic = 0;
++		for (i = 0; i < SWCONFIG_LED_NUM_PORTS; i++) {
++			if (port_mask & (1 << i))
++				traffic += sw_trig->port_traffic[i];
++		}
++
++		if (trig_data->prev_brightness != LED_FULL)
++			swconfig_trig_set_brightness(trig_data, LED_FULL);
++		else if (traffic != trig_data->prev_traffic)
++			swconfig_trig_set_brightness(trig_data, LED_OFF);
++
++		trig_data->prev_traffic = traffic;
++	}
++
++	trig_data->prev_link = link;
++}
++
++static void
++swconfig_trig_update_leds(struct switch_led_trigger *sw_trig)
++{
++	struct list_head *entry;
++	struct led_trigger *trigger;
++
++	trigger = &sw_trig->trig;
++	read_lock(&trigger->leddev_list_lock);
++	list_for_each(entry, &trigger->led_cdevs) {
++		struct led_classdev *led_cdev;
++
++		led_cdev = list_entry(entry, struct led_classdev, trig_list);
++		swconfig_trig_led_event(sw_trig, led_cdev);
++	}
++	read_unlock(&trigger->leddev_list_lock);
++}
++
++static void
++swconfig_led_work_func(struct work_struct *work)
++{
++	struct switch_led_trigger *sw_trig;
++	struct switch_dev *swdev;
++	u32 port_mask;
++	u32 link;
++	int i;
++
++	sw_trig = container_of(work, struct switch_led_trigger,
++			       sw_led_work.work);
++
++	port_mask = sw_trig->port_mask;
++	swdev = sw_trig->swdev;
++
++	link = 0;
++	for (i = 0; i < SWCONFIG_LED_NUM_PORTS; i++) {
++		u32 port_bit;
++
++		port_bit = BIT(i);
++		if ((port_mask & port_bit) == 0)
++			continue;
++
++		if (swdev->ops->get_port_link) {
++			struct switch_port_link port_link;
++
++			memset(&port_link, '\0', sizeof(port_link));
++			swdev->ops->get_port_link(swdev, i, &port_link);
++
++			if (port_link.link)
++				link |= port_bit;
++		}
++
++		if (swdev->ops->get_port_stats) {
++			struct switch_port_stats port_stats;
++
++			memset(&port_stats, '\0', sizeof(port_stats));
++			swdev->ops->get_port_stats(swdev, i, &port_stats);
++			sw_trig->port_traffic[i] = port_stats.tx_bytes +
++						   port_stats.rx_bytes;
++		}
++	}
++
++	sw_trig->port_link = link;
++
++	swconfig_trig_update_leds(sw_trig);
++
++	schedule_delayed_work(&sw_trig->sw_led_work,
++			      SWCONFIG_LED_TIMER_INTERVAL);
++}
++
++static int
++swconfig_create_led_trigger(struct switch_dev *swdev)
++{
++	struct switch_led_trigger *sw_trig;
++	int err;
++
++	if (!swdev->ops->get_port_link)
++		return 0;
++
++	sw_trig = kzalloc(sizeof(struct switch_led_trigger), GFP_KERNEL);
++	if (!sw_trig)
++		return -ENOMEM;
++
++	sw_trig->swdev = swdev;
++	sw_trig->trig.name = swdev->devname;
++	sw_trig->trig.activate = swconfig_trig_activate;
++	sw_trig->trig.deactivate = swconfig_trig_deactivate;
++
++	INIT_DELAYED_WORK(&sw_trig->sw_led_work, swconfig_led_work_func);
++
++	err = led_trigger_register(&sw_trig->trig);
++	if (err)
++		goto err_free;
++
++	swdev->led_trigger = sw_trig;
++
++	return 0;
++
++err_free:
++	kfree(sw_trig);
++	return err;
++}
++
++static void
++swconfig_destroy_led_trigger(struct switch_dev *swdev)
++{
++	struct switch_led_trigger *sw_trig;
++
++	sw_trig = swdev->led_trigger;
++	if (sw_trig) {
++		cancel_delayed_work_sync(&sw_trig->sw_led_work);
++		led_trigger_unregister(&sw_trig->trig);
++		kfree(sw_trig);
++	}
++}
++
++#else /* SWCONFIG_LEDS */
++static inline int
++swconfig_create_led_trigger(struct switch_dev *swdev) { return 0; }
++
++static inline void
++swconfig_destroy_led_trigger(struct switch_dev *swdev) { }
++#endif /* CONFIG_SWCONFIG_LEDS */
+diff --git a/include/linux/phy.h b/include/linux/phy.h
+index 22af8f8..9ece37a 100644
+--- a/include/linux/phy.h
++++ b/include/linux/phy.h
+@@ -775,6 +775,24 @@ void mdio_bus_exit(void);
+ 
+ extern struct bus_type mdio_bus_type;
+ 
++struct mdio_board_info {
++	const char	*bus_id;
++	int		phy_addr;
++
++	const void	*platform_data;
++};
++
++#ifdef CONFIG_MDIO_BOARDINFO
++int mdiobus_register_board_info(const struct mdio_board_info *info, unsigned n);
++#else
++static inline int
++mdiobus_register_board_info(const struct mdio_board_info *info, unsigned n)
++{
++	return 0;
++}
++#endif
++
++
+ /**
+  * module_phy_driver() - Helper macro for registering PHY drivers
+  * @__phy_drivers: array of PHY drivers to register
+diff --git a/include/linux/platform_data/b53.h b/include/linux/platform_data/b53.h
+new file mode 100644
+index 0000000..7842741
+--- /dev/null
++++ b/include/linux/platform_data/b53.h
+@@ -0,0 +1,36 @@
++/*
++ * B53 platform data
++ *
++ * Copyright (C) 2013 Jonas Gorski <jogo@openwrt.org>
++ *
++ * Permission to use, copy, modify, and/or distribute this software for any
++ * purpose with or without fee is hereby granted, provided that the above
++ * copyright notice and this permission notice appear in all copies.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
++ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
++ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
++ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
++ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
++ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
++ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
++ */
++
++#ifndef __B53_H
++#define __B53_H
++
++#include <linux/kernel.h>
++
++struct b53_platform_data {
++	u32 chip_id;
++	u16 enabled_ports;
++
++	/* allow to specify an ethX alias */
++	const char *alias;
++
++	/* only used by MMAP'd driver */
++	unsigned big_endian:1;
++	void __iomem *regs;
++};
++
++#endif
+diff --git a/include/linux/switch.h b/include/linux/switch.h
+new file mode 100644
+index 0000000..4291364
+--- /dev/null
++++ b/include/linux/switch.h
+@@ -0,0 +1,169 @@
++/*
++ * switch.h: Switch configuration API
++ *
++ * Copyright (C) 2008 Felix Fietkau <nbd@openwrt.org>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++#ifndef _LINUX_SWITCH_H
++#define _LINUX_SWITCH_H
++
++#include <net/genetlink.h>
++#include <uapi/linux/switch.h>
++
++struct switch_dev;
++struct switch_op;
++struct switch_val;
++struct switch_attr;
++struct switch_attrlist;
++struct switch_led_trigger;
++
++int register_switch(struct switch_dev *dev, struct net_device *netdev);
++void unregister_switch(struct switch_dev *dev);
++
++/**
++ * struct switch_attrlist - attribute list
++ *
++ * @n_attr: number of attributes
++ * @attr: pointer to the attributes array
++ */
++struct switch_attrlist {
++	int n_attr;
++	const struct switch_attr *attr;
++};
++
++enum switch_port_speed {
++	SWITCH_PORT_SPEED_UNKNOWN = 0,
++	SWITCH_PORT_SPEED_10 = 10,
++	SWITCH_PORT_SPEED_100 = 100,
++	SWITCH_PORT_SPEED_1000 = 1000,
++};
++
++struct switch_port_link {
++	bool link;
++	bool duplex;
++	bool aneg;
++	bool tx_flow;
++	bool rx_flow;
++	enum switch_port_speed speed;
++	/* in ethtool adv_t format */
++	u32 eee;
++};
++
++struct switch_port_stats {
++	unsigned long tx_bytes;
++	unsigned long rx_bytes;
++};
++
++/**
++ * struct switch_dev_ops - switch driver operations
++ *
++ * @attr_global: global switch attribute list
++ * @attr_port: port attribute list
++ * @attr_vlan: vlan attribute list
++ *
++ * Callbacks:
++ *
++ * @get_vlan_ports: read the port list of a VLAN
++ * @set_vlan_ports: set the port list of a VLAN
++ *
++ * @get_port_pvid: get the primary VLAN ID of a port
++ * @set_port_pvid: set the primary VLAN ID of a port
++ *
++ * @apply_config: apply all changed settings to the switch
++ * @reset_switch: resetting the switch
++ */
++struct switch_dev_ops {
++	struct switch_attrlist attr_global, attr_port, attr_vlan;
++
++	int (*get_vlan_ports)(struct switch_dev *dev, struct switch_val *val);
++	int (*set_vlan_ports)(struct switch_dev *dev, struct switch_val *val);
++
++	int (*get_port_pvid)(struct switch_dev *dev, int port, int *val);
++	int (*set_port_pvid)(struct switch_dev *dev, int port, int val);
++
++	int (*apply_config)(struct switch_dev *dev);
++	int (*reset_switch)(struct switch_dev *dev);
++
++	int (*get_port_link)(struct switch_dev *dev, int port,
++			     struct switch_port_link *link);
++	int (*get_port_stats)(struct switch_dev *dev, int port,
++			      struct switch_port_stats *stats);
++};
++
++struct switch_dev {
++	struct device_node *of_node;
++	const struct switch_dev_ops *ops;
++	/* will be automatically filled */
++	char devname[IFNAMSIZ];
++
++	const char *name;
++	/* NB: either alias or netdev must be set */
++	const char *alias;
++	struct net_device *netdev;
++
++	int ports;
++	int vlans;
++	int cpu_port;
++
++	/* the following fields are internal for swconfig */
++	int id;
++	struct list_head dev_list;
++	unsigned long def_global, def_port, def_vlan;
++
++	struct mutex sw_mutex;
++	struct switch_port *portbuf;
++	struct switch_portmap *portmap;
++
++	char buf[128];
++
++#ifdef CONFIG_SWCONFIG_LEDS
++	struct switch_led_trigger *led_trigger;
++#endif
++};
++
++struct switch_port {
++	u32 id;
++	u32 flags;
++};
++
++struct switch_portmap {
++	u32 virt;
++	const char *s;
++};
++
++struct switch_val {
++	const struct switch_attr *attr;
++	int port_vlan;
++	int len;
++	union {
++		const char *s;
++		u32 i;
++		struct switch_port *ports;
++	} value;
++};
++
++struct switch_attr {
++	int disabled;
++	int type;
++	const char *name;
++	const char *description;
++
++	int (*set)(struct switch_dev *dev, const struct switch_attr *attr, struct switch_val *val);
++	int (*get)(struct switch_dev *dev, const struct switch_attr *attr, struct switch_val *val);
++
++	/* for driver internal use */
++	int id;
++	int ofs;
++	int max;
++};
++
++#endif /* _LINUX_SWITCH_H */
+diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
+index 00b1000..485d22b 100644
+--- a/include/uapi/linux/Kbuild
++++ b/include/uapi/linux/Kbuild
+@@ -378,6 +378,7 @@ header-y += stddef.h
+ header-y += string.h
+ header-y += suspend_ioctls.h
+ header-y += swab.h
++header-y += switch.h
+ header-y += synclink.h
+ header-y += sysctl.h
+ header-y += sysinfo.h
+diff --git a/include/uapi/linux/switch.h b/include/uapi/linux/switch.h
+new file mode 100644
+index 0000000..a59b239
+--- /dev/null
++++ b/include/uapi/linux/switch.h
+@@ -0,0 +1,103 @@
++/*
++ * switch.h: Switch configuration API
++ *
++ * Copyright (C) 2008 Felix Fietkau <nbd@openwrt.org>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++#ifndef _UAPI_LINUX_SWITCH_H
++#define _UAPI_LINUX_SWITCH_H
++
++#include <linux/types.h>
++#include <linux/netdevice.h>
++#include <linux/netlink.h>
++#include <linux/genetlink.h>
++#ifndef __KERNEL__
++#include <netlink/netlink.h>
++#include <netlink/genl/genl.h>
++#include <netlink/genl/ctrl.h>
++#endif
++
++/* main attributes */
++enum {
++	SWITCH_ATTR_UNSPEC,
++	/* global */
++	SWITCH_ATTR_TYPE,
++	/* device */
++	SWITCH_ATTR_ID,
++	SWITCH_ATTR_DEV_NAME,
++	SWITCH_ATTR_ALIAS,
++	SWITCH_ATTR_NAME,
++	SWITCH_ATTR_VLANS,
++	SWITCH_ATTR_PORTS,
++	SWITCH_ATTR_PORTMAP,
++	SWITCH_ATTR_CPU_PORT,
++	/* attributes */
++	SWITCH_ATTR_OP_ID,
++	SWITCH_ATTR_OP_TYPE,
++	SWITCH_ATTR_OP_NAME,
++	SWITCH_ATTR_OP_PORT,
++	SWITCH_ATTR_OP_VLAN,
++	SWITCH_ATTR_OP_VALUE_INT,
++	SWITCH_ATTR_OP_VALUE_STR,
++	SWITCH_ATTR_OP_VALUE_PORTS,
++	SWITCH_ATTR_OP_DESCRIPTION,
++	/* port lists */
++	SWITCH_ATTR_PORT,
++	SWITCH_ATTR_MAX
++};
++
++enum {
++	/* port map */
++	SWITCH_PORTMAP_PORTS,
++	SWITCH_PORTMAP_SEGMENT,
++	SWITCH_PORTMAP_VIRT,
++	SWITCH_PORTMAP_MAX
++};
++
++/* commands */
++enum {
++	SWITCH_CMD_UNSPEC,
++	SWITCH_CMD_GET_SWITCH,
++	SWITCH_CMD_NEW_ATTR,
++	SWITCH_CMD_LIST_GLOBAL,
++	SWITCH_CMD_GET_GLOBAL,
++	SWITCH_CMD_SET_GLOBAL,
++	SWITCH_CMD_LIST_PORT,
++	SWITCH_CMD_GET_PORT,
++	SWITCH_CMD_SET_PORT,
++	SWITCH_CMD_LIST_VLAN,
++	SWITCH_CMD_GET_VLAN,
++	SWITCH_CMD_SET_VLAN
++};
++
++/* data types */
++enum switch_val_type {
++	SWITCH_TYPE_UNSPEC,
++	SWITCH_TYPE_INT,
++	SWITCH_TYPE_STRING,
++	SWITCH_TYPE_PORTS,
++	SWITCH_TYPE_NOVAL,
++};
++
++/* port nested attributes */
++enum {
++	SWITCH_PORT_UNSPEC,
++	SWITCH_PORT_ID,
++	SWITCH_PORT_FLAG_TAGGED,
++	SWITCH_PORT_ATTR_MAX
++};
++
++#define SWITCH_ATTR_DEFAULTS_OFFSET	0x1000
++
++
++#endif /* _UAPI_LINUX_SWITCH_H */
diff --git a/board/bananapi/r1/patches/package/.empty b/board/bananapi/r1/patches/package/.empty
new file mode 100644
index 0000000..e69de29
diff --git a/board/bananapi/r1/post-image.sh b/board/bananapi/r1/post-image.sh
new file mode 100755
index 0000000..7e43b4d
--- /dev/null
+++ b/board/bananapi/r1/post-image.sh
@@ -0,0 +1,108 @@
+#!/bin/bash -e
+echo "Creating SD card image..."
+SCRIPT_DIR=$(dirname $0)
+
+B=512
+K=1024
+KiB=1000
+M=$((1024*K))
+MiB=$((1000*KiB))
+G=$((1024*M))
+GiB=$((1000*MiB))
+
+IMAGE_SIZE=$((101*M))
+IMAGE_NAME=${BINARIES_DIR}/bpi-r1.img
+UBOOT=${BINARIES_DIR}/u-boot-sunxi-with-spl.bin
+
+ALIGN=2048
+
+NUMPARTITIONS=2
+PARTITION1_SIZE=$((20480*K))
+PARTITION1_TYPE=0x0c
+PARTITION1_FS=msdos
+PARTITION2_SIZE=*
+PARTITION2_TYPE=0x83
+
+make_partitions()
+{
+  local POS=2048
+  local SIZE
+  local REMAINING=$((IMAGE_SIZE - ($POS*$B)))
+  local BLOCKS
+  local FLAGS="-c"
+  local P
+  {
+    for ((P=1; P <= NUMPARTITIONS ; P++))
+    do
+      eval SIZE='$'PARTITION${P}_SIZE
+      eval TYPE='$'PARTITION${P}_TYPE
+      if [ "$SIZE" = "*" ]
+      then
+        SIZE=$REMAINING
+      fi
+      BLOCKS=$((SIZE/B))
+      BLOCKS=$(((BLOCKS + ALIGN - 1) / ALIGN * ALIGN))
+      SIZE=$((BLOCKS*B))
+
+
+      if [ $P -eq 4 ]
+      then
+        FLAGS="${FLAGS} -m"
+      fi
+
+      ${HOST_DIR}/usr/bin/genpart --begin=${POS} --size=${BLOCKS} --type=${TYPE} ${FLAGS}
+
+      REMAINING=$((REMAINING - SIZE))
+      POS=$((POS + BLOCKS))
+      FLAGS=
+    done
+  }
+
+  while [ $P -le 4 ]
+  do
+    if [ $P -eq 4 ]
+    then
+      FLAGS="${FLAGS} -m"
+    fi
+
+    ${HOST_DIR}/usr/bin/genpart --type=0 --size=0 ${FLAGS}
+
+    P=$((P+1))
+
+  done
+
+  return
+}
+
+make_boot()
+{
+  FAT32_BLOCKS=$((PARTITION1_SIZE / K))
+  echo "Creating boot.img with $FAT32_BLOCKS blocks"
+  rm -f ${BINARIES_DIR}/boot.img
+  ${HOST_DIR}/usr/sbin/mkdosfs ${BINARIES_DIR}/boot.img -C ${FAT32_BLOCKS}
+
+  ${HOST_DIR}/usr/bin/mcopy -i ${BINARIES_DIR}/boot.img ${BINARIES_DIR}/boot.scr ::boot.scr
+  ${HOST_DIR}/usr/bin/mcopy -i ${BINARIES_DIR}/boot.img ${BINARIES_DIR}/sun7i-a20-lamobo-r1.dtb ::dtb
+  ${HOST_DIR}/usr/bin/mcopy -i ${BINARIES_DIR}/boot.img ${BINARIES_DIR}/uImage ::uImage
+}
+
+# create boot script
+${HOST_DIR}/usr/bin/mkimage  -A arm -T script -C none -d ${SCRIPT_DIR}/uEnv.txt ${BINARIES_DIR}/boot.scr
+
+# create boot image
+${HOST_DIR}/usr/bin/mkimage  -A arm -O linux -T kernel -C none \
+                -a 0x40008000 -e 0x40008000 \
+                -n "ARM BuildRoot Linux" \
+                -d ${BINARIES_DIR}/zImage ${BINARIES_DIR}/uImage
+
+make_boot
+
+{
+  dd if=/dev/zero bs=446 count=1 2>/dev/null
+  make_partitions
+  dd if=/dev/zero bs=512 count=15 2>/dev/null
+  cat ${UBOOT} /dev/zero | dd bs=512 count=2032 2>/dev/null
+  cat ${BINARIES_DIR}/boot.img
+  cat ${BINARIES_DIR}/rootfs.ext2
+  cat /dev/zero
+} | dd bs=512 count=$((IMAGE_SIZE/B)) iflag=fullblock conv=sparse of=${IMAGE_NAME} 2>/dev/null
diff --git a/board/bananapi/r1/uEnv.txt b/board/bananapi/r1/uEnv.txt
new file mode 100644
index 0000000..e024954
--- /dev/null
+++ b/board/bananapi/r1/uEnv.txt
@@ -0,0 +1,6 @@
+setenv fdt_high ffffffff
+setenv loadkernel fatload mmc 0 \$kernel_addr_r uImage
+setenv loaddtb fatload mmc 0 \$fdt_addr_r dtb
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv uenvcmd run loadkernel \&\& run loaddtb \&\& bootm \$kernel_addr_r - \$fdt_addr_r
+run uenvcmd
diff --git a/boot/uboot/uboot-001-bananapi.patch b/boot/uboot/uboot-001-bananapi.patch
new file mode 100644
index 0000000..3831810
--- /dev/null
+++ b/boot/uboot/uboot-001-bananapi.patch
@@ -0,0 +1,50 @@
+diff --git a/board/sunxi/gmac.c b/board/sunxi/gmac.c
+index 571bc9e..0e370ef 100644
+--- a/board/sunxi/gmac.c
++++ b/board/sunxi/gmac.c
+@@ -34,7 +34,7 @@ int sunxi_gmac_initialize(bd_t *bis)
+ 	 * need to set bits 10-12 GTXDC "GMAC Transmit Clock Delay Chain"
+ 	 * of the GMAC clk register to 3.
+ 	 */
+-#ifdef CONFIG_TARGET_BANANAPI
++#ifdef CONFIG_SUNXI_GMAC_TX_DELAY_3
+ 	setbits_le32(&ccm->gmac_clk_cfg, 0x3 << 10);
+ #endif
+ 
+diff --git a/configs/Bananapi_defconfig b/configs/Bananapi_defconfig
+index 196f682..1aff33f 100644
+--- a/configs/Bananapi_defconfig
++++ b/configs/Bananapi_defconfig
+@@ -1,5 +1,5 @@
+ CONFIG_SPL=y
+-CONFIG_SYS_EXTRA_OPTIONS="AXP209_POWER,SUNXI_GMAC,RGMII,MACPWR=SUNXI_GPH(23),AHCI,USB_EHCI"
++CONFIG_SYS_EXTRA_OPTIONS="AXP209_POWER,SUNXI_GMAC,SUNXI_GMAC_TX_DELAY_3,RGMII,MACPWR=SUNXI_GPH(23),AHCI,USB_EHCI"
+ CONFIG_FDTFILE="sun7i-a20-bananapi.dtb"
+ +S:CONFIG_ARM=y
+ +S:CONFIG_ARCH_SUNXI=y
+diff --git a/configs/Bananapro_defconfig b/configs/Bananapro_defconfig
+new file mode 100644
+index 0000000..6f215dd
+--- /dev/null
++++ b/configs/Bananapro_defconfig
+@@ -0,0 +1,7 @@
++CONFIG_SPL=y
++CONFIG_SYS_EXTRA_OPTIONS="AXP209_POWER,SUNXI_GMAC,RGMII,MACPWR=SUNXI_GPH(23),AHCI,USB_EHCI"
++CONFIG_FDTFILE="sun7i-a20-bananapro.dtb"
+++S:CONFIG_ARM=y
+++S:CONFIG_ARCH_SUNXI=y
+++S:CONFIG_MACH_SUN7I=y
+++S:CONFIG_TARGET_BANANAPRO=y
+diff --git a/configs/Lamobo_R1_defconfig b/configs/Lamobo_R1_defconfig
+new file mode 100644
+index 0000000..4c42fe7
+--- /dev/null
++++ b/configs/Lamobo_R1_defconfig
+@@ -0,0 +1,7 @@
++CONFIG_SPL=y
++CONFIG_SYS_EXTRA_OPTIONS="AXP209_POWER,SUNXI_GMAC,SUNXI_GMAC_TX_DELAY_3,RGMII,MACPWR=SUNXI_GPH(23),AHCI,USB_EHCI"
++CONFIG_FDTFILE="sun7i-a20-lamobo-r1.dtb"
+++S:CONFIG_ARM=y
+++S:CONFIG_ARCH_SUNXI=y
+++S:CONFIG_MACH_SUN7I=y
+++S:CONFIG_TARGET_LAMOBO_R1=y
diff --git a/configs/lamobo_r1_defconfig b/configs/lamobo_r1_defconfig
new file mode 100644
index 0000000..6b65db4
--- /dev/null
+++ b/configs/lamobo_r1_defconfig
@@ -0,0 +1,62 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV4=y
+BR2_JLEVEL=4
+BR2_GLOBAL_PATCH_DIR="board/bananapi/r1/patches/package"
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.19.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_GCC_VERSION_4_9_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="bpi-r1"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi-R1"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_OVERLAY="board/bananapi/r1/fs-overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bananapi/r1/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19.1"
+BR2_LINUX_KERNEL_PATCH="board/bananapi/r1/patches/linux"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/bananapi/r1/linux-3.19.1.config"
+BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-lamobo-r1"
+BR2_PACKAGE_BUSYBOX_CONFIG="board/bananapi/r1/busybox.config"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_ZD1211_FIRMWARE=y
+BR2_PACKAGE_EUDEV_RULES_GEN=y
+BR2_PACKAGE_SWCONFIG=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_DNSMASQ=y
+BR2_PACKAGE_DROPBEAR=y
+BR2_PACKAGE_HOSTAPD=y
+BR2_PACKAGE_HOSTAPD_EAP=y
+BR2_PACKAGE_HOSTAPD_WPS=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_KNOCK=y
+BR2_PACKAGE_OPENVPN=y
+BR2_PACKAGE_PPPD=y
+BR2_PACKAGE_TCPDUMP=y
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="Lamobo_R1"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/bananapi/r1/uEnv.txt"
+BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x1000"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENPART=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/package/Config.in b/package/Config.in
index c183748..07a95c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -381,6 +381,7 @@ endif
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
 	source "package/sunxi-mali-prop/Config.in"
+	source "package/swconfig/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/swconfig/001-no-uci.patch b/package/swconfig/001-no-uci.patch
new file mode 100644
index 0000000..b68dad3
--- /dev/null
+++ b/package/swconfig/001-no-uci.patch
@@ -0,0 +1,236 @@
+diff --git a/Makefile b/Makefile
+index 0d56f43..bb4a712 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,12 +1,12 @@
+ ifndef CFLAGS
+ CFLAGS = -O2 -g -I ../src
+ endif
+-LIBS=-lnl -lnl-genl
++LIBS=-lnl-3 -lnl-genl-3
+ 
+ all: swconfig
+ 
+ %.o: %.c
+ 	$(CC) $(CFLAGS) -c -o $@ $^
+ 
+-swconfig: cli.o swlib.o uci.o
++swconfig: cli.o swlib.o
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+diff --git a/cli.c b/cli.c
+index d472086..d6ae0ee 100644
+--- a/cli.c
++++ b/cli.c
+@@ -23,7 +23,6 @@
+ #include <getopt.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <uci.h>
+ 
+ #include <linux/types.h>
+ #include <linux/netlink.h>
+@@ -31,14 +30,22 @@
+ #include <netlink/netlink.h>
+ #include <netlink/genl/genl.h>
+ #include <netlink/genl/ctrl.h>
+-#include <linux/switch.h>
++#include "switch.h"
+ #include "swlib.h"
+ 
++#if !defined false
++# define false 0
++typedef unsigned char bool;
++#endif
++
++#if !defined true
++# define true 1
++#endif
++
+ enum {
+ 	CMD_NONE,
+ 	CMD_GET,
+ 	CMD_SET,
+-	CMD_LOAD,
+ 	CMD_HELP,
+ 	CMD_SHOW,
+ 	CMD_PORTMAP,
+@@ -169,36 +176,10 @@ static void
+ print_usage(void)
+ {
+ 	printf("swconfig list\n");
+-	printf("swconfig dev <dev> [port <port>|vlan <vlan>] (help|set <key> <value>|get <key>|load <config>|show)\n");
++	printf("swconfig dev <dev> [port <port>|vlan <vlan>] (help|set <key> <value>|get <key>|portmap|show)\n");
+ 	exit(1);
+ }
+ 
+-static void
+-swconfig_load_uci(struct switch_dev *dev, const char *name)
+-{
+-	struct uci_context *ctx;
+-	struct uci_package *p = NULL;
+-	int ret = -1;
+-
+-	ctx = uci_alloc_context();
+-	if (!ctx)
+-		return;
+-
+-	uci_load(ctx, name, &p);
+-	if (!p) {
+-		uci_perror(ctx, "Failed to load config file: ");
+-		goto out;
+-	}
+-
+-	ret = swlib_apply_from_uci(dev, p);
+-	if (ret < 0)
+-		fprintf(stderr, "Failed to apply configuration for switch '%s'\n", dev->dev_name);
+-
+-out:
+-	uci_free_context(ctx);
+-	exit(ret);
+-}
+-
+ int main(int argc, char **argv)
+ {
+ 	int retval = 0;
+@@ -247,11 +228,6 @@ int main(int argc, char **argv)
+ 		} else if (!strcmp(arg, "get") && i+1 < argc) {
+ 			cmd = CMD_GET;
+ 			ckey = argv[++i];
+-		} else if (!strcmp(arg, "load") && i+1 < argc) {
+-			if ((cport >= 0) || (cvlan >= 0))
+-				print_usage();
+-			cmd = CMD_LOAD;
+-			ckey = argv[++i];
+ 		} else if (!strcmp(arg, "portmap")) {
+ 			if (i + 1 < argc)
+ 				csegment = argv[++i];
+@@ -323,9 +299,6 @@ int main(int argc, char **argv)
+ 		print_attr_val(a, &val);
+ 		putchar('\n');
+ 		break;
+-	case CMD_LOAD:
+-		swconfig_load_uci(dev, ckey);
+-		break;
+ 	case CMD_HELP:
+ 		list_attributes(dev);
+ 		break;
+diff --git a/switch.h b/switch.h
+new file mode 100644
+index 0000000..af8d979
+--- /dev/null
++++ b/switch.h
+@@ -0,0 +1,101 @@
++/*
++ * switch.h: Switch configuration API
++ *
++ * Copyright (C) 2008 Felix Fietkau <nbd@openwrt.org>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2
++ * of the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++#ifndef _LINUX_SWITCH_H
++#define _LINUX_SWITCH_H
++
++#include <linux/types.h>
++#include <linux/netdevice.h>
++#include <linux/netlink.h>
++#include <linux/genetlink.h>
++#include <netlink/netlink.h>
++#include <netlink/genl/genl.h>
++#include <netlink/genl/ctrl.h>
++
++/* main attributes */
++enum {
++	SWITCH_ATTR_UNSPEC,
++	/* global */
++	SWITCH_ATTR_TYPE,
++	/* device */
++	SWITCH_ATTR_ID,
++	SWITCH_ATTR_DEV_NAME,
++	SWITCH_ATTR_ALIAS,
++	SWITCH_ATTR_NAME,
++	SWITCH_ATTR_VLANS,
++	SWITCH_ATTR_PORTS,
++	SWITCH_ATTR_PORTMAP,
++	SWITCH_ATTR_CPU_PORT,
++	/* attributes */
++	SWITCH_ATTR_OP_ID,
++	SWITCH_ATTR_OP_TYPE,
++	SWITCH_ATTR_OP_NAME,
++	SWITCH_ATTR_OP_PORT,
++	SWITCH_ATTR_OP_VLAN,
++	SWITCH_ATTR_OP_VALUE_INT,
++	SWITCH_ATTR_OP_VALUE_STR,
++	SWITCH_ATTR_OP_VALUE_PORTS,
++	SWITCH_ATTR_OP_DESCRIPTION,
++	/* port lists */
++	SWITCH_ATTR_PORT,
++	SWITCH_ATTR_MAX
++};
++
++enum {
++	/* port map */
++	SWITCH_PORTMAP_PORTS,
++	SWITCH_PORTMAP_SEGMENT,
++	SWITCH_PORTMAP_VIRT,
++	SWITCH_PORTMAP_MAX
++};
++
++/* commands */
++enum {
++	SWITCH_CMD_UNSPEC,
++	SWITCH_CMD_GET_SWITCH,
++	SWITCH_CMD_NEW_ATTR,
++	SWITCH_CMD_LIST_GLOBAL,
++	SWITCH_CMD_GET_GLOBAL,
++	SWITCH_CMD_SET_GLOBAL,
++	SWITCH_CMD_LIST_PORT,
++	SWITCH_CMD_GET_PORT,
++	SWITCH_CMD_SET_PORT,
++	SWITCH_CMD_LIST_VLAN,
++	SWITCH_CMD_GET_VLAN,
++	SWITCH_CMD_SET_VLAN
++};
++
++/* data types */
++enum switch_val_type {
++	SWITCH_TYPE_UNSPEC,
++	SWITCH_TYPE_INT,
++	SWITCH_TYPE_STRING,
++	SWITCH_TYPE_PORTS,
++	SWITCH_TYPE_NOVAL,
++};
++
++/* port nested attributes */
++enum {
++	SWITCH_PORT_UNSPEC,
++	SWITCH_PORT_ID,
++	SWITCH_PORT_FLAG_TAGGED,
++	SWITCH_PORT_ATTR_MAX
++};
++
++#define SWITCH_ATTR_DEFAULTS_OFFSET	0x1000
++
++
++#endif /* _LINUX_SWITCH_H */
+diff --git a/swlib.c b/swlib.c
+index 1222502..0953456 100644
+--- a/swlib.c
++++ b/swlib.c
+@@ -22,7 +22,7 @@
+ #include <getopt.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <linux/switch.h>
++#include "switch.h"
+ #include "swlib.h"
+ #include <netlink/netlink.h>
+ #include <netlink/genl/genl.h>
diff --git a/package/swconfig/Config.in b/package/swconfig/Config.in
new file mode 100644
index 0000000..8817c3f
--- /dev/null
+++ b/package/swconfig/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SWCONFIG
+	bool "swconfig"
+#	depends on BR2_PACKAGE_LIBNL
+	select BR2_PACKAGE_LIBNL
+	help
+	  Configuration utility for the B53 switch on the Bananapi R1 router board
+
+	  http://openwrt.org
+
+#comment "swconfig needs libnl"
+#	depends on !BR2_PACKAGE_LIBNL 
diff --git a/package/swconfig/swconfig.mk b/package/swconfig/swconfig.mk
new file mode 100644
index 0000000..8773cd9
--- /dev/null
+++ b/package/swconfig/swconfig.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# swconfig
+#
+################################################################################
+
+SWCONFIG_VERSION = 39229
+SWCONFIG_SITE = svn://svn.openwrt.org/openwrt/trunk/package/network/config/swconfig/src
+SWCONFIG_INSTALL_STAGING = NO
+SWCONFIG_INSTALL_TARGET = YES
+
+define SWCONFIG_BUILD_CMDS
+        $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+
+define SWCONFIG_INSTALL_TARGET_CMDS
+        $(INSTALL) -D -m 0755 $(@D)/swconfig $(TARGET_DIR)/usr/bin/swconfig
+endef
+
+
+$(eval $(generic-package))
+
+
-- 
1.8.3.2
