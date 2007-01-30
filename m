From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 30 Jan 2007 05:37:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070130133721.86684485AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-30 05:37:21 -0800 (Tue, 30 Jan 2007)
New Revision: 17669

Log:
busybox 1.4.0 support files

Added:
   trunk/buildroot/package/busybox/busybox-1.4.0-conf.patch
   trunk/buildroot/package/busybox/busybox-1.4.0-libnetlink.patch
   trunk/buildroot/package/busybox/busybox-1.4.0-parse_config_file.patch
   trunk/buildroot/package/busybox/busybox-1.4.0-syslogd-n.patch
   trunk/buildroot/package/busybox/busybox-1.4.0-tar.patch
   trunk/buildroot/package/busybox/busybox-1.4.0.config


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.4.0-conf.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0-conf.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0-conf.patch	2007-01-30 13:37:21 UTC (rev 17669)
@@ -0,0 +1,37 @@
+--- busybox-1.4.0/applets/applets.c	Fri Jan 19 22:23:11 2007
++++ busybox-1.4.0-conf/applets/applets.c	Wed Jan 24 10:15:49 2007
+@@ -340,20 +340,26 @@
+ 		if (sct) {
+ 			mode_t m = sct->m_mode;
+ 
+-			if (sct->m_uid == ruid)       /* same uid */
++			if (sct->m_uid == ruid)
++				/* same uid */
+ 				m >>= 6;
+-			else if ((sct->m_gid == rgid) || ingroup(ruid, sct->m_gid))  /* same group / in group */
++			else if ((sct->m_gid == rgid) || ingroup(ruid, sct->m_gid))
++				/* same group / in group */
+ 				m >>= 3;
+ 
+ 			if (!(m & S_IXOTH))           /* is x bit not set ? */
+ 				bb_error_msg_and_die("you have no permission to run this applet!");
+ 
+-			if ((sct->m_mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)) {     /* *both* have to be set for sgid */
+-				xsetgid(sct->m_gid);
+-			} else xsetgid(rgid);                /* no sgid -> drop */
+-
+-			if (sct->m_mode & S_ISUID) xsetuid(sct->m_uid);
+-			else xsetuid(ruid);                  /* no suid -> drop */
++			if (sct->m_gid != 0) {
++				/* _both_ have to be set for sgid */
++				if ((sct->m_mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)) {
++					xsetgid(sct->m_gid);
++				} else xsetgid(rgid); /* no sgid -> drop */
++			}
++			if (sct->m_uid != 0) {
++				if (sct->m_mode & S_ISUID) xsetuid(sct->m_uid);
++				else xsetuid(ruid); /* no suid -> drop */
++			}
+ 		} else {
+ 			/* default: drop all privileges */
+ 			xsetgid(rgid);

Added: trunk/buildroot/package/busybox/busybox-1.4.0-libnetlink.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0-libnetlink.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0-libnetlink.patch	2007-01-30 13:37:21 UTC (rev 17669)
@@ -0,0 +1,19 @@
+--- busybox-1.4.0/networking/libiproute/libnetlink.h	Fri Jan 19 22:22:58 2007
++++ busybox-1.4.0-libnetlink/networking/libiproute/libnetlink.h	Tue Jan 23 00:30:45 2007
+@@ -2,6 +2,9 @@
+ #ifndef __LIBNETLINK_H__
+ #define __LIBNETLINK_H__ 1
+ 
++#include <linux/types.h>
++/* We need linux/types.h because older kernels use __u32 etc
++ * in linux/[rt]netlink.h. 2.6.19 seems to be ok, though */
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ 
+@@ -37,6 +40,4 @@
+ 
+ extern int parse_rtattr(struct rtattr *tb[], int max, struct rtattr *rta, int len);
+ 
+-
+ #endif /* __LIBNETLINK_H__ */
+-

Added: trunk/buildroot/package/busybox/busybox-1.4.0-parse_config_file.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0-parse_config_file.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0-parse_config_file.patch	2007-01-30 13:37:21 UTC (rev 17669)
@@ -0,0 +1,11 @@
+--- busybox-1.4.0/applets/applets.c	Fri Jan 19 22:23:11 2007
++++ busybox-1.4.0-parse_config_file/applets/applets.c	Tue Jan 23 21:35:00 2007
+@@ -320,7 +320,7 @@
+ }
+ 
+ #else
+-#define parse_config_file()
++#define parse_config_file() ((void)0)
+ #endif /* CONFIG_FEATURE_SUID_CONFIG */
+ 
+ #ifdef CONFIG_FEATURE_SUID

Added: trunk/buildroot/package/busybox/busybox-1.4.0-syslogd-n.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0-syslogd-n.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0-syslogd-n.patch	2007-01-30 13:37:21 UTC (rev 17669)
@@ -0,0 +1,65 @@
+--- busybox-1.4.0/libbb/vdprintf.c	Fri Jan 19 22:23:06 2007
++++ busybox-1.4.0-syslogd-n/libbb/vdprintf.c	Tue Jan 23 21:50:54 2007
+@@ -7,11 +7,7 @@
+  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
+  */
+ 
+-#include <stdio.h>
+-#include <unistd.h>
+ #include "libbb.h"
+-
+-
+ 
+ #if defined(__GLIBC__) && __GLIBC__ < 2
+ int vdprintf(int d, const char *format, va_list ap)
+--- busybox-1.4.0/libbb/xfuncs.c	Fri Jan 19 22:23:06 2007
++++ busybox-1.4.0-syslogd-n/libbb/xfuncs.c	Tue Jan 23 21:47:27 2007
+@@ -81,13 +81,14 @@
+ 	t = (char*) s;
+ 	while (m) {
+ 		if (!*t) break;
+-		m--; t++;
++		m--;
++		t++;
+ 	}
+-	n = n - m;
++	n -= m;
+ 	t = xmalloc(n + 1);
+ 	t[n] = '\0';
+ 
+-	return memcpy(t,s,n);
++	return memcpy(t, s, n);
+ }
+ 
+ // Die if we can't open a file and return a FILE * to it.
+--- busybox-1.4.0/libbb/xreadlink.c	Fri Jan 19 22:23:06 2007
++++ busybox-1.4.0-syslogd-n/libbb/xreadlink.c	Tue Jan 23 22:35:45 2007
+@@ -36,7 +36,7 @@
+ 
+ char *xmalloc_realpath(const char *path)
+ {
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ 	/* glibc provides a non-standard extension */
+ 	return realpath(path, NULL);
+ #else
+--- busybox-1.4.0/sysklogd/syslogd.c	Fri Jan 19 22:23:02 2007
++++ busybox-1.4.0-syslogd-n/sysklogd/syslogd.c	Wed Jan 24 21:52:07 2007
+@@ -569,7 +569,7 @@
+ 	//if (option_mask32 & OPT_locallog) // -L
+ #endif
+ #if ENABLE_FEATURE_IPC_SYSLOG
+-	if ((option_mask32 & OPT_circularlog) && opt_C) // -C
++	if (opt_C) // -Cn
+ 		shm_size = xatoul_range(opt_C, 4, INT_MAX/1024) * 1024;
+ #endif
+ 
+@@ -588,7 +588,7 @@
+ #ifdef BB_NOMMU
+ 		vfork_daemon_rexec(0, 1, argc, argv, "-n");
+ #else
+-		xdaemon(0, 1);
++		bb_daemonize();
+ #endif
+ 	}
+ 	umask(0);

Added: trunk/buildroot/package/busybox/busybox-1.4.0-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0-tar.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0-tar.patch	2007-01-30 13:37:21 UTC (rev 17669)
@@ -0,0 +1,117 @@
+--- busybox-1.4.0/archival/tar.c	Fri Jan 19 22:23:02 2007
++++ busybox-1.4.0-tar/archival/tar.c	Wed Jan 24 21:32:00 2007
+@@ -23,10 +23,10 @@
+  * Licensed under GPLv2 or later, see file LICENSE in this tarball for details.
+  */
+ 
+-#include "busybox.h"
+-#include "unarchive.h"
+ #include <fnmatch.h>
+ #include <getopt.h>
++#include "busybox.h"
++#include "unarchive.h"
+ 
+ #if ENABLE_FEATURE_TAR_CREATE
+ 
+@@ -37,6 +37,7 @@
+ /* POSIX tar Header Block, from POSIX 1003.1-1990  */
+ #define NAME_SIZE      100
+ #define NAME_SIZE_STR "100"
++typedef struct TarHeader TarHeader;
+ struct TarHeader {		  /* byte offset */
+ 	char name[NAME_SIZE];     /*   0-99 */
+ 	char mode[8];             /* 100-107 */
+@@ -56,7 +57,6 @@
+ 	char prefix[155];         /* 345-499 */
+ 	char padding[12];         /* 500-512 (pad to exactly the TAR_BLOCK_SIZE) */
+ };
+-typedef struct TarHeader TarHeader;
+ 
+ /*
+ ** writeTarFile(), writeFileToTarball(), and writeTarHeader() are
+@@ -73,6 +73,7 @@
+ };
+ 
+ /* Some info to be carried along when creating a new tarball */
++typedef struct TarBallInfo TarBallInfo;
+ struct TarBallInfo {
+ 	int tarFd;				/* Open-for-write file descriptor
+ 							   for the tarball */
+@@ -85,7 +86,6 @@
+ 	HardLinkInfo *hlInfoHead;	/* Hard Link Tracking Information */
+ 	HardLinkInfo *hlInfo;	/* Hard Link Info for the current file */
+ };
+-typedef struct TarBallInfo TarBallInfo;
+ 
+ /* A nice enum with all the possible tar file content types */
+ enum TarFileType {
+@@ -348,7 +348,7 @@
+ 	return TRUE;
+ }
+ 
+-# if ENABLE_FEATURE_TAR_FROM
++#if ENABLE_FEATURE_TAR_FROM
+ static int exclude_file(const llist_t *excluded_files, const char *file)
+ {
+ 	while (excluded_files) {
+@@ -371,12 +371,12 @@
+ 
+ 	return 0;
+ }
+-# else
++#else
+ #define exclude_file(excluded_files, file) 0
+-# endif
++#endif
+ 
+ static int writeFileToTarball(const char *fileName, struct stat *statbuf,
+-			void *userData, int depth)
++			void *userData, int depth ATTRIBUTE_UNUSED)
+ {
+ 	struct TarBallInfo *tbInfo = (struct TarBallInfo *) userData;
+ 	const char *header_name;
+@@ -509,14 +509,14 @@
+ 		if (pipe(gzipDataPipe) < 0 || pipe(gzipStatusPipe) < 0)
+ 			bb_perror_msg_and_die("pipe");
+ 
+-		signal(SIGPIPE, SIG_IGN);	/* we only want EPIPE on errors */
++		signal(SIGPIPE, SIG_IGN); /* we only want EPIPE on errors */
+ 
+-# if __GNUC__
++#if defined(__GNUC__) && __GNUC__
+ 		/* Avoid vfork clobbering */
+ 		(void) &include;
+ 		(void) &errorFlag;
+ 		(void) &zip_exec;
+-# endif
++#endif
+ 
+ 		gzipPid = vfork();
+ 
+@@ -600,7 +600,7 @@
+ int writeTarFile(const int tar_fd, const int verboseFlag,
+ 	const unsigned long dereferenceFlag, const llist_t *include,
+ 	const llist_t *exclude, const int gzip);
+-#endif	/* tar_create */
++#endif /* FEATURE_TAR_CREATE */
+ 
+ #if ENABLE_FEATURE_TAR_FROM
+ static llist_t *append_file_list_to_list(llist_t *list)
+@@ -628,7 +628,7 @@
+ 	return newlist;
+ }
+ #else
+-#define append_file_list_to_list(x)	0
++#define append_file_list_to_list(x) 0
+ #endif
+ 
+ #if ENABLE_FEATURE_TAR_COMPRESS
+@@ -653,7 +653,7 @@
+ 	return EXIT_FAILURE;
+ }
+ #else
+-#define get_header_tar_Z	0
++#define get_header_tar_Z NULL
+ #endif
+ 
+ #ifdef CHECK_FOR_CHILD_EXITCODE

Added: trunk/buildroot/package/busybox/busybox-1.4.0.config
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0.config	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0.config	2007-01-30 13:37:21 UTC (rev 17669)
@@ -0,0 +1,675 @@
+#
+# Automatically generated make config: don't edit
+# Busybox version: 1.4.0
+# Tue Jan 30 14:22:01 2007
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
+# CONFIG_NITPICK is not set
+# CONFIG_DESKTOP is not set
+# CONFIG_FEATURE_BUFFERS_USE_MALLOC is not set
+# CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
+# CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
+CONFIG_SHOW_USAGE=y
+CONFIG_FEATURE_VERBOSE_USAGE=y
+# CONFIG_FEATURE_COMPRESS_USAGE is not set
+# CONFIG_FEATURE_INSTALLER is not set
+# CONFIG_LOCALE_SUPPORT is not set
+CONFIG_GETOPT_LONG=y
+CONFIG_FEATURE_DEVPTS=y
+# CONFIG_FEATURE_CLEAN_UP is not set
+CONFIG_FEATURE_SUID=y
+CONFIG_FEATURE_SYSLOG=y
+# CONFIG_FEATURE_SUID_CONFIG is not set
+# CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
+CONFIG_FEATURE_HAVE_RPC=y
+# CONFIG_SELINUX is not set
+CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+
+#
+# Build Options
+#
+# CONFIG_STATIC is not set
+# CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_FULL_LIBBUSYBOX is not set
+# CONFIG_FEATURE_SHARED_BUSYBOX is not set
+CONFIG_LFS=y
+# CONFIG_BUILD_AT_ONCE is not set
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+# CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_NO_DEBUG_LIB is not set
+# CONFIG_DMALLOC is not set
+# CONFIG_EFENCE is not set
+CONFIG_INCLUDE_SUSv2=y
+
+#
+# Installation Options
+#
+# CONFIG_INSTALL_NO_USR is not set
+CONFIG_INSTALL_APPLET_SYMLINKS=y
+# CONFIG_INSTALL_APPLET_HARDLINKS is not set
+# CONFIG_INSTALL_APPLET_DONT is not set
+CONFIG_PREFIX="./_install"
+
+#
+# Busybox Library Tuning
+#
+CONFIG_PASSWORD_MINLEN=6
+CONFIG_MD5_SIZE_VS_SPEED=2
+
+#
+# Applets
+#
+
+#
+# Archival Utilities
+#
+# CONFIG_AR is not set
+# CONFIG_FEATURE_AR_LONG_FILENAMES is not set
+CONFIG_BUNZIP2=y
+# CONFIG_CPIO is not set
+# CONFIG_DPKG is not set
+# CONFIG_DPKG_DEB is not set
+# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
+CONFIG_GUNZIP=y
+# CONFIG_FEATURE_GUNZIP_UNCOMPRESS is not set
+CONFIG_GZIP=y
+# CONFIG_RPM2CPIO is not set
+# CONFIG_RPM is not set
+CONFIG_TAR=y
+CONFIG_FEATURE_TAR_CREATE=y
+CONFIG_FEATURE_TAR_BZIP2=y
+# CONFIG_FEATURE_TAR_LZMA is not set
+# CONFIG_FEATURE_TAR_FROM is not set
+CONFIG_FEATURE_TAR_GZIP=y
+# CONFIG_FEATURE_TAR_COMPRESS is not set
+# CONFIG_FEATURE_TAR_OLDGNU_COMPATIBILITY is not set
+CONFIG_FEATURE_TAR_GNU_EXTENSIONS=y
+# CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
+# CONFIG_UNCOMPRESS is not set
+# CONFIG_UNLZMA is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
+CONFIG_UNZIP=y
+
+#
+# Common options for cpio and tar
+#
+# CONFIG_FEATURE_UNARCHIVE_TAPE is not set
+# CONFIG_FEATURE_DEB_TAR_GZ is not set
+# CONFIG_FEATURE_DEB_TAR_BZ2 is not set
+# CONFIG_FEATURE_DEB_TAR_LZMA is not set
+
+#
+# Coreutils
+#
+CONFIG_BASENAME=y
+# CONFIG_CAL is not set
+CONFIG_CAT=y
+# CONFIG_CATV is not set
+CONFIG_CHGRP=y
+CONFIG_CHMOD=y
+CONFIG_CHOWN=y
+CONFIG_CHROOT=y
+# CONFIG_CKSUM is not set
+CONFIG_CMP=y
+# CONFIG_COMM is not set
+CONFIG_CP=y
+CONFIG_CUT=y
+CONFIG_DATE=y
+CONFIG_FEATURE_DATE_ISOFMT=y
+CONFIG_DD=y
+# CONFIG_FEATURE_DD_SIGNAL_HANDLING is not set
+# CONFIG_FEATURE_DD_IBS_OBS is not set
+CONFIG_DF=y
+# CONFIG_DIFF is not set
+# CONFIG_FEATURE_DIFF_BINARY is not set
+# CONFIG_FEATURE_DIFF_DIR is not set
+# CONFIG_FEATURE_DIFF_MINIMAL is not set
+CONFIG_DIRNAME=y
+CONFIG_DOS2UNIX=y
+CONFIG_UNIX2DOS=y
+CONFIG_DU=y
+CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
+CONFIG_ECHO=y
+CONFIG_FEATURE_FANCY_ECHO=y
+CONFIG_ENV=y
+# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
+CONFIG_EXPR=y
+CONFIG_EXPR_MATH_SUPPORT_64=y
+CONFIG_FALSE=y
+# CONFIG_FOLD is not set
+CONFIG_HEAD=y
+# CONFIG_FEATURE_FANCY_HEAD is not set
+CONFIG_HOSTID=y
+CONFIG_ID=y
+CONFIG_INSTALL=y
+# CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
+# CONFIG_LENGTH is not set
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
+# CONFIG_FEATURE_MKDIR_LONG_OPTIONS is not set
+# CONFIG_MKFIFO is not set
+CONFIG_MKNOD=y
+CONFIG_MV=y
+# CONFIG_FEATURE_MV_LONG_OPTIONS is not set
+# CONFIG_NICE is not set
+# CONFIG_NOHUP is not set
+# CONFIG_OD is not set
+# CONFIG_PRINTENV is not set
+# CONFIG_PRINTF is not set
+CONFIG_PWD=y
+# CONFIG_REALPATH is not set
+CONFIG_RM=y
+CONFIG_RMDIR=y
+# CONFIG_SEQ is not set
+CONFIG_SHA1SUM=y
+CONFIG_SLEEP=y
+# CONFIG_FEATURE_FANCY_SLEEP is not set
+CONFIG_SORT=y
+CONFIG_FEATURE_SORT_BIG=y
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STTY=y
+# CONFIG_SUM is not set
+CONFIG_SYNC=y
+CONFIG_TAIL=y
+CONFIG_FEATURE_FANCY_TAIL=y
+CONFIG_TEE=y
+CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
+CONFIG_TEST=y
+CONFIG_FEATURE_TEST_64=y
+CONFIG_TOUCH=y
+# CONFIG_TR is not set
+# CONFIG_FEATURE_TR_CLASSES is not set
+# CONFIG_FEATURE_TR_EQUIV is not set
+CONFIG_TRUE=y
+CONFIG_TTY=y
+CONFIG_UNAME=y
+CONFIG_UNIQ=y
+CONFIG_USLEEP=y
+CONFIG_UUDECODE=y
+CONFIG_UUENCODE=y
+# CONFIG_WATCH is not set
+CONFIG_WC=y
+# CONFIG_FEATURE_WC_LARGE is not set
+# CONFIG_WHO is not set
+CONFIG_WHOAMI=y
+CONFIG_YES=y
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
+# Common options for md5sum, sha1sum
+#
+CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
+
+#
+# Console Utilities
+#
+CONFIG_CHVT=y
+CONFIG_CLEAR=y
+CONFIG_DEALLOCVT=y
+# CONFIG_DUMPKMAP is not set
+# CONFIG_LOADFONT is not set
+# CONFIG_LOADKMAP is not set
+CONFIG_OPENVT=y
+CONFIG_RESET=y
+# CONFIG_RESIZE is not set
+# CONFIG_FEATURE_RESIZE_PRINT is not set
+# CONFIG_SETCONSOLE is not set
+# CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
+# CONFIG_SETKEYCODES is not set
+# CONFIG_SETLOGCONS is not set
+
+#
+# Debian Utilities
+#
+CONFIG_MKTEMP=y
+# CONFIG_PIPE_PROGRESS is not set
+CONFIG_READLINK=y
+CONFIG_FEATURE_READLINK_FOLLOW=y
+CONFIG_RUN_PARTS=y
+CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+CONFIG_START_STOP_DAEMON=y
+CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
+CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+CONFIG_WHICH=y
+
+#
+# Editors
+#
+# CONFIG_AWK is not set
+# CONFIG_FEATURE_AWK_MATH is not set
+# CONFIG_ED is not set
+# CONFIG_PATCH is not set
+CONFIG_SED=y
+CONFIG_VI=y
+CONFIG_FEATURE_VI_COLON=y
+CONFIG_FEATURE_VI_YANKMARK=y
+CONFIG_FEATURE_VI_SEARCH=y
+CONFIG_FEATURE_VI_USE_SIGNALS=y
+CONFIG_FEATURE_VI_DOT_CMD=y
+CONFIG_FEATURE_VI_READONLY=y
+CONFIG_FEATURE_VI_SETOPTS=y
+CONFIG_FEATURE_VI_SET=y
+CONFIG_FEATURE_VI_WIN_RESIZE=y
+CONFIG_FEATURE_VI_OPTIMIZE_CURSOR=y
+CONFIG_FEATURE_ALLOW_EXEC=y
+
+#
+# Finding Utilities
+#
+CONFIG_FIND=y
+CONFIG_FEATURE_FIND_PRINT0=y
+CONFIG_FEATURE_FIND_MTIME=y
+# CONFIG_FEATURE_FIND_MMIN is not set
+CONFIG_FEATURE_FIND_PERM=y
+CONFIG_FEATURE_FIND_TYPE=y
+CONFIG_FEATURE_FIND_XDEV=y
+# CONFIG_FEATURE_FIND_NEWER is not set
+# CONFIG_FEATURE_FIND_INUM is not set
+CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_GREP=y
+CONFIG_FEATURE_GREP_EGREP_ALIAS=y
+CONFIG_FEATURE_GREP_FGREP_ALIAS=y
+CONFIG_FEATURE_GREP_CONTEXT=y
+CONFIG_XARGS=y
+# CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION is not set
+CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
+CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
+CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+
+#
+# Init Utilities
+#
+CONFIG_INIT=y
+# CONFIG_DEBUG_INIT is not set
+CONFIG_FEATURE_USE_INITTAB=y
+CONFIG_FEATURE_INIT_SCTTY=y
+CONFIG_FEATURE_EXTRA_QUIET=y
+# CONFIG_FEATURE_INIT_COREDUMPS is not set
+CONFIG_FEATURE_INITRD=y
+CONFIG_HALT=y
+# CONFIG_MESG is not set
+
+#
+# Login/Password Management Utilities
+#
+CONFIG_FEATURE_SHADOWPASSWDS=y
+# CONFIG_USE_BB_SHADOW is not set
+# CONFIG_USE_BB_PWD_GRP is not set
+CONFIG_ADDGROUP=y
+CONFIG_DELGROUP=y
+CONFIG_ADDUSER=y
+CONFIG_DELUSER=y
+CONFIG_GETTY=y
+# CONFIG_FEATURE_UTMP is not set
+# CONFIG_FEATURE_WTMP is not set
+CONFIG_LOGIN=y
+# CONFIG_LOGIN_SCRIPTS is not set
+CONFIG_FEATURE_SECURETTY=y
+CONFIG_PASSWD=y
+CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
+CONFIG_SU=y
+CONFIG_FEATURE_SU_SYSLOG=y
+CONFIG_FEATURE_SU_CHECKS_SHELLS=y
+CONFIG_SULOGIN=y
+CONFIG_VLOCK=y
+
+#
+# Linux Ext2 FS Progs
+#
+# CONFIG_CHATTR is not set
+# CONFIG_FSCK is not set
+# CONFIG_LSATTR is not set
+
+#
+# Linux Module Utilities
+#
+CONFIG_INSMOD=y
+# CONFIG_FEATURE_INSMOD_VERSION_CHECKING is not set
+# CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS is not set
+# CONFIG_FEATURE_INSMOD_LOADINKMEM is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP is not set
+# CONFIG_FEATURE_INSMOD_LOAD_MAP_FULL is not set
+CONFIG_RMMOD=y
+CONFIG_LSMOD=y
+CONFIG_FEATURE_LSMOD_PRETTY_2_6_OUTPUT=y
+CONFIG_MODPROBE=y
+CONFIG_FEATURE_MODPROBE_MULTIPLE_OPTIONS=y
+CONFIG_FEATURE_MODPROBE_FANCY_ALIAS=y
+
+#
+# Options common to multiple modutils
+#
+CONFIG_FEATURE_CHECK_TAINTED_MODULE=y
+CONFIG_FEATURE_2_4_MODULES=y
+CONFIG_FEATURE_2_6_MODULES=y
+# CONFIG_FEATURE_QUERY_MODULE_INTERFACE is not set
+
+#
+# Linux System Utilities
+#
+CONFIG_DMESG=y
+CONFIG_FEATURE_DMESG_PRETTY=y
+# CONFIG_FBSET is not set
+# CONFIG_FEATURE_FBSET_FANCY is not set
+# CONFIG_FEATURE_FBSET_READMODE is not set
+# CONFIG_FDFLUSH is not set
+CONFIG_FDFORMAT=y
+CONFIG_FDISK=y
+CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+CONFIG_FEATURE_FDISK_WRITABLE=y
+# CONFIG_FEATURE_AIX_LABEL is not set
+# CONFIG_FEATURE_SGI_LABEL is not set
+# CONFIG_FEATURE_SUN_LABEL is not set
+# CONFIG_FEATURE_OSF_LABEL is not set
+# CONFIG_FEATURE_FDISK_ADVANCED is not set
+# CONFIG_FREERAMDISK is not set
+# CONFIG_FSCK_MINIX is not set
+# CONFIG_MKFS_MINIX is not set
+# CONFIG_FEATURE_MINIX2 is not set
+CONFIG_GETOPT=y
+CONFIG_HEXDUMP=y
+CONFIG_HWCLOCK=y
+# CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS is not set
+# CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS is not set
+# CONFIG_IPCRM is not set
+# CONFIG_IPCS is not set
+# CONFIG_LOSETUP is not set
+# CONFIG_MDEV is not set
+# CONFIG_FEATURE_MDEV_CONF is not set
+# CONFIG_FEATURE_MDEV_EXEC is not set
+# CONFIG_MKSWAP is not set
+# CONFIG_FEATURE_MKSWAP_V0 is not set
+CONFIG_MORE=y
+CONFIG_FEATURE_USE_TERMIOS=y
+CONFIG_MOUNT=y
+CONFIG_FEATURE_MOUNT_NFS=y
+# CONFIG_FEATURE_MOUNT_CIFS is not set
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+CONFIG_PIVOT_ROOT=y
+CONFIG_RDATE=y
+# CONFIG_READPROFILE is not set
+# CONFIG_SETARCH is not set
+CONFIG_SWAPONOFF=y
+CONFIG_SWITCH_ROOT=y
+CONFIG_UMOUNT=y
+CONFIG_FEATURE_UMOUNT_ALL=y
+
+#
+# Common options for mount/umount
+#
+CONFIG_FEATURE_MOUNT_LOOP=y
+# CONFIG_FEATURE_MTAB_SUPPORT is not set
+
+#
+# Miscellaneous Utilities
+#
+# CONFIG_ADJTIMEX is not set
+# CONFIG_BBCONFIG is not set
+# CONFIG_CROND is not set
+# CONFIG_DEBUG_CROND_OPTION is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+# CONFIG_CRONTAB is not set
+CONFIG_DC=y
+# CONFIG_DEVFSD is not set
+# CONFIG_DEVFSD_MODLOAD is not set
+# CONFIG_DEVFSD_FG_NP is not set
+# CONFIG_DEVFSD_VERBOSE is not set
+# CONFIG_FEATURE_DEVFS is not set
+# CONFIG_EJECT is not set
+# CONFIG_LAST is not set
+CONFIG_LESS=y
+CONFIG_FEATURE_LESS_MAXLINES=9999999
+# CONFIG_FEATURE_LESS_BRACKETS is not set
+# CONFIG_FEATURE_LESS_FLAGS is not set
+# CONFIG_FEATURE_LESS_FLAGCS is not set
+# CONFIG_FEATURE_LESS_MARKS is not set
+CONFIG_FEATURE_LESS_REGEXP=y
+# CONFIG_HDPARM is not set
+# CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
+# CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
+# CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
+# CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+# CONFIG_MAKEDEVS is not set
+# CONFIG_FEATURE_MAKEDEVS_LEAF is not set
+# CONFIG_FEATURE_MAKEDEVS_TABLE is not set
+# CONFIG_MOUNTPOINT is not set
+CONFIG_MT=y
+# CONFIG_NMETER is not set
+# CONFIG_RAIDAUTORUN is not set
+# CONFIG_READAHEAD is not set
+# CONFIG_RUNLEVEL is not set
+# CONFIG_RX is not set
+CONFIG_STRINGS=y
+# CONFIG_SETSID is not set
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
+CONFIG_TIME=y
+# CONFIG_WATCHDOG is not set
+
+#
+# Networking Utilities
+#
+# CONFIG_FEATURE_IPV6 is not set
+# CONFIG_ARP is not set
+# CONFIG_ARPING is not set
+# CONFIG_DNSD is not set
+# CONFIG_ETHER_WAKE is not set
+# CONFIG_FAKEIDENTD is not set
+# CONFIG_FTPGET is not set
+# CONFIG_FTPPUT is not set
+# CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
+CONFIG_HOSTNAME=y
+# CONFIG_HTTPD is not set
+# CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP is not set
+# CONFIG_FEATURE_HTTPD_SETUID is not set
+# CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
+# CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
+# CONFIG_FEATURE_HTTPD_CONFIG_WITH_MIME_TYPES is not set
+# CONFIG_FEATURE_HTTPD_CGI is not set
+# CONFIG_FEATURE_HTTPD_CONFIG_WITH_SCRIPT_INTERPR is not set
+# CONFIG_FEATURE_HTTPD_SET_REMOTE_PORT_TO_ENV is not set
+# CONFIG_FEATURE_HTTPD_ENCODE_URL_STR is not set
+CONFIG_IFCONFIG=y
+CONFIG_FEATURE_IFCONFIG_STATUS=y
+# CONFIG_FEATURE_IFCONFIG_SLIP is not set
+# CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ is not set
+# CONFIG_FEATURE_IFCONFIG_HW is not set
+# CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS is not set
+CONFIG_IFUPDOWN=y
+# CONFIG_FEATURE_IFUPDOWN_IP is not set
+# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
+CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
+CONFIG_FEATURE_IFUPDOWN_IPV4=y
+# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
+# CONFIG_FEATURE_IFUPDOWN_IPX is not set
+# CONFIG_FEATURE_IFUPDOWN_MAPPING is not set
+# CONFIG_INETD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+# CONFIG_FEATURE_INETD_RPC is not set
+# CONFIG_IP is not set
+# CONFIG_FEATURE_IP_ADDRESS is not set
+# CONFIG_FEATURE_IP_LINK is not set
+# CONFIG_FEATURE_IP_ROUTE is not set
+# CONFIG_FEATURE_IP_TUNNEL is not set
+# CONFIG_FEATURE_IP_RULE is not set
+# CONFIG_FEATURE_IP_SHORT_FORMS is not set
+# CONFIG_IPADDR is not set
+# CONFIG_IPLINK is not set
+# CONFIG_IPROUTE is not set
+# CONFIG_IPTUNNEL is not set
+# CONFIG_IPRULE is not set
+# CONFIG_IPCALC is not set
+# CONFIG_FEATURE_IPCALC_FANCY is not set
+# CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
+# CONFIG_NAMEIF is not set
+# CONFIG_NC is not set
+# CONFIG_NC_SERVER is not set
+# CONFIG_NC_EXTRA is not set
+CONFIG_NETSTAT=y
+CONFIG_NSLOOKUP=y
+CONFIG_PING=y
+CONFIG_FEATURE_FANCY_PING=y
+# CONFIG_PING6 is not set
+# CONFIG_FEATURE_FANCY_PING6 is not set
+CONFIG_ROUTE=y
+CONFIG_TELNET=y
+CONFIG_FEATURE_TELNET_TTYPE=y
+# CONFIG_FEATURE_TELNET_AUTOLOGIN is not set
+# CONFIG_TELNETD is not set
+# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+# CONFIG_TFTP is not set
+# CONFIG_FEATURE_TFTP_GET is not set
+# CONFIG_FEATURE_TFTP_PUT is not set
+# CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
+# CONFIG_DEBUG_TFTP is not set
+# CONFIG_TRACEROUTE is not set
+# CONFIG_FEATURE_TRACEROUTE_VERBOSE is not set
+# CONFIG_FEATURE_TRACEROUTE_SOURCE_ROUTE is not set
+# CONFIG_FEATURE_TRACEROUTE_USE_ICMP is not set
+# CONFIG_APP_UDHCPD is not set
+# CONFIG_APP_DHCPRELAY is not set
+# CONFIG_APP_DUMPLEASES is not set
+CONFIG_APP_UDHCPC=y
+CONFIG_FEATURE_UDHCP_SYSLOG=y
+# CONFIG_FEATURE_UDHCP_DEBUG is not set
+# CONFIG_VCONFIG is not set
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+# CONFIG_FEATURE_WGET_IP6_LITERAL is not set
+# CONFIG_FEATURE_WGET_LONG_OPTIONS is not set
+# CONFIG_ZCIP is not set
+
+#
+# Process Utilities
+#
+CONFIG_FREE=y
+# CONFIG_FUSER is not set
+CONFIG_KILL=y
+CONFIG_KILLALL=y
+# CONFIG_KILLALL5 is not set
+CONFIG_PIDOF=y
+# CONFIG_FEATURE_PIDOF_SINGLE is not set
+# CONFIG_FEATURE_PIDOF_OMIT is not set
+CONFIG_PS=y
+CONFIG_FEATURE_PS_WIDE=y
+# CONFIG_RENICE is not set
+# CONFIG_BB_SYSCTL is not set
+# CONFIG_TOP is not set
+# CONFIG_FEATURE_TOP_CPU_USAGE_PERCENTAGE is not set
+CONFIG_UPTIME=y
+
+#
+# Shells
+#
+CONFIG_FEATURE_SH_IS_ASH=y
+# CONFIG_FEATURE_SH_IS_HUSH is not set
+# CONFIG_FEATURE_SH_IS_LASH is not set
+# CONFIG_FEATURE_SH_IS_MSH is not set
+# CONFIG_FEATURE_SH_IS_NONE is not set
+CONFIG_ASH=y
+
+#
+# Ash Shell Options
+#
+CONFIG_ASH_JOB_CONTROL=y
+CONFIG_ASH_READ_NCHARS=y
+CONFIG_ASH_READ_TIMEOUT=y
+CONFIG_ASH_ALIAS=y
+CONFIG_ASH_MATH_SUPPORT=y
+CONFIG_ASH_MATH_SUPPORT_64=y
+# CONFIG_ASH_GETOPTS is not set
+CONFIG_ASH_BUILTIN_ECHO=y
+CONFIG_ASH_BUILTIN_TEST=y
+# CONFIG_ASH_CMDCMD is not set
+# CONFIG_ASH_MAIL is not set
+CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
+# CONFIG_ASH_RANDOM_SUPPORT is not set
+CONFIG_ASH_EXPAND_PRMT=y
+# CONFIG_HUSH is not set
+# CONFIG_LASH is not set
+# CONFIG_MSH is not set
+
+#
+# Bourne Shell Options
+#
+# CONFIG_FEATURE_SH_EXTRA_QUIET is not set
+# CONFIG_FEATURE_SH_STANDALONE_SHELL is not set
+CONFIG_FEATURE_COMMAND_EDITING=y
+# CONFIG_FEATURE_COMMAND_EDITING_VI is not set
+CONFIG_FEATURE_COMMAND_HISTORY=15
+CONFIG_FEATURE_COMMAND_SAVEHISTORY=y
+CONFIG_FEATURE_COMMAND_TAB_COMPLETION=y
+# CONFIG_FEATURE_COMMAND_USERNAME_COMPLETION is not set
+CONFIG_FEATURE_SH_FANCY_PROMPT=y
+
+#
+# System Logging Utilities
+#
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+# CONFIG_FEATURE_REMOTE_LOG is not set
+# CONFIG_FEATURE_IPC_SYSLOG is not set
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
+CONFIG_KLOGD=y
+CONFIG_LOGGER=y
+
+#
+# Runit Utilities
+#
+# CONFIG_RUNSV is not set
+# CONFIG_RUNSVDIR is not set
+# CONFIG_SV is not set
+# CONFIG_SVLOGD is not set
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
