From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Apr 2012 07:15:23 -0300
Subject: [Buildroot] [PATCH 1/2] busybox: add new 1.20.0, remove deprecated,
	mark 1.18.x deprecated
Message-ID: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add version 1.20.0, remove deprecated 1.16.x & 1.17.x versions and mark
1.18.x as deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/Config.in                          |   22 +-
 .../busybox/busybox-1.16.2/busybox-devmem.patch    |   76 --
 package/busybox/busybox-1.16.x.config              |  920 --------------------
 .../busybox-1.20.0/busybox-1.20.0-getty.patch      |   17 +
 .../busybox-1.20.0/busybox-1.20.0-lineedit.patch   |   22 +
 .../busybox-1.20.0/busybox-1.20.0-sed.patch        |   29 +
 ...busybox-1.17.x.config => busybox-1.20.x.config} |  206 +++--
 7 files changed, 208 insertions(+), 1084 deletions(-)
 delete mode 100644 package/busybox/busybox-1.16.2/busybox-devmem.patch
 delete mode 100644 package/busybox/busybox-1.16.x.config
 create mode 100644 package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch
 create mode 100644 package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch
 create mode 100644 package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch
 rename package/busybox/{busybox-1.17.x.config => busybox-1.20.x.config} (92%)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index c206509..b5770eb 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -13,24 +13,20 @@ if BR2_PACKAGE_BUSYBOX
 
 choice
 	prompt "BusyBox Version"
-	default BR2_BUSYBOX_VERSION_1_19_X
+	default BR2_BUSYBOX_VERSION_1_20_X
 	help
 	  Select the version of BusyBox you wish to use.
 
-	config BR2_BUSYBOX_VERSION_1_16_X
-		bool "BusyBox 1.16.x"
-		depends on BR2_DEPRECATED
-
-	config BR2_BUSYBOX_VERSION_1_17_X
-		bool "BusyBox 1.17.x"
-		depends on BR2_DEPRECATED
-
 	config BR2_BUSYBOX_VERSION_1_18_X
 		bool "BusyBox 1.18.x"
+		depends on BR2_DEPRECATED
 
 	config BR2_BUSYBOX_VERSION_1_19_X
 		bool "BusyBox 1.19.x"
 
+	config BR2_BUSYBOX_VERSION_1_20_X
+		bool "BusyBox 1.20.x"
+
 	config BR2_PACKAGE_BUSYBOX_SNAPSHOT
 		bool "daily snapshot"
 
@@ -38,18 +34,16 @@ endchoice
 
 config BR2_BUSYBOX_VERSION
 	string
-	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
-	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
 	default "1.18.5"	if BR2_BUSYBOX_VERSION_1_18_X
 	default "1.19.4"	if BR2_BUSYBOX_VERSION_1_19_X
+	default "1.20.0"	if BR2_BUSYBOX_VERSION_1_20_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
-	default "package/busybox/busybox-1.19.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
-	default "package/busybox/busybox-1.16.x.config" if BR2_BUSYBOX_VERSION_1_16_X
-	default "package/busybox/busybox-1.17.x.config" if BR2_BUSYBOX_VERSION_1_17_X
+	default "package/busybox/busybox-1.20.x.config" if BR2_PACKAGE_BUSYBOX_SNAPSHOT
 	default "package/busybox/busybox-1.18.x.config" if BR2_BUSYBOX_VERSION_1_18_X
 	default "package/busybox/busybox-1.19.x.config" if BR2_BUSYBOX_VERSION_1_19_X
+	default "package/busybox/busybox-1.20.x.config" if BR2_BUSYBOX_VERSION_1_20_X
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
diff --git a/package/busybox/busybox-1.16.2/busybox-devmem.patch b/package/busybox/busybox-1.16.2/busybox-devmem.patch
deleted file mode 100644
index f7d1d1d..0000000
--- a/package/busybox/busybox-1.16.2/busybox-devmem.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 351ef7188a1a2e2f154bbda6f703c2d3f4af6d79 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Wed, 14 Apr 2010 13:37:25 -0700
-Subject: [PATCH] devmem: map two pages only if it is necessary
-
-function                                             old     new   delta
-devmem_main                                          463     469      +6
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- miscutils/devmem.c |   21 ++++++++++++++-------
- 1 files changed, 14 insertions(+), 7 deletions(-)
-
-diff --git a/miscutils/devmem.c b/miscutils/devmem.c
-index e13dedc..39b5808 100644
---- a/miscutils/devmem.c
-+++ b/miscutils/devmem.c
-@@ -13,9 +13,9 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 	uint64_t read_result;
- 	uint64_t writeval = writeval; /* for compiler */
- 	off_t target;
--	unsigned page_size = getpagesize();
-+	unsigned page_size, mapped_size, offset_in_page;
- 	int fd;
--	int width = 8 * sizeof(int);
-+	unsigned width = 8 * sizeof(int);
- 
- 	/* devmem ADDRESS [WIDTH [VALUE]] */
- // TODO: options?
-@@ -50,15 +50,22 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 		if (argv[3])
- 			writeval = bb_strtoull(argv[3], NULL, 0);
- 	} else { /* argv[2] == NULL */
--		/* make argv[3] to be a valid thing to use */
-+		/* make argv[3] to be a valid thing to fetch */
- 		argv--;
- 	}
- 	if (errno)
--		bb_show_usage(); /* bb_strtouXX failed */
-+		bb_show_usage(); /* one of bb_strtouXX failed */
- 
- 	fd = xopen("/dev/mem", argv[3] ? (O_RDWR | O_SYNC) : (O_RDONLY | O_SYNC));
-+	mapped_size = page_size = getpagesize();
-+	offset_in_page = (unsigned)target & (page_size - 1);
-+	if (offset_in_page + width > page_size) {
-+		/* This access spans pages.
-+		 * Must map two pages to make it possible: */
-+		mapped_size *= 2;
-+	}
- 	map_base = mmap(NULL,
--			page_size * 2 /* in case value spans page */,
-+			mapped_size,
- 			argv[3] ? (PROT_READ | PROT_WRITE) : PROT_READ,
- 			MAP_SHARED,
- 			fd,
-@@ -68,7 +75,7 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 
- //	printf("Memory mapped at address %p.\n", map_base);
- 
--	virt_addr = (char*)map_base + (target & (page_size - 1));
-+	virt_addr = (char*)map_base + offset_in_page;
- 
- 	if (!argv[3]) {
- 		switch (width) {
-@@ -119,7 +126,7 @@ int devmem_main(int argc UNUSED_PARAM, char **argv)
- 	}
- 
- 	if (ENABLE_FEATURE_CLEAN_UP) {
--		if (munmap(map_base, page_size * 2) == -1)
-+		if (munmap(map_base, mapped_size) == -1)
- 			bb_perror_msg_and_die("munmap");
- 		close(fd);
- 	}
--- 
-1.7.1
-
diff --git a/package/busybox/busybox-1.16.x.config b/package/busybox/busybox-1.16.x.config
deleted file mode 100644
index 24a27bf..0000000
--- a/package/busybox/busybox-1.16.x.config
+++ /dev/null
@@ -1,920 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Busybox version: 1.16.0
-# Sun Jan 31 20:49:46 2010
-#
-CONFIG_HAVE_DOT_CONFIG=y
-
-#
-# Busybox Settings
-#
-
-#
-# General Configuration
-#
-CONFIG_DESKTOP=y
-# CONFIG_EXTRA_COMPAT is not set
-CONFIG_INCLUDE_SUSv2=y
-# CONFIG_USE_PORTABLE_CODE is not set
-CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
-# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
-# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
-CONFIG_SHOW_USAGE=y
-CONFIG_FEATURE_VERBOSE_USAGE=y
-# CONFIG_FEATURE_COMPRESS_USAGE is not set
-CONFIG_FEATURE_INSTALLER=y
-# CONFIG_LOCALE_SUPPORT is not set
-# CONFIG_FEATURE_ASSUME_UNICODE is not set
-# CONFIG_FEATURE_CHECK_UNICODE_IN_ENV is not set
-CONFIG_LONG_OPTS=y
-CONFIG_FEATURE_DEVPTS=y
-CONFIG_FEATURE_CLEAN_UP=y
-# CONFIG_FEATURE_PIDFILE is not set
-CONFIG_FEATURE_SUID=y
-# CONFIG_FEATURE_SUID_CONFIG is not set
-# CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
-# CONFIG_SELINUX is not set
-# CONFIG_FEATURE_PREFER_APPLETS is not set
-CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
-CONFIG_FEATURE_SYSLOG=y
-# CONFIG_FEATURE_HAVE_RPC is not set
-
-#
-# Build Options
-#
-# CONFIG_STATIC is not set
-# CONFIG_PIE is not set
-# CONFIG_NOMMU is not set
-# CONFIG_BUILD_LIBBUSYBOX is not set
-# CONFIG_FEATURE_INDIVIDUAL is not set
-# CONFIG_FEATURE_SHARED_BUSYBOX is not set
-# CONFIG_LFS is not set
-CONFIG_CROSS_COMPILER_PREFIX=""
-CONFIG_EXTRA_CFLAGS=""
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
-# CONFIG_DEBUG_PESSIMIZE is not set
-# CONFIG_WERROR is not set
-CONFIG_NO_DEBUG_LIB=y
-# CONFIG_DMALLOC is not set
-# CONFIG_EFENCE is not set
-
-#
-# Installation Options
-#
-# CONFIG_INSTALL_NO_USR is not set
-CONFIG_INSTALL_APPLET_SYMLINKS=y
-# CONFIG_INSTALL_APPLET_HARDLINKS is not set
-# CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
-# CONFIG_INSTALL_APPLET_DONT is not set
-# CONFIG_INSTALL_SH_APPLET_SYMLINK is not set
-# CONFIG_INSTALL_SH_APPLET_HARDLINK is not set
-# CONFIG_INSTALL_SH_APPLET_SCRIPT_WRAPPER is not set
-CONFIG_PREFIX="./_install"
-
-#
-# Busybox Library Tuning
-#
-CONFIG_PASSWORD_MINLEN=6
-CONFIG_MD5_SIZE_VS_SPEED=2
-# CONFIG_FEATURE_FAST_TOP is not set
-# CONFIG_FEATURE_ETC_NETWORKS is not set
-CONFIG_FEATURE_EDITING=y
-CONFIG_FEATURE_EDITING_MAX_LEN=1024
-CONFIG_FEATURE_EDITING_VI=y
-CONFIG_FEATURE_EDITING_HISTORY=999
-CONFIG_FEATURE_EDITING_SAVEHISTORY=y
-CONFIG_FEATURE_TAB_COMPLETION=y
-# CONFIG_FEATURE_USERNAME_COMPLETION is not set
-CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
-# CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
-CONFIG_FEATURE_NON_POSIX_CP=y
-# CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
-CONFIG_FEATURE_COPYBUF_KB=4
-CONFIG_MONOTONIC_SYSCALL=y
-CONFIG_IOCTL_HEX2STR_ERROR=y
-CONFIG_FEATURE_HWIB=y
-
-#
-# Applets
-#
-
-#
-# Archival Utilities
-#
-# CONFIG_FEATURE_SEAMLESS_LZMA is not set
-# CONFIG_FEATURE_SEAMLESS_BZ2 is not set
-# CONFIG_FEATURE_SEAMLESS_GZ is not set
-# CONFIG_FEATURE_SEAMLESS_Z is not set
-CONFIG_AR=y
-# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
-CONFIG_BUNZIP2=y
-# CONFIG_BZIP2 is not set
-CONFIG_CPIO=y
-# CONFIG_FEATURE_CPIO_O is not set
-# CONFIG_FEATURE_CPIO_P is not set
-# CONFIG_DPKG is not set
-# CONFIG_DPKG_DEB is not set
-# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
-CONFIG_GUNZIP=y
-CONFIG_GZIP=y
-# CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
-# CONFIG_LZOP is not set
-# CONFIG_LZOP_COMPR_HIGH is not set
-# CONFIG_RPM2CPIO is not set
-# CONFIG_RPM is not set
-CONFIG_TAR=y
-CONFIG_FEATURE_TAR_CREATE=y
-# CONFIG_FEATURE_TAR_AUTODETECT is not set
-CONFIG_FEATURE_TAR_FROM=y
-# CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
-# CONFIG_FEATURE_TAR_OLDSUN_COMPATIBILITY is not set
-CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
-CONFIG_FEATURE_TAR_LONG_OPTIONS=y
-# CONFIG_FEATURE_TAR_UNAME_GNAME is not set
-# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
-# CONFIG_UNCOMPRESS is not set
-CONFIG_UNLZMA=y
-# CONFIG_FEATURE_LZMA_FAST is not set
-CONFIG_UNZIP=y
-
-#
-# Coreutils
-#
-CONFIG_BASENAME=y
-# CONFIG_CAL is not set
-CONFIG_CAT=y
-CONFIG_CATV=y
-CONFIG_CHGRP=y
-CONFIG_CHMOD=y
-CONFIG_CHOWN=y
-# CONFIG_FEATURE_CHOWN_LONG_OPTIONS is not set
-CONFIG_CHROOT=y
-CONFIG_CKSUM=y
-# CONFIG_COMM is not set
-CONFIG_CP=y
-# CONFIG_FEATURE_CP_LONG_OPTIONS is not set
-CONFIG_CUT=y
-CONFIG_DATE=y
-CONFIG_FEATURE_DATE_ISOFMT=y
-CONFIG_FEATURE_DATE_COMPAT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
-CONFIG_FEATURE_DD_IBS_OBS=y
-CONFIG_DF=y
-# CONFIG_FEATURE_DF_FANCY is not set
-CONFIG_DIRNAME=y
-CONFIG_DOS2UNIX=y
-CONFIG_UNIX2DOS=y
-CONFIG_DU=y
-CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
-CONFIG_ECHO=y
-CONFIG_FEATURE_FANCY_ECHO=y
-CONFIG_ENV=y
-# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
-# CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
-CONFIG_EXPR=y
-CONFIG_EXPR_MATH_SUPPORT_64=y
-CONFIG_FALSE=y
-CONFIG_FOLD=y
-# CONFIG_FSYNC is not set
-CONFIG_HEAD=y
-CONFIG_FEATURE_FANCY_HEAD=y
-CONFIG_HOSTID=y
-CONFIG_ID=y
-CONFIG_INSTALL=y
-CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
-CONFIG_LENGTH=y
-CONFIG_LN=y
-CONFIG_LOGNAME=y
-CONFIG_LS=y
-CONFIG_FEATURE_LS_FILETYPES=y
-CONFIG_FEATURE_LS_FOLLOWLINKS=y
-CONFIG_FEATURE_LS_RECURSIVE=y
-CONFIG_FEATURE_LS_SORTFILES=y
-CONFIG_FEATURE_LS_TIMESTAMPS=y
-CONFIG_FEATURE_LS_USERNAME=y
-CONFIG_FEATURE_LS_COLOR=y
-CONFIG_FEATURE_LS_COLOR_IS_DEFAULT=y
-CONFIG_MD5SUM=y
-CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
-CONFIG_MKFIFO=y
-CONFIG_MKNOD=y
-CONFIG_MV=y
-CONFIG_FEATURE_MV_LONG_OPTIONS=y
-CONFIG_NICE=y
-CONFIG_NOHUP=y
-CONFIG_OD=y
-CONFIG_PRINTENV=y
-CONFIG_PRINTF=y
-CONFIG_PWD=y
-CONFIG_READLINK=y
-CONFIG_FEATURE_READLINK_FOLLOW=y
-CONFIG_REALPATH=y
-CONFIG_RM=y
-CONFIG_RMDIR=y
-# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
-CONFIG_SEQ=y
-CONFIG_SHA1SUM=y
-CONFIG_SHA256SUM=y
-CONFIG_SHA512SUM=y
-CONFIG_SLEEP=y
-# CONFIG_FEATURE_FANCY_SLEEP is not set
-# CONFIG_FEATURE_FLOAT_SLEEP is not set
-CONFIG_SORT=y
-CONFIG_FEATURE_SORT_BIG=y
-# CONFIG_SPLIT is not set
-# CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
-CONFIG_STTY=y
-# CONFIG_SUM is not set
-CONFIG_SYNC=y
-# CONFIG_TAC is not set
-CONFIG_TAIL=y
-CONFIG_FEATURE_FANCY_TAIL=y
-CONFIG_TEE=y
-CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
-CONFIG_TEST=y
-CONFIG_FEATURE_TEST_64=y
-CONFIG_TOUCH=y
-CONFIG_TR=y
-CONFIG_FEATURE_TR_CLASSES=y
-CONFIG_FEATURE_TR_EQUIV=y
-CONFIG_TRUE=y
-CONFIG_TTY=y
-CONFIG_UNAME=y
-# CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
-CONFIG_UNIQ=y
-CONFIG_USLEEP=y
-CONFIG_UUDECODE=y
-CONFIG_UUENCODE=y
-CONFIG_WC=y
-# CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
-CONFIG_WHOAMI=y
-CONFIG_YES=y
-
-#
-# Common options for cp and mv
-#
-CONFIG_FEATURE_PRESERVE_HARDLINKS=y
-
-#
-# Common options for ls, more and telnet
-#
-CONFIG_FEATURE_AUTOWIDTH=y
-
-#
-# Common options for df, du, ls
-#
-CONFIG_FEATURE_HUMAN_READABLE=y
-
-#
-# Common options for md5sum, sha1sum, sha256sum, sha512sum
-#
-CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
-
-#
-# Console Utilities
-#
-CONFIG_CHVT=y
-CONFIG_CLEAR=y
-CONFIG_DEALLOCVT=y
-CONFIG_DUMPKMAP=y
-# CONFIG_KBD_MODE is not set
-CONFIG_LOADFONT=y
-CONFIG_LOADKMAP=y
-CONFIG_OPENVT=y
-CONFIG_RESET=y
-CONFIG_RESIZE=y
-CONFIG_FEATURE_RESIZE_PRINT=y
-CONFIG_SETCONSOLE=y
-# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
-# CONFIG_SETFONT is not set
-# CONFIG_FEATURE_SETFONT_TEXTUAL_MAP is not set
-CONFIG_DEFAULT_SETFONT_DIR=""
-CONFIG_SETKEYCODES=y
-CONFIG_SETLOGCONS=y
-# CONFIG_SHOWKEY is not set
-
-#
-# Debian Utilities
-#
-CONFIG_MKTEMP=y
-CONFIG_PIPE_PROGRESS=y
-CONFIG_RUN_PARTS=y
-CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
-# CONFIG_FEATURE_RUN_PARTS_FANCY is not set
-CONFIG_START_STOP_DAEMON=y
-CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
-CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
-CONFIG_WHICH=y
-
-#
-# Editors
-#
-CONFIG_AWK=y
-# CONFIG_FEATURE_AWK_LIBM is not set
-CONFIG_CMP=y
-CONFIG_DIFF=y
-# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
-CONFIG_FEATURE_DIFF_DIR=y
-# CONFIG_ED is not set
-CONFIG_PATCH=y
-CONFIG_SED=y
-CONFIG_VI=y
-CONFIG_FEATURE_VI_MAX_LEN=4096
-CONFIG_FEATURE_VI_8BIT=y
-CONFIG_FEATURE_VI_COLON=y
-CONFIG_FEATURE_VI_YANKMARK=y
-CONFIG_FEATURE_VI_SEARCH=y
-CONFIG_FEATURE_VI_USE_SIGNALS=y
-CONFIG_FEATURE_VI_DOT_CMD=y
-CONFIG_FEATURE_VI_READONLY=y
-CONFIG_FEATURE_VI_SETOPTS=y
-CONFIG_FEATURE_VI_SET=y
-CONFIG_FEATURE_VI_WIN_RESIZE=y
-CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
-CONFIG_FEATURE_ALLOW_EXEC=y
-
-#
-# Finding Utilities
-#
-CONFIG_FIND=y
-CONFIG_FEATURE_FIND_PRINT0=y
-CONFIG_FEATURE_FIND_MTIME=y
-CONFIG_FEATURE_FIND_MMIN=y
-CONFIG_FEATURE_FIND_PERM=y
-CONFIG_FEATURE_FIND_TYPE=y
-CONFIG_FEATURE_FIND_XDEV=y
-CONFIG_FEATURE_FIND_MAXDEPTH=y
-CONFIG_FEATURE_FIND_NEWER=y
-# CONFIG_FEATURE_FIND_INUM is not set
-CONFIG_FEATURE_FIND_EXEC=y
-CONFIG_FEATURE_FIND_USER=y
-CONFIG_FEATURE_FIND_GROUP=y
-CONFIG_FEATURE_FIND_NOT=y
-CONFIG_FEATURE_FIND_DEPTH=y
-CONFIG_FEATURE_FIND_PAREN=y
-CONFIG_FEATURE_FIND_SIZE=y
-CONFIG_FEATURE_FIND_PRUNE=y
-# CONFIG_FEATURE_FIND_DELETE is not set
-CONFIG_FEATURE_FIND_PATH=y
-CONFIG_FEATURE_FIND_REGEX=y
-# CONFIG_FEATURE_FIND_CONTEXT is not set
-# CONFIG_FEATURE_FIND_LINKS is not set
-CONFIG_GREP=y
-CONFIG_FEATURE_GREP_EGREP_ALIAS=y
-CONFIG_FEATURE_GREP_FGREP_ALIAS=y
-CONFIG_FEATURE_GREP_CONTEXT=y
-CONFIG_XARGS=y
-# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
-CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
-CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
-CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
-
-#
-# Init Utilities
-#
-CONFIG_INIT=y
-CONFIG_FEATURE_USE_INITTAB=y
-CONFIG_FEATURE_KILL_REMOVED=y
-CONFIG_FEATURE_KILL_DELAY=0
-CONFIG_FEATURE_INIT_SCTTY=y
-CONFIG_FEATURE_INIT_SYSLOG=y
-CONFIG_FEATURE_EXTRA_QUIET=y
-# CONFIG_FEATURE_INIT_COREDUMPS is not set
-CONFIG_FEATURE_INITRD=y
-CONFIG_HALT=y
-# CONFIG_FEATURE_CALL_TELINIT is not set
-CONFIG_TELINIT_PATH=""
-CONFIG_MESG=y
-
-#
-# Login/Password Management Utilities
-#
-CONFIG_FEATURE_SHADOWPASSWDS=y
-# CONFIG_USE_BB_PWD_GRP is not set
-# CONFIG_USE_BB_SHADOW is not set
-CONFIG_USE_BB_CRYPT=y
-# CONFIG_USE_BB_CRYPT_SHA is not set
-CONFIG_ADDGROUP=y
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-CONFIG_DELGROUP=y
-# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-# CONFIG_FEATURE_CHECK_NAMES is not set
-CONFIG_ADDUSER=y
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
-CONFIG_FIRST_SYSTEM_ID=100
-CONFIG_LAST_SYSTEM_ID=999
-CONFIG_DELUSER=y
-CONFIG_GETTY=y
-CONFIG_FEATURE_UTMP=y
-CONFIG_FEATURE_WTMP=y
-CONFIG_LOGIN=y
-# CONFIG_PAM is not set
-# CONFIG_LOGIN_SCRIPTS is not set
-CONFIG_FEATURE_NOLOGIN=y
-CONFIG_FEATURE_SECURETTY=y
-CONFIG_PASSWD=y
-CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
-# CONFIG_CRYPTPW is not set
-# CONFIG_CHPASSWD is not set
-CONFIG_SU=y
-CONFIG_FEATURE_SU_SYSLOG=y
-CONFIG_FEATURE_SU_CHECKS_SHELLS=y
-CONFIG_SULOGIN=y
-CONFIG_VLOCK=y
-
-#
-# Linux Ext2 FS Progs
-#
-CONFIG_CHATTR=y
-CONFIG_FSCK=y
-CONFIG_LSATTR=y
-
-#
-# Linux Module Utilities
-#
-# CONFIG_MODPROBE_SMALL is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE is not set
-# CONFIG_FEATURE_MODPROBE_SMALL_CHECK_ALREADY_LOADED is not set
-CONFIG_INSMOD=y
-CONFIG_RMMOD=y
-CONFIG_LSMOD=y
-CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
-CONFIG_MODPROBE=y
-# CONFIG_FEATURE_MODPROBE_BLACKLIST is not set
-# CONFIG_DEPMOD is not set
-
-#
-# Options common to multiple modutils
-#
-# CONFIG_FEATURE_2_4_MODULES is not set
-# CONFIG_FEATURE_INSMOD_TRY_MMAP is not set
-# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
-# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
-# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
-# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
-CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
-CONFIG_FEATURE_MODUTILS_ALIAS=y
-CONFIG_FEATURE_MODUTILS_SYMBOLS=y
-CONFIG_DEFAULT_MODULES_DIR="/lib/modules"
-CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
-
-#
-# Linux System Utilities
-#
-# CONFIG_ACPID is not set
-# CONFIG_FEATURE_ACPID_COMPAT is not set
-# CONFIG_BLKID is not set
-CONFIG_DMESG=y
-CONFIG_FEATURE_DMESG_PRETTY=y
-# CONFIG_FBSET is not set
-# CONFIG_FEATURE_FBSET_FANCY is not set
-# CONFIG_FEATURE_FBSET_READMODE is not set
-CONFIG_FDFLUSH=y
-CONFIG_FDFORMAT=y
-# CONFIG_FDISK is not set
-# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
-# CONFIG_FEATURE_FDISK_WRITABLE is not set
-# CONFIG_FEATURE_AIX_LABEL is not set
-# CONFIG_FEATURE_SGI_LABEL is not set
-# CONFIG_FEATURE_SUN_LABEL is not set
-# CONFIG_FEATURE_OSF_LABEL is not set
-# CONFIG_FEATURE_FDISK_ADVANCED is not set
-# CONFIG_FINDFS is not set
-CONFIG_FREERAMDISK=y
-# CONFIG_FSCK_MINIX is not set
-# CONFIG_MKFS_EXT2 is not set
-# CONFIG_MKFS_MINIX is not set
-# CONFIG_FEATURE_MINIX2 is not set
-# CONFIG_MKFS_REISER is not set
-# CONFIG_MKFS_VFAT is not set
-CONFIG_GETOPT=y
-CONFIG_FEATURE_GETOPT_LONG=y
-CONFIG_HEXDUMP=y
-# CONFIG_FEATURE_HEXDUMP_REVERSE is not set
-# CONFIG_HD is not set
-CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
-CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
-CONFIG_IPCRM=y
-CONFIG_IPCS=y
-CONFIG_LOSETUP=y
-CONFIG_LSPCI=y
-CONFIG_LSUSB=y
-CONFIG_MDEV=y
-CONFIG_FEATURE_MDEV_CONF=y
-CONFIG_FEATURE_MDEV_RENAME=y
-# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
-CONFIG_FEATURE_MDEV_EXEC=y
-# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
-CONFIG_MKSWAP=y
-# CONFIG_FEATURE_MKSWAP_UUID is not set
-CONFIG_MORE=y
-CONFIG_FEATURE_USE_TERMIOS=y
-# CONFIG_VOLUMEID is not set
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
-# CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
-# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
-CONFIG_MOUNT=y
-# CONFIG_FEATURE_MOUNT_FAKE is not set
-# CONFIG_FEATURE_MOUNT_VERBOSE is not set
-# CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
-# CONFIG_FEATURE_MOUNT_NFS is not set
-CONFIG_FEATURE_MOUNT_CIFS=y
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
-CONFIG_PIVOT_ROOT=y
-CONFIG_RDATE=y
-# CONFIG_RDEV is not set
-CONFIG_READPROFILE=y
-# CONFIG_RTCWAKE is not set
-# CONFIG_SCRIPT is not set
-# CONFIG_SCRIPTREPLAY is not set
-CONFIG_SETARCH=y
-CONFIG_SWAPONOFF=y
-# CONFIG_FEATURE_SWAPON_PRI is not set
-CONFIG_SWITCH_ROOT=y
-CONFIG_UMOUNT=y
-CONFIG_FEATURE_UMOUNT_ALL=y
-
-#
-# Common options for mount/umount
-#
-CONFIG_FEATURE_MOUNT_LOOP=y
-# CONFIG_FEATURE_MTAB_SUPPORT is not set
-
-#
-# Miscellaneous Utilities
-#
-# CONFIG_ADJTIMEX is not set
-# CONFIG_BBCONFIG is not set
-# CONFIG_BEEP is not set
-CONFIG_FEATURE_BEEP_FREQ=0
-CONFIG_FEATURE_BEEP_LENGTH_MS=0
-# CONFIG_CHAT is not set
-# CONFIG_FEATURE_CHAT_NOFAIL is not set
-# CONFIG_FEATURE_CHAT_TTY_HIFI is not set
-# CONFIG_FEATURE_CHAT_IMPLICIT_CR is not set
-# CONFIG_FEATURE_CHAT_SWALLOW_OPTS is not set
-# CONFIG_FEATURE_CHAT_SEND_ESCAPES is not set
-# CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
-# CONFIG_FEATURE_CHAT_CLR_ABORT is not set
-CONFIG_CHRT=y
-CONFIG_CROND=y
-# CONFIG_FEATURE_CROND_D is not set
-# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
-CONFIG_CRONTAB=y
-CONFIG_DC=y
-# CONFIG_FEATURE_DC_LIBM is not set
-# CONFIG_DEVFSD is not set
-# CONFIG_DEVFSD_MODLOAD is not set
-# CONFIG_DEVFSD_FG_NP is not set
-# CONFIG_DEVFSD_VERBOSE is not set
-# CONFIG_FEATURE_DEVFS is not set
-CONFIG_DEVMEM=y
-CONFIG_EJECT=y
-# CONFIG_FEATURE_EJECT_SCSI is not set
-# CONFIG_FBSPLASH is not set
-# CONFIG_FLASHCP is not set
-# CONFIG_FLASH_LOCK is not set
-# CONFIG_FLASH_UNLOCK is not set
-# CONFIG_FLASH_ERASEALL is not set
-# CONFIG_IONICE is not set
-# CONFIG_INOTIFYD is not set
-CONFIG_LAST=y
-CONFIG_FEATURE_LAST_SMALL=y
-# CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
-# CONFIG_FEATURE_LESS_MARKS is not set
-CONFIG_FEATURE_LESS_REGEXP=y
-# CONFIG_FEATURE_LESS_WINCH is not set
-# CONFIG_FEATURE_LESS_DASHCMD is not set
-# CONFIG_FEATURE_LESS_LINENUMS is not set
-CONFIG_HDPARM=y
-CONFIG_FEATURE_HDPARM_GET_IDENTITY=y
-# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
-# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
-# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
-CONFIG_MAKEDEVS=y
-# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
-CONFIG_FEATURE_MAKEDEVS_TABLE=y
-# CONFIG_MAN is not set
-# CONFIG_MICROCOM is not set
-CONFIG_MOUNTPOINT=y
-CONFIG_MT=y
-# CONFIG_RAIDAUTORUN is not set
-# CONFIG_READAHEAD is not set
-CONFIG_RUNLEVEL=y
-# CONFIG_RX is not set
-CONFIG_SETSID=y
-CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
-CONFIG_TIME=y
-# CONFIG_TIMEOUT is not set
-# CONFIG_TTYSIZE is not set
-# CONFIG_VOLNAME is not set
-# CONFIG_WALL is not set
-CONFIG_WATCHDOG=y
-
-#
-# Networking Utilities
-#
-# CONFIG_FEATURE_IPV6 is not set
-# CONFIG_FEATURE_UNIX_LOCAL is not set
-# CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
-# CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
-CONFIG_ARPING=y
-# CONFIG_BRCTL is not set
-# CONFIG_FEATURE_BRCTL_FANCY is not set
-# CONFIG_FEATURE_BRCTL_SHOW is not set
-CONFIG_DNSD=y
-CONFIG_ETHER_WAKE=y
-# CONFIG_FAKEIDENTD is not set
-# CONFIG_FTPD is not set
-# CONFIG_FEATURE_FTP_WRITE is not set
-# CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
-# CONFIG_FTPGET is not set
-# CONFIG_FTPPUT is not set
-# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
-CONFIG_HOSTNAME=y
-# CONFIG_HTTPD is not set
-# CONFIG_FEATURE_HTTPD_RANGES is not set
-# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
-# CONFIG_FEATURE_HTTPD_SETUID is not set
-# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
-# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
-# CONFIG_FEATURE_HTTPD_CGI is not set
-# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
-# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
-# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
-# CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
-# CONFIG_FEATURE_HTTPD_PROXY is not set
-CONFIG_IFCONFIG=y
-CONFIG_FEATURE_IFCONFIG_STATUS=y
-CONFIG_FEATURE_IFCONFIG_SLIP=y
-CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ=y
-CONFIG_FEATURE_IFCONFIG_HW=y
-# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
-# CONFIG_IFENSLAVE is not set
-# CONFIG_IFPLUGD is not set
-CONFIG_IFUPDOWN=y
-CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
-CONFIG_FEATURE_IFUPDOWN_IP=y
-# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
-# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
-CONFIG_FEATURE_IFUPDOWN_IPV4=y
-# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
-CONFIG_FEATURE_IFUPDOWN_MAPPING=y
-# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-CONFIG_INETD=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
-# CONFIG_FEATURE_INETD_RPC is not set
-CONFIG_IP=y
-CONFIG_FEATURE_IP_ADDRESS=y
-CONFIG_FEATURE_IP_LINK=y
-CONFIG_FEATURE_IP_ROUTE=y
-CONFIG_FEATURE_IP_TUNNEL=y
-CONFIG_FEATURE_IP_RULE=y
-CONFIG_FEATURE_IP_SHORT_FORMS=y
-# CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
-CONFIG_IPADDR=y
-CONFIG_IPLINK=y
-CONFIG_IPROUTE=y
-CONFIG_IPTUNNEL=y
-CONFIG_IPRULE=y
-# CONFIG_IPCALC is not set
-# CONFIG_FEATURE_IPCALC_FANCY is not set
-# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
-CONFIG_NAMEIF=y
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
-# CONFIG_NC is not set
-# CONFIG_NC_SERVER is not set
-# CONFIG_NC_EXTRA is not set
-CONFIG_NETSTAT=y
-# CONFIG_FEATURE_NETSTAT_WIDE is not set
-# CONFIG_FEATURE_NETSTAT_PRG is not set
-CONFIG_NSLOOKUP=y
-# CONFIG_NTPD is not set
-# CONFIG_FEATURE_NTPD_SERVER is not set
-CONFIG_PING=y
-# CONFIG_PING6 is not set
-CONFIG_FEATURE_FANCY_PING=y
-# CONFIG_PSCAN is not set
-CONFIG_ROUTE=y
-# CONFIG_SLATTACH is not set
-CONFIG_TELNET=y
-CONFIG_FEATURE_TELNET_TTYPE=y
-CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-# CONFIG_TELNETD is not set
-# CONFIG_FEATURE_TELNETD_STANDALONE is not set
-# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
-CONFIG_TFTP=y
-# CONFIG_TFTPD is not set
-CONFIG_FEATURE_TFTP_GET=y
-CONFIG_FEATURE_TFTP_PUT=y
-CONFIG_FEATURE_TFTP_BLOCKSIZE=y
-# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
-# CONFIG_TFTP_DEBUG is not set
-CONFIG_TRACEROUTE=y
-# CONFIG_TRACEROUTE6 is not set
-# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
-# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
-# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
-# CONFIG_UDHCPD is not set
-# CONFIG_DHCPRELAY is not set
-# CONFIG_DUMPLEASES is not set
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
-CONFIG_DHCPD_LEASES_FILE=""
-CONFIG_UDHCPC=y
-CONFIG_FEATURE_UDHCPC_ARPING=y
-# CONFIG_FEATURE_UDHCP_PORT is not set
-CONFIG_UDHCP_DEBUG=0
-# CONFIG_FEATURE_UDHCP_RFC3397 is not set
-CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
-CONFIG_VCONFIG=y
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-# CONFIG_ZCIP is not set
-# CONFIG_TCPSVD is not set
-# CONFIG_TUNCTL is not set
-# CONFIG_FEATURE_TUNCTL_UG is not set
-# CONFIG_UDPSVD is not set
-
-#
-# Print Utilities
-#
-# CONFIG_LPD is not set
-# CONFIG_LPR is not set
-# CONFIG_LPQ is not set
-
-#
-# Mail Utilities
-#
-# CONFIG_MAKEMIME is not set
-CONFIG_FEATURE_MIME_CHARSET=""
-# CONFIG_POPMAILDIR is not set
-# CONFIG_FEATURE_POPMAILDIR_DELIVERY is not set
-# CONFIG_REFORMIME is not set
-# CONFIG_FEATURE_REFORMIME_COMPAT is not set
-# CONFIG_SENDMAIL is not set
-
-#
-# Process Utilities
-#
-CONFIG_FREE=y
-CONFIG_FUSER=y
-CONFIG_KILL=y
-CONFIG_KILLALL=y
-CONFIG_KILLALL5=y
-# CONFIG_NMETER is not set
-# CONFIG_PGREP is not set
-CONFIG_PIDOF=y
-CONFIG_FEATURE_PIDOF_SINGLE=y
-CONFIG_FEATURE_PIDOF_OMIT=y
-# CONFIG_PKILL is not set
-CONFIG_PS=y
-CONFIG_FEATURE_PS_WIDE=y
-# CONFIG_FEATURE_PS_TIME is not set
-# CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
-# CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
-CONFIG_RENICE=y
-CONFIG_BB_SYSCTL=y
-CONFIG_TOP=y
-CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE=y
-CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
-# CONFIG_FEATURE_TOP_SMP_CPU is not set
-# CONFIG_FEATURE_TOP_DECIMALS is not set
-# CONFIG_FEATURE_TOP_SMP_PROCESS is not set
-# CONFIG_FEATURE_TOPMEM is not set
-# CONFIG_FEATURE_SHOW_THREADS is not set
-CONFIG_UPTIME=y
-CONFIG_WATCH=y
-
-#
-# Runit Utilities
-#
-# CONFIG_RUNSV is not set
-# CONFIG_RUNSVDIR is not set
-# CONFIG_FEATURE_RUNSVDIR_LOG is not set
-# CONFIG_SV is not set
-CONFIG_SV_DEFAULT_SERVICE_DIR=""
-# CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
-# CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
-# CONFIG_GETENFORCE is not set
-# CONFIG_GETSEBOOL is not set
-# CONFIG_LOAD_POLICY is not set
-# CONFIG_MATCHPATHCON is not set
-# CONFIG_RESTORECON is not set
-# CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
-# CONFIG_SELINUXENABLED is not set
-# CONFIG_SETENFORCE is not set
-# CONFIG_SETFILES is not set
-# CONFIG_FEATURE_SETFILES_CHECK_OPTION is not set
-# CONFIG_SETSEBOOL is not set
-# CONFIG_SESTATUS is not set
-
-#
-# Shells
-#
-CONFIG_FEATURE_SH_IS_ASH=y
-# CONFIG_FEATURE_SH_IS_HUSH is not set
-# CONFIG_FEATURE_SH_IS_NONE is not set
-CONFIG_ASH=y
-CONFIG_ASH_BASH_COMPAT=y
-CONFIG_ASH_JOB_CONTROL=y
-CONFIG_ASH_ALIAS=y
-# CONFIG_ASH_GETOPTS is not set
-CONFIG_ASH_BUILTIN_ECHO=y
-CONFIG_ASH_BUILTIN_PRINTF=y
-CONFIG_ASH_BUILTIN_TEST=y
-CONFIG_ASH_CMDCMD=y
-# CONFIG_ASH_MAIL is not set
-CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
-CONFIG_ASH_RANDOM_SUPPORT=y
-CONFIG_ASH_EXPAND_PRMT=y
-# CONFIG_HUSH is not set
-# CONFIG_HUSH_BASH_COMPAT is not set
-# CONFIG_HUSH_HELP is not set
-# CONFIG_HUSH_INTERACTIVE is not set
-# CONFIG_HUSH_JOB is not set
-# CONFIG_HUSH_TICK is not set
-# CONFIG_HUSH_IF is not set
-# CONFIG_HUSH_LOOPS is not set
-# CONFIG_HUSH_CASE is not set
-# CONFIG_HUSH_FUNCTIONS is not set
-# CONFIG_HUSH_LOCAL is not set
-# CONFIG_HUSH_EXPORT_N is not set
-# CONFIG_HUSH_RANDOM_SUPPORT is not set
-# CONFIG_LASH is not set
-# CONFIG_MSH is not set
-CONFIG_SH_MATH_SUPPORT=y
-# CONFIG_SH_MATH_SUPPORT_64 is not set
-CONFIG_FEATURE_SH_EXTRA_QUIET=y
-# CONFIG_FEATURE_SH_STANDALONE is not set
-# CONFIG_FEATURE_SH_NOFORK is not set
-# CONFIG_CTTYHACK is not set
-
-#
-# System Logging Utilities
-#
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
-# CONFIG_FEATURE_SYSLOGD_DUP is not set
-# CONFIG_FEATURE_IPC_SYSLOG is not set
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
-# CONFIG_LOGREAD is not set
-# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
-CONFIG_KLOGD=y
-CONFIG_LOGGER=y
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch
new file mode 100644
index 0000000..ed52159
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-getty.patch
@@ -0,0 +1,17 @@
+--- busybox-1.20.0/loginutils/getty.c
++++ busybox-1.20.0-getty/loginutils/getty.c
+@@ -561,8 +561,14 @@ int getty_main(int argc UNUSED_PARAM, ch
+ 		 */
+ 		fd = open("/dev/tty", O_RDWR | O_NONBLOCK);
+ 		if (fd >= 0) {
++			/* TIOCNOTTY sends SIGHUP to the foreground
++			 * process group - which may include us!
++			 * Make sure to not die on it:
++			 */
++			sighandler_t old = signal(SIGHUP, SIG_IGN);
+ 			ioctl(fd, TIOCNOTTY);
+ 			close(fd);
++			signal(SIGHUP, old);
+ 		}
+ 	}
+ 
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch
new file mode 100644
index 0000000..ee236ff
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-lineedit.patch
@@ -0,0 +1,22 @@
+--- busybox-1.20.0/libbb/lineedit.c
++++ busybox-1.20.0-lineedit/libbb/lineedit.c
+@@ -1352,8 +1352,7 @@ static void load_history(line_input_t *s
+ 		/* fill temp_h[], retaining only last MAX_HISTORY lines */
+ 		memset(temp_h, 0, sizeof(temp_h));
+ 		idx = 0;
+-		if (!ENABLE_FEATURE_EDITING_SAVE_ON_EXIT)
+-			st_parm->cnt_history_in_file = 0;
++		st_parm->cnt_history_in_file = 0;
+ 		while ((line = xmalloc_fgetline(fp)) != NULL) {
+ 			if (line[0] == '\0') {
+ 				free(line);
+@@ -1361,8 +1360,7 @@ static void load_history(line_input_t *s
+ 			}
+ 			free(temp_h[idx]);
+ 			temp_h[idx] = line;
+-			if (!ENABLE_FEATURE_EDITING_SAVE_ON_EXIT)
+-				st_parm->cnt_history_in_file++;
++			st_parm->cnt_history_in_file++;
+ 			idx++;
+ 			if (idx == st_parm->max_history)
+ 				idx = 0;
diff --git a/package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch b/package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch
new file mode 100644
index 0000000..70dc63f
--- /dev/null
+++ b/package/busybox/busybox-1.20.0/busybox-1.20.0-sed.patch
@@ -0,0 +1,29 @@
+--- busybox-1.20.0/editors/sed.c
++++ busybox-1.20.0-sed/editors/sed.c
+@@ -743,7 +743,7 @@ static int do_subst_command(sed_cmd_t *s
+ 		 */
+ 		if (!G.regmatch[0].rm_so && !G.regmatch[0].rm_eo && match_count) {
+ 			pipe_putc(*line++);
+-			continue;
++			goto next;
+ 		}
+ 
+ 		match_count++;
+@@ -755,7 +755,7 @@ static int do_subst_command(sed_cmd_t *s
+ 		) {
+ 			for (i = 0; i < G.regmatch[0].rm_eo; i++)
+ 				pipe_putc(*line++);
+-			continue;
++			goto next;
+ 		}
+ 
+ 		/* print everything before the match */
+@@ -773,7 +773,7 @@ static int do_subst_command(sed_cmd_t *s
+ 		/* if we're not doing this globally, get out now */
+ 		if (sed_cmd->which_match != 0)
+ 			break;
+-
++ next:
+ 		if (*line == '\0')
+ 			break;
+ 
diff --git a/package/busybox/busybox-1.17.x.config b/package/busybox/busybox-1.20.x.config
similarity index 92%
rename from package/busybox/busybox-1.17.x.config
rename to package/busybox/busybox-1.20.x.config
index edf9c6d..5525434 100644
--- a/package/busybox/busybox-1.17.x.config
+++ b/package/busybox/busybox-1.20.x.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.17.0
-# Tue Jul  6 10:53:37 2010
+# Busybox version: 1.20.0
+# Sun Apr 22 10:09:56 2012
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -16,6 +16,7 @@ CONFIG_DESKTOP=y
 # CONFIG_EXTRA_COMPAT is not set
 CONFIG_INCLUDE_SUSv2=y
 # CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_PLATFORM_LINUX=y
 CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 # CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
 # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
@@ -23,6 +24,7 @@ CONFIG_SHOW_USAGE=y
 CONFIG_FEATURE_VERBOSE_USAGE=y
 # CONFIG_FEATURE_COMPRESS_USAGE is not set
 CONFIG_FEATURE_INSTALLER=y
+# CONFIG_INSTALL_NO_USR is not set
 # CONFIG_LOCALE_SUPPORT is not set
 # CONFIG_UNICODE_SUPPORT is not set
 # CONFIG_UNICODE_USING_LOCALE is not set
@@ -60,7 +62,10 @@ CONFIG_FEATURE_SYSLOG=y
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
 # CONFIG_LFS is not set
 CONFIG_CROSS_COMPILER_PREFIX=""
+CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
+CONFIG_EXTRA_LDFLAGS=""
+CONFIG_EXTRA_LDLIBS=""
 
 #
 # Debugging Options
@@ -73,9 +78,8 @@ CONFIG_NO_DEBUG_LIB=y
 # CONFIG_EFENCE is not set
 
 #
-# Installation Options
+# Installation Options ("make install" behavior)
 #
-# CONFIG_INSTALL_NO_USR is not set
 CONFIG_INSTALL_APPLET_SYMLINKS=y
 # CONFIG_INSTALL_APPLET_HARDLINKS is not set
 # CONFIG_INSTALL_APPLET_SCRIPT_WRAPPERS is not set
@@ -88,15 +92,20 @@ CONFIG_PREFIX="./_install"
 #
 # Busybox Library Tuning
 #
+# CONFIG_FEATURE_SYSTEMD is not set
+CONFIG_FEATURE_RTMINMAX=y
 CONFIG_PASSWORD_MINLEN=6
-CONFIG_MD5_SIZE_VS_SPEED=2
+CONFIG_MD5_SMALL=1
 # CONFIG_FEATURE_FAST_TOP is not set
 # CONFIG_FEATURE_ETC_NETWORKS is not set
+CONFIG_FEATURE_USE_TERMIOS=y
 CONFIG_FEATURE_EDITING=y
 CONFIG_FEATURE_EDITING_MAX_LEN=1024
 CONFIG_FEATURE_EDITING_VI=y
 CONFIG_FEATURE_EDITING_HISTORY=999
 CONFIG_FEATURE_EDITING_SAVEHISTORY=y
+# CONFIG_FEATURE_EDITING_SAVE_ON_EXIT is not set
+CONFIG_FEATURE_REVERSE_SEARCH=y
 CONFIG_FEATURE_TAB_COMPLETION=y
 # CONFIG_FEATURE_USERNAME_COMPLETION is not set
 CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
@@ -104,6 +113,7 @@ CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
 CONFIG_FEATURE_NON_POSIX_CP=y
 # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
 CONFIG_FEATURE_COPYBUF_KB=4
+CONFIG_FEATURE_SKIP_ROOTFS=y
 CONFIG_MONOTONIC_SYSCALL=y
 CONFIG_IOCTL_HEX2STR_ERROR=y
 CONFIG_FEATURE_HWIB=y
@@ -134,6 +144,7 @@ CONFIG_CPIO=y
 CONFIG_GUNZIP=y
 CONFIG_GZIP=y
 # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
+CONFIG_GZIP_FAST=0
 # CONFIG_LZOP is not set
 # CONFIG_LZOP_COMPR_HIGH is not set
 # CONFIG_RPM2CPIO is not set
@@ -167,11 +178,19 @@ CONFIG_DATE=y
 CONFIG_FEATURE_DATE_ISOFMT=y
 # CONFIG_FEATURE_DATE_NANO is not set
 CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_HOSTID=y
+CONFIG_ID=y
+# CONFIG_GROUPS is not set
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
+CONFIG_TOUCH=y
+CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
 CONFIG_FEATURE_TR_EQUIV=y
+# CONFIG_BASE64 is not set
+CONFIG_WHO=y
+# CONFIG_USERS is not set
 # CONFIG_CAL is not set
 CONFIG_CATV=y
 CONFIG_CHGRP=y
@@ -208,11 +227,8 @@ CONFIG_FOLD=y
 # CONFIG_FSYNC is not set
 CONFIG_HEAD=y
 CONFIG_FEATURE_FANCY_HEAD=y
-CONFIG_HOSTID=y
-CONFIG_ID=y
 CONFIG_INSTALL=y
 CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
-CONFIG_LENGTH=y
 CONFIG_LN=y
 CONFIG_LOGNAME=y
 CONFIG_LS=y
@@ -264,7 +280,6 @@ CONFIG_TAIL=y
 CONFIG_FEATURE_FANCY_TAIL=y
 CONFIG_TEE=y
 CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
-CONFIG_TOUCH=y
 CONFIG_TRUE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
@@ -276,7 +291,6 @@ CONFIG_UUDECODE=y
 CONFIG_UUENCODE=y
 CONFIG_WC=y
 # CONFIG_FEATURE_WC_LARGE is not set
-CONFIG_WHO=y
 CONFIG_WHOAMI=y
 CONFIG_YES=y
 
@@ -346,21 +360,14 @@ CONFIG_WHICH=y
 #
 # Editors
 #
-CONFIG_AWK=y
-# CONFIG_FEATURE_AWK_LIBM is not set
-CONFIG_CMP=y
-CONFIG_DIFF=y
-# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
-CONFIG_FEATURE_DIFF_DIR=y
-# CONFIG_ED is not set
 CONFIG_PATCH=y
-CONFIG_SED=y
 CONFIG_VI=y
 CONFIG_FEATURE_VI_MAX_LEN=4096
 CONFIG_FEATURE_VI_8BIT=y
 CONFIG_FEATURE_VI_COLON=y
 CONFIG_FEATURE_VI_YANKMARK=y
 CONFIG_FEATURE_VI_SEARCH=y
+# CONFIG_FEATURE_VI_REGEX_SEARCH is not set
 CONFIG_FEATURE_VI_USE_SIGNALS=y
 CONFIG_FEATURE_VI_DOT_CMD=y
 CONFIG_FEATURE_VI_READONLY=y
@@ -369,6 +376,14 @@ CONFIG_FEATURE_VI_SET=y
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 CONFIG_FEATURE_VI_ASK_TERMINAL=y
 CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_AWK=y
+# CONFIG_FEATURE_AWK_LIBM is not set
+CONFIG_CMP=y
+CONFIG_DIFF=y
+# CONFIG_FEATURE_DIFF_LONG_OPTIONS is not set
+CONFIG_FEATURE_DIFF_DIR=y
+# CONFIG_ED is not set
+CONFIG_SED=y
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
@@ -413,6 +428,9 @@ CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
 # CONFIG_BOOTCHARTD is not set
 # CONFIG_FEATURE_BOOTCHARTD_BLOATED_HEADER is not set
 # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
+CONFIG_HALT=y
+# CONFIG_FEATURE_CALL_TELINIT is not set
+CONFIG_TELINIT_PATH=""
 CONFIG_INIT=y
 CONFIG_FEATURE_USE_INITTAB=y
 CONFIG_FEATURE_KILL_REMOVED=y
@@ -422,32 +440,34 @@ CONFIG_FEATURE_INIT_SYSLOG=y
 CONFIG_FEATURE_EXTRA_QUIET=y
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
 CONFIG_FEATURE_INITRD=y
-CONFIG_HALT=y
-# CONFIG_FEATURE_CALL_TELINIT is not set
-CONFIG_TELINIT_PATH=""
+CONFIG_INIT_TERMINAL_TYPE="linux"
 CONFIG_MESG=y
+CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP=y
 
 #
 # Login/Password Management Utilities
 #
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
 CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
-CONFIG_ADDGROUP=y
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-CONFIG_DELGROUP=y
-# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
-# CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_ADDUSER=y
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
+# CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
+CONFIG_ADDGROUP=y
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
 CONFIG_DELUSER=y
+CONFIG_DELGROUP=y
+# CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
 CONFIG_GETTY=y
 CONFIG_LOGIN=y
+# CONFIG_LOGIN_SESSION_AS_CHILD is not set
 # CONFIG_PAM is not set
 # CONFIG_LOGIN_SCRIPTS is not set
 CONFIG_FEATURE_NOLOGIN=y
@@ -456,6 +476,7 @@ CONFIG_PASSWD=y
 CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
 # CONFIG_CRYPTPW is not set
 # CONFIG_CHPASSWD is not set
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
 CONFIG_SU=y
 CONFIG_FEATURE_SU_SYSLOG=y
 CONFIG_FEATURE_SU_CHECKS_SHELLS=y
@@ -504,10 +525,18 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 #
 # Linux System Utilities
 #
+# CONFIG_BLOCKDEV is not set
+CONFIG_MDEV=y
+CONFIG_FEATURE_MDEV_CONF=y
+CONFIG_FEATURE_MDEV_RENAME=y
+# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
+CONFIG_FEATURE_MDEV_EXEC=y
+# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
 # CONFIG_REV is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
-# CONFIG_BLKID is not set
+CONFIG_BLKID=y
+# CONFIG_FEATURE_BLKID_TYPE is not set
 CONFIG_DMESG=y
 CONFIG_FEATURE_DMESG_PRETTY=y
 # CONFIG_FBSET is not set
@@ -522,6 +551,7 @@ CONFIG_FDFORMAT=y
 # CONFIG_FEATURE_SGI_LABEL is not set
 # CONFIG_FEATURE_SUN_LABEL is not set
 # CONFIG_FEATURE_OSF_LABEL is not set
+# CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
 # CONFIG_FLOCK is not set
@@ -545,34 +575,9 @@ CONFIG_IPCS=y
 CONFIG_LOSETUP=y
 CONFIG_LSPCI=y
 CONFIG_LSUSB=y
-CONFIG_MDEV=y
-CONFIG_FEATURE_MDEV_CONF=y
-CONFIG_FEATURE_MDEV_RENAME=y
-# CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
-CONFIG_FEATURE_MDEV_EXEC=y
-# CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
 CONFIG_MKSWAP=y
 # CONFIG_FEATURE_MKSWAP_UUID is not set
 CONFIG_MORE=y
-CONFIG_FEATURE_USE_TERMIOS=y
-# CONFIG_VOLUMEID is not set
-# CONFIG_FEATURE_VOLUMEID_EXT is not set
-# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
-# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
-# CONFIG_FEATURE_VOLUMEID_FAT is not set
-# CONFIG_FEATURE_VOLUMEID_HFS is not set
-# CONFIG_FEATURE_VOLUMEID_JFS is not set
-# CONFIG_FEATURE_VOLUMEID_XFS is not set
-# CONFIG_FEATURE_VOLUMEID_NTFS is not set
-# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
-# CONFIG_FEATURE_VOLUMEID_UDF is not set
-# CONFIG_FEATURE_VOLUMEID_LUKS is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
-# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
-# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
-# CONFIG_FEATURE_VOLUMEID_SYSV is not set
-# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
-# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_FAKE is not set
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
@@ -602,15 +607,55 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
+CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
+# CONFIG_FEATURE_VOLUMEID_EXT is not set
+# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
+# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
+# CONFIG_FEATURE_VOLUMEID_FAT is not set
+# CONFIG_FEATURE_VOLUMEID_HFS is not set
+# CONFIG_FEATURE_VOLUMEID_JFS is not set
+# CONFIG_FEATURE_VOLUMEID_XFS is not set
+# CONFIG_FEATURE_VOLUMEID_NTFS is not set
+# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
+# CONFIG_FEATURE_VOLUMEID_UDF is not set
+# CONFIG_FEATURE_VOLUMEID_LUKS is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
+# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
+# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
+# CONFIG_FEATURE_VOLUMEID_SYSV is not set
+# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
+# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 
 #
 # Miscellaneous Utilities
 #
 # CONFIG_CONSPY is not set
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
+CONFIG_SETSERIAL=y
 # CONFIG_UBIATTACH is not set
 # CONFIG_UBIDETACH is not set
+# CONFIG_UBIMKVOL is not set
+# CONFIG_UBIRMVOL is not set
+# CONFIG_UBIRSVOL is not set
+# CONFIG_UBIUPDATEVOL is not set
 # CONFIG_ADJTIMEX is not set
 # CONFIG_BBCONFIG is not set
+# CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
 # CONFIG_BEEP is not set
 CONFIG_FEATURE_BEEP_FREQ=0
 CONFIG_FEATURE_BEEP_LENGTH_MS=0
@@ -648,15 +693,6 @@ CONFIG_EJECT=y
 CONFIG_LAST=y
 CONFIG_FEATURE_LAST_SMALL=y
 # CONFIG_FEATURE_LAST_FANCY is not set
-CONFIG_LESS=y
-CONFIG_FEATURE_LESS_MAXLINES=9999999
-CONFIG_FEATURE_LESS_BRACKETS=y
-CONFIG_FEATURE_LESS_FLAGS=y
-# CONFIG_FEATURE_LESS_MARKS is not set
-CONFIG_FEATURE_LESS_REGEXP=y
-# CONFIG_FEATURE_LESS_WINCH is not set
-# CONFIG_FEATURE_LESS_DASHCMD is not set
-# CONFIG_FEATURE_LESS_LINENUMS is not set
 CONFIG_HDPARM=y
 CONFIG_FEATURE_HDPARM_GET_IDENTITY=y
 # CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
@@ -690,10 +726,17 @@ CONFIG_WATCHDOG=y
 #
 # Networking Utilities
 #
+CONFIG_NAMEIF=y
+# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
+# CONFIG_NBDCLIENT is not set
 # CONFIG_NC is not set
 # CONFIG_NC_SERVER is not set
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
+CONFIG_PING=y
+# CONFIG_PING6 is not set
+CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_WHOIS is not set
 # CONFIG_FEATURE_IPV6 is not set
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 # CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
@@ -725,6 +768,7 @@ CONFIG_HOSTNAME=y
 # CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
 # CONFIG_FEATURE_HTTPD_ERROR_PAGES is not set
 # CONFIG_FEATURE_HTTPD_PROXY is not set
+# CONFIG_FEATURE_HTTPD_GZIP is not set
 CONFIG_IFCONFIG=y
 CONFIG_FEATURE_IFCONFIG_STATUS=y
 CONFIG_FEATURE_IFCONFIG_SLIP=y
@@ -765,17 +809,12 @@ CONFIG_IPRULE=y
 # CONFIG_IPCALC is not set
 # CONFIG_FEATURE_IPCALC_FANCY is not set
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
-CONFIG_NAMEIF=y
-# CONFIG_FEATURE_NAMEIF_EXTENDED is not set
 CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
 CONFIG_NSLOOKUP=y
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
-CONFIG_PING=y
-# CONFIG_PING6 is not set
-CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
@@ -804,16 +843,19 @@ CONFIG_TRACEROUTE=y
 # CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
 # CONFIG_TUNCTL is not set
 # CONFIG_FEATURE_TUNCTL_UG is not set
+# CONFIG_UDHCPC6 is not set
 # CONFIG_UDHCPD is not set
 # CONFIG_DHCPRELAY is not set
 # CONFIG_DUMPLEASES is not set
 # CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
+# CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
 CONFIG_DHCPD_LEASES_FILE=""
 CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
+CONFIG_FEATURE_UDHCP_8021Q=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
@@ -823,6 +865,7 @@ CONFIG_WGET=y
 CONFIG_FEATURE_WGET_STATUSBAR=y
 CONFIG_FEATURE_WGET_AUTHENTICATION=y
 CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
 # CONFIG_ZCIP is not set
 
 #
@@ -846,20 +889,30 @@ CONFIG_FEATURE_MIME_CHARSET=""
 #
 # Process Utilities
 #
+# CONFIG_IOSTAT is not set
+CONFIG_LSOF=y
+# CONFIG_MPSTAT is not set
+# CONFIG_NMETER is not set
+# CONFIG_PMAP is not set
+# CONFIG_POWERTOP is not set
+# CONFIG_PSTREE is not set
+# CONFIG_PWDX is not set
 # CONFIG_SMEMCAP is not set
+CONFIG_UPTIME=y
+# CONFIG_FEATURE_UPTIME_UTMP_SUPPORT is not set
 CONFIG_FREE=y
 CONFIG_FUSER=y
 CONFIG_KILL=y
 CONFIG_KILLALL=y
 CONFIG_KILLALL5=y
-# CONFIG_NMETER is not set
 # CONFIG_PGREP is not set
 CONFIG_PIDOF=y
 CONFIG_FEATURE_PIDOF_SINGLE=y
 CONFIG_FEATURE_PIDOF_OMIT=y
 # CONFIG_PKILL is not set
 CONFIG_PS=y
-CONFIG_FEATURE_PS_WIDE=y
+# CONFIG_FEATURE_PS_WIDE is not set
+# CONFIG_FEATURE_PS_LONG is not set
 # CONFIG_FEATURE_PS_TIME is not set
 # CONFIG_FEATURE_PS_ADDITIONAL_COLUMNS is not set
 # CONFIG_FEATURE_PS_UNUSUAL_SYSTEMS is not set
@@ -873,7 +926,6 @@ CONFIG_FEATURE_TOP_CPU_GLOBAL_PERCENTS=y
 # CONFIG_FEATURE_TOP_SMP_PROCESS is not set
 # CONFIG_FEATURE_TOPMEM is not set
 # CONFIG_FEATURE_SHOW_THREADS is not set
-CONFIG_UPTIME=y
 CONFIG_WATCH=y
 
 #
@@ -911,6 +963,7 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 #
 CONFIG_ASH=y
 CONFIG_ASH_BASH_COMPAT=y
+CONFIG_ASH_IDLE_TIMEOUT=y
 CONFIG_ASH_JOB_CONTROL=y
 CONFIG_ASH_ALIAS=y
 # CONFIG_ASH_GETOPTS is not set
@@ -922,10 +975,13 @@ CONFIG_ASH_CMDCMD=y
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 CONFIG_ASH_RANDOM_SUPPORT=y
 CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_CTTYHACK is not set
 # CONFIG_HUSH is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
+# CONFIG_HUSH_BRACE_EXPANSION is not set
 # CONFIG_HUSH_HELP is not set
 # CONFIG_HUSH_INTERACTIVE is not set
+# CONFIG_HUSH_SAVEHISTORY is not set
 # CONFIG_HUSH_JOB is not set
 # CONFIG_HUSH_TICK is not set
 # CONFIG_HUSH_IF is not set
@@ -933,22 +989,22 @@ CONFIG_ASH_EXPAND_PRMT=y
 # CONFIG_HUSH_CASE is not set
 # CONFIG_HUSH_FUNCTIONS is not set
 # CONFIG_HUSH_LOCAL is not set
-# CONFIG_HUSH_EXPORT_N is not set
 # CONFIG_HUSH_RANDOM_SUPPORT is not set
+# CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_MODE_X is not set
+# CONFIG_MSH is not set
 CONFIG_FEATURE_SH_IS_ASH=y
 # CONFIG_FEATURE_SH_IS_HUSH is not set
 # CONFIG_FEATURE_SH_IS_NONE is not set
 # CONFIG_FEATURE_BASH_IS_ASH is not set
 # CONFIG_FEATURE_BASH_IS_HUSH is not set
 CONFIG_FEATURE_BASH_IS_NONE=y
-# CONFIG_LASH is not set
-# CONFIG_MSH is not set
 CONFIG_SH_MATH_SUPPORT=y
 # CONFIG_SH_MATH_SUPPORT_64 is not set
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
-# CONFIG_CTTYHACK is not set
+# CONFIG_FEATURE_SH_HISTFILESIZE is not set
 
 #
 # System Logging Utilities
@@ -957,10 +1013,12 @@ CONFIG_SYSLOGD=y
 CONFIG_FEATURE_ROTATE_LOGFILE=y
 CONFIG_FEATURE_REMOTE_LOG=y
 # CONFIG_FEATURE_SYSLOGD_DUP is not set
+# CONFIG_FEATURE_SYSLOGD_CFG is not set
 CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 # CONFIG_FEATURE_IPC_SYSLOG is not set
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
 # CONFIG_LOGREAD is not set
 # CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 CONFIG_KLOGD=y
+CONFIG_FEATURE_KLOGD_KLOGCTL=y
 CONFIG_LOGGER=y
-- 
1.7.3.4
