From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:21:27 +0100
Subject: [Buildroot] [git commit branch/next] busybox: bump to 1.28.0
Message-ID: <20180208222156.582F188600@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58105f2df6696296ee70f1ae666d24d3163ce65a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Other changes:
 - Update 0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
   for 1.28.0
 - Remove upstream patches 3, 4, and 5.
 - Update buxybox.config and busybox-minimal.config

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |  2 +-
 ...clude-per-arch-Makefile-before-Makefile.f.patch | 46 -----------
 ...h-sparc-sparc64-Makefile-define-ARCH_FPIC.patch | 79 ------------------
 ...0005-httpd-fix-handling-of-range-requests.patch | 27 -------
 package/busybox/busybox-minimal.config             | 93 +++++++++++++---------
 package/busybox/busybox.config                     | 87 ++++++++++++--------
 package/busybox/busybox.hash                       |  6 +-
 package/busybox/busybox.mk                         |  2 +-
 8 files changed, 114 insertions(+), 228 deletions(-)

diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
index 105626cbe2..a5da3a251e 100644
--- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
+++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
@@ -12,7 +12,7 @@ diff --git a/Makefile.flags b/Makefile.flags
 index 307afa7..885e323 100644
 --- a/Makefile.flags
 +++ b/Makefile.flags
-@@ -141,7 +141,9 @@ ifeq ($(CONFIG_SELINUX),y)
+@@ -153,7 +153,9 @@ ifeq ($(CONFIG_SELINUX),y)
  SELINUX_PC_MODULES = libselinux libsepol
  $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
  CPPFLAGS += $(SELINUX_CFLAGS)
diff --git a/package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch b/package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch
deleted file mode 100644
index 610ca3992d..0000000000
--- a/package/busybox/0003-Makefile-include-per-arch-Makefile-before-Makefile.f.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 2c240f131ae5cc981702b45397be3b311c67a9ee Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 14 Jul 2017 22:23:46 +0200
-Subject: [PATCH] Makefile: include per-arch Makefile before Makefile.flags
-
-Makefile.flags contains:
-
-ARCH_FPIC ?= -fpic
-ARCH_FPIE ?= -fpie
-
-However, arch/$(ARCH)/Makefile gets included *after* Makefile.flags,
-and therefore doesn't get the chance to provide its own value.
-
-Fix this by including arch/$(ARCH)/Makefile *before* Makefile.flags.
-
-[Submitted upstream: http://lists.busybox.net/pipermail/busybox/2017-July/085632.html]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 971e68e..fe85070 100644
---- a/Makefile
-+++ b/Makefile
-@@ -508,6 +508,8 @@ ifeq ($(dot-config),1)
- # To avoid any implicit rule to kick in, define an empty command
- .config .kconfig.d: ;
- 
-+-include $(srctree)/arch/$(ARCH)/Makefile
-+
- # Now we can define CFLAGS etc according to .config
- include $(srctree)/Makefile.flags
- 
-@@ -531,8 +533,6 @@ endif
- # Defaults busybox but it is usually overridden in the arch makefile
- all: busybox doc
- 
---include $(srctree)/arch/$(ARCH)/Makefile
--
- # arch Makefile may override CC so keep this after arch Makefile is included
- #bbox# NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
- CHECKFLAGS += $(NOSTDINC_FLAGS)
--- 
-2.9.4
-
diff --git a/package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch b/package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch
deleted file mode 100644
index b487035358..0000000000
--- a/package/busybox/0004-arch-sparc-sparc64-Makefile-define-ARCH_FPIC.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 43593d65827f4e7f848fc410321b0b2deed986fc Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 14 Jul 2017 21:54:37 +0200
-Subject: [PATCH] arch/{sparc,sparc64}/Makefile: define ARCH_FPIC
-
-Building Busybox on SPARC or SPARC64 with CONFIG_BUILD_LIBBUSYBOX=y
-currently fails with:
-
-miscutils/lib.a(i2c_tools.o): In function `i2c_dev_open':
-i2c_tools.c:(.text.i2c_dev_open+0x14): relocation truncated to fit: R_SPARC_GOT13 against `.LC0'
-i2c_tools.c:(.text.i2c_dev_open+0x38): relocation truncated to fit: R_SPARC_GOT13 against symbol `bb_errno' defined in COMMON section in libbb/lib.a(ptr_to_globals.o)
-i2c_tools.c:(.text.i2c_dev_open+0x6c): relocation truncated to fit: R_SPARC_GOT13 against `.LC1'
-miscutils/lib.a(i2c_tools.o): In function `check_funcs_test_end':
-i2c_tools.c:(.text.check_funcs_test_end+0x24): relocation truncated to fit: R_SPARC_GOT13 against `.LC2'
-i2c_tools.c:(.text.check_funcs_test_end+0x2c): relocation truncated to fit: R_SPARC_GOT13 against `.LC3'
-miscutils/lib.a(i2c_tools.o): In function `check_read_funcs':
-i2c_tools.c:(.text.check_read_funcs+0x30): relocation truncated to fit: R_SPARC_GOT13 against `.LC10'
-i2c_tools.c:(.text.check_read_funcs+0x80): relocation truncated to fit: R_SPARC_GOT13 against `.LC4'
-i2c_tools.c:(.text.check_read_funcs+0x98): relocation truncated to fit: R_SPARC_GOT13 against `.LC5'
-i2c_tools.c:(.text.check_read_funcs+0xc0): relocation truncated to fit: R_SPARC_GOT13 against `.LC6'
-i2c_tools.c:(.text.check_read_funcs+0xe0): relocation truncated to fit: R_SPARC_GOT13 against `.LC7'
-i2c_tools.c:(.text.check_read_funcs+0xf8): additional relocation overflows omitted from the output
-
-As stated by the gcc documentation, the SPARC architecture has a
-limited GOT size, which prevents moderately large binaries to be built
-with -fpic, and -fPIC is necessary. From gcc's documentation:
-
-'-fpic'
-     Generate position-independent code (PIC) suitable for use in a
-     shared library, if supported for the target machine.  Such code
-     accesses all constant addresses through a global offset table
-     (GOT).  The dynamic loader resolves the GOT entries when the
-     program starts (the dynamic loader is not part of GCC; it is part
-     of the operating system).  If the GOT size for the linked
-     executable exceeds a machine-specific maximum size, you get an
-     error message from the linker indicating that '-fpic' does not
-     work; in that case, recompile with '-fPIC' instead.  (These
-     maximums are 8k on the SPARC, 28k on AArch64 and 32k on the m68k
-     and RS/6000.  The x86 has no such limit.)
-
-'-fPIC'
-     If supported for the target machine, emit position-independent
-     code, suitable for dynamic linking and avoiding any limit on the
-     size of the global offset table.  This option makes a difference on
-     AArch64, m68k, PowerPC and SPARC.
-
-With a limit of 8KB on SPARC, we quickly reach this limit, and we hit
-it when building Busybox on SPARC/SPARC64 with the
-CONFIG_BUILD_LIBBUSYBOX=y option enabled.
-
-Therefore, this commit redefines ARCH_FPIC as -fPIC on sparc and
-sparc64 to solve this issue.
-
-[Submitted upstream: http://lists.busybox.net/pipermail/busybox/2017-July/085633.html]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- arch/sparc/Makefile   | 1 +
- arch/sparc64/Makefile | 1 +
- 2 files changed, 2 insertions(+)
- create mode 100644 arch/sparc/Makefile
- create mode 100644 arch/sparc64/Makefile
-
-diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
-new file mode 100644
-index 0000000..4d6c5fb
---- /dev/null
-+++ b/arch/sparc/Makefile
-@@ -0,0 +1 @@
-+ARCH_FPIC = -fPIC
-diff --git a/arch/sparc64/Makefile b/arch/sparc64/Makefile
-new file mode 100644
-index 0000000..4d6c5fb
---- /dev/null
-+++ b/arch/sparc64/Makefile
-@@ -0,0 +1 @@
-+ARCH_FPIC = -fPIC
--- 
-2.9.4
-
diff --git a/package/busybox/0005-httpd-fix-handling-of-range-requests.patch b/package/busybox/0005-httpd-fix-handling-of-range-requests.patch
deleted file mode 100644
index b3ca32d75c..0000000000
--- a/package/busybox/0005-httpd-fix-handling-of-range-requests.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2b400d9b2b7309d6e479102fc3ce646e893058a5 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 18 Sep 2017 13:09:11 +0200
-Subject: [PATCH] httpd: fix handling of range requests
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- networking/httpd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/networking/httpd.c b/networking/httpd.c
-index e072f23c7..5e32fc936 100644
---- a/networking/httpd.c
-+++ b/networking/httpd.c
-@@ -2337,7 +2337,7 @@ static void handle_incoming_and_exit(const len_and_sockaddr *fromAddr)
- 			if (STRNCASECMP(iobuf, "Range:") == 0) {
- 				/* We know only bytes=NNN-[MMM] */
- 				char *s = skip_whitespace(iobuf + sizeof("Range:")-1);
--				if (is_prefixed_with(s, "bytes=") == 0) {
-+				if (is_prefixed_with(s, "bytes=")) {
- 					s += sizeof("bytes=")-1;
- 					range_start = BB_STRTOOFF(s, &s, 10);
- 					if (s[0] != '-' || range_start < 0) {
--- 
-2.11.0
-
diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 4130e6a8b6..a7aa19ea8a 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -1,39 +1,39 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.27.1
-# Sun Jul 30 15:42:11 2017
+# Busybox version: 1.28.0
+# Wed Feb  7 09:47:09 2018
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
 #
-# Busybox Settings
+# Settings
 #
 # CONFIG_DESKTOP is not set
 # CONFIG_EXTRA_COMPAT is not set
+# CONFIG_FEDORA_COMPAT is not set
 CONFIG_INCLUDE_SUSv2=y
-# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_LONG_OPTS=y
 # CONFIG_SHOW_USAGE is not set
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 # CONFIG_FEATURE_COMPRESS_USAGE is not set
-CONFIG_BUSYBOX=y
-CONFIG_FEATURE_INSTALLER=y
-# CONFIG_INSTALL_NO_USR is not set
+CONFIG_LFS=y
 # CONFIG_PAM is not set
-CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_UTMP=y
 CONFIG_FEATURE_WTMP=y
 # CONFIG_FEATURE_PIDFILE is not set
 CONFIG_PID_FILE_PATH=""
+CONFIG_BUSYBOX=y
+CONFIG_FEATURE_INSTALLER=y
+# CONFIG_INSTALL_NO_USR is not set
 CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_SUID_CONFIG is not set
 # CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
-# CONFIG_SELINUX is not set
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_SYSLOG=y
-# CONFIG_FEATURE_HAVE_RPC is not set
 CONFIG_PLATFORM_LINUX=y
 
 #
@@ -43,14 +43,15 @@ CONFIG_STATIC=y
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_LIBBUSYBOX_STATIC is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
 CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
+# CONFIG_USE_PORTABLE_CODE is not set
 
 #
 # Installation Options ("make install" behavior)
@@ -77,7 +78,7 @@ CONFIG_NO_DEBUG_LIB=y
 # CONFIG_EFENCE is not set
 
 #
-# Busybox Library Tuning
+# Library Tuning
 #
 # CONFIG_FEATURE_USE_BSS_TAIL is not set
 CONFIG_FEATURE_RTMINMAX=y
@@ -144,7 +145,6 @@ CONFIG_BZCAT=y
 # CONFIG_UNLZMA is not set
 CONFIG_LZCAT=y
 # CONFIG_LZMA is not set
-# CONFIG_FEATURE_LZMA_FAST is not set
 # CONFIG_UNXZ is not set
 CONFIG_XZCAT=y
 # CONFIG_XZ is not set
@@ -164,8 +164,8 @@ CONFIG_FEATURE_GZIP_DECOMPRESS=y
 CONFIG_UNLZOP=y
 CONFIG_LZOPCAT=y
 # CONFIG_LZOP_COMPR_HIGH is not set
-# CONFIG_RPM2CPIO is not set
 # CONFIG_RPM is not set
+# CONFIG_RPM2CPIO is not set
 # CONFIG_TAR is not set
 # CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
 # CONFIG_FEATURE_TAR_CREATE is not set
@@ -183,12 +183,14 @@ CONFIG_LZOPCAT=y
 # CONFIG_FEATURE_UNZIP_BZIP2 is not set
 # CONFIG_FEATURE_UNZIP_LZMA is not set
 # CONFIG_FEATURE_UNZIP_XZ is not set
+# CONFIG_FEATURE_LZMA_FAST is not set
 
 #
 # Coreutils
 #
 CONFIG_BASENAME=y
 CONFIG_CAT=y
+CONFIG_FEATURE_CATN=y
 CONFIG_FEATURE_CATV=y
 CONFIG_CHGRP=y
 CONFIG_CHMOD=y
@@ -219,11 +221,8 @@ CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
 CONFIG_ECHO=y
 CONFIG_FEATURE_FANCY_ECHO=y
 CONFIG_ENV=y
-# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
 # CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
 # CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_EXPR=y
 CONFIG_EXPR_MATH_SUPPORT_64=y
 CONFIG_FACTOR=y
@@ -261,12 +260,10 @@ CONFIG_SHA3SUM=y
 #
 CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
 CONFIG_MKFIFO=y
 CONFIG_MKNOD=y
 # CONFIG_MKTEMP is not set
 CONFIG_MV=y
-CONFIG_FEATURE_MV_LONG_OPTIONS=y
 CONFIG_NICE=y
 CONFIG_NL=y
 CONFIG_NOHUP=y
@@ -281,7 +278,6 @@ CONFIG_FEATURE_READLINK_FOLLOW=y
 CONFIG_REALPATH=y
 CONFIG_RM=y
 CONFIG_RMDIR=y
-# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
 CONFIG_SEQ=y
 CONFIG_SHRED=y
 # CONFIG_SHUF is not set
@@ -320,6 +316,7 @@ CONFIG_TRUNCATE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
 CONFIG_UNAME_OSNAME="GNU/Linux"
+CONFIG_BB_ARCH=y
 CONFIG_UNIQ=y
 CONFIG_UNLINK=y
 CONFIG_USLEEP=y
@@ -388,6 +385,14 @@ CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_WHICH=y
 
 #
+# klibc-utils
+#
+# CONFIG_MINIPS is not set
+CONFIG_NUKE=y
+CONFIG_RESUME=y
+CONFIG_RUN_INIT=y
+
+#
 # Editors
 #
 # CONFIG_AWK is not set
@@ -456,6 +461,8 @@ CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
 CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
 CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
 CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
+CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=y
+CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
 
 #
 # Init Utilities
@@ -489,12 +496,10 @@ CONFIG_FEATURE_SHADOWPASSWDS=y
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
 # CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
 CONFIG_ADDUSER=y
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
@@ -604,7 +609,6 @@ CONFIG_FEATURE_GETOPT_LONG=y
 # CONFIG_HD is not set
 CONFIG_XXD=y
 # CONFIG_HWCLOCK is not set
-# CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS is not set
 # CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS is not set
 # CONFIG_IONICE is not set
 # CONFIG_IPCRM is not set
@@ -644,7 +648,6 @@ CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_FEATURE_MOUNT_OTHERTAB=y
 # CONFIG_MOUNTPOINT is not set
 # CONFIG_NSENTER is not set
-# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 # CONFIG_PIVOT_ROOT is not set
 # CONFIG_RDATE is not set
 # CONFIG_RDEV is not set
@@ -658,11 +661,15 @@ CONFIG_FEATURE_MOUNT_OTHERTAB=y
 CONFIG_LINUX32=y
 CONFIG_LINUX64=y
 CONFIG_SETPRIV=y
+CONFIG_FEATURE_SETPRIV_DUMP=y
+CONFIG_FEATURE_SETPRIV_CAPABILITIES=y
+CONFIG_FEATURE_SETPRIV_CAPABILITY_NAMES=y
 # CONFIG_SETSID is not set
 CONFIG_SWAPON=y
 # CONFIG_FEATURE_SWAPON_DISCARD is not set
 # CONFIG_FEATURE_SWAPON_PRI is not set
 CONFIG_SWAPOFF=y
+CONFIG_FEATURE_SWAPONOFF_LABEL=y
 # CONFIG_SWITCH_ROOT is not set
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
@@ -678,7 +685,11 @@ CONFIG_FEATURE_UMOUNT_ALL=y
 CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
-# CONFIG_VOLUMEID is not set
+CONFIG_VOLUMEID=y
+
+#
+# Filesystem/Volume identification
+#
 # CONFIG_FEATURE_VOLUMEID_BCACHE is not set
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
@@ -692,6 +703,7 @@ CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
+CONFIG_FEATURE_VOLUMEID_MINIX=y
 # CONFIG_FEATURE_VOLUMEID_NILFS is not set
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
@@ -724,6 +736,7 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_CROND is not set
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+# CONFIG_FEATURE_CROND_SPECIAL_TIMES is not set
 CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_CRONTAB is not set
 # CONFIG_DC is not set
@@ -746,6 +759,7 @@ CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
 # CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
 # CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+CONFIG_HEXEDIT=y
 # CONFIG_I2CGET is not set
 # CONFIG_I2CSET is not set
 # CONFIG_I2CDUMP is not set
@@ -777,6 +791,7 @@ CONFIG_PARTPROBE=y
 # CONFIG_RFKILL is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
+CONFIG_SETFATTR=y
 CONFIG_SETSERIAL=y
 # CONFIG_STRINGS is not set
 # CONFIG_TIME is not set
@@ -872,6 +887,7 @@ CONFIG_FEATURE_IP_ROUTE_DIR="/etc/iproute2"
 # CONFIG_FEATURE_NAMEIF_EXTENDED is not set
 # CONFIG_NBDCLIENT is not set
 CONFIG_NC=y
+# CONFIG_NETCAT is not set
 CONFIG_NC_SERVER=y
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
@@ -899,11 +915,11 @@ CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 # CONFIG_TFTP is not set
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTPD is not set
 # CONFIG_FEATURE_TFTP_GET is not set
 # CONFIG_FEATURE_TFTP_PUT is not set
 # CONFIG_FEATURE_TFTP_BLOCKSIZE is not set
-# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
 # CONFIG_TLS is not set
 # CONFIG_TRACEROUTE is not set
@@ -922,13 +938,9 @@ CONFIG_WGET=y
 # CONFIG_FEATURE_WGET_OPENSSL is not set
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
-# CONFIG_UDHCPC6 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
 # CONFIG_UDHCPD is not set
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 CONFIG_DHCPD_LEASES_FILE=""
 # CONFIG_DUMPLEASES is not set
 # CONFIG_DHCPRELAY is not set
@@ -936,11 +948,19 @@ CONFIG_UDHCPC=y
 # CONFIG_FEATURE_UDHCPC_ARPING is not set
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+# CONFIG_UDHCPC6 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
+
+#
+# Common options for DHCP applets
+#
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=9
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 # CONFIG_FEATURE_UDHCP_8021Q is not set
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
 
 #
@@ -1020,13 +1040,11 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 CONFIG_SVC=y
 # CONFIG_SVLOGD is not set
 # CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
 # CONFIG_GETSEBOOL is not set
 # CONFIG_LOAD_POLICY is not set
 # CONFIG_MATCHPATHCON is not set
 # CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
 # CONFIG_SELINUXENABLED is not set
 # CONFIG_SESTATUS is not set
 # CONFIG_SETENFORCE is not set
@@ -1081,17 +1099,19 @@ CONFIG_HUSH_TEST=y
 CONFIG_HUSH_HELP=y
 CONFIG_HUSH_EXPORT=y
 CONFIG_HUSH_EXPORT_N=y
+CONFIG_HUSH_READONLY=y
 CONFIG_HUSH_KILL=y
 CONFIG_HUSH_WAIT=y
 CONFIG_HUSH_TRAP=y
 CONFIG_HUSH_TYPE=y
+CONFIG_HUSH_TIMES=y
 CONFIG_HUSH_READ=y
 CONFIG_HUSH_SET=y
 CONFIG_HUSH_UNSET=y
 CONFIG_HUSH_ULIMIT=y
 CONFIG_HUSH_UMASK=y
+CONFIG_HUSH_GETOPTS=y
 # CONFIG_HUSH_MEMLEAK is not set
-# CONFIG_MSH is not set
 
 #
 # Options common to all shells
@@ -1101,6 +1121,7 @@ CONFIG_FEATURE_SH_MATH_64=y
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
+CONFIG_FEATURE_SH_READ_FRAC=y
 # CONFIG_FEATURE_SH_HISTFILESIZE is not set
 
 #
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 7753a861fd..38de13d4d9 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,39 +1,39 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.27.1
-# Sun Jul 30 15:27:03 2017
+# Busybox version: 1.28.0
+# Wed Feb  7 09:44:57 2018
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
 #
-# Busybox Settings
+# Settings
 #
 CONFIG_DESKTOP=y
 # CONFIG_EXTRA_COMPAT is not set
+# CONFIG_FEDORA_COMPAT is not set
 CONFIG_INCLUDE_SUSv2=y
-# CONFIG_USE_PORTABLE_CODE is not set
+CONFIG_LONG_OPTS=y
 CONFIG_SHOW_USAGE=y
 CONFIG_FEATURE_VERBOSE_USAGE=y
 # CONFIG_FEATURE_COMPRESS_USAGE is not set
-CONFIG_BUSYBOX=y
-CONFIG_FEATURE_INSTALLER=y
-# CONFIG_INSTALL_NO_USR is not set
+CONFIG_LFS=y
 # CONFIG_PAM is not set
-CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
-# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_UTMP=y
 CONFIG_FEATURE_WTMP=y
 # CONFIG_FEATURE_PIDFILE is not set
 CONFIG_PID_FILE_PATH=""
+CONFIG_BUSYBOX=y
+CONFIG_FEATURE_INSTALLER=y
+# CONFIG_INSTALL_NO_USR is not set
 CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_SUID_CONFIG is not set
 # CONFIG_FEATURE_SUID_CONFIG_QUIET is not set
-# CONFIG_SELINUX is not set
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
+# CONFIG_SELINUX is not set
+# CONFIG_FEATURE_CLEAN_UP is not set
 CONFIG_FEATURE_SYSLOG=y
-# CONFIG_FEATURE_HAVE_RPC is not set
 CONFIG_PLATFORM_LINUX=y
 
 #
@@ -43,14 +43,15 @@ CONFIG_PLATFORM_LINUX=y
 # CONFIG_PIE is not set
 # CONFIG_NOMMU is not set
 # CONFIG_BUILD_LIBBUSYBOX is not set
+# CONFIG_FEATURE_LIBBUSYBOX_STATIC is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
-CONFIG_LFS=y
 CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
 CONFIG_EXTRA_LDFLAGS=""
 CONFIG_EXTRA_LDLIBS=""
+# CONFIG_USE_PORTABLE_CODE is not set
 
 #
 # Installation Options ("make install" behavior)
@@ -77,7 +78,7 @@ CONFIG_NO_DEBUG_LIB=y
 # CONFIG_EFENCE is not set
 
 #
-# Busybox Library Tuning
+# Library Tuning
 #
 # CONFIG_FEATURE_USE_BSS_TAIL is not set
 CONFIG_FEATURE_RTMINMAX=y
@@ -144,7 +145,6 @@ CONFIG_BZCAT=y
 CONFIG_UNLZMA=y
 CONFIG_LZCAT=y
 CONFIG_LZMA=y
-# CONFIG_FEATURE_LZMA_FAST is not set
 CONFIG_UNXZ=y
 CONFIG_XZCAT=y
 CONFIG_XZ=y
@@ -164,8 +164,8 @@ CONFIG_FEATURE_GZIP_DECOMPRESS=y
 CONFIG_UNLZOP=y
 CONFIG_LZOPCAT=y
 # CONFIG_LZOP_COMPR_HIGH is not set
-# CONFIG_RPM2CPIO is not set
 # CONFIG_RPM is not set
+# CONFIG_RPM2CPIO is not set
 CONFIG_TAR=y
 CONFIG_FEATURE_TAR_LONG_OPTIONS=y
 CONFIG_FEATURE_TAR_CREATE=y
@@ -183,12 +183,14 @@ CONFIG_FEATURE_UNZIP_CDF=y
 CONFIG_FEATURE_UNZIP_BZIP2=y
 CONFIG_FEATURE_UNZIP_LZMA=y
 CONFIG_FEATURE_UNZIP_XZ=y
+# CONFIG_FEATURE_LZMA_FAST is not set
 
 #
 # Coreutils
 #
 CONFIG_BASENAME=y
 CONFIG_CAT=y
+CONFIG_FEATURE_CATN=y
 CONFIG_FEATURE_CATV=y
 CONFIG_CHGRP=y
 CONFIG_CHMOD=y
@@ -219,11 +221,8 @@ CONFIG_FEATURE_DU_DEFAULT_BLOCKSIZE_1K=y
 CONFIG_ECHO=y
 CONFIG_FEATURE_FANCY_ECHO=y
 CONFIG_ENV=y
-# CONFIG_FEATURE_ENV_LONG_OPTIONS is not set
 # CONFIG_EXPAND is not set
-# CONFIG_FEATURE_EXPAND_LONG_OPTIONS is not set
 # CONFIG_UNEXPAND is not set
-# CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_EXPR=y
 CONFIG_EXPR_MATH_SUPPORT_64=y
 CONFIG_FACTOR=y
@@ -261,12 +260,10 @@ CONFIG_SHA3SUM=y
 #
 CONFIG_FEATURE_MD5_SHA1_SUM_CHECK=y
 CONFIG_MKDIR=y
-CONFIG_FEATURE_MKDIR_LONG_OPTIONS=y
 CONFIG_MKFIFO=y
 CONFIG_MKNOD=y
 CONFIG_MKTEMP=y
 CONFIG_MV=y
-CONFIG_FEATURE_MV_LONG_OPTIONS=y
 CONFIG_NICE=y
 CONFIG_NL=y
 CONFIG_NOHUP=y
@@ -281,7 +278,6 @@ CONFIG_FEATURE_READLINK_FOLLOW=y
 CONFIG_REALPATH=y
 CONFIG_RM=y
 CONFIG_RMDIR=y
-# CONFIG_FEATURE_RMDIR_LONG_OPTIONS is not set
 CONFIG_SEQ=y
 CONFIG_SHRED=y
 # CONFIG_SHUF is not set
@@ -320,6 +316,7 @@ CONFIG_TRUNCATE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
 CONFIG_UNAME_OSNAME="GNU/Linux"
+CONFIG_BB_ARCH=y
 CONFIG_UNIQ=y
 CONFIG_UNLINK=y
 CONFIG_USLEEP=y
@@ -392,6 +389,14 @@ CONFIG_FEATURE_START_STOP_DAEMON_FANCY=y
 CONFIG_WHICH=y
 
 #
+# klibc-utils
+#
+# CONFIG_MINIPS is not set
+CONFIG_NUKE=y
+CONFIG_RESUME=y
+CONFIG_RUN_INIT=y
+
+#
 # Editors
 #
 CONFIG_AWK=y
@@ -460,6 +465,8 @@ CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
 CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
 CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
 CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
+CONFIG_FEATURE_XARGS_SUPPORT_PARALLEL=y
+CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
 
 #
 # Init Utilities
@@ -493,12 +500,10 @@ CONFIG_FEATURE_SHADOWPASSWDS=y
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
 CONFIG_ADDGROUP=y
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
 # CONFIG_ADD_SHELL is not set
 # CONFIG_REMOVE_SHELL is not set
 CONFIG_ADDUSER=y
-# CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
@@ -608,7 +613,6 @@ CONFIG_HEXDUMP=y
 # CONFIG_HD is not set
 CONFIG_XXD=y
 CONFIG_HWCLOCK=y
-CONFIG_FEATURE_HWCLOCK_LONG_OPTIONS=y
 CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=y
 # CONFIG_IONICE is not set
 CONFIG_IPCRM=y
@@ -648,7 +652,6 @@ CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_FEATURE_MOUNT_OTHERTAB=y
 CONFIG_MOUNTPOINT=y
 # CONFIG_NSENTER is not set
-# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
@@ -662,11 +665,15 @@ CONFIG_SETARCH=y
 CONFIG_LINUX32=y
 CONFIG_LINUX64=y
 CONFIG_SETPRIV=y
+CONFIG_FEATURE_SETPRIV_DUMP=y
+CONFIG_FEATURE_SETPRIV_CAPABILITIES=y
+CONFIG_FEATURE_SETPRIV_CAPABILITY_NAMES=y
 CONFIG_SETSID=y
 CONFIG_SWAPON=y
 # CONFIG_FEATURE_SWAPON_DISCARD is not set
 # CONFIG_FEATURE_SWAPON_PRI is not set
 CONFIG_SWAPOFF=y
+CONFIG_FEATURE_SWAPONOFF_LABEL=y
 CONFIG_SWITCH_ROOT=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
@@ -700,6 +707,7 @@ CONFIG_FEATURE_VOLUMEID_FAT=y
 # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
 # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
 # CONFIG_FEATURE_VOLUMEID_LUKS is not set
+CONFIG_FEATURE_VOLUMEID_MINIX=y
 # CONFIG_FEATURE_VOLUMEID_NILFS is not set
 # CONFIG_FEATURE_VOLUMEID_NTFS is not set
 # CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
@@ -732,6 +740,7 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 CONFIG_CROND=y
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+CONFIG_FEATURE_CROND_SPECIAL_TIMES=y
 CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
 CONFIG_CRONTAB=y
 CONFIG_DC=y
@@ -754,6 +763,7 @@ CONFIG_FEATURE_HDPARM_GET_IDENTITY=y
 # CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET is not set
 # CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF is not set
 # CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA is not set
+CONFIG_HEXEDIT=y
 CONFIG_I2CGET=y
 CONFIG_I2CSET=y
 CONFIG_I2CDUMP=y
@@ -785,6 +795,7 @@ CONFIG_PARTPROBE=y
 # CONFIG_RFKILL is not set
 CONFIG_RUNLEVEL=y
 # CONFIG_RX is not set
+CONFIG_SETFATTR=y
 CONFIG_SETSERIAL=y
 CONFIG_STRINGS=y
 CONFIG_TIME=y
@@ -880,6 +891,7 @@ CONFIG_NAMEIF=y
 # CONFIG_FEATURE_NAMEIF_EXTENDED is not set
 # CONFIG_NBDCLIENT is not set
 # CONFIG_NC is not set
+# CONFIG_NETCAT is not set
 # CONFIG_NC_SERVER is not set
 # CONFIG_NC_EXTRA is not set
 # CONFIG_NC_110_COMPAT is not set
@@ -907,6 +919,7 @@ CONFIG_FEATURE_TELNET_WIDTH=y
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
+# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTPD is not set
 
 #
@@ -915,7 +928,6 @@ CONFIG_TFTP=y
 CONFIG_FEATURE_TFTP_GET=y
 CONFIG_FEATURE_TFTP_PUT=y
 CONFIG_FEATURE_TFTP_BLOCKSIZE=y
-# CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
 # CONFIG_TFTP_DEBUG is not set
 # CONFIG_TLS is not set
 CONFIG_TRACEROUTE=y
@@ -934,13 +946,9 @@ CONFIG_FEATURE_WGET_TIMEOUT=y
 # CONFIG_FEATURE_WGET_OPENSSL is not set
 # CONFIG_WHOIS is not set
 # CONFIG_ZCIP is not set
-# CONFIG_UDHCPC6 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
-# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
 # CONFIG_UDHCPD is not set
-# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 # CONFIG_FEATURE_UDHCPD_BASE_IP_ON_MAC is not set
+# CONFIG_FEATURE_UDHCPD_WRITE_LEASES_EARLY is not set
 CONFIG_DHCPD_LEASES_FILE=""
 # CONFIG_DUMPLEASES is not set
 # CONFIG_DHCPRELAY is not set
@@ -948,11 +956,19 @@ CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
 CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
+# CONFIG_UDHCPC6 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
+# CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
+
+#
+# Common options for DHCP applets
+#
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
+CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
 
 #
@@ -1032,13 +1048,11 @@ CONFIG_SV_DEFAULT_SERVICE_DIR=""
 CONFIG_SVC=y
 # CONFIG_SVLOGD is not set
 # CONFIG_CHCON is not set
-# CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
 # CONFIG_GETSEBOOL is not set
 # CONFIG_LOAD_POLICY is not set
 # CONFIG_MATCHPATHCON is not set
 # CONFIG_RUNCON is not set
-# CONFIG_FEATURE_RUNCON_LONG_OPTIONS is not set
 # CONFIG_SELINUXENABLED is not set
 # CONFIG_SESTATUS is not set
 # CONFIG_SETENFORCE is not set
@@ -1093,17 +1107,19 @@ CONFIG_ASH_CMDCMD=y
 # CONFIG_HUSH_HELP is not set
 # CONFIG_HUSH_EXPORT is not set
 # CONFIG_HUSH_EXPORT_N is not set
+# CONFIG_HUSH_READONLY is not set
 # CONFIG_HUSH_KILL is not set
 # CONFIG_HUSH_WAIT is not set
 # CONFIG_HUSH_TRAP is not set
 # CONFIG_HUSH_TYPE is not set
+# CONFIG_HUSH_TIMES is not set
 # CONFIG_HUSH_READ is not set
 # CONFIG_HUSH_SET is not set
 # CONFIG_HUSH_UNSET is not set
 # CONFIG_HUSH_ULIMIT is not set
 # CONFIG_HUSH_UMASK is not set
+# CONFIG_HUSH_GETOPTS is not set
 # CONFIG_HUSH_MEMLEAK is not set
-# CONFIG_MSH is not set
 
 #
 # Options common to all shells
@@ -1113,6 +1129,7 @@ CONFIG_FEATURE_SH_MATH_64=y
 CONFIG_FEATURE_SH_EXTRA_QUIET=y
 # CONFIG_FEATURE_SH_STANDALONE is not set
 # CONFIG_FEATURE_SH_NOFORK is not set
+CONFIG_FEATURE_SH_READ_FRAC=y
 # CONFIG_FEATURE_SH_HISTFILESIZE is not set
 
 #
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 3e1956d0a0..4ca3936ada 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.27.2.tar.bz2.sign
-md5	476186f4bab81781dab2369bfd42734e	busybox-1.27.2.tar.bz2
-sha1	11669e223cc38de646ce26080e91ca29b8d42ad9	busybox-1.27.2.tar.bz2
+# From https://busybox.net/downloads/busybox-1.28.0.tar.bz2.sign
+md5	b119b8decda796ab5cee5478dc9c642c	busybox-1.28.0.tar.bz2
+sha1	a25e9a33e830e307c2a446ca234531049dd427f2	busybox-1.28.0.tar.bz2
 # License files, locally calculated
 sha256	bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548	LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d0bbd3fd6e..73353baeda 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.27.2
+BUSYBOX_VERSION = 1.28.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0
