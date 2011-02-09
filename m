From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Feb 2011 09:00:47 -0300
Subject: [Buildroot] [PATCH] busybox: bump to version 1.18.3
Message-ID: <1297252847-5111-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.18.2/busybox-1.18.2-buildsys.patch   |   62 --------------------
 .../busybox-1.18.2/busybox-1.18.2-hush.patch       |   34 -----------
 .../busybox-1.18.2/busybox-1.18.2-libbb.patch      |   10 ---
 .../busybox-1.18.2-modprobe-small.patch            |   19 ------
 .../busybox-1.18.2/busybox-1.18.2-modprobe.patch   |   20 ------
 .../busybox-1.18.2/busybox-1.18.2-ping.patch       |   11 ----
 .../busybox-1.18.2/busybox-1.18.2-tar.patch        |   15 -----
 .../busybox-1.18.2/busybox-1.18.2-udhcp.patch      |   11 ----
 .../busybox/busybox-1.18.2/busybox-1.18.2-wc.patch |   41 -------------
 10 files changed, 1 insertions(+), 224 deletions(-)
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch
 delete mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index e56ef00..ecb3d40 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -40,7 +40,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.15.3"	if BR2_BUSYBOX_VERSION_1_15_X
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
 	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
-	default "1.18.2"	if BR2_BUSYBOX_VERSION_1_18_X
+	default "1.18.3"	if BR2_BUSYBOX_VERSION_1_18_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch
deleted file mode 100644
index d904806..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch
+++ /dev/null
@@ -1,62 +0,0 @@
---- busybox-1.18.2/loginutils/Config.src
-+++ busybox-1.18.2-buildsys/loginutils/Config.src
-@@ -186,7 +186,6 @@ config GETTY
- config LOGIN
- 	bool "login"
- 	default y
--	select FEATURE_SUID
- 	select FEATURE_SYSLOG
- 	help
- 	  login is used when signing onto a system.
-@@ -229,7 +228,6 @@ config FEATURE_SECURETTY
- config PASSWD
- 	bool "passwd"
- 	default y
--	select FEATURE_SUID
- 	select FEATURE_SYSLOG
- 	help
- 	  passwd changes passwords for user and group accounts. A normal user
-@@ -265,7 +263,6 @@ config CHPASSWD
- config SU
- 	bool "su"
- 	default y
--	select FEATURE_SUID
- 	select FEATURE_SYSLOG
- 	help
- 	  su is used to become another user during a login session.
-@@ -295,7 +292,6 @@ config SULOGIN
- config VLOCK
- 	bool "vlock"
- 	default y
--	select FEATURE_SUID
- 	help
- 	  Build the "vlock" applet which allows you to lock (virtual) terminals.
- 
---- busybox-1.18.2/miscutils/Config.src
-+++ busybox-1.18.2-buildsys/miscutils/Config.src
-@@ -170,7 +170,6 @@ config FEATURE_CROND_DIR
- config CRONTAB
- 	bool "crontab"
- 	default y
--	select FEATURE_SUID
- 	help
- 	  Crontab manipulates the crontab for a particular user. Only
- 	  the superuser may specify a different user and/or crontab directory.
---- busybox-1.18.2/util-linux/Config.src
-+++ busybox-1.18.2-buildsys/util-linux/Config.src
-@@ -354,7 +354,6 @@ config FEATURE_HWCLOCK_ADJTIME_FHS
- config IPCRM
- 	bool "ipcrm"
- 	default y
--	select FEATURE_SUID
- 	help
- 	  The ipcrm utility allows the removal of System V interprocess
- 	  communication (IPC) objects and the associated data structures
-@@ -364,7 +363,6 @@ config IPCS
- 	bool "ipcs"
- 	default y
- 	depends on PLATFORM_LINUX
--	select FEATURE_SUID
- 	help
- 	  The ipcs utility is used to provide information on the currently
- 	  allocated System V interprocess (IPC) objects in the system.
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch
deleted file mode 100644
index d08e519..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch
+++ /dev/null
@@ -1,34 +0,0 @@
---- busybox-1.18.2/shell/hush.c
-+++ busybox-1.18.2-hush/shell/hush.c
-@@ -4123,15 +4123,26 @@ static struct pipe *parse_stream(char **
- 				 && dest.length == 0 && !dest.has_quoted_part
- 				) {
- 					/* This newline can be ignored. But...
--					 * without the below check, interactive shell
--					 * will ignore even lines with bare <newline>,
--					 * and show the continuation prompt:
-+					 * Without check #1, interactive shell
-+					 * ignores even bare <newline>,
-+					 * and shows the continuation prompt:
- 					 * ps1_prompt$ <enter>
--					 * ps2> _   <=== wrong prompt, should be ps1
-+					 * ps2> _   <=== wrong, should be ps1
-+					 * Without check #2, "cmd & <newline>"
-+					 * is similarly mistreated.
-+					 * (BTW, this makes "cmd & cmd"
-+					 * and "cmd && cmd" non-orthogonal.
-+					 * Really, ask yourself, why
-+					 * "cmd && <newline>" doesn't start
-+					 * cmd but waits for more input?
-+					 * No reason...)
- 					 */
- 					struct pipe *pi = ctx.list_head;
--					if (pi->num_cmds != 0)
-+					if (pi->num_cmds != 0       /* check #1 */
-+					 && pi->followup != PIPE_BG /* check #2 */
-+					) {
- 						continue;
-+					}
- 				}
- 				/* Treat newline as a command separator. */
- 				done_pipe(&ctx, PIPE_SEQ);
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch
deleted file mode 100644
index aa7e75d..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-libbb.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- busybox-1.18.2/libbb/vfork_daemon_rexec.c
-+++ busybox-1.18.2-libbb/libbb/vfork_daemon_rexec.c
-@@ -52,6 +52,7 @@ pid_t FAST_FUNC spawn(char **argv)
- 	 * Interested party can wait on pid and learn exit code.
- 	 * If 111 - then it (most probably) failed to exec */
- 	if (failed) {
-+		safe_waitpid(pid, NULL, 0); /* prevent zombie */
- 		errno = failed;
- 		return -1;
- 	}
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch
deleted file mode 100644
index b0623f2..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- busybox-1.18.2/modutils/modprobe-small.c
-+++ busybox-1.18.2-modprobe-small/modutils/modprobe-small.c
-@@ -205,6 +205,7 @@ static void parse_module(module_info *in
- 	/* Read (possibly compressed) module */
- 	len = 64 * 1024 * 1024; /* 64 Mb at most */
- 	module_image = xmalloc_open_zipped_read_close(pathname, &len);
-+	/* module_image == NULL is ok here, find_keyword handles it */
- //TODO: optimize redundant module body reads
- 
- 	/* "alias1 symbol:sym1 alias2 symbol:sym2" */
-@@ -845,6 +846,8 @@ int modprobe_main(int argc UNUSED_PARAM,
- 
- 		len = MAXINT(ssize_t);
- 		map = xmalloc_open_zipped_read_close(*argv, &len);
-+		if (!map)
-+			bb_perror_msg_and_die("can't read '%s'", *argv);
- 		if (init_module(map, len,
- 			IF_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE(options ? options : "")
- 			IF_NOT_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE("")
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch
deleted file mode 100644
index cad887e..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- busybox-1.18.2/modutils/modutils.c
-+++ busybox-1.18.2-modprobe/modutils/modutils.c
-@@ -71,12 +71,11 @@ char* FAST_FUNC parse_cmdline_module_opt
- 	optlen = 0;
- 	while (*++argv) {
- 		options = xrealloc(options, optlen + 2 + strlen(*argv) + 2);
--		/* Older versions were enclosing space-containing *argv in "",
--		 * but both modprobe and insmod from module-init-tools 3.11.1
--		 * don't do this anymore. (As to extra trailing space,
--		 * insmod adds it but modprobe does not. We do in both cases)
--		 */
--		optlen += sprintf(options + optlen, "%s ", *argv);
-+		/* Spaces handled by "" pairs, but no way of escaping quotes */
-+//TODO: module-init-tools version 3.11.1 quotes only value:
-+//it generates var="val with spaces", not "var=val with spaces"
-+//(and it won't quote var *name* even if it has spaces)
-+		optlen += sprintf(options + optlen, (strchr(*argv, ' ') ? "\"%s\" " : "%s "), *argv);
- 	}
- 	return options;
- }
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch
deleted file mode 100644
index 34262d6..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-ping.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.18.2/networking/ping.c
-+++ busybox-1.18.2-ping/networking/ping.c
-@@ -394,7 +394,7 @@ static void sendping4(int junk UNUSED_PA
- #if ENABLE_PING6
- static void sendping6(int junk UNUSED_PARAM)
- {
--	struct icmp6_hdr *pkt = alloca(datalen + sizeof(struct icmp6_hdr) + 4);
-+	struct icmp6_hdr *pkt = G.snd_packet;
- 
- 	//memset(pkt, 0, datalen + sizeof(struct icmp6_hdr) + 4);
- 	pkt->icmp6_type = ICMP6_ECHO_REQUEST;
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch
deleted file mode 100644
index 5d5f721..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-tar.patch
+++ /dev/null
@@ -1,15 +0,0 @@
---- busybox-1.18.2/archival/tar.c
-+++ busybox-1.18.2-tar/archival/tar.c
-@@ -1037,8 +1037,10 @@ int tar_main(int argc UNUSED_PARAM, char
- 			tar_handle->src_fd = tar_fd;
- 			tar_handle->seek = seek_by_read;
- 		} else {
--			if (ENABLE_FEATURE_TAR_AUTODETECT && flags == O_RDONLY) {
--				get_header_ptr = get_header_tar;
-+			if (ENABLE_FEATURE_TAR_AUTODETECT
-+			 && flags == O_RDONLY
-+			 && get_header_ptr == get_header_tar
-+			) {
- 				tar_handle->src_fd = open_zipped(tar_filename);
- 				if (tar_handle->src_fd < 0)
- 					bb_perror_msg_and_die("can't open '%s'", tar_filename);
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch
deleted file mode 100644
index bed4f4d..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-udhcp.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- busybox-1.18.2/networking/udhcp/common.c
-+++ busybox-1.18.2-udhcp/networking/udhcp/common.c
-@@ -375,7 +375,7 @@ static NOINLINE void attach_option(
- 		new->data = xmalloc(length + OPT_DATA);
- 		new->data[OPT_CODE] = optflag->code;
- 		new->data[OPT_LEN] = length;
--		memcpy(new->data + OPT_DATA, buffer, length);
-+		memcpy(new->data + OPT_DATA, (allocated ? allocated : buffer), length);
- 
- 		curr = opt_list;
- 		while (*curr && (*curr)->data[OPT_CODE] < optflag->code)
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch
deleted file mode 100644
index 558896d..0000000
--- a/package/busybox/busybox-1.18.2/busybox-1.18.2-wc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
---- busybox-1.18.2/coreutils/wc.c
-+++ busybox-1.18.2-wc/coreutils/wc.c
-@@ -81,11 +81,11 @@
-  * column order in "wc -cmlwL" output:
-  */
- enum {
--	WC_LINES    = 0,
--	WC_WORDS    = 1,
--	WC_UNICHARS = 2,
--	WC_CHARS    = 3,
--	WC_LENGTH   = 4,
-+	WC_LINES    = 0, /* -l */
-+	WC_WORDS    = 1, /* -w */
-+	WC_UNICHARS = 2, /* -m */
-+	WC_BYTES    = 3, /* -c */
-+	WC_LENGTH   = 4, /* -L */
- 	NUM_WCS     = 5,
- };
- 
-@@ -104,10 +104,10 @@ int wc_main(int argc UNUSED_PARAM, char 
- 
- 	init_unicode();
- 
--	print_type = getopt32(argv, "lwcmL");
-+	print_type = getopt32(argv, "lwmcL");
- 
- 	if (print_type == 0) {
--		print_type = (1 << WC_LINES) | (1 << WC_WORDS) | (1 << WC_CHARS);
-+		print_type = (1 << WC_LINES) | (1 << WC_WORDS) | (1 << WC_BYTES);
- 	}
- 
- 	argv += optind;
-@@ -157,7 +157,7 @@ int wc_main(int argc UNUSED_PARAM, char 
- 			}
- 
- 			/* Cater for -c and -m */
--			++counts[WC_CHARS];
-+			++counts[WC_BYTES];
- 			if (unicode_status != UNICODE_ON /* every byte is a new char */
- 			 || (c & 0xc0) != 0x80 /* it isn't a 2nd+ byte of a Unicode char */
- 			) {
-- 
1.7.3.4
