From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] busybox: add 1.19.2 fixes for chpasswd,
	crond and inetd.
Message-ID: <20110912052630.D2E9A8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d97542c6d88d2e621db8d01db523baac5bf9ccf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.19.2/busybox-1.19.2-chpasswd.patch   |   55 ++++++++++++++++++++
 .../busybox-1.19.2/busybox-1.19.2-crond.patch      |   12 ++++
 .../busybox-1.19.2/busybox-1.19.2-inetd.patch      |   47 +++++++++++++++++
 3 files changed, 114 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch
 create mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch
 create mode 100644 package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch

diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch
new file mode 100644
index 0000000..0cba0e2
--- /dev/null
+++ b/package/busybox/busybox-1.19.2/busybox-1.19.2-chpasswd.patch
@@ -0,0 +1,55 @@
+--- busybox-1.19.2/loginutils/chpasswd.c
++++ busybox-1.19.2-chpasswd/loginutils/chpasswd.c
+@@ -33,9 +33,8 @@ static const char chpasswd_longopts[] AL
+ int chpasswd_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
+ int chpasswd_main(int argc UNUSED_PARAM, char **argv)
+ {
+-	char *name, *pass;
+-	char salt[sizeof("$N$XXXXXXXX")];
+-	int opt, rc;
++	char *name;
++	int opt;
+ 
+ 	if (getuid() != 0)
+ 		bb_error_msg_and_die(bb_msg_perm_denied_are_you_root);
+@@ -45,6 +44,10 @@ int chpasswd_main(int argc UNUSED_PARAM,
+ 	opt = getopt32(argv, "em");
+ 
+ 	while ((name = xmalloc_fgetline(stdin)) != NULL) {
++		char *free_me;
++		char *pass;
++		int rc;
++
+ 		pass = strchr(name, ':');
+ 		if (!pass)
+ 			bb_error_msg_and_die("missing new password");
+@@ -52,7 +55,10 @@ int chpasswd_main(int argc UNUSED_PARAM,
+ 
+ 		xuname2uid(name); /* dies if there is no such user */
+ 
++		free_me = NULL;
+ 		if (!(opt & OPT_ENC)) {
++			char salt[sizeof("$N$XXXXXXXX")];
++
+ 			crypt_make_salt(salt, 1);
+ 			if (opt & OPT_MD5) {
+ 				salt[0] = '$';
+@@ -60,7 +66,7 @@ int chpasswd_main(int argc UNUSED_PARAM,
+ 				salt[2] = '$';
+ 				crypt_make_salt(salt + 3, 4);
+ 			}
+-			pass = pw_encrypt(pass, salt, 0);
++			free_me = pass = pw_encrypt(pass, salt, 0);
+ 		}
+ 
+ 		/* This is rather complex: if user is not found in /etc/shadow,
+@@ -81,8 +87,7 @@ int chpasswd_main(int argc UNUSED_PARAM,
+ 			bb_info_msg("Password for '%s' changed", name);
+ 		logmode = LOGMODE_STDIO;
+ 		free(name);
+-		if (!(opt & OPT_ENC))
+-			free(pass);
++		free(free_me);
+ 	}
+ 	return EXIT_SUCCESS;
+ }
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch
new file mode 100644
index 0000000..043a846
--- /dev/null
+++ b/package/busybox/busybox-1.19.2/busybox-1.19.2-crond.patch
@@ -0,0 +1,12 @@
+--- busybox-1.19.2/miscutils/crond.c
++++ busybox-1.19.2-crond/miscutils/crond.c
+@@ -861,7 +861,8 @@ int crond_main(int argc UNUSED_PARAM, ch
+ 
+ 	/* "-b after -f is ignored", and so on for every pair a-b */
+ 	opt_complementary = "f-b:b-f:S-L:L-S" IF_FEATURE_CROND_D(":d-l")
+-			":l+:d+"; /* -l and -d have numeric param */
++			/* -l and -d have numeric param */
++			":l+" IF_FEATURE_CROND_D(":d+");
+ 	opts = getopt32(argv, "l:L:fbSc:" IF_FEATURE_CROND_D("d:"),
+ 			&G.log_level, &G.log_filename, &G.crontab_dir_name
+ 			IF_FEATURE_CROND_D(,&G.log_level));
diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch
new file mode 100644
index 0000000..e1395a6
--- /dev/null
+++ b/package/busybox/busybox-1.19.2/busybox-1.19.2-inetd.patch
@@ -0,0 +1,47 @@
+--- busybox-1.19.2/networking/inetd.c
++++ busybox-1.19.2-inetd/networking/inetd.c
+@@ -1278,6 +1278,7 @@ int inetd_main(int argc UNUSED_PARAM, ch
+ 							sep->se_count = 0;
+ 							rearm_alarm(); /* will revive it in RETRYTIME sec */
+ 							restore_sigmask(&omask);
++							maybe_close(new_udp_fd);
+ 							maybe_close(accepted_fd);
+ 							continue; /* -> check next fd in fd set */
+ 						}
+@@ -1298,17 +1299,18 @@ int inetd_main(int argc UNUSED_PARAM, ch
+ 					bb_perror_msg("vfork"+1);
+ 					sleep(1);
+ 					restore_sigmask(&omask);
++					maybe_close(new_udp_fd);
+ 					maybe_close(accepted_fd);
+ 					continue; /* -> check next fd in fd set */
+ 				}
+ 				if (pid == 0)
+ 					pid--; /* -1: "we did fork and we are child" */
+ 			}
+-			/* if pid == 0 here, we never forked */
++			/* if pid == 0 here, we didn't fork */
+ 
+ 			if (pid > 0) { /* parent */
+ 				if (sep->se_wait) {
+-					/* tcp wait: we passed listening socket to child,
++					/* wait: we passed socket to child,
+ 					 * will wait for child to terminate */
+ 					sep->se_wait = pid;
+ 					remove_fd_from_set(sep->se_fd);
+@@ -1345,9 +1347,13 @@ int inetd_main(int argc UNUSED_PARAM, ch
+ 			setsid();
+ 			/* "nowait" udp */
+ 			if (new_udp_fd >= 0) {
+-				len_and_sockaddr *lsa = xzalloc_lsa(sep->se_family);
++				len_and_sockaddr *lsa;
++				int r;
++
++				close(new_udp_fd);
++				lsa = xzalloc_lsa(sep->se_family);
+ 				/* peek at the packet and remember peer addr */
+-				int r = recvfrom(ctrl, NULL, 0, MSG_PEEK|MSG_DONTWAIT,
++				r = recvfrom(ctrl, NULL, 0, MSG_PEEK|MSG_DONTWAIT,
+ 					&lsa->u.sa, &lsa->len);
+ 				if (r < 0)
+ 					goto do_exit1;
-- 
1.7.3.4
