From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jun 2016 10:32:53 +0200
Subject: [Buildroot] [git commit] busybox: bump to version 1.25.0
Message-ID: <20160622083404.BC5328213A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81cbdbaee8c1e924597891fee14de1e678e73540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also drop upstream patches.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/0003-ash-recursive-heredocs.patch |  84 ---------------
 package/busybox/0004-fix-CVE-2016-2147.patch      |  73 -------------
 package/busybox/0005-fix-CVE-2016-2148.patch      |  56 ----------
 package/busybox/busybox-minimal.config            |  67 +++++++-----
 package/busybox/busybox.config                    | 121 +++++++++++++---------
 package/busybox/busybox.hash                      |   6 +-
 package/busybox/busybox.mk                        |   2 +-
 7 files changed, 118 insertions(+), 291 deletions(-)

diff --git a/package/busybox/0003-ash-recursive-heredocs.patch b/package/busybox/0003-ash-recursive-heredocs.patch
deleted file mode 100644
index f054a90..0000000
--- a/package/busybox/0003-ash-recursive-heredocs.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 4194c2875310c13ee3ca2bb0e1aea6a2ae67c55a Mon Sep 17 00:00:00 2001
-From: Ron Yorston <rmy@pobox.com>
-Date: Thu, 29 Oct 2015 16:44:56 +0000
-Subject: [PATCH] ash: fix error during recursive processing of here document
-
-Save the value of the checkkwd flag to prevent it being clobbered
-during recursion.
-
-Based on commit ec2c84d from git://git.kernel.org/pub/scm/utils/dash/dash.git
-by Herbert Xu.
-
-function                                             old     new   delta
-readtoken                                            190     203     +13
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 1/0 up/down: 13/0)               Total: 13 bytes
-
-Signed-off-by: Ron Yorston <rmy@pobox.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-(cherry picked from commit 713f07d906d9171953be0c12e2369869855b6ca6)
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- shell/ash.c                               | 5 +++--
- shell/ash_test/ash-heredoc/heredoc3.right | 1 +
- shell/ash_test/ash-heredoc/heredoc3.tests | 9 +++++++++
- 3 files changed, 13 insertions(+), 2 deletions(-)
- create mode 100644 shell/ash_test/ash-heredoc/heredoc3.right
- create mode 100755 shell/ash_test/ash-heredoc/heredoc3.tests
-
-diff --git a/shell/ash.c b/shell/ash.c
-index 8a1628e..256e933 100644
---- a/shell/ash.c
-+++ b/shell/ash.c
-@@ -11893,6 +11893,7 @@ static int
- readtoken(void)
- {
- 	int t;
-+	int kwd = checkkwd;
- #if DEBUG
- 	smallint alreadyseen = tokpushback;
- #endif
-@@ -11906,7 +11907,7 @@ readtoken(void)
- 	/*
- 	 * eat newlines
- 	 */
--	if (checkkwd & CHKNL) {
-+	if (kwd & CHKNL) {
- 		while (t == TNL) {
- 			parseheredoc();
- 			t = xxreadtoken();
-@@ -11920,7 +11921,7 @@ readtoken(void)
- 	/*
- 	 * check for keywords
- 	 */
--	if (checkkwd & CHKKWD) {
-+	if (kwd & CHKKWD) {
- 		const char *const *pp;
- 
- 		pp = findkwd(wordtext);
-diff --git a/shell/ash_test/ash-heredoc/heredoc3.right b/shell/ash_test/ash-heredoc/heredoc3.right
-new file mode 100644
-index 0000000..ce01362
---- /dev/null
-+++ b/shell/ash_test/ash-heredoc/heredoc3.right
-@@ -0,0 +1 @@
-+hello
-diff --git a/shell/ash_test/ash-heredoc/heredoc3.tests b/shell/ash_test/ash-heredoc/heredoc3.tests
-new file mode 100755
-index 0000000..96c227c
---- /dev/null
-+++ b/shell/ash_test/ash-heredoc/heredoc3.tests
-@@ -0,0 +1,9 @@
-+echo hello >greeting
-+cat <<EOF &&
-+$(cat greeting)
-+EOF
-+{
-+	echo $?
-+	cat greeting
-+} >/dev/null
-+rm greeting
--- 
-2.7.4
-
diff --git a/package/busybox/0004-fix-CVE-2016-2147.patch b/package/busybox/0004-fix-CVE-2016-2147.patch
deleted file mode 100644
index bd1e47e..0000000
--- a/package/busybox/0004-fix-CVE-2016-2147.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 3c4de6e36c4d387a648622e7b828a05f2b1b47e6 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 26 Feb 2016 15:54:56 +0100
-Subject: [PATCH] udhcpc: fix OPTION_6RD parsing (could overflow its malloced
- buffer)
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-(cherry picked from commit 352f79acbd759c14399e39baef21fc4ffe180ac2)
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- networking/udhcp/common.c | 15 +++++++++++++--
- networking/udhcp/dhcpc.c  |  4 ++--
- 2 files changed, 15 insertions(+), 4 deletions(-)
-
-diff --git a/networking/udhcp/common.c b/networking/udhcp/common.c
-index bc41c8d..680852c 100644
---- a/networking/udhcp/common.c
-+++ b/networking/udhcp/common.c
-@@ -142,7 +142,7 @@ const char dhcp_option_strings[] ALIGN1 =
-  * udhcp_str2optset: to determine how many bytes to allocate.
-  * xmalloc_optname_optval: to estimate string length
-  * from binary option length: (option[LEN] / dhcp_option_lengths[opt_type])
-- * is the number of elements, multiply in by one element's string width
-+ * is the number of elements, multiply it by one element's string width
-  * (len_of_option_as_string[opt_type]) and you know how wide string you need.
-  */
- const uint8_t dhcp_option_lengths[] ALIGN1 = {
-@@ -162,7 +162,18 @@ const uint8_t dhcp_option_lengths[] ALIGN1 = {
- 	[OPTION_S32] =     4,
- 	/* Just like OPTION_STRING, we use minimum length here */
- 	[OPTION_STATIC_ROUTES] = 5,
--	[OPTION_6RD] =    22,  /* ignored by udhcp_str2optset */
-+	[OPTION_6RD] =    12,  /* ignored by udhcp_str2optset */
-+	/* The above value was chosen as follows:
-+	 * len_of_option_as_string[] for this option is >60: it's a string of the form
-+	 * "32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 ".
-+	 * Each additional ipv4 address takes 4 bytes in binary option and appends
-+	 * another "255.255.255.255 " 16-byte string. We can set [OPTION_6RD] = 4
-+	 * but this severely overestimates string length: instead of 16 bytes,
-+	 * it adds >60 for every 4 bytes in binary option.
-+	 * We cheat and declare here that option is in units of 12 bytes.
-+	 * This adds more than 60 bytes for every three ipv4 addresses - more than enough.
-+	 * (Even 16 instead of 12 should work, but let's be paranoid).
-+	 */
- };
- 
- 
-diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
-index 915f659..2332b57 100644
---- a/networking/udhcp/dhcpc.c
-+++ b/networking/udhcp/dhcpc.c
-@@ -113,7 +113,7 @@ static const uint8_t len_of_option_as_string[] = {
- 	[OPTION_IP              ] = sizeof("255.255.255.255 "),
- 	[OPTION_IP_PAIR         ] = sizeof("255.255.255.255 ") * 2,
- 	[OPTION_STATIC_ROUTES   ] = sizeof("255.255.255.255/32 255.255.255.255 "),
--	[OPTION_6RD             ] = sizeof("32 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
-+	[OPTION_6RD             ] = sizeof("132 128 ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff 255.255.255.255 "),
- 	[OPTION_STRING          ] = 1,
- 	[OPTION_STRING_HOST     ] = 1,
- #if ENABLE_FEATURE_UDHCP_RFC3397
-@@ -220,7 +220,7 @@ static NOINLINE char *xmalloc_optname_optval(uint8_t *option, const struct dhcp_
- 	type = optflag->flags & OPTION_TYPE_MASK;
- 	optlen = dhcp_option_lengths[type];
- 	upper_length = len_of_option_as_string[type]
--		* ((unsigned)(len + optlen - 1) / (unsigned)optlen);
-+		* ((unsigned)(len + optlen) / (unsigned)optlen);
- 
- 	dest = ret = xmalloc(upper_length + strlen(opt_name) + 2);
- 	dest += sprintf(ret, "%s=", opt_name);
--- 
-2.7.4
-
diff --git a/package/busybox/0005-fix-CVE-2016-2148.patch b/package/busybox/0005-fix-CVE-2016-2148.patch
deleted file mode 100644
index 93eff48..0000000
--- a/package/busybox/0005-fix-CVE-2016-2148.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3a76bb5136d05f94ee62e377aa723e63444912c7 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 10 Mar 2016 11:47:58 +0100
-Subject: [PATCH] udhcp: fix a SEGV on malformed RFC1035-encoded domain name
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-(cherry picked from commit d474ffc68290e0a83651c4432eeabfa62cd51e87)
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- networking/udhcp/domain_codec.c | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/networking/udhcp/domain_codec.c b/networking/udhcp/domain_codec.c
-index c1325d8..8429367 100644
---- a/networking/udhcp/domain_codec.c
-+++ b/networking/udhcp/domain_codec.c
-@@ -63,11 +63,10 @@ char* FAST_FUNC dname_dec(const uint8_t *cstr, int clen, const char *pre)
- 				if (crtpos + *c + 1 > clen) /* label too long? abort */
- 					return NULL;
- 				if (dst)
--					memcpy(dst + len, c + 1, *c);
-+					/* \3com ---> "com." */
-+					((char*)mempcpy(dst + len, c + 1, *c))[0] = '.';
- 				len += *c + 1;
- 				crtpos += *c + 1;
--				if (dst)
--					dst[len - 1] = '.';
- 			} else {
- 				/* NUL: end of current domain name */
- 				if (retpos == 0) {
-@@ -78,7 +77,10 @@ char* FAST_FUNC dname_dec(const uint8_t *cstr, int clen, const char *pre)
- 					crtpos = retpos;
- 					retpos = depth = 0;
- 				}
--				if (dst)
-+				if (dst && len != 0)
-+					/* \4host\3com\0\4host and we are at \0:
-+					 * \3com was converted to "com.", change dot to space.
-+					 */
- 					dst[len - 1] = ' ';
- 			}
- 
-@@ -228,6 +230,9 @@ int main(int argc, char **argv)
- 	int len;
- 	uint8_t *encoded;
- 
-+        uint8_t str[6] = { 0x00, 0x00, 0x02, 0x65, 0x65, 0x00 };
-+        printf("NUL:'%s'\n",   dname_dec(str, 6, ""));
-+
- #define DNAME_DEC(encoded,pre) dname_dec((uint8_t*)(encoded), sizeof(encoded), (pre))
- 	printf("'%s'\n",       DNAME_DEC("\4host\3com\0", "test1:"));
- 	printf("test2:'%s'\n", DNAME_DEC("\4host\3com\0\4host\3com\0", ""));
--- 
-2.7.4
-
diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 368ce8e..a394a1e 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.24.2
-# Mon May  9 18:42:38 2016
+# Busybox version: 1.25.0
+# Tue Jun 21 20:21:32 2016
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -23,6 +23,7 @@ CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 # CONFIG_SHOW_USAGE is not set
 # CONFIG_FEATURE_VERBOSE_USAGE is not set
 # CONFIG_FEATURE_COMPRESS_USAGE is not set
+CONFIG_BUSYBOX=y
 CONFIG_FEATURE_INSTALLER=y
 # CONFIG_INSTALL_NO_USR is not set
 # CONFIG_LOCALE_SUPPORT is not set
@@ -75,6 +76,7 @@ CONFIG_EXTRA_LDLIBS=""
 #
 # CONFIG_DEBUG is not set
 # CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_DEBUG_SANITIZE is not set
 # CONFIG_UNIT_TEST is not set
 # CONFIG_WERROR is not set
 CONFIG_NO_DEBUG_LIB=y
@@ -96,7 +98,7 @@ CONFIG_PREFIX="./_install"
 #
 # Busybox Library Tuning
 #
-# CONFIG_FEATURE_SYSTEMD is not set
+# CONFIG_FEATURE_USE_BSS_TAIL is not set
 CONFIG_FEATURE_RTMINMAX=y
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SMALL=1
@@ -140,6 +142,7 @@ CONFIG_FEATURE_HWIB=y
 # CONFIG_FEATURE_AR_CREATE is not set
 # CONFIG_UNCOMPRESS is not set
 # CONFIG_GUNZIP is not set
+# CONFIG_FEATURE_GUNZIP_LONG_OPTIONS is not set
 # CONFIG_BUNZIP2 is not set
 # CONFIG_UNLZMA is not set
 # CONFIG_FEATURE_LZMA_FAST is not set
@@ -159,8 +162,8 @@ CONFIG_GZIP_FAST=0
 # CONFIG_FEATURE_GZIP_LEVELS is not set
 # CONFIG_LZOP is not set
 # CONFIG_LZOP_COMPR_HIGH is not set
-# CONFIG_RPM is not set
 # CONFIG_RPM2CPIO is not set
+# CONFIG_RPM is not set
 # CONFIG_TAR is not set
 # CONFIG_FEATURE_TAR_CREATE is not set
 # CONFIG_FEATURE_TAR_AUTODETECT is not set
@@ -193,6 +196,9 @@ CONFIG_HOSTID=y
 CONFIG_ID=y
 # CONFIG_GROUPS is not set
 # CONFIG_SHUF is not set
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+# CONFIG_FEATURE_STAT_FILESYSTEM is not set
 CONFIG_SYNC=y
 # CONFIG_FEATURE_SYNC_FANCY is not set
 CONFIG_TEST=y
@@ -284,8 +290,6 @@ CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_SPLIT is not set
 # CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
 CONFIG_STTY=y
 # CONFIG_SUM is not set
 # CONFIG_TAC is not set
@@ -452,6 +456,7 @@ CONFIG_HALT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 CONFIG_TELINIT_PATH=""
 CONFIG_INIT=y
+CONFIG_LINUXRC=y
 CONFIG_FEATURE_USE_INITTAB=y
 CONFIG_FEATURE_KILL_REMOVED=y
 CONFIG_FEATURE_KILL_DELAY=0
@@ -459,30 +464,34 @@ CONFIG_FEATURE_INIT_SCTTY=y
 CONFIG_FEATURE_INIT_SYSLOG=y
 CONFIG_FEATURE_EXTRA_QUIET=y
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
-CONFIG_FEATURE_INITRD=y
 CONFIG_INIT_TERMINAL_TYPE="linux"
+CONFIG_FEATURE_INIT_MODIFY_CMDLINE=y
 CONFIG_MESG=y
 CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP=y
 
 #
 # Login/Password Management Utilities
 #
-# CONFIG_ADD_SHELL is not set
-# CONFIG_REMOVE_SHELL is not set
 CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
+# CONFIG_ADDGROUP is not set
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
 CONFIG_ADDUSER=y
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
-# CONFIG_ADDGROUP is not set
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_CHPASSWD is not set
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
+# CONFIG_CRYPTPW is not set
+# CONFIG_MKPASSWD is not set
 # CONFIG_DELUSER is not set
 # CONFIG_DELGROUP is not set
 # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
@@ -494,9 +503,6 @@ CONFIG_FEATURE_NOLOGIN=y
 CONFIG_FEATURE_SECURETTY=y
 CONFIG_PASSWD=y
 CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
-# CONFIG_CRYPTPW is not set
-# CONFIG_CHPASSWD is not set
-CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="des"
 # CONFIG_SU is not set
 # CONFIG_FEATURE_SU_SYSLOG is not set
 # CONFIG_FEATURE_SU_CHECKS_SHELLS is not set
@@ -545,6 +551,7 @@ CONFIG_DEFAULT_DEPMOD_FILE=""
 #
 # Linux System Utilities
 #
+# CONFIG_BLKDISCARD is not set
 # CONFIG_BLOCKDEV is not set
 # CONFIG_FATATTR is not set
 # CONFIG_FSTRIM is not set
@@ -564,8 +571,12 @@ CONFIG_FEATURE_MOUNT_CIFS=y
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_FEATURE_MOUNT_OTHERTAB=y
+# CONFIG_NSENTER is not set
+# CONFIG_FEATURE_NSENTER_LONG_OPTS is not set
 # CONFIG_REV is not set
+# CONFIG_SETARCH is not set
 # CONFIG_UEVENT is not set
+# CONFIG_UNSHARE is not set
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKID is not set
@@ -618,7 +629,6 @@ CONFIG_MORE=y
 # CONFIG_RTCWAKE is not set
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
-# CONFIG_SETARCH is not set
 # CONFIG_SWAPONOFF is not set
 # CONFIG_FEATURE_SWAPON_DISCARD is not set
 # CONFIG_FEATURE_SWAPON_PRI is not set
@@ -633,6 +643,7 @@ CONFIG_FEATURE_MOUNT_LOOP=y
 CONFIG_FEATURE_MOUNT_LOOP_CREATE=y
 # CONFIG_FEATURE_MTAB_SUPPORT is not set
 # CONFIG_VOLUMEID is not set
+# CONFIG_FEATURE_VOLUMEID_BCACHE is not set
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
 # CONFIG_FEATURE_VOLUMEID_EXFAT is not set
@@ -684,6 +695,7 @@ CONFIG_FEATURE_LESS_MAXLINES=0
 CONFIG_SETSERIAL=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
+# CONFIG_UBIRENAME is not set
 # CONFIG_UBIATTACH is not set
 # CONFIG_UBIDETACH is not set
 # CONFIG_UBIMKVOL is not set
@@ -725,7 +737,6 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_IONICE is not set
 # CONFIG_INOTIFYD is not set
 # CONFIG_LAST is not set
-# CONFIG_FEATURE_LAST_SMALL is not set
 # CONFIG_FEATURE_LAST_FANCY is not set
 # CONFIG_HDPARM is not set
 # CONFIG_FEATURE_HDPARM_GET_IDENTITY is not set
@@ -837,6 +848,7 @@ CONFIG_FEATURE_IP_ROUTE=y
 CONFIG_FEATURE_IP_ROUTE_DIR="/etc/iproute2"
 # CONFIG_FEATURE_IP_TUNNEL is not set
 # CONFIG_FEATURE_IP_RULE is not set
+# CONFIG_FEATURE_IP_NEIGH is not set
 CONFIG_FEATURE_IP_SHORT_FORMS=y
 # CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
 CONFIG_IPADDR=y
@@ -844,6 +856,7 @@ CONFIG_IPLINK=y
 CONFIG_IPROUTE=y
 # CONFIG_IPTUNNEL is not set
 # CONFIG_IPRULE is not set
+# CONFIG_IPNEIGH is not set
 # CONFIG_IPCALC is not set
 # CONFIG_FEATURE_IPCALC_FANCY is not set
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
@@ -962,17 +975,17 @@ CONFIG_FEATURE_PS_LONG=y
 #
 # Runit Utilities
 #
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
 # CONFIG_RUNSV is not set
 # CONFIG_RUNSVDIR is not set
 # CONFIG_FEATURE_RUNSVDIR_LOG is not set
 # CONFIG_SV is not set
 CONFIG_SV_DEFAULT_SERVICE_DIR=""
 # CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
 # CONFIG_CHCON is not set
 # CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
@@ -1041,6 +1054,11 @@ CONFIG_FEATURE_SH_EXTRA_QUIET=y
 #
 # System Logging Utilities
 #
+# CONFIG_KLOGD is not set
+# CONFIG_FEATURE_KLOGD_KLOGCTL is not set
+# CONFIG_LOGGER is not set
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 # CONFIG_SYSLOGD is not set
 # CONFIG_FEATURE_ROTATE_LOGFILE is not set
 # CONFIG_FEATURE_REMOTE_LOG is not set
@@ -1049,9 +1067,4 @@ CONFIG_FEATURE_SH_EXTRA_QUIET=y
 CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=0
 # CONFIG_FEATURE_IPC_SYSLOG is not set
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
-# CONFIG_LOGREAD is not set
-# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 # CONFIG_FEATURE_KMSG_SYSLOG is not set
-# CONFIG_KLOGD is not set
-# CONFIG_FEATURE_KLOGD_KLOGCTL is not set
-# CONFIG_LOGGER is not set
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 693b9d2..1059d67 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.23.0
-# Sun Dec 28 21:14:57 2014
+# Busybox version: 1.25.0
+# Tue Jun 21 21:03:53 2016
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -23,6 +23,7 @@ CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
 CONFIG_SHOW_USAGE=y
 CONFIG_FEATURE_VERBOSE_USAGE=y
 # CONFIG_FEATURE_COMPRESS_USAGE is not set
+CONFIG_BUSYBOX=y
 CONFIG_FEATURE_INSTALLER=y
 # CONFIG_INSTALL_NO_USR is not set
 # CONFIG_LOCALE_SUPPORT is not set
@@ -75,6 +76,7 @@ CONFIG_EXTRA_LDLIBS=""
 #
 # CONFIG_DEBUG is not set
 # CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_DEBUG_SANITIZE is not set
 # CONFIG_UNIT_TEST is not set
 # CONFIG_WERROR is not set
 CONFIG_NO_DEBUG_LIB=y
@@ -96,7 +98,7 @@ CONFIG_PREFIX="./_install"
 #
 # Busybox Library Tuning
 #
-# CONFIG_FEATURE_SYSTEMD is not set
+# CONFIG_FEATURE_USE_BSS_TAIL is not set
 CONFIG_FEATURE_RTMINMAX=y
 CONFIG_PASSWORD_MINLEN=6
 CONFIG_MD5_SMALL=1
@@ -140,6 +142,7 @@ CONFIG_AR=y
 CONFIG_FEATURE_AR_CREATE=y
 # CONFIG_UNCOMPRESS is not set
 CONFIG_GUNZIP=y
+CONFIG_FEATURE_GUNZIP_LONG_OPTIONS=y
 CONFIG_BUNZIP2=y
 CONFIG_UNLZMA=y
 # CONFIG_FEATURE_LZMA_FAST is not set
@@ -156,6 +159,7 @@ CONFIG_CPIO=y
 CONFIG_GZIP=y
 # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
 CONFIG_GZIP_FAST=0
+# CONFIG_FEATURE_GZIP_LEVELS is not set
 # CONFIG_LZOP is not set
 # CONFIG_LZOP_COMPR_HIGH is not set
 # CONFIG_RPM2CPIO is not set
@@ -183,10 +187,20 @@ CONFIG_DATE=y
 CONFIG_FEATURE_DATE_ISOFMT=y
 # CONFIG_FEATURE_DATE_NANO is not set
 CONFIG_FEATURE_DATE_COMPAT=y
+CONFIG_DD=y
+CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
+# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
+CONFIG_FEATURE_DD_IBS_OBS=y
+CONFIG_FEATURE_DD_STATUS=y
 CONFIG_HOSTID=y
 CONFIG_ID=y
 # CONFIG_GROUPS is not set
 # CONFIG_SHUF is not set
+# CONFIG_STAT is not set
+# CONFIG_FEATURE_STAT_FORMAT is not set
+# CONFIG_FEATURE_STAT_FILESYSTEM is not set
+CONFIG_SYNC=y
+# CONFIG_FEATURE_SYNC_FANCY is not set
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
@@ -195,6 +209,7 @@ CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
 CONFIG_FEATURE_TR_EQUIV=y
+CONFIG_TRUNCATE=y
 CONFIG_UNLINK=y
 # CONFIG_BASE64 is not set
 CONFIG_WHO=y
@@ -211,10 +226,6 @@ CONFIG_CKSUM=y
 CONFIG_CP=y
 # CONFIG_FEATURE_CP_LONG_OPTIONS is not set
 CONFIG_CUT=y
-CONFIG_DD=y
-CONFIG_FEATURE_DD_SIGNAL_HANDLING=y
-# CONFIG_FEATURE_DD_THIRD_STATUS_LINE is not set
-CONFIG_FEATURE_DD_IBS_OBS=y
 CONFIG_DF=y
 # CONFIG_FEATURE_DF_FANCY is not set
 CONFIG_DIRNAME=y
@@ -279,12 +290,8 @@ CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_SPLIT is not set
 # CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
 CONFIG_STTY=y
 # CONFIG_SUM is not set
-CONFIG_SYNC=y
-# CONFIG_FEATURE_SYNC_FANCY is not set
 # CONFIG_TAC is not set
 CONFIG_TAIL=y
 CONFIG_FEATURE_FANCY_TAIL=y
@@ -293,6 +300,7 @@ CONFIG_FEATURE_TEE_USE_BLOCK_IO=y
 CONFIG_TRUE=y
 CONFIG_TTY=y
 CONFIG_UNAME=y
+CONFIG_UNAME_OSNAME="GNU/Linux"
 # CONFIG_UNEXPAND is not set
 # CONFIG_FEATURE_UNEXPAND_LONG_OPTIONS is not set
 CONFIG_UNIQ=y
@@ -452,6 +460,7 @@ CONFIG_HALT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 CONFIG_TELINIT_PATH=""
 CONFIG_INIT=y
+CONFIG_LINUXRC=y
 CONFIG_FEATURE_USE_INITTAB=y
 CONFIG_FEATURE_KILL_REMOVED=y
 CONFIG_FEATURE_KILL_DELAY=0
@@ -459,30 +468,34 @@ CONFIG_FEATURE_INIT_SCTTY=y
 CONFIG_FEATURE_INIT_SYSLOG=y
 CONFIG_FEATURE_EXTRA_QUIET=y
 # CONFIG_FEATURE_INIT_COREDUMPS is not set
-CONFIG_FEATURE_INITRD=y
 CONFIG_INIT_TERMINAL_TYPE="linux"
+CONFIG_FEATURE_INIT_MODIFY_CMDLINE=y
 CONFIG_MESG=y
 CONFIG_FEATURE_MESG_ENABLE_ONLY_GROUP=y
 
 #
 # Login/Password Management Utilities
 #
-# CONFIG_ADD_SHELL is not set
-# CONFIG_REMOVE_SHELL is not set
 CONFIG_FEATURE_SHADOWPASSWDS=y
 # CONFIG_USE_BB_PWD_GRP is not set
 # CONFIG_USE_BB_SHADOW is not set
 CONFIG_USE_BB_CRYPT=y
 # CONFIG_USE_BB_CRYPT_SHA is not set
+CONFIG_ADDGROUP=y
+# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
+# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_ADD_SHELL is not set
+# CONFIG_REMOVE_SHELL is not set
 CONFIG_ADDUSER=y
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
 CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
-CONFIG_ADDGROUP=y
-# CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
-# CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
+# CONFIG_CHPASSWD is not set
+CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="md5"
+# CONFIG_CRYPTPW is not set
+CONFIG_MKPASSWD=y
 CONFIG_DELUSER=y
 CONFIG_DELGROUP=y
 # CONFIG_FEATURE_DEL_USER_FROM_GROUP is not set
@@ -494,9 +507,6 @@ CONFIG_FEATURE_NOLOGIN=y
 CONFIG_FEATURE_SECURETTY=y
 CONFIG_PASSWD=y
 CONFIG_FEATURE_PASSWD_WEAK_CHECK=y
-# CONFIG_CRYPTPW is not set
-# CONFIG_CHPASSWD is not set
-CONFIG_FEATURE_DEFAULT_PASSWD_ALGO="md5"
 CONFIG_SU=y
 CONFIG_FEATURE_SU_SYSLOG=y
 CONFIG_FEATURE_SU_CHECKS_SHELLS=y
@@ -545,6 +555,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 #
 # Linux System Utilities
 #
+# CONFIG_BLKDISCARD is not set
 # CONFIG_BLOCKDEV is not set
 # CONFIG_FATATTR is not set
 CONFIG_FSTRIM=y
@@ -554,7 +565,22 @@ CONFIG_FEATURE_MDEV_RENAME=y
 # CONFIG_FEATURE_MDEV_RENAME_REGEXP is not set
 CONFIG_FEATURE_MDEV_EXEC=y
 # CONFIG_FEATURE_MDEV_LOAD_FIRMWARE is not set
+CONFIG_MOUNT=y
+# CONFIG_FEATURE_MOUNT_FAKE is not set
+# CONFIG_FEATURE_MOUNT_VERBOSE is not set
+# CONFIG_FEATURE_MOUNT_HELPERS is not set
+# CONFIG_FEATURE_MOUNT_LABEL is not set
+# CONFIG_FEATURE_MOUNT_NFS is not set
+CONFIG_FEATURE_MOUNT_CIFS=y
+CONFIG_FEATURE_MOUNT_FLAGS=y
+CONFIG_FEATURE_MOUNT_FSTAB=y
+CONFIG_FEATURE_MOUNT_OTHERTAB=y
+CONFIG_NSENTER=y
+CONFIG_FEATURE_NSENTER_LONG_OPTS=y
 # CONFIG_REV is not set
+CONFIG_SETARCH=y
+CONFIG_UEVENT=y
+CONFIG_UNSHARE=y
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 CONFIG_BLKID=y
@@ -567,7 +593,7 @@ CONFIG_FEATURE_FBSET_READMODE=y
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
 CONFIG_FDISK=y
-CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
+# CONFIG_FDISK_SUPPORT_LARGE_DISKS is not set
 CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
 # CONFIG_FEATURE_SGI_LABEL is not set
@@ -600,15 +626,6 @@ CONFIG_LSUSB=y
 CONFIG_MKSWAP=y
 # CONFIG_FEATURE_MKSWAP_UUID is not set
 CONFIG_MORE=y
-CONFIG_MOUNT=y
-# CONFIG_FEATURE_MOUNT_FAKE is not set
-# CONFIG_FEATURE_MOUNT_VERBOSE is not set
-# CONFIG_FEATURE_MOUNT_HELPERS is not set
-# CONFIG_FEATURE_MOUNT_LABEL is not set
-# CONFIG_FEATURE_MOUNT_NFS is not set
-CONFIG_FEATURE_MOUNT_CIFS=y
-CONFIG_FEATURE_MOUNT_FLAGS=y
-CONFIG_FEATURE_MOUNT_FSTAB=y
 CONFIG_PIVOT_ROOT=y
 CONFIG_RDATE=y
 # CONFIG_RDEV is not set
@@ -616,7 +633,6 @@ CONFIG_READPROFILE=y
 # CONFIG_RTCWAKE is not set
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
-CONFIG_SETARCH=y
 CONFIG_SWAPONOFF=y
 # CONFIG_FEATURE_SWAPON_DISCARD is not set
 # CONFIG_FEATURE_SWAPON_PRI is not set
@@ -635,6 +651,7 @@ CONFIG_VOLUMEID=y
 #
 # Filesystem/Volume identification
 #
+# CONFIG_FEATURE_VOLUMEID_BCACHE is not set
 # CONFIG_FEATURE_VOLUMEID_BTRFS is not set
 # CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
 CONFIG_FEATURE_VOLUMEID_EXFAT=y
@@ -665,10 +682,15 @@ CONFIG_CROND=y
 # CONFIG_FEATURE_CROND_D is not set
 # CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
 CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
+CONFIG_I2CGET=y
+CONFIG_I2CSET=y
+CONFIG_I2CDUMP=y
+CONFIG_I2CDETECT=y
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
 CONFIG_FEATURE_LESS_BRACKETS=y
 CONFIG_FEATURE_LESS_FLAGS=y
+CONFIG_FEATURE_LESS_TRUNCATE=y
 # CONFIG_FEATURE_LESS_MARKS is not set
 CONFIG_FEATURE_LESS_REGEXP=y
 # CONFIG_FEATURE_LESS_WINCH is not set
@@ -681,6 +703,7 @@ CONFIG_FEATURE_LESS_REGEXP=y
 CONFIG_SETSERIAL=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
+CONFIG_UBIRENAME=y
 # CONFIG_UBIATTACH is not set
 # CONFIG_UBIDETACH is not set
 # CONFIG_UBIMKVOL is not set
@@ -722,7 +745,6 @@ CONFIG_EJECT=y
 # CONFIG_IONICE is not set
 # CONFIG_INOTIFYD is not set
 CONFIG_LAST=y
-CONFIG_FEATURE_LAST_SMALL=y
 # CONFIG_FEATURE_LAST_FANCY is not set
 CONFIG_HDPARM=y
 CONFIG_FEATURE_HDPARM_GET_IDENTITY=y
@@ -763,6 +785,13 @@ CONFIG_NAMEIF=y
 CONFIG_PING=y
 # CONFIG_PING6 is not set
 CONFIG_FEATURE_FANCY_PING=y
+CONFIG_WGET=y
+CONFIG_FEATURE_WGET_STATUSBAR=y
+CONFIG_FEATURE_WGET_AUTHENTICATION=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_TIMEOUT=y
+# CONFIG_FEATURE_WGET_OPENSSL is not set
+# CONFIG_FEATURE_WGET_SSL_HELPER is not set
 # CONFIG_WHOIS is not set
 CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
@@ -824,8 +853,10 @@ CONFIG_IP=y
 CONFIG_FEATURE_IP_ADDRESS=y
 CONFIG_FEATURE_IP_LINK=y
 CONFIG_FEATURE_IP_ROUTE=y
+CONFIG_FEATURE_IP_ROUTE_DIR="/etc/iproute2"
 CONFIG_FEATURE_IP_TUNNEL=y
 CONFIG_FEATURE_IP_RULE=y
+CONFIG_FEATURE_IP_NEIGH=y
 CONFIG_FEATURE_IP_SHORT_FORMS=y
 # CONFIG_FEATURE_IP_RARE_PROTOCOLS is not set
 CONFIG_IPADDR=y
@@ -833,6 +864,7 @@ CONFIG_IPLINK=y
 CONFIG_IPROUTE=y
 CONFIG_IPTUNNEL=y
 CONFIG_IPRULE=y
+CONFIG_IPNEIGH=y
 # CONFIG_IPCALC is not set
 # CONFIG_FEATURE_IPCALC_FANCY is not set
 # CONFIG_FEATURE_IPCALC_LONG_OPTIONS is not set
@@ -890,11 +922,6 @@ CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
 # CONFIG_UDPSVD is not set
 CONFIG_VCONFIG=y
-CONFIG_WGET=y
-CONFIG_FEATURE_WGET_STATUSBAR=y
-CONFIG_FEATURE_WGET_AUTHENTICATION=y
-CONFIG_FEATURE_WGET_LONG_OPTIONS=y
-CONFIG_FEATURE_WGET_TIMEOUT=y
 # CONFIG_ZCIP is not set
 
 #
@@ -960,17 +987,17 @@ CONFIG_WATCH=y
 #
 # Runit Utilities
 #
+# CONFIG_CHPST is not set
+# CONFIG_SETUIDGID is not set
+# CONFIG_ENVUIDGID is not set
+# CONFIG_ENVDIR is not set
+# CONFIG_SOFTLIMIT is not set
 # CONFIG_RUNSV is not set
 # CONFIG_RUNSVDIR is not set
 # CONFIG_FEATURE_RUNSVDIR_LOG is not set
 # CONFIG_SV is not set
 CONFIG_SV_DEFAULT_SERVICE_DIR=""
 # CONFIG_SVLOGD is not set
-# CONFIG_CHPST is not set
-# CONFIG_SETUIDGID is not set
-# CONFIG_ENVUIDGID is not set
-# CONFIG_ENVDIR is not set
-# CONFIG_SOFTLIMIT is not set
 # CONFIG_CHCON is not set
 # CONFIG_FEATURE_CHCON_LONG_OPTIONS is not set
 # CONFIG_GETENFORCE is not set
@@ -1039,6 +1066,11 @@ CONFIG_FEATURE_SH_EXTRA_QUIET=y
 #
 # System Logging Utilities
 #
+CONFIG_KLOGD=y
+CONFIG_FEATURE_KLOGD_KLOGCTL=y
+CONFIG_LOGGER=y
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 CONFIG_SYSLOGD=y
 CONFIG_FEATURE_ROTATE_LOGFILE=y
 CONFIG_FEATURE_REMOTE_LOG=y
@@ -1047,9 +1079,4 @@ CONFIG_FEATURE_REMOTE_LOG=y
 CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 # CONFIG_FEATURE_IPC_SYSLOG is not set
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=0
-# CONFIG_LOGREAD is not set
-# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
 # CONFIG_FEATURE_KMSG_SYSLOG is not set
-CONFIG_KLOGD=y
-CONFIG_FEATURE_KLOGD_KLOGCTL=y
-CONFIG_LOGGER=y
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 7486aeb..e9e0691 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.24.2.tar.bz2.sign
-md5	2eaae519cac1143bcf583636a745381f	busybox-1.24.2.tar.bz2
-sha1	03e6cfc8ddb2f709f308719a9b9f4818bc0a28d0	busybox-1.24.2.tar.bz2
+# From http://busybox.net/downloads/busybox-1.25.0.tar.bz2.sign
+md5	b05af9645076f75429a8683f8afcbdb3	busybox-1.25.0.tar.bz2
+sha1	c6c759bf4c4f24b37f52e136e2b15d921a8d44cb	busybox-1.25.0.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 08d8e64..895f4ca 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.24.2
+BUSYBOX_VERSION = 1.25.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
