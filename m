From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Jan 2011 09:08:45 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: add 1.18.2 fixes
Message-ID: <20110119081003.EB30088F20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dea0b13403e2696046d1469f691945a74545127e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.18.2/busybox-1.18.2-buildsys.patch   |   62 ++++++++++++++++++++
 .../busybox-1.18.2/busybox-1.18.2-hush.patch       |   34 +++++++++++
 .../busybox-1.18.2-modprobe-small.patch            |   19 ++++++
 3 files changed, 115 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch
 create mode 100644 package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch

diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch
new file mode 100644
index 0000000..d904806
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-buildsys.patch
@@ -0,0 +1,62 @@
+--- busybox-1.18.2/loginutils/Config.src
++++ busybox-1.18.2-buildsys/loginutils/Config.src
+@@ -186,7 +186,6 @@ config GETTY
+ config LOGIN
+ 	bool "login"
+ 	default y
+-	select FEATURE_SUID
+ 	select FEATURE_SYSLOG
+ 	help
+ 	  login is used when signing onto a system.
+@@ -229,7 +228,6 @@ config FEATURE_SECURETTY
+ config PASSWD
+ 	bool "passwd"
+ 	default y
+-	select FEATURE_SUID
+ 	select FEATURE_SYSLOG
+ 	help
+ 	  passwd changes passwords for user and group accounts. A normal user
+@@ -265,7 +263,6 @@ config CHPASSWD
+ config SU
+ 	bool "su"
+ 	default y
+-	select FEATURE_SUID
+ 	select FEATURE_SYSLOG
+ 	help
+ 	  su is used to become another user during a login session.
+@@ -295,7 +292,6 @@ config SULOGIN
+ config VLOCK
+ 	bool "vlock"
+ 	default y
+-	select FEATURE_SUID
+ 	help
+ 	  Build the "vlock" applet which allows you to lock (virtual) terminals.
+ 
+--- busybox-1.18.2/miscutils/Config.src
++++ busybox-1.18.2-buildsys/miscutils/Config.src
+@@ -170,7 +170,6 @@ config FEATURE_CROND_DIR
+ config CRONTAB
+ 	bool "crontab"
+ 	default y
+-	select FEATURE_SUID
+ 	help
+ 	  Crontab manipulates the crontab for a particular user. Only
+ 	  the superuser may specify a different user and/or crontab directory.
+--- busybox-1.18.2/util-linux/Config.src
++++ busybox-1.18.2-buildsys/util-linux/Config.src
+@@ -354,7 +354,6 @@ config FEATURE_HWCLOCK_ADJTIME_FHS
+ config IPCRM
+ 	bool "ipcrm"
+ 	default y
+-	select FEATURE_SUID
+ 	help
+ 	  The ipcrm utility allows the removal of System V interprocess
+ 	  communication (IPC) objects and the associated data structures
+@@ -364,7 +363,6 @@ config IPCS
+ 	bool "ipcs"
+ 	default y
+ 	depends on PLATFORM_LINUX
+-	select FEATURE_SUID
+ 	help
+ 	  The ipcs utility is used to provide information on the currently
+ 	  allocated System V interprocess (IPC) objects in the system.
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch
new file mode 100644
index 0000000..d08e519
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-hush.patch
@@ -0,0 +1,34 @@
+--- busybox-1.18.2/shell/hush.c
++++ busybox-1.18.2-hush/shell/hush.c
+@@ -4123,15 +4123,26 @@ static struct pipe *parse_stream(char **
+ 				 && dest.length == 0 && !dest.has_quoted_part
+ 				) {
+ 					/* This newline can be ignored. But...
+-					 * without the below check, interactive shell
+-					 * will ignore even lines with bare <newline>,
+-					 * and show the continuation prompt:
++					 * Without check #1, interactive shell
++					 * ignores even bare <newline>,
++					 * and shows the continuation prompt:
+ 					 * ps1_prompt$ <enter>
+-					 * ps2> _   <=== wrong prompt, should be ps1
++					 * ps2> _   <=== wrong, should be ps1
++					 * Without check #2, "cmd & <newline>"
++					 * is similarly mistreated.
++					 * (BTW, this makes "cmd & cmd"
++					 * and "cmd && cmd" non-orthogonal.
++					 * Really, ask yourself, why
++					 * "cmd && <newline>" doesn't start
++					 * cmd but waits for more input?
++					 * No reason...)
+ 					 */
+ 					struct pipe *pi = ctx.list_head;
+-					if (pi->num_cmds != 0)
++					if (pi->num_cmds != 0       /* check #1 */
++					 && pi->followup != PIPE_BG /* check #2 */
++					) {
+ 						continue;
++					}
+ 				}
+ 				/* Treat newline as a command separator. */
+ 				done_pipe(&ctx, PIPE_SEQ);
diff --git a/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch b/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch
new file mode 100644
index 0000000..b0623f2
--- /dev/null
+++ b/package/busybox/busybox-1.18.2/busybox-1.18.2-modprobe-small.patch
@@ -0,0 +1,19 @@
+--- busybox-1.18.2/modutils/modprobe-small.c
++++ busybox-1.18.2-modprobe-small/modutils/modprobe-small.c
+@@ -205,6 +205,7 @@ static void parse_module(module_info *in
+ 	/* Read (possibly compressed) module */
+ 	len = 64 * 1024 * 1024; /* 64 Mb at most */
+ 	module_image = xmalloc_open_zipped_read_close(pathname, &len);
++	/* module_image == NULL is ok here, find_keyword handles it */
+ //TODO: optimize redundant module body reads
+ 
+ 	/* "alias1 symbol:sym1 alias2 symbol:sym2" */
+@@ -845,6 +846,8 @@ int modprobe_main(int argc UNUSED_PARAM,
+ 
+ 		len = MAXINT(ssize_t);
+ 		map = xmalloc_open_zipped_read_close(*argv, &len);
++		if (!map)
++			bb_perror_msg_and_die("can't read '%s'", *argv);
+ 		if (init_module(map, len,
+ 			IF_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE(options ? options : "")
+ 			IF_NOT_FEATURE_MODPROBE_SMALL_OPTIONS_ON_CMDLINE("")
-- 
1.7.3.4
