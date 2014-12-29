From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Dec 2014 06:33:03 -0300
Subject: [Buildroot] [PATCH] busybox: bump to version 1.23.0
Message-ID: <1419845583-21874-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...ibiproute-use-linux-if_packet.h-instead-.patch} |  0
 package/busybox/0002-ash.patch                     | 39 +++++++++++++
 .../busybox/busybox-0002-busybox-1.22.1-ash.patch  | 11 ----
 .../busybox/busybox-0003-busybox-1.22.1-date.patch | 30 ----------
 .../busybox-0004-busybox-1.22.1-iplink.patch       | 19 -------
 .../busybox/busybox-0005-busybox-1.22.1-nc.patch   | 15 -----
 .../busybox-0006-lzop-add-overflow-check.patch     | 66 ----------------------
 .../busybox/busybox-0007-login-fail-delay.patch    | 32 -----------
 package/busybox/busybox.config                     | 40 +++++++++----
 package/busybox/busybox.hash                       |  6 +-
 package/busybox/busybox.mk                         |  2 +-
 11 files changed, 73 insertions(+), 187 deletions(-)
 rename package/busybox/{busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch => 0001-networking-libiproute-use-linux-if_packet.h-instead-.patch} (100%)
 create mode 100644 package/busybox/0002-ash.patch
 delete mode 100644 package/busybox/busybox-0002-busybox-1.22.1-ash.patch
 delete mode 100644 package/busybox/busybox-0003-busybox-1.22.1-date.patch
 delete mode 100644 package/busybox/busybox-0004-busybox-1.22.1-iplink.patch
 delete mode 100644 package/busybox/busybox-0005-busybox-1.22.1-nc.patch
 delete mode 100644 package/busybox/busybox-0006-lzop-add-overflow-check.patch
 delete mode 100644 package/busybox/busybox-0007-login-fail-delay.patch

diff --git a/package/busybox/busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch b/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
similarity index 100%
rename from package/busybox/busybox-0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
rename to package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
diff --git a/package/busybox/0002-ash.patch b/package/busybox/0002-ash.patch
new file mode 100644
index 0000000..fbd1fad
--- /dev/null
+++ b/package/busybox/0002-ash.patch
@@ -0,0 +1,39 @@
+Upstream http://busybox.net/downloads/fixes-1.23.0/busybox-1.23.0-ash.patch
+post-release hotfix patch for ash segfault.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- busybox-1.23.0/shell/ash.c
++++ busybox-1.23.0-ash/shell/ash.c
+@@ -6746,6 +6746,14 @@ varvalue(char *name, int varflags, int f
+ 		len = strlen(p);
+ 		if (!(subtype == VSPLUS || subtype == VSLENGTH))
+ 			memtodest(p, len, syntax, quotes);
++#if ENABLE_UNICODE_SUPPORT
++		if (subtype == VSLENGTH && len > 0) {
++			reinit_unicode_for_ash();
++			if (unicode_status == UNICODE_ON) {
++				len = unicode_strlen(p);
++			}
++		}
++#endif
+ 		return len;
+ 	}
+ 
+@@ -6829,15 +6837,7 @@ evalvar(char *p, int flags, struct strli
+ 		varunset(p, var, 0, 0);
+ 
+ 	if (subtype == VSLENGTH) {
+-		ssize_t n = varlen;
+-		if (n > 0) {
+-			reinit_unicode_for_ash();
+-			if (unicode_status == UNICODE_ON) {
+-				const char *val = lookupvar(var);
+-				n = unicode_strlen(val);
+-			}
+-		}
+-		cvtnum(n > 0 ? n : 0);
++		cvtnum(varlen > 0 ? varlen : 0);
+ 		goto record;
+ 	}
+ 
diff --git a/package/busybox/busybox-0002-busybox-1.22.1-ash.patch b/package/busybox/busybox-0002-busybox-1.22.1-ash.patch
deleted file mode 100644
index 301e942..0000000
--- a/package/busybox/busybox-0002-busybox-1.22.1-ash.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.22.1/shell/ash.c
-+++ busybox-1.22.1-ash/shell/ash.c
-@@ -13014,7 +13014,7 @@ init(void)
- 		setvar2("PPID", utoa(getppid()));
- #if ENABLE_ASH_BASH_COMPAT
- 		p = lookupvar("SHLVL");
--		setvar2("SHLVL", utoa(p ? atoi(p) + 1 : 1));
-+		setvar("SHLVL", utoa((p ? atoi(p) : 0) + 1), VEXPORT);
- #endif
- 		p = lookupvar("PWD");
- 		if (p) {
diff --git a/package/busybox/busybox-0003-busybox-1.22.1-date.patch b/package/busybox/busybox-0003-busybox-1.22.1-date.patch
deleted file mode 100644
index 6380d87..0000000
--- a/package/busybox/busybox-0003-busybox-1.22.1-date.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- busybox-1.22.1/libbb/time.c
-+++ busybox-1.22.1-date/libbb/time.c
-@@ -68,15 +68,23 @@ void FAST_FUNC parse_datestr(const char
- 			/* else end != NUL and we error out */
- 		}
- 	} else
--	/* yyyy-mm-dd HH */
--	if (sscanf(date_str, "%u-%u-%u %u%c", &ptm->tm_year,
-+	if (strchr(date_str, '-')
-+	    /* Why strchr('-') check?
-+	     * sscanf below will trash ptm->tm_year, this breaks
-+	     * if parse_str is "10101010" (iow, "MMddhhmm" form)
-+	     * because we destroy year. Do these sscanf
-+	     * only if we saw a dash in parse_str.
-+	     */
-+		/* yyyy-mm-dd HH */
-+	 && (sscanf(date_str, "%u-%u-%u %u%c", &ptm->tm_year,
- 				&ptm->tm_mon, &ptm->tm_mday,
- 				&ptm->tm_hour,
- 				&end) >= 4
--	/* yyyy-mm-dd */
--	 || sscanf(date_str, "%u-%u-%u%c", &ptm->tm_year,
-+		/* yyyy-mm-dd */
-+	     || sscanf(date_str, "%u-%u-%u%c", &ptm->tm_year,
- 				&ptm->tm_mon, &ptm->tm_mday,
- 				&end) >= 3
-+	    )
- 	) {
- 		ptm->tm_year -= 1900; /* Adjust years */
- 		ptm->tm_mon -= 1; /* Adjust month from 1-12 to 0-11 */
diff --git a/package/busybox/busybox-0004-busybox-1.22.1-iplink.patch b/package/busybox/busybox-0004-busybox-1.22.1-iplink.patch
deleted file mode 100644
index dbd76c5..0000000
--- a/package/busybox/busybox-0004-busybox-1.22.1-iplink.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- busybox-1.22.1/networking/libiproute/iplink.c
-+++ busybox-1.22.1-iplink/networking/libiproute/iplink.c
-@@ -31,6 +31,16 @@
- #ifndef IFLA_LINKINFO
- # define IFLA_LINKINFO 18
- # define IFLA_INFO_KIND 1
-+# define IFLA_INFO_DATA 2
-+#endif
-+
-+#ifndef IFLA_VLAN_MAX
-+# define IFLA_VLAN_ID 1
-+# define IFLA_VLAN_FLAGS 2
-+struct ifla_vlan_flags {
-+	uint32_t	flags;
-+	uint32_t	mask;
-+};
- #endif
- 
- /* taken from linux/sockios.h */
diff --git a/package/busybox/busybox-0005-busybox-1.22.1-nc.patch b/package/busybox/busybox-0005-busybox-1.22.1-nc.patch
deleted file mode 100644
index 1ddb483..0000000
--- a/package/busybox/busybox-0005-busybox-1.22.1-nc.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- busybox-1.22.1/networking/nc_bloaty.c
-+++ busybox-1.22.1-nc/networking/nc_bloaty.c
-@@ -175,9 +175,9 @@ enum {
- 	OPT_w = (1 << 5),
- 	OPT_l = (1 << 6) * ENABLE_NC_SERVER,
- 	OPT_k = (1 << 7) * ENABLE_NC_SERVER,
--	OPT_i = (1 << (7+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
--	OPT_o = (1 << (8+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
--	OPT_z = (1 << (9+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
-+	OPT_i = (1 << (6+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
-+	OPT_o = (1 << (7+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
-+	OPT_z = (1 << (8+2*ENABLE_NC_SERVER)) * ENABLE_NC_EXTRA,
- };
- 
- #define o_nflag   (option_mask32 & OPT_n)
diff --git a/package/busybox/busybox-0006-lzop-add-overflow-check.patch b/package/busybox/busybox-0006-lzop-add-overflow-check.patch
deleted file mode 100644
index d3f6c67..0000000
--- a/package/busybox/busybox-0006-lzop-add-overflow-check.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From a9dc7c2f59dc5e92870d2d46316ea5c1f14740e3 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 30 Jun 2014 10:14:34 +0200
-Subject: [PATCH] lzop: add overflow check
-
-See CVE-2014-4607
-http://www.openwall.com/lists/oss-security/2014/06/26/20
-
-function                                             old     new   delta
-lzo1x_decompress_safe                               1010    1031     +21
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- archival/libarchive/liblzo.h  | 2 ++
- archival/libarchive/lzo1x_d.c | 3 +++
- 2 files changed, 5 insertions(+)
-
-diff --git a/archival/libarchive/liblzo.h b/archival/libarchive/liblzo.h
-index 843997c..4596620 100644
---- a/archival/libarchive/liblzo.h
-+++ b/archival/libarchive/liblzo.h
-@@ -76,11 +76,13 @@
- #    define TEST_IP             (ip < ip_end)
- #    define NEED_IP(x) \
-             if ((unsigned)(ip_end - ip) < (unsigned)(x))  goto input_overrun
-+#    define TEST_IV(x)          if ((x) > (unsigned)0 - (511)) goto input_overrun
- 
- #    undef TEST_OP              /* don't need both of the tests here */
- #    define TEST_OP             1
- #    define NEED_OP(x) \
-             if ((unsigned)(op_end - op) < (unsigned)(x))  goto output_overrun
-+#    define TEST_OV(x)          if ((x) > (unsigned)0 - (511)) goto output_overrun
- 
- #define HAVE_ANY_OP 1
- 
-diff --git a/archival/libarchive/lzo1x_d.c b/archival/libarchive/lzo1x_d.c
-index 9bc1270..40b167e 100644
---- a/archival/libarchive/lzo1x_d.c
-+++ b/archival/libarchive/lzo1x_d.c
-@@ -92,6 +92,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 				ip++;
- 				NEED_IP(1);
- 			}
-+			TEST_IV(t);
- 			t += 15 + *ip++;
- 		}
- 		/* copy literals */
-@@ -224,6 +225,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 31 + *ip++;
- 				}
- #if defined(COPY_DICT)
-@@ -265,6 +267,7 @@ int lzo1x_decompress_safe(const uint8_t* in, unsigned in_len,
- 						ip++;
- 						NEED_IP(1);
- 					}
-+					TEST_IV(t);
- 					t += 7 + *ip++;
- 				}
- #if defined(COPY_DICT)
--- 
-1.8.5.5
-
diff --git a/package/busybox/busybox-0007-login-fail-delay.patch b/package/busybox/busybox-0007-login-fail-delay.patch
deleted file mode 100644
index 0e2bb2e..0000000
--- a/package/busybox/busybox-0007-login-fail-delay.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a6588fa10230e7b87990482773a445701abbaae8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
-Date: Mon, 22 Dec 2014 01:55:54 +0100
-Subject: [PATCH 1/1] Make it possible to override LOGIN_FAIL_DELAY in
- CONFIG_EXTRA_CFLAGS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
----
- include/libbb.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/libbb.h b/include/libbb.h
-index 8e8b9ca..68a7cf0 100644
---- a/include/libbb.h
-+++ b/include/libbb.h
-@@ -1271,7 +1271,9 @@ char *bb_simplify_path(const char *path) FAST_FUNC;
- /* Returns ptr to NUL */
- char *bb_simplify_abs_path_inplace(char *path) FAST_FUNC;
- 
-+#ifndef LOGIN_FAIL_DELAY
- #define LOGIN_FAIL_DELAY 3
-+#endif
- extern void bb_do_delay(int seconds) FAST_FUNC;
- extern void change_identity(const struct passwd *pw) FAST_FUNC;
- extern void run_shell(const char *shell, int loginshell, const char *command, const char **additional_args) NORETURN FAST_FUNC;
--- 
-1.9.1
-
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 05ef676..7af7eca 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.22.0
-# Wed Jan  1 09:40:21 2014
+# Busybox version: 1.23.0
+# Sun Dec 28 21:14:57 2014
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -36,6 +36,8 @@ CONFIG_LAST_SUPPORTED_WCHAR=0
 # CONFIG_UNICODE_BIDI_SUPPORT is not set
 # CONFIG_UNICODE_NEUTRAL_TABLE is not set
 # CONFIG_UNICODE_PRESERVE_BROKEN is not set
+# CONFIG_PAM is not set
+CONFIG_FEATURE_USE_SENDFILE=y
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_DEVPTS=y
 CONFIG_FEATURE_CLEAN_UP=y
@@ -73,6 +75,7 @@ CONFIG_EXTRA_LDLIBS=""
 #
 # CONFIG_DEBUG is not set
 # CONFIG_DEBUG_PESSIMIZE is not set
+# CONFIG_UNIT_TEST is not set
 # CONFIG_WERROR is not set
 CONFIG_NO_DEBUG_LIB=y
 # CONFIG_DMALLOC is not set
@@ -183,6 +186,7 @@ CONFIG_FEATURE_DATE_COMPAT=y
 CONFIG_HOSTID=y
 CONFIG_ID=y
 # CONFIG_GROUPS is not set
+# CONFIG_SHUF is not set
 CONFIG_TEST=y
 CONFIG_FEATURE_TEST_64=y
 CONFIG_TOUCH=y
@@ -191,6 +195,7 @@ CONFIG_FEATURE_TOUCH_SUSV3=y
 CONFIG_TR=y
 CONFIG_FEATURE_TR_CLASSES=y
 CONFIG_FEATURE_TR_EQUIV=y
+CONFIG_UNLINK=y
 # CONFIG_BASE64 is not set
 CONFIG_WHO=y
 # CONFIG_USERS is not set
@@ -299,6 +304,11 @@ CONFIG_WHOAMI=y
 CONFIG_YES=y
 
 #
+# Common options
+#
+CONFIG_FEATURE_VERBOSE=y
+
+#
 # Common options for cp and mv
 #
 CONFIG_FEATURE_PRESERVE_HARDLINKS=y
@@ -388,6 +398,9 @@ CONFIG_FEATURE_VI_SETOPTS=y
 CONFIG_FEATURE_VI_SET=y
 CONFIG_FEATURE_VI_WIN_RESIZE=y
 CONFIG_FEATURE_VI_ASK_TERMINAL=y
+CONFIG_FEATURE_VI_UNDO=y
+CONFIG_FEATURE_VI_UNDO_QUEUE=y
+CONFIG_FEATURE_VI_UNDO_QUEUE_MAX=256
 CONFIG_FEATURE_ALLOW_EXEC=y
 
 #
@@ -404,6 +417,7 @@ CONFIG_FEATURE_FIND_MAXDEPTH=y
 CONFIG_FEATURE_FIND_NEWER=y
 # CONFIG_FEATURE_FIND_INUM is not set
 CONFIG_FEATURE_FIND_EXEC=y
+CONFIG_FEATURE_FIND_EXEC_PLUS=y
 CONFIG_FEATURE_FIND_USER=y
 CONFIG_FEATURE_FIND_GROUP=y
 CONFIG_FEATURE_FIND_NOT=y
@@ -425,6 +439,7 @@ CONFIG_XARGS=y
 CONFIG_FEATURE_XARGS_SUPPORT_QUOTES=y
 CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT=y
 CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=y
+CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 
 #
 # Init Utilities
@@ -461,6 +476,7 @@ CONFIG_USE_BB_CRYPT=y
 CONFIG_ADDUSER=y
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
+CONFIG_LAST_ID=60000
 CONFIG_FIRST_SYSTEM_ID=100
 CONFIG_LAST_SYSTEM_ID=999
 CONFIG_ADDGROUP=y
@@ -472,7 +488,6 @@ CONFIG_DELGROUP=y
 CONFIG_GETTY=y
 CONFIG_LOGIN=y
 # CONFIG_LOGIN_SESSION_AS_CHILD is not set
-# CONFIG_PAM is not set
 # CONFIG_LOGIN_SCRIPTS is not set
 CONFIG_FEATURE_NOLOGIN=y
 CONFIG_FEATURE_SECURETTY=y
@@ -530,6 +545,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # Linux System Utilities
 #
 # CONFIG_BLOCKDEV is not set
+# CONFIG_FATATTR is not set
 CONFIG_FSTRIM=y
 CONFIG_MDEV=y
 CONFIG_FEATURE_MDEV_CONF=y
@@ -601,6 +617,7 @@ CONFIG_READPROFILE=y
 # CONFIG_SCRIPTREPLAY is not set
 CONFIG_SETARCH=y
 CONFIG_SWAPONOFF=y
+# CONFIG_FEATURE_SWAPON_DISCARD is not set
 # CONFIG_FEATURE_SWAPON_PRI is not set
 CONFIG_SWITCH_ROOT=y
 CONFIG_UMOUNT=y
@@ -643,6 +660,10 @@ CONFIG_FEATURE_VOLUMEID_FAT=y
 # Miscellaneous Utilities
 #
 # CONFIG_CONSPY is not set
+CONFIG_CROND=y
+# CONFIG_FEATURE_CROND_D is not set
+# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
+CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
 CONFIG_FEATURE_LESS_BRACKETS=y
@@ -657,6 +678,8 @@ CONFIG_FEATURE_LESS_REGEXP=y
 # CONFIG_NANDDUMP is not set
 # CONFIG_RFKILL is not set
 CONFIG_SETSERIAL=y
+# CONFIG_TASKSET is not set
+# CONFIG_FEATURE_TASKSET_FANCY is not set
 # CONFIG_UBIATTACH is not set
 # CONFIG_UBIDETACH is not set
 # CONFIG_UBIMKVOL is not set
@@ -679,10 +702,6 @@ CONFIG_FEATURE_BEEP_LENGTH_MS=0
 # CONFIG_FEATURE_CHAT_VAR_ABORT_LEN is not set
 # CONFIG_FEATURE_CHAT_CLR_ABORT is not set
 CONFIG_CHRT=y
-CONFIG_CROND=y
-# CONFIG_FEATURE_CROND_D is not set
-# CONFIG_FEATURE_CROND_CALL_SENDMAIL is not set
-CONFIG_FEATURE_CROND_DIR="/var/spool/cron"
 CONFIG_CRONTAB=y
 CONFIG_DC=y
 # CONFIG_FEATURE_DC_LIBM is not set
@@ -724,8 +743,6 @@ CONFIG_RUNLEVEL=y
 # CONFIG_RX is not set
 CONFIG_SETSID=y
 CONFIG_STRINGS=y
-# CONFIG_TASKSET is not set
-# CONFIG_FEATURE_TASKSET_FANCY is not set
 CONFIG_TIME=y
 # CONFIG_TIMEOUT is not set
 # CONFIG_TTYSIZE is not set
@@ -761,13 +778,13 @@ CONFIG_ETHER_WAKE=y
 # CONFIG_FTPD is not set
 # CONFIG_FEATURE_FTP_WRITE is not set
 # CONFIG_FEATURE_FTPD_ACCEPT_BROKEN_LIST is not set
+# CONFIG_FEATURE_FTP_AUTHENTICATION is not set
 # CONFIG_FTPGET is not set
 # CONFIG_FTPPUT is not set
 # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
 CONFIG_HOSTNAME=y
 # CONFIG_HTTPD is not set
 # CONFIG_FEATURE_HTTPD_RANGES is not set
-# CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
 # CONFIG_FEATURE_HTTPD_SETUID is not set
 # CONFIG_FEATURE_HTTPD_BASIC_AUTH is not set
 # CONFIG_FEATURE_HTTPD_AUTH_MD5 is not set
@@ -824,6 +841,7 @@ CONFIG_NETSTAT=y
 CONFIG_NSLOOKUP=y
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
+# CONFIG_FEATURE_NTPD_CONF is not set
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
@@ -861,6 +879,7 @@ CONFIG_TRACEROUTE=y
 CONFIG_DHCPD_LEASES_FILE=""
 CONFIG_UDHCPC=y
 CONFIG_FEATURE_UDHCPC_ARPING=y
+CONFIG_FEATURE_UDHCPC_SANITIZEOPT=y
 # CONFIG_FEATURE_UDHCP_PORT is not set
 CONFIG_UDHCP_DEBUG=0
 # CONFIG_FEATURE_UDHCP_RFC3397 is not set
@@ -979,6 +998,7 @@ CONFIG_ASH_GETOPTS=y
 CONFIG_ASH_BUILTIN_ECHO=y
 CONFIG_ASH_BUILTIN_PRINTF=y
 CONFIG_ASH_BUILTIN_TEST=y
+CONFIG_ASH_HELP=y
 CONFIG_ASH_CMDCMD=y
 # CONFIG_ASH_MAIL is not set
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 428ce0a..5ec4b78 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.22.1.tar.bz2.sign
-md5	337d1a15ab1cb1d4ed423168b1eb7d7e	busybox-1.22.1.tar.bz2
-sha1	d6e96fefb6f0fb8079f27468b9bf22d8dd96108e	busybox-1.22.1.tar.bz2
+# From http://busybox.net/downloads/busybox-1.23.0.tar.bz2.sign
+md5	6dffeb16044c6022476c64744492106a	busybox-1.23.0.tar.bz2
+sha1	c38285fc1458c19d0f7ca01515fc95c404bc596d	busybox-1.23.0.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2e55aec..8e75e1f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.22.1
+BUSYBOX_VERSION = 1.23.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
-- 
2.0.5
