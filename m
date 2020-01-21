From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Jan 2020 22:35:46 +0100
Subject: [Buildroot] [PATCH] package/busybox: update minimal .config
 file with Busybox 1.31.1
In-Reply-To: <20200120075539.3071-2-joerg.krause@embedded.rocks>
References: <20200120075539.3071-1-joerg.krause@embedded.rocks>
 <20200120075539.3071-2-joerg.krause@embedded.rocks>
Message-ID: <565a5419-4c16-c1c4-994f-387f4ce4d200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/01/2020 08:55, J?rg Krause wrote:
> Commit 5530674e0ce21a927735ff77602a9e5854363751 bumped the version, but
> did not update the minimal .config file.
> 
> Update the configuration file by loading the busybox-iminimal.config file
> and saving it back.

 That is probably not the way the minimal.config should be updated. An
'oldnoconfig' would be more appropriate, but unfortunately busybox doesn't
support that.

> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/busybox/busybox-minimal.config | 52 +++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
> index a7aa19ea8a..6107edbdea 100644
> --- a/package/busybox/busybox-minimal.config
> +++ b/package/busybox/busybox-minimal.config
> @@ -1,7 +1,7 @@
>  #
>  # Automatically generated make config: don't edit
> -# Busybox version: 1.28.0
> -# Wed Feb  7 09:47:09 2018
> +# Busybox version: 1.31.1
> +# Tue Jan 14 10:15:13 2020
>  #
>  CONFIG_HAVE_DOT_CONFIG=y
>  
> @@ -24,6 +24,7 @@ CONFIG_FEATURE_WTMP=y
>  # CONFIG_FEATURE_PIDFILE is not set
>  CONFIG_PID_FILE_PATH=""
>  CONFIG_BUSYBOX=y
> +CONFIG_FEATURE_SHOW_SCRIPT=y
>  CONFIG_FEATURE_INSTALLER=y
>  # CONFIG_INSTALL_NO_USR is not set
>  CONFIG_FEATURE_SUID=y
> @@ -33,6 +34,7 @@ CONFIG_FEATURE_SUID=y
>  CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
>  # CONFIG_SELINUX is not set
>  # CONFIG_FEATURE_CLEAN_UP is not set
> +CONFIG_FEATURE_SYSLOG_INFO=y

 This one for instance adds 200 bytes to the size and probably isn't needed in a
minimal situation.

>  CONFIG_FEATURE_SYSLOG=y
>  CONFIG_PLATFORM_LINUX=y
>  
> @@ -52,6 +54,7 @@ CONFIG_EXTRA_CFLAGS=""
>  CONFIG_EXTRA_LDFLAGS=""
>  CONFIG_EXTRA_LDLIBS=""
>  # CONFIG_USE_PORTABLE_CODE is not set
> +CONFIG_STACK_OPTIMIZATION_386=y

 But then this one you probably *do* want to enable...

 Really, I think it would be done with 'make oldconfig' and considering each
option on its own merit.


 Regards,
 Arnout

>  
>  #
>  # Installation Options ("make install" behavior)
> @@ -81,7 +84,9 @@ CONFIG_NO_DEBUG_LIB=y
>  # Library Tuning
>  #
>  # CONFIG_FEATURE_USE_BSS_TAIL is not set
> +CONFIG_FLOAT_DURATION=y
>  CONFIG_FEATURE_RTMINMAX=y
> +CONFIG_FEATURE_RTMINMAX_USE_LIBC_DEFINITIONS=y
>  CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
>  # CONFIG_FEATURE_BUFFERS_GO_ON_STACK is not set
>  # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
> @@ -90,6 +95,7 @@ CONFIG_MD5_SMALL=1
>  CONFIG_SHA3_SMALL=1
>  # CONFIG_FEATURE_FAST_TOP is not set
>  # CONFIG_FEATURE_ETC_NETWORKS is not set
> +# CONFIG_FEATURE_ETC_SERVICES is not set
>  CONFIG_FEATURE_EDITING=y
>  CONFIG_FEATURE_EDITING_MAX_LEN=1024
>  CONFIG_FEATURE_EDITING_VI=y
> @@ -100,6 +106,7 @@ CONFIG_FEATURE_REVERSE_SEARCH=y
>  CONFIG_FEATURE_TAB_COMPLETION=y
>  # CONFIG_FEATURE_USERNAME_COMPLETION is not set
>  CONFIG_FEATURE_EDITING_FANCY_PROMPT=y
> +CONFIG_FEATURE_EDITING_WINCH=y
>  # CONFIG_FEATURE_EDITING_ASK_TERMINAL is not set
>  # CONFIG_LOCALE_SUPPORT is not set
>  # CONFIG_UNICODE_SUPPORT is not set
> @@ -149,6 +156,7 @@ CONFIG_LZCAT=y
>  CONFIG_XZCAT=y
>  # CONFIG_XZ is not set
>  # CONFIG_BZIP2 is not set
> +CONFIG_BZIP2_SMALL=0
>  CONFIG_FEATURE_BZIP2_DECOMPRESS=y
>  # CONFIG_CPIO is not set
>  # CONFIG_FEATURE_CPIO_O is not set
> @@ -201,6 +209,7 @@ CONFIG_CKSUM=y
>  # CONFIG_COMM is not set
>  CONFIG_CP=y
>  # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
> +# CONFIG_FEATURE_CP_REFLINK is not set
>  CONFIG_CUT=y
>  CONFIG_DATE=y
>  CONFIG_FEATURE_DATE_ISOFMT=y
> @@ -228,7 +237,6 @@ CONFIG_EXPR_MATH_SUPPORT_64=y
>  CONFIG_FACTOR=y
>  CONFIG_FALSE=y
>  CONFIG_FOLD=y
> -# CONFIG_FSYNC is not set
>  CONFIG_HEAD=y
>  CONFIG_FEATURE_FANCY_HEAD=y
>  CONFIG_HOSTID=y
> @@ -283,9 +291,9 @@ CONFIG_SHRED=y
>  # CONFIG_SHUF is not set
>  CONFIG_SLEEP=y
>  CONFIG_FEATURE_FANCY_SLEEP=y
> -CONFIG_FEATURE_FLOAT_SLEEP=y
>  CONFIG_SORT=y
>  CONFIG_FEATURE_SORT_BIG=y
> +# CONFIG_FEATURE_SORT_OPTIMIZE_MEMORY is not set
>  # CONFIG_SPLIT is not set
>  # CONFIG_FEATURE_SPLIT_FANCY is not set
>  # CONFIG_STAT is not set
> @@ -295,6 +303,7 @@ CONFIG_STTY=y
>  # CONFIG_SUM is not set
>  CONFIG_SYNC=y
>  # CONFIG_FEATURE_SYNC_FANCY is not set
> +# CONFIG_FSYNC is not set
>  # CONFIG_TAC is not set
>  CONFIG_TAIL=y
>  CONFIG_FEATURE_FANCY_TAIL=y
> @@ -433,6 +442,7 @@ CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=0
>  # CONFIG_FEATURE_FIND_MMIN is not set
>  # CONFIG_FEATURE_FIND_PERM is not set
>  # CONFIG_FEATURE_FIND_TYPE is not set
> +# CONFIG_FEATURE_FIND_EXECUTABLE is not set
>  # CONFIG_FEATURE_FIND_XDEV is not set
>  # CONFIG_FEATURE_FIND_MAXDEPTH is not set
>  # CONFIG_FEATURE_FIND_NEWER is not set
> @@ -446,6 +456,7 @@ CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=0
>  # CONFIG_FEATURE_FIND_PAREN is not set
>  # CONFIG_FEATURE_FIND_SIZE is not set
>  # CONFIG_FEATURE_FIND_PRUNE is not set
> +# CONFIG_FEATURE_FIND_QUIT is not set
>  # CONFIG_FEATURE_FIND_DELETE is not set
>  # CONFIG_FEATURE_FIND_PATH is not set
>  # CONFIG_FEATURE_FIND_REGEX is not set
> @@ -473,6 +484,7 @@ CONFIG_FEATURE_XARGS_SUPPORT_ARGS_FILE=y
>  CONFIG_HALT=y
>  CONFIG_POWEROFF=y
>  CONFIG_REBOOT=y
> +CONFIG_FEATURE_WAIT_FOR_INIT=y
>  # CONFIG_FEATURE_CALL_TELINIT is not set
>  CONFIG_TELINIT_PATH=""
>  CONFIG_INIT=y
> @@ -624,6 +636,7 @@ CONFIG_XXD=y
>  # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
>  # CONFIG_FEATURE_MDEV_EXEC is not set
>  # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
> +# CONFIG_FEATURE_MDEV_DAEMON is not set
>  CONFIG_MESG=y
>  CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP=y
>  CONFIG_MKE2FS=y
> @@ -647,6 +660,8 @@ CONFIG_FEATURE_MOUNT_FLAGS=y
>  CONFIG_FEATURE_MOUNT_FSTAB=y
>  CONFIG_FEATURE_MOUNT_OTHERTAB=y
>  # CONFIG_MOUNTPOINT is not set
> +CONFIG_NOLOGIN=y
> +CONFIG_NOLOGIN_DEPENDENCIES=y
>  # CONFIG_NSENTER is not set
>  # CONFIG_PIVOT_ROOT is not set
>  # CONFIG_RDATE is not set
> @@ -700,6 +715,7 @@ CONFIG_VOLUMEID=y
>  # CONFIG_FEATURE_VOLUMEID_HFS is not set
>  # CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
>  # CONFIG_FEATURE_VOLUMEID_JFS is not set
> +# CONFIG_FEATURE_VOLUMEID_LFS is not set
>  # CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
>  # CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
>  # CONFIG_FEATURE_VOLUMEID_LUKS is not set
> @@ -721,6 +737,12 @@ CONFIG_FEATURE_VOLUMEID_MINIX=y
>  # CONFIG_ADJTIMEX is not set
>  # CONFIG_BBCONFIG is not set
>  # CONFIG_FEATURE_COMPRESS_BBCONFIG is not set
> +CONFIG_BC=y
> +# CONFIG_DC is not set
> +CONFIG_FEATURE_DC_BIG=y
> +# CONFIG_FEATURE_DC_LIBM is not set
> +CONFIG_FEATURE_BC_INTERACTIVE=y
> +CONFIG_FEATURE_BC_LONG_OPTIONS=y
>  # CONFIG_BEEP is not set
>  CONFIG_FEATURE_BEEP_FREQ=0
>  CONFIG_FEATURE_BEEP_LENGTH_MS=0
> @@ -739,8 +761,6 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
>  # CONFIG_FEATURE_CROND_SPECIAL_TIMES is not set
>  CONFIG_FEATURE_CROND_DIR=""
>  # CONFIG_CRONTAB is not set
> -# CONFIG_DC is not set
> -# CONFIG_FEATURE_DC_LIBM is not set
>  # CONFIG_DEVFSD is not set
>  # CONFIG_DEVFSD_MODLOAD is not set
>  # CONFIG_DEVFSD_FG_NP is not set
> @@ -764,6 +784,7 @@ CONFIG_HEXEDIT=y
>  # CONFIG_I2CSET is not set
>  # CONFIG_I2CDUMP is not set
>  # CONFIG_I2CDETECT is not set
> +CONFIG_I2CTRANSFER=y
>  # CONFIG_INOTIFYD is not set
>  # CONFIG_LESS is not set
>  CONFIG_FEATURE_LESS_MAXLINES=0
> @@ -776,6 +797,8 @@ CONFIG_FEATURE_LESS_MAXLINES=0
>  # CONFIG_FEATURE_LESS_ASK_TERMINAL is not set
>  # CONFIG_FEATURE_LESS_DASHCMD is not set
>  # CONFIG_FEATURE_LESS_LINENUMS is not set
> +# CONFIG_FEATURE_LESS_RAW is not set
> +# CONFIG_FEATURE_LESS_ENV is not set
>  CONFIG_LSSCSI=y
>  # CONFIG_MAKEDEVS is not set
>  # CONFIG_FEATURE_MAKEDEVS_LEAF is not set
> @@ -795,6 +818,7 @@ CONFIG_SETFATTR=y
>  CONFIG_SETSERIAL=y
>  # CONFIG_STRINGS is not set
>  # CONFIG_TIME is not set
> +CONFIG_TS=y
>  # CONFIG_TTYSIZE is not set
>  # CONFIG_UBIRENAME is not set
>  # CONFIG_UBIATTACH is not set
> @@ -813,6 +837,7 @@ CONFIG_SETSERIAL=y
>  # CONFIG_FEATURE_UNIX_LOCAL is not set
>  # CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
>  # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
> +# CONFIG_FEATURE_TLS_SHA1 is not set
>  # CONFIG_ARP is not set
>  # CONFIG_ARPING is not set
>  # CONFIG_BRCTL is not set
> @@ -895,9 +920,12 @@ CONFIG_NETSTAT=y
>  # CONFIG_FEATURE_NETSTAT_WIDE is not set
>  CONFIG_FEATURE_NETSTAT_PRG=y
>  # CONFIG_NSLOOKUP is not set
> +# CONFIG_FEATURE_NSLOOKUP_BIG is not set
> +# CONFIG_FEATURE_NSLOOKUP_LONG_OPTIONS is not set
>  # CONFIG_NTPD is not set
>  # CONFIG_FEATURE_NTPD_SERVER is not set
>  # CONFIG_FEATURE_NTPD_CONF is not set
> +# CONFIG_FEATURE_NTP_AUTH is not set
>  CONFIG_PING=y
>  # CONFIG_PING6 is not set
>  # CONFIG_FEATURE_FANCY_PING is not set
> @@ -905,6 +933,8 @@ CONFIG_PING=y
>  CONFIG_ROUTE=y
>  # CONFIG_SLATTACH is not set
>  # CONFIG_SSL_CLIENT is not set
> +CONFIG_TC=y
> +CONFIG_FEATURE_TC_INGRESS=y
>  # CONFIG_TCPSVD is not set
>  # CONFIG_UDPSVD is not set
>  CONFIG_TELNET=y
> @@ -916,6 +946,7 @@ CONFIG_FEATURE_TELNET_WIDTH=y
>  # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
>  # CONFIG_TFTP is not set
>  # CONFIG_FEATURE_TFTP_PROGRESS_BAR is not set
> +# CONFIG_FEATURE_TFTP_HPA_COMPAT is not set
>  # CONFIG_TFTPD is not set
>  # CONFIG_FEATURE_TFTP_GET is not set
>  # CONFIG_FEATURE_TFTP_PUT is not set
> @@ -952,6 +983,7 @@ CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
>  # CONFIG_FEATURE_UDHCPC6_RFC3646 is not set
>  # CONFIG_FEATURE_UDHCPC6_RFC4704 is not set
>  # CONFIG_FEATURE_UDHCPC6_RFC4833 is not set
> +# CONFIG_FEATURE_UDHCPC6_RFC5970 is not set
>  
>  #
>  # Common options for DHCP applets
> @@ -1038,6 +1070,7 @@ CONFIG_FEATURE_PS_LONG=y
>  # CONFIG_SV is not set
>  CONFIG_SV_DEFAULT_SERVICE_DIR=""
>  CONFIG_SVC=y
> +CONFIG_SVOK=y
>  # CONFIG_SVLOGD is not set
>  # CONFIG_CHCON is not set
>  # CONFIG_GETENFORCE is not set
> @@ -1066,6 +1099,8 @@ CONFIG_BASH_IS_NONE=y
>  # CONFIG_ASH_OPTIMIZE_FOR_SIZE is not set
>  # CONFIG_ASH_INTERNAL_GLOB is not set
>  # CONFIG_ASH_BASH_COMPAT is not set
> +# CONFIG_ASH_BASH_SOURCE_CURDIR is not set
> +# CONFIG_ASH_BASH_NOT_FOUND_HOOK is not set
>  # CONFIG_ASH_JOB_CONTROL is not set
>  # CONFIG_ASH_ALIAS is not set
>  # CONFIG_ASH_RANDOM_SUPPORT is not set
> @@ -1082,6 +1117,8 @@ CONFIG_BASH_IS_NONE=y
>  CONFIG_HUSH=y
>  CONFIG_HUSH_BASH_COMPAT=y
>  CONFIG_HUSH_BRACE_EXPANSION=y
> +CONFIG_HUSH_LINENO_VAR=y
> +# CONFIG_HUSH_BASH_SOURCE_CURDIR is not set
>  CONFIG_HUSH_INTERACTIVE=y
>  CONFIG_HUSH_SAVEHISTORY=y
>  CONFIG_HUSH_JOB=y
> @@ -1102,6 +1139,7 @@ CONFIG_HUSH_EXPORT_N=y
>  CONFIG_HUSH_READONLY=y
>  CONFIG_HUSH_KILL=y
>  CONFIG_HUSH_WAIT=y
> +CONFIG_HUSH_COMMAND=y
>  CONFIG_HUSH_TRAP=y
>  CONFIG_HUSH_TYPE=y
>  CONFIG_HUSH_TIMES=y
> @@ -1118,11 +1156,13 @@ CONFIG_HUSH_GETOPTS=y
>  #
>  CONFIG_FEATURE_SH_MATH=y
>  CONFIG_FEATURE_SH_MATH_64=y
> +CONFIG_FEATURE_SH_MATH_BASE=y
>  CONFIG_FEATURE_SH_EXTRA_QUIET=y
>  # CONFIG_FEATURE_SH_STANDALONE is not set
>  # CONFIG_FEATURE_SH_NOFORK is not set
>  CONFIG_FEATURE_SH_READ_FRAC=y
>  # CONFIG_FEATURE_SH_HISTFILESIZE is not set
> +CONFIG_FEATURE_SH_EMBEDDED_SCRIPTS=y
>  
>  #
>  # System Logging Utilities
> 
