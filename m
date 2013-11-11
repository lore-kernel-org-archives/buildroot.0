From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Mon, 11 Nov 2013 18:29:24 +0800
Subject: [Buildroot] [PATCH 1/2] util-linux: nommu: Add patch to use vfork
	in nommu arch.
Message-ID: <1384165765-23210-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/util-linux/util-linux-nommu.patch | 591 ++++++++++++++++++++++++++++++
 1 file changed, 591 insertions(+)
 create mode 100644 package/util-linux/util-linux-nommu.patch

diff --git a/package/util-linux/util-linux-nommu.patch b/package/util-linux/util-linux-nommu.patch
new file mode 100644
index 0000000..b09783c
--- /dev/null
+++ b/package/util-linux/util-linux-nommu.patch
@@ -0,0 +1,591 @@
+diff -urN util-linux-2.23.2.old/configure.ac util-linux-2.23.2/configure.ac
+--- util-linux-2.23.2.old/configure.ac	2013-11-11 14:34:33.550893863 +0800
++++ util-linux-2.23.2/configure.ac	2013-11-11 14:44:23.762438640 +0800
+@@ -311,6 +311,7 @@
+ 	err \
+ 	errx \
+ 	fsync \
++	fork \
+ 	futimens \
+ 	getdomainname \
+ 	getdtablesize \
+diff -urN util-linux-2.23.2.old/disk-utils/fsck.c util-linux-2.23.2/disk-utils/fsck.c
+--- util-linux-2.23.2.old/disk-utils/fsck.c	2013-06-13 15:46:10.377650254 +0800
++++ util-linux-2.23.2/disk-utils/fsck.c	2013-11-11 14:48:48.383360534 +0800
+@@ -606,7 +606,11 @@
+ 	/* Fork and execute the correct program. */
+ 	if (noexecute)
+ 		pid = -1;
++#ifndef HAVE_FORK
++	else if ((pid = vfork()) < 0) {
++#else
+ 	else if ((pid = fork()) < 0) {
++#endif
+ 		warn(_("fork failed"));
+ 		free(inst);
+ 		return errno;
+@@ -755,10 +759,18 @@
+ 			 * time to set up the signal handler
+ 			 */
+ 			if (inst2->start_time.tv_sec < time(0) + 2) {
++#ifndef HAVE_FORK
++				if (vfork() == 0) {
++#else
+ 				if (fork() == 0) {
++#endif
+ 					sleep(1);
+ 					kill(inst2->pid, SIGUSR1);
++#ifndef HAVE_FORK
++					_exit(EXIT_OK);
++#else
+ 					exit(FSCK_EX_OK);
++#endif
+ 				}
+ 			} else
+ 				kill(inst2->pid, SIGUSR1);
+diff -urN util-linux-2.23.2.old/fdisks/fdiskbsdlabel.h util-linux-2.23.2/fdisks/fdiskbsdlabel.h
+--- util-linux-2.23.2.old/fdisks/fdiskbsdlabel.h	2013-07-30 16:54:15.362994206 +0800
++++ util-linux-2.23.2/fdisks/fdiskbsdlabel.h	2013-11-11 14:52:18.285623027 +0800
+@@ -50,7 +50,7 @@
+     defined (__mips__) || defined (__s390__) || defined (__sh__) || \
+     defined (__aarch64__) || defined(__xtensa__) || \
+     defined (__x86_64__) || defined (__avr32__) || defined(__cris__) || \
+-    defined (__microblaze__)
++    defined(__bfin__) || defined (__microblaze__)
+ #define BSD_LABELSECTOR   1
+ #define BSD_LABELOFFSET   0
+ #elif defined (__alpha__) || defined (__powerpc__) || defined (__ia64__) || defined (__hppa__)
+diff -urN util-linux-2.23.2.old/libblkid/src/topology/dm.c util-linux-2.23.2/libblkid/src/topology/dm.c
+--- util-linux-2.23.2.old/libblkid/src/topology/dm.c	2013-06-13 15:46:10.428650690 +0800
++++ util-linux-2.23.2/libblkid/src/topology/dm.c	2013-11-11 15:13:11.316088170 +0800
+@@ -61,7 +61,11 @@
+ 		goto nothing;
+ 	}
+ 
++#ifndef HAVE_FORK
++	switch (vfork()) {
++#else
+ 	switch (fork()) {
++#endif
+ 	case 0:
+ 	{
+ 		char *dmargv[7], maj[16], min[16];
+@@ -74,9 +78,9 @@
+ 
+ 		/* The libblkid library could linked with setuid programs */
+ 		if (setgid(getgid()) < 0)
+-			 exit(1);
++			 _exit(1);
+ 		if (setuid(getuid()) < 0)
+-			 exit(1);
++			 _exit(1);
+ 
+ 		snprintf(maj, sizeof(maj), "%d", major(devno));
+ 		snprintf(min, sizeof(min), "%d", minor(devno));
+@@ -92,7 +96,7 @@
+ 		execv(dmargv[0], dmargv);
+ 
+ 		DBG(LOWPROBE, blkid_debug("Failed to execute %s: errno=%d", cmd, errno));
+-		exit(1);
++		_exit(1);
+ 	}
+ 	case -1:
+ 		DBG(LOWPROBE, blkid_debug("Failed to forking: errno=%d", errno));
+diff -urN util-linux-2.23.2.old/libblkid/src/topology/lvm.c util-linux-2.23.2/libblkid/src/topology/lvm.c
+--- util-linux-2.23.2.old/libblkid/src/topology/lvm.c	2013-06-13 15:46:10.429650699 +0800
++++ util-linux-2.23.2/libblkid/src/topology/lvm.c	2013-11-11 15:14:07.483452404 +0800
+@@ -71,7 +71,11 @@
+ 		goto nothing;
+ 	}
+ 
++#ifndef HAVE_FORK
++	switch (vfork()) {
++#else
+ 	switch (fork()) {
++#endif
+ 	case 0:
+ 	{
+ 		char *lvargv[3];
+@@ -84,9 +88,9 @@
+ 
+ 		/* The libblkid library could linked with setuid programs */
+ 		if (setgid(getgid()) < 0)
+-			 exit(1);
++			 _exit(1);
+ 		if (setuid(getuid()) < 0)
+-			 exit(1);
++			 _exit(1);
+ 
+ 		lvargv[0] = cmd;
+ 		lvargv[1] = devname;
+@@ -95,7 +99,7 @@
+ 		execv(lvargv[0], lvargv);
+ 
+ 		DBG(LOWPROBE, blkid_debug("Failed to execute %s: errno=%d", cmd, errno));
+-		exit(1);
++		_exit(1);
+ 	}
+ 	case -1:
+ 		DBG(LOWPROBE, blkid_debug("Failed to forking: errno=%d", errno));
+diff -urN util-linux-2.23.2.old/libmount/src/context_mount.c util-linux-2.23.2/libmount/src/context_mount.c
+--- util-linux-2.23.2.old/libmount/src/context_mount.c	2013-06-13 15:46:10.432650724 +0800
++++ util-linux-2.23.2/libmount/src/context_mount.c	2013-11-11 14:44:33.215049590 +0800
+@@ -499,17 +499,29 @@
+ 
+ 	DBG_FLUSH;
+ 
++#ifndef HAVE_FORK
++	switch (vfork()) {
++#else
+ 	switch (fork()) {
++#endif
+ 	case 0:
+ 	{
+ 		const char *args[12], *type;
+ 		int i = 0;
+ 
+ 		if (setgid(getgid()) < 0)
++#ifndef HAVE_FORK
++			_exit(EXIT_FAILURE);
++#else
+ 			exit(EXIT_FAILURE);
++#endif
+ 
+ 		if (setuid(getuid()) < 0)
++#ifndef HAVE_FORK
++			_exit(EXIT_FAILURE);
++#else
+ 			exit(EXIT_FAILURE);
++#endif
+ 
+ 		type = mnt_fs_get_fstype(cxt->fs);
+ 
+@@ -546,7 +558,11 @@
+ #endif
+ 		DBG_FLUSH;
+ 		execv(cxt->helper, (char * const *) args);
++#ifndef HAVE_FORK
++		_exit(EXIT_FAILURE);
++#else
+ 		exit(EXIT_FAILURE);
++#endif
+ 	}
+ 	default:
+ 	{
+@@ -1123,7 +1123,7 @@
+ 	if (mnt_context_is_child(cxt)) {
+ 		DBG(CXT, mnt_debug_h(cxt, "next-mount: child exit [rc=%d]", rc));
+ 		DBG_FLUSH;
+-		exit(rc);
++		_exit(rc);
+ 	}
+ 	return 0;
+ }
+diff -urN util-linux-2.23.2.old/libmount/src/context_umount.c util-linux-2.23.2/libmount/src/context_umount.c
+--- util-linux-2.23.2.old/libmount/src/context_umount.c	2013-07-15 16:25:46.290049113 +0800
++++ util-linux-2.23.2/libmount/src/context_umount.c	2013-11-11 14:44:33.211047925 +0800
+@@ -441,17 +441,29 @@
+ 
+ 	DBG_FLUSH;
+ 
++#ifndef HAVE_FORK
++	switch (vfork()) {
++#else
+ 	switch (fork()) {
++#endif
+ 	case 0:
+ 	{
+ 		const char *args[10], *type;
+ 		int i = 0;
+ 
+ 		if (setgid(getgid()) < 0)
++#ifndef HAVE_FORK
++			_exit(EXIT_FAILURE);
++#else
+ 			exit(EXIT_FAILURE);
++#endif
+ 
+ 		if (setuid(getuid()) < 0)
++#ifndef HAVE_FORK
++			_exit(EXIT_FAILURE);
++#else
+ 			exit(EXIT_FAILURE);
++#endif
+ 
+ 		type = mnt_fs_get_fstype(cxt->fs);
+ 
+@@ -481,7 +493,11 @@
+ #endif
+ 		DBG_FLUSH;
+ 		execv(cxt->helper, (char * const *) args);
++#ifndef HAVE_FORK
++		_exit(EXIT_FAILURE);
++#else
+ 		exit(EXIT_FAILURE);
++#endif
+ 	}
+ 	default:
+ 	{
+diff -urN util-linux-2.23.2.old/login-utils/login.c util-linux-2.23.2/login-utils/login.c
+--- util-linux-2.23.2.old/login-utils/login.c	2013-07-30 16:39:26.222738397 +0800
++++ util-linux-2.23.2/login-utils/login.c	2013-11-11 15:10:11.720590863 +0800
+@@ -1079,7 +1079,11 @@
+ 	 * We must fork before setuid() because we need to call
+ 	 * pam_close_session() as root.
+ 	 */
++#ifndef HAVE_FORK
++	child_pid = vfork();
++#else
+ 	child_pid = fork();
++#endif
+ 	if (child_pid < 0) {
+ 		/*
+ 		 * fork() error
+@@ -1117,8 +1121,11 @@
+ 	sigaction(SIGHUP, &oldsa_hup, NULL);		/* restore old state */
+ 	sigaction(SIGTERM, &oldsa_term, NULL);
+ 	if (got_sig)
++#ifndef HAVE_FORK
++		_exit(EXIT_SUCCESS);
++#else
+ 		exit(EXIT_FAILURE);
+-
++#endif
+ 	/*
+ 	 * Problem: if the user's shell is a shell like ash that doesn't do
+ 	 * setsid() or setpgrp(), then a ctrl-\, sending SIGQUIT to every
+@@ -1428,7 +1435,7 @@
+ 	/* discard permissions last so can't get killed and drop core */
+ 	if (setuid(pwd->pw_uid) < 0 && pwd->pw_uid) {
+ 		syslog(LOG_ALERT, _("setuid() failed"));
+-		exit(EXIT_FAILURE);
++		_exit(EXIT_FAILURE);
+ 	}
+ 
+ 	/* wait until here to change directory! */
+@@ -1436,9 +1443,9 @@
+ 		warn(_("%s: change directory failed"), pwd->pw_dir);
+ 
+ 		if (!getlogindefs_bool("DEFAULT_HOME", 1))
+-			exit(0);
++			_exit(0);
+ 		if (chdir("/"))
+-			exit(EXIT_FAILURE);
++			_exit(EXIT_FAILURE);
+ 		pwd->pw_dir = "/";
+ 		printf(_("Logging in with home = \"/\".\n"));
+ 	}
+@@ -1473,7 +1480,7 @@
+ 	else
+ 		warn(_("no shell"));
+ 
+-	exit(EXIT_SUCCESS);
++	_exit(EXIT_SUCCESS);
+ }
+ 
+ 
+diff -urN util-linux-2.23.2.old/login-utils/vipw.c util-linux-2.23.2/login-utils/vipw.c
+--- util-linux-2.23.2.old/login-utils/vipw.c	2013-06-13 15:46:10.445650836 +0800
++++ util-linux-2.23.2/login-utils/vipw.c	2013-11-11 14:44:33.223052968 +0800
+@@ -208,7 +208,11 @@
+ 	else
+ 		p = editor;
+ 
++#ifndef HAVE_FORK
++	pid = vfork();
++#else
+ 	pid = fork();
++#endif
+ 	if (pid < 0)
+ 		err(EXIT_FAILURE, _("fork failed"));
+ 
+diff -urN util-linux-2.23.2.old/sys-utils/flock.c util-linux-2.23.2/sys-utils/flock.c
+--- util-linux-2.23.2.old/sys-utils/flock.c	2013-07-30 16:39:26.338739544 +0800
++++ util-linux-2.23.2/sys-utils/flock.c	2013-11-11 14:59:17.129680082 +0800
+@@ -286,8 +286,11 @@
+ 		pid_t w, f;
+ 		/* Clear any inherited settings */
+ 		signal(SIGCHLD, SIG_DFL);
++#ifndef HAVE_FORK
++		f = vfork();
++#else
+ 		f = fork();
+-
++#endif
+ 		if (f < 0) {
+ 			err(EX_OSERR, _("fork failed"));
+ 		} else if (f == 0) {
+diff -urN util-linux-2.23.2.old/sys-utils/setsid.c util-linux-2.23.2/sys-utils/setsid.c
+--- util-linux-2.23.2.old/sys-utils/setsid.c	2013-07-30 16:39:26.348739643 +0800
++++ util-linux-2.23.2/sys-utils/setsid.c	2013-11-11 14:58:28.542008597 +0800
+@@ -74,7 +74,11 @@
+ 		usage(stderr);
+ 
+ 	if (getpgrp() == getpid()) {
++#ifndef HAVE_FORK
++		switch(vfork()){
++#else
+ 		switch (fork()) {
++#endif
+ 		case -1:
+ 			err(EXIT_FAILURE, _("fork"));
+ 		case 0:
+diff -urN util-linux-2.23.2.old/sys-utils/swapon.c util-linux-2.23.2/sys-utils/swapon.c
+--- util-linux-2.23.2.old/sys-utils/swapon.c	2013-07-30 16:39:26.348739643 +0800
++++ util-linux-2.23.2/sys-utils/swapon.c	2013-11-11 14:44:33.223052968 +0800
+@@ -261,7 +261,11 @@
+ 
+ 	warnx(_("%s: reinitializing the swap."), device);
+ 
++#ifndef HAVE_FORK
++	switch((pid=vfork())) {
++#else
+ 	switch((pid=fork())) {
++#endif
+ 	case -1: /* fork error */
+ 		warn(_("fork failed"));
+ 		return -1;
+diff -urN util-linux-2.23.2.old/sys-utils/switch_root.c util-linux-2.23.2/sys-utils/switch_root.c
+--- util-linux-2.23.2.old/sys-utils/switch_root.c	2013-06-13 15:46:10.544651682 +0800
++++ util-linux-2.23.2/sys-utils/switch_root.c	2013-11-11 14:54:08.311226318 +0800
+@@ -172,7 +172,11 @@
+ 	}
+ 
+ 	if (cfd >= 0) {
++#ifndef HAVE_FORK
++		pid = vfork();
++#else
+ 		pid = fork();
++#endif
+ 		if (pid <= 0) {
+ 			if (fstat(cfd, &sb) == 0) {
+ 				if (sb.st_dev == makedev(0, 1))
+@@ -182,7 +186,11 @@
+ 			}
+ 
+ 			if (pid == 0)
++#ifndef HAVE_FORK
++				_exit(EXIT_SUCCESS);
++#else
+ 				exit(EXIT_SUCCESS);
++#endif
+ 		}
+ 		close(cfd);
+ 	}
+diff -urN util-linux-2.23.2.old/term-utils/script.c util-linux-2.23.2/term-utils/script.c
+--- util-linux-2.23.2.old/term-utils/script.c	2013-06-13 15:46:10.546651699 +0800
++++ util-linux-2.23.2/term-utils/script.c	2013-11-11 14:44:33.227054773 +0800
+@@ -257,7 +257,11 @@
+ 	sigaddset(&block_mask, SIGCHLD);
+ 
+ 	sigprocmask(SIG_SETMASK, &block_mask, &unblock_mask);
++#ifndef HAVE_FORK
++	child = vfork();
++#else
+ 	child = fork();
++#endif
+ 	sigprocmask(SIG_SETMASK, &unblock_mask, NULL);
+ 
+ 	if (child < 0) {
+@@ -267,7 +271,11 @@
+ 	if (child == 0) {
+ 
+ 		sigprocmask(SIG_SETMASK, &block_mask, NULL);
++#ifndef HAVE_FORK
++		subchild = child = vfork();
++#else
+ 		subchild = child = fork();
++#endif
+ 		sigprocmask(SIG_SETMASK, &unblock_mask, NULL);
+ 
+ 		if (child < 0) {
+@@ -505,11 +513,21 @@
+ 
+ 	if(eflg) {
+ 		if (WIFSIGNALED(childstatus))
+-			exit(WTERMSIG(childstatus) + 0x80);
++#ifndef HAVE_FORK
++			_exit(WTERMSIG(childstatus) + 0x80);
++		else
++			exit(WEXITSTATUS(childstatus));
++#else
++			_exit(WTERMSIG(childstatus) + 0x80);
+ 		else
+ 			exit(WEXITSTATUS(childstatus));
++#endif
+ 	}
++#ifndef HAVE_FORK
++	_exit(EXIT_SUCCESS);
++#else
+ 	exit(EXIT_SUCCESS);
++#endif
+ }
+ 
+ void
+diff -urN util-linux-2.23.2.old/term-utils/ttymsg.c util-linux-2.23.2/term-utils/ttymsg.c
+--- util-linux-2.23.2.old/term-utils/ttymsg.c	2013-07-30 16:39:26.352739682 +0800
++++ util-linux-2.23.2/term-utils/ttymsg.c	2013-11-11 14:44:33.227054773 +0800
+@@ -136,7 +136,11 @@
+ 				(void) close(fd);
+ 				_exit(EXIT_FAILURE);
+ 			}
++#ifndef HAVE_FORK
++			cpid = vfork();
++#else
+ 			cpid = fork();
++#endif
+ 			if (cpid < 0) {
+ 				if (strlen(strerror(errno)) > 1000)
+ 					(void) sprintf(errbuf, _("cannot fork"));
+diff -urN util-linux-2.23.2.old/text-utils/more.c util-linux-2.23.2/text-utils/more.c
+--- util-linux-2.23.2.old/text-utils/more.c	2013-07-30 16:39:26.358739741 +0800
++++ util-linux-2.23.2/text-utils/more.c	2013-11-11 14:51:17.355938643 +0800
+@@ -1659,7 +1659,11 @@
+ 
+ 	fflush(stdout);
+ 	reset_tty();
++#ifndef HAVE_FORK
++	for (n = 10; (id = vfork()) < 0 && n > 0; n--)
++#else
+ 	for (n = 10; (id = fork()) < 0 && n > 0; n--)
++#endif
+ 		sleep(5);
+ 	if (id == 0) {
+ 		if (!isatty(0)) {
+@@ -1691,7 +1695,11 @@
+ 
+ 		execvp(cmd, args);
+ 		putserr(_("exec failed\n"));
++#ifndef HAVE_FORK
++		_exit(EXIT_FAILURE);
++#else
+ 		exit(EXIT_FAILURE);
++#endif
+ 	}
+ 	if (id > 0) {
+ 		signal(SIGINT, SIG_IGN);
+diff -urN util-linux-2.23.2.old/text-utils/pg.c util-linux-2.23.2/text-utils/pg.c
+--- util-linux-2.23.2.old/text-utils/pg.c	2013-07-30 16:39:26.359739751 +0800
++++ util-linux-2.23.2/text-utils/pg.c	2013-11-11 14:44:33.231056254 +0800
+@@ -1330,7 +1330,11 @@
+ 					write_all(STDOUT_FILENO, "\n", 1);
+ 					my_sigset(SIGINT, SIG_IGN);
+ 					my_sigset(SIGQUIT, SIG_IGN);
++#ifndef HAVE_FORK
++					switch (cpid = vfork()) {
++#else
+ 					switch (cpid = fork()) {
++#endif
+ 					case 0:
+ 					{
+ 						const char *sh = getenv("SHELL");
+diff -urN util-linux-2.23.2.old/lib/pager.c util-linux-2.23.2/lib/pager.c
+--- util-linux-2.23.2.old/lib/pager.c	2013-07-30 16:39:26.204738219 +0800
++++ util-linux-2.23.2/lib/pager.c	2013-11-11 17:21:04.690487001 +0800
+@@ -70,7 +70,11 @@
+ 	}
+ 
+ 	fflush(NULL);
++#ifndef HAVE_FORK
++	cmd->pid = vfork();
++#else
+ 	cmd->pid = fork();
++#endif
+ 	if (!cmd->pid) {
+ 		if (need_in) {
+ 			dup2(fdin[0], 0);
+@@ -82,7 +86,7 @@
+ 
+ 		cmd->preexec_cb();
+ 		execvp(cmd->argv[0], (char *const*) cmd->argv);
+-		exit(127); /* cmd not found */
++		_exit(127); /* cmd not found */
+ 	}
+ 
+ 	if (cmd->pid < 0) {
+diff -urN util-linux-2.23.2.old/libmount/src/context.c util-linux-2.23.2/libmount/src/context.c
+--- util-linux-2.23.2.old/libmount/src/context.c	2013-07-30 16:39:26.214738318 +0800
++++ util-linux-2.23.2/libmount/src/context.c	2013-11-11 17:22:02.246527785 +0800
+@@ -2199,8 +2199,11 @@
+ 
+ 	DBG_FLUSH;
+ 
++#ifndef HAVE_FORK
++	pid = vfork();
++#else
+ 	pid = fork();
+-
++#endif
+ 	switch (pid) {
+ 	case -1: /* error */
+ 		DBG(CXT, mnt_debug_h(cxt, "fork failed %m"));
+diff -urN util-linux-2.23.2.old/login-utils/su-common.c util-linux-2.23.2/login-utils/su-common.c
+--- util-linux-2.23.2.old/login-utils/su-common.c	2013-07-30 16:39:26.223738407 +0800
++++ util-linux-2.23.2/login-utils/su-common.c	2013-11-11 17:30:35.612635118 +0800
+@@ -271,7 +271,11 @@
+   else
+     _pam_session_opened = 1;
+ 
++#ifndef HAVE_FORK
++  child = vfork ();
++#else
+   child = fork ();
++#endif
+   if (child == (pid_t) -1)
+     {
+       cleanup_pam (PAM_ABORT);
+diff -urN util-linux-2.23.2.old/login-utils/sulogin.c util-linux-2.23.2/login-utils/sulogin.c
+--- util-linux-2.23.2.old/login-utils/sulogin.c	2013-07-30 16:39:26.225738427 +0800
++++ util-linux-2.23.2/login-utils/sulogin.c	2013-11-11 17:29:48.421644098 +0800
+@@ -912,8 +912,11 @@
+ 		con = list_entry(ptr, struct console, entry);
+ 		if (con->id >= CONMAX)
+ 			break;
+-
++#ifndef HAVE_FORK
++		switch ((con->pid = vfork())) {
++#else
+ 		switch ((con->pid = fork())) {
++#endif
+ 		case 0:
+ 			mask_signal(SIGCHLD, SIG_DFL, NULL);
+ 			/* fall through */
+@@ -963,7 +966,7 @@
+ 			/*
+ 			 * User pressed Control-D.
+ 			 */
+-			exit(0);
++			_exit(0);
+ 		case -1:
+ 			warn(_("fork failed"));
+ 			/* fall through */
+diff -urN util-linux-2.23.2.old/sys-utils/eject.c util-linux-2.23.2/sys-utils/eject.c
+--- util-linux-2.23.2.old/sys-utils/eject.c	2013-07-30 16:53:48.342745064 +0800
++++ util-linux-2.23.2/sys-utils/eject.c	2013-11-11 17:31:55.427519728 +0800
+@@ -652,7 +652,11 @@
+ 
+ 	verbose(_("%s: unmounting"), name);
+ 
++#ifndef HAVE_FORK
++	switch (vfork()) {
++#else
+ 	switch (fork()) {
++#endif
+ 	case 0: /* child */
+ 		if (setgid(getgid()) < 0)
+ 			err(EXIT_FAILURE, _("cannot set group id"));
+diff -urN util-linux-2.23.2.old/sys-utils/nsenter.c util-linux-2.23.2/sys-utils/nsenter.c
+--- util-linux-2.23.2.old/sys-utils/nsenter.c	2013-07-30 16:39:26.345739613 +0800
++++ util-linux-2.23.2/sys-utils/nsenter.c	2013-11-11 17:33:23.038203353 +0800
+@@ -127,7 +127,11 @@
+ 
+ static void continue_as_child(void)
+ {
++#ifndef HAVE_FORK
++	pid_t child = vfork();
++#else
+ 	pid_t child = fork();
++#endif
+ 	int status;
+ 	pid_t ret;
+ 
-- 
1.8.2.3
