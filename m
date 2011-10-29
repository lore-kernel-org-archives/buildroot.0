From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Oct 2011 12:33:12 -0300
Subject: [Buildroot] [PATCH] busybox: bump to version 1.19.3
Message-ID: <1319902392-4343-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/busybox/Config.in                          |    2 +-
 .../busybox-1.19.2/busybox-1.19.2-buildsys.patch   |   19 -------
 .../busybox-1.19.2/busybox-1.19.2-chpasswd.patch   |   55 --------------------
 .../busybox-1.19.2/busybox-1.19.2-crond.patch      |   12 ----
 .../busybox-1.19.2/busybox-1.19.2-inetd.patch      |   47 -----------------
 .../busybox-1.19.2/busybox-1.19.2-syslogd.patch    |   20 -------
 .../busybox-1.19.2/busybox-1.19.2-tail.patch       |   43 ---------------
 .../busybox-1.19.2/busybox-1.19.2-tftp.patch       |   12 ----
 8 files changed, 1 insertions(+), 209 deletions(-)
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-buildsys.patch
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-syslogd.patch
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch
 delete mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 52aef86..4176020 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -41,7 +41,7 @@ config BR2_BUSYBOX_VERSION
 	default "1.16.2"	if BR2_BUSYBOX_VERSION_1_16_X
 	default "1.17.4"	if BR2_BUSYBOX_VERSION_1_17_X
 	default "1.18.5"	if BR2_BUSYBOX_VERSION_1_18_X
-	default "1.19.2"	if BR2_BUSYBOX_VERSION_1_19_X
+	default "1.19.3"	if BR2_BUSYBOX_VERSION_1_19_X
 
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-buildsys.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-buildsys.patch
deleted file mode 100644
index 8e0c4c3..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-buildsys.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- busybox-1.19.2/applets/applet_tables.c
-+++ busybox-1.19.2-buildsys/applets/applet_tables.c
-@@ -80,8 +80,15 @@ int main(int argc, char **argv)
- 
- 	printf("#define NUM_APPLETS %u\n", NUM_APPLETS);
- 	if (NUM_APPLETS == 1) {
-+		char *dash_to_underscore, *p;
- 		printf("#define SINGLE_APPLET_STR \"%s\"\n", applets[0].name);
--		printf("#define SINGLE_APPLET_MAIN %s_main\n", applets[0].name);
-+		/* Example: "ether-wake" -> "ether_wake" */
-+		p = dash_to_underscore = strdup(applets[0].name);
-+		p--;
-+		while (*++p)
-+			if (*p == '-')
-+				*p = '_';
-+		printf("#define SINGLE_APPLET_MAIN %s_main\n", dash_to_underscore);
- 	}
- 	printf("\n");
- 
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch
deleted file mode 100644
index 0cba0e2..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch
+++ /dev/null
@@ -1,55 +0,0 @@
---- busybox-1.19.2/loginutils/chpasswd.c
-+++ busybox-1.19.2-chpasswd/loginutils/chpasswd.c
-@@ -33,9 +33,8 @@ static const char chpasswd_longopts[] AL
- int chpasswd_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
- int chpasswd_main(int argc UNUSED_PARAM, char **argv)
- {
--	char *name, *pass;
--	char salt[sizeof("$N$XXXXXXXX")];
--	int opt, rc;
-+	char *name;
-+	int opt;
- 
- 	if (getuid() != 0)
- 		bb_error_msg_and_die(bb_msg_perm_denied_are_you_root);
-@@ -45,6 +44,10 @@ int chpasswd_main(int argc UNUSED_PARAM,
- 	opt = getopt32(argv, "em");
- 
- 	while ((name = xmalloc_fgetline(stdin)) != NULL) {
-+		char *free_me;
-+		char *pass;
-+		int rc;
-+
- 		pass = strchr(name, ':');
- 		if (!pass)
- 			bb_error_msg_and_die("missing new password");
-@@ -52,7 +55,10 @@ int chpasswd_main(int argc UNUSED_PARAM,
- 
- 		xuname2uid(name); /* dies if there is no such user */
- 
-+		free_me = NULL;
- 		if (!(opt & OPT_ENC)) {
-+			char salt[sizeof("$N$XXXXXXXX")];
-+
- 			crypt_make_salt(salt, 1);
- 			if (opt & OPT_MD5) {
- 				salt[0] = '$';
-@@ -60,7 +66,7 @@ int chpasswd_main(int argc UNUSED_PARAM,
- 				salt[2] = '$';
- 				crypt_make_salt(salt + 3, 4);
- 			}
--			pass = pw_encrypt(pass, salt, 0);
-+			free_me = pass = pw_encrypt(pass, salt, 0);
- 		}
- 
- 		/* This is rather complex: if user is not found in /etc/shadow,
-@@ -81,8 +87,7 @@ int chpasswd_main(int argc UNUSED_PARAM,
- 			bb_info_msg("Password for '%s' changed", name);
- 		logmode = LOGMODE_STDIO;
- 		free(name);
--		if (!(opt & OPT_ENC))
--			free(pass);
-+		free(free_me);
- 	}
- 	return EXIT_SUCCESS;
- }
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch
deleted file mode 100644
index 043a846..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- busybox-1.19.2/miscutils/crond.c
-+++ busybox-1.19.2-crond/miscutils/crond.c
-@@ -861,7 +861,8 @@ int crond_main(int argc UNUSED_PARAM, ch
- 
- 	/* "-b after -f is ignored", and so on for every pair a-b */
- 	opt_complementary = "f-b:b-f:S-L:L-S" IF_FEATURE_CROND_D(":d-l")
--			":l+:d+"; /* -l and -d have numeric param */
-+			/* -l and -d have numeric param */
-+			":l+" IF_FEATURE_CROND_D(":d+");
- 	opts = getopt32(argv, "l:L:fbSc:" IF_FEATURE_CROND_D("d:"),
- 			&G.log_level, &G.log_filename, &G.crontab_dir_name
- 			IF_FEATURE_CROND_D(,&G.log_level));
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch
deleted file mode 100644
index e1395a6..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch
+++ /dev/null
@@ -1,47 +0,0 @@
---- busybox-1.19.2/networking/inetd.c
-+++ busybox-1.19.2-inetd/networking/inetd.c
-@@ -1278,6 +1278,7 @@ int inetd_main(int argc UNUSED_PARAM, ch
- 							sep->se_count = 0;
- 							rearm_alarm(); /* will revive it in RETRYTIME sec */
- 							restore_sigmask(&omask);
-+							maybe_close(new_udp_fd);
- 							maybe_close(accepted_fd);
- 							continue; /* -> check next fd in fd set */
- 						}
-@@ -1298,17 +1299,18 @@ int inetd_main(int argc UNUSED_PARAM, ch
- 					bb_perror_msg("vfork"+1);
- 					sleep(1);
- 					restore_sigmask(&omask);
-+					maybe_close(new_udp_fd);
- 					maybe_close(accepted_fd);
- 					continue; /* -> check next fd in fd set */
- 				}
- 				if (pid == 0)
- 					pid--; /* -1: "we did fork and we are child" */
- 			}
--			/* if pid == 0 here, we never forked */
-+			/* if pid == 0 here, we didn't fork */
- 
- 			if (pid > 0) { /* parent */
- 				if (sep->se_wait) {
--					/* tcp wait: we passed listening socket to child,
-+					/* wait: we passed socket to child,
- 					 * will wait for child to terminate */
- 					sep->se_wait = pid;
- 					remove_fd_from_set(sep->se_fd);
-@@ -1345,9 +1347,13 @@ int inetd_main(int argc UNUSED_PARAM, ch
- 			setsid();
- 			/* "nowait" udp */
- 			if (new_udp_fd >= 0) {
--				len_and_sockaddr *lsa = xzalloc_lsa(sep->se_family);
-+				len_and_sockaddr *lsa;
-+				int r;
-+
-+				close(new_udp_fd);
-+				lsa = xzalloc_lsa(sep->se_family);
- 				/* peek at the packet and remember peer addr */
--				int r = recvfrom(ctrl, NULL, 0, MSG_PEEK|MSG_DONTWAIT,
-+				r = recvfrom(ctrl, NULL, 0, MSG_PEEK|MSG_DONTWAIT,
- 					&lsa->u.sa, &lsa->len);
- 				if (r < 0)
- 					goto do_exit1;
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-syslogd.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-syslogd.patch
deleted file mode 100644
index d54f5d4..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-syslogd.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- busybox-1.19.2/sysklogd/syslogd.c
-+++ busybox-1.19.2-syslogd/sysklogd/syslogd.c
-@@ -278,7 +278,7 @@ static void parse_syslogdcfg(const char 
- 	parser_t *parser;
- 
- 	parser = config_open2(file ? file : "/etc/syslog.conf",
--				file ? xfopen_for_read : fopen_or_warn_stdin);
-+				file ? xfopen_for_read : fopen_for_read);
- 	if (!parser)
- 		/* didn't find default /etc/syslog.conf */
- 		/* proceed as if we built busybox without config support */
-@@ -678,7 +678,7 @@ static void timestamp_and_log(int pri, c
- 	if (LOG_PRI(pri) < G.logLevel) {
- #if ENABLE_FEATURE_IPC_SYSLOG
- 		if ((option_mask32 & OPT_circularlog) && G.shbuf) {
--			log_to_shmem(msg);
-+			log_to_shmem(G.printbuf);
- 			return;
- 		}
- #endif
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch
deleted file mode 100644
index f3cc798..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch
+++ /dev/null
@@ -1,43 +0,0 @@
---- busybox-1.19.2/coreutils/tail.c
-+++ busybox-1.19.2-tail/coreutils/tail.c
-@@ -203,7 +203,7 @@ int tail_main(int argc, char **argv)
- 		int fd = fds[i];
- 
- 		if (ENABLE_FEATURE_FANCY_TAIL && fd < 0)
--			continue; /* may happen with -E */
-+			continue; /* may happen with -F */
- 
- 		if (nfiles > header_threshhold) {
- 			tail_xprint_header(fmt, argv[i]);
-@@ -252,14 +252,14 @@ int tail_main(int argc, char **argv)
- 		 * Used only by +N code ("start from Nth", 1-based): */
- 		seen = 1;
- 		newlines_seen = 0;
--		while ((nread = tail_read(fd, buf, tailbufsize-taillen)) > 0) {
-+		while ((nread = tail_read(fd, buf, tailbufsize - taillen)) > 0) {
- 			if (G.from_top) {
- 				int nwrite = nread;
- 				if (seen < count) {
- 					/* We need to skip a few more bytes/lines */
- 					if (COUNT_BYTES) {
- 						nwrite -= (count - seen);
--						seen = count;
-+						seen += nread;
- 					} else {
- 						char *s = buf;
- 						do {
---- busybox-1.19.2/testsuite/tail.tests
-+++ busybox-1.19.2-tail/testsuite/tail.tests
-@@ -14,4 +14,12 @@ testing "tail: +N with N > file length" 
- 	"0\n" \
- 	"" "qw"
- 
-+testing "tail: -c +N with largish N" \
-+	"
-+	dd if=/dev/zero bs=16k count=1 2>/dev/null | tail -c +8200 | wc -c;
-+	dd if=/dev/zero bs=16k count=1 2>/dev/null | tail -c +8208 | wc -c;
-+	" \
-+	"8185\n8177\n" \
-+	"" ""
-+
- exit $FAILCOUNT
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch
deleted file mode 100644
index 15dc9e1..0000000
--- a/package/busybox/busybox-1.19.2/busybox-1.19.2-tftp.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- busybox-1.19.2/networking/tftp.c
-+++ busybox-1.19.2-tftp/networking/tftp.c
-@@ -813,7 +813,8 @@ int tftpd_main(int argc UNUSED_PARAM, ch
- 		goto err;
- 	}
- 	mode = local_file + strlen(local_file) + 1;
--	if (mode >= block_buf + result || strcmp(mode, "octet") != 0) {
-+	/* RFC 1350 says mode string is case independent */
-+	if (mode >= block_buf + result || strcasecmp(mode, "octet") != 0) {
- 		goto err;
- 	}
- # if ENABLE_FEATURE_TFTP_BLOCKSIZE
-- 
1.7.3.4
