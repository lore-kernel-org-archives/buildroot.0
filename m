From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 May 2012 18:39:32 +0200
Subject: [Buildroot] [PATCH 2/2] dropbear: fix on !MMU platforms
In-Reply-To: <1336408773-27312-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1336408773-27312-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1336408773-27312-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build tested for sh2a and blackfin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear-better-fork-test.patch |  232 ++++++++++++++++++++++
 package/dropbear/dropbear-no-mmu.patch           |   21 ++
 package/dropbear/dropbear.mk                     |    1 +
 3 files changed, 254 insertions(+)
 create mode 100644 package/dropbear/dropbear-better-fork-test.patch
 create mode 100644 package/dropbear/dropbear-no-mmu.patch

diff --git a/package/dropbear/dropbear-better-fork-test.patch b/package/dropbear/dropbear-better-fork-test.patch
new file mode 100644
index 0000000..d7a8a66
--- /dev/null
+++ b/package/dropbear/dropbear-better-fork-test.patch
@@ -0,0 +1,232 @@
+Upstream patch, will be part of the next Dropbear release.
+
+# HG changeset patch
+# User Mike Frysinger <vapier@gentoo.org>
+# Date 1333864252 14400
+# Node ID 0ad95abf8d3c78d16203fa6e3609fccfdb1effba
+# Parent  4d9511f98462cf1fdcc9f657534669fd4dc571bd
+check for fork() and not __uClinux__
+
+diff -r 4d9511f98462 -r 0ad95abf8d3c configure.in
+--- a/configure.in	Sun Apr 08 02:06:54 2012 -0400
++++ b/configure.in	Sun Apr 08 01:50:52 2012 -0400
+@@ -616,7 +616,7 @@
+ AC_FUNC_MEMCMP
+ AC_FUNC_SELECT_ARGTYPES
+ AC_TYPE_SIGNAL
+-AC_CHECK_FUNCS([dup2 getspnam getusershell memset putenv select socket strdup clearenv strlcpy strlcat daemon basename _getpty getaddrinfo freeaddrinfo getnameinfo])
++AC_CHECK_FUNCS([dup2 getspnam getusershell memset putenv select socket strdup clearenv strlcpy strlcat daemon basename _getpty getaddrinfo freeaddrinfo getnameinfo fork])
+ 
+ AC_SEARCH_LIBS(basename, gen, AC_DEFINE(HAVE_BASENAME))
+ 
+diff -r 4d9511f98462 -r 0ad95abf8d3c dbutil.c
+--- a/dbutil.c	Sun Apr 08 02:06:54 2012 -0400
++++ b/dbutil.c	Sun Apr 08 01:50:52 2012 -0400
+@@ -443,7 +443,7 @@
+ 		return DROPBEAR_FAILURE;
+ 	}
+ 
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	pid = vfork();
+ #else
+ 	pid = fork();
+diff -r 4d9511f98462 -r 0ad95abf8d3c scp.c
+--- a/scp.c	Sun Apr 08 02:06:54 2012 -0400
++++ b/scp.c	Sun Apr 08 01:50:52 2012 -0400
+@@ -130,22 +130,22 @@
+ 			fprintf(stderr, " %s", a->list[i]);
+ 		fprintf(stderr, "\n");
+ 	}
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	pid = vfork();
+ #else
+ 	pid = fork();
+-#endif /* __uClinux__ */
++#endif
+ 	if (pid == -1)
+ 		fatal("do_local_cmd: fork: %s", strerror(errno));
+ 
+ 	if (pid == 0) {
+ 		execvp(a->list[0], a->list);
+ 		perror(a->list[0]);
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 		_exit(1);
+ #else
+ 		exit(1);
+-#endif /* __uClinux__ */
++#endif
+ 	}
+ 
+ 	do_cmd_pid = pid;
+@@ -171,6 +171,16 @@
+  * assigns the input and output file descriptors on success.
+  */
+ 
++static void
++arg_setup(char *host, char *remuser, char *cmd)
++{
++	replacearg(&args, 0, "%s", ssh_program);
++	if (remuser != NULL)
++		addargs(&args, "-l%s", remuser);
++	addargs(&args, "%s", host);
++	addargs(&args, "%s", cmd);
++}
++
+ int
+ do_cmd(char *host, char *remuser, char *cmd, int *fdin, int *fdout, int argc)
+ {
+@@ -198,22 +208,18 @@
+ 	close(reserved[0]);
+ 	close(reserved[1]);
+ 
+-    /* uClinux needs to build the args here before vforking,
+-       otherwise we do it later on. */
+-#ifdef __uClinux__
+-		replacearg(&args, 0, "%s", ssh_program);
+-		if (remuser != NULL)
+-			addargs(&args, "-l%s", remuser);
+-		addargs(&args, "%s", host);
+-		addargs(&args, "%s", cmd);
+-#endif /* __uClinux__ */
++	/* uClinux needs to build the args here before vforking,
++	   otherwise we do it later on. */
++#ifndef HAVE_FORK
++	arg_setup(host, remuser, cmd);
++#endif
+ 
+ 	/* Fork a child to execute the command on the remote host using ssh. */
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	do_cmd_pid = vfork();
+ #else
+ 	do_cmd_pid = fork();
+-#endif /* __uClinux__ */
++#endif
+ 
+ 	if (do_cmd_pid == 0) {
+ 		/* Child. */
+@@ -224,27 +230,22 @@
+ 		close(pin[0]);
+ 		close(pout[1]);
+ 
+-#ifndef __uClinux__
+-		replacearg(&args, 0, "%s", ssh_program);
+-		if (remuser != NULL)
+-			addargs(&args, "-l%s", remuser);
+-		addargs(&args, "%s", host);
+-		addargs(&args, "%s", cmd);
+-#endif /* __uClinux__ */
++#ifndef HAVE_FORK
++		arg_setup(host, remuser, cmd);
++#endif
+ 
+ 		execvp(ssh_program, args.list);
+ 		perror(ssh_program);
+-#ifndef __uClinux__
++#ifndef HAVE_FORK
++		_exit(1);
++#else
+ 		exit(1);
+-#else
+-		_exit(1);
+-#endif /* __uClinux__ */
++#endif
+ 	} else if (do_cmd_pid == -1) {
+ 		fatal("fork: %s", strerror(errno));
+ 	}
+ 
+-
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	/* clean up command */
+ 	/* pop cmd */
+ 	xfree(args.list[args.num-1]);
+@@ -260,7 +261,7 @@
+ 		args.list[args.num-1]=NULL;
+ 		args.num--;
+ 	}
+-#endif /* __uClinux__ */
++#endif
+ 
+ 	/* Parent.  Close the other side, and return the local side. */
+ 	close(pin[0]);
+diff -r 4d9511f98462 -r 0ad95abf8d3c session.h
+--- a/session.h	Sun Apr 08 02:06:54 2012 -0400
++++ b/session.h	Sun Apr 08 01:50:52 2012 -0400
+@@ -218,7 +218,7 @@
+ 	/* The resolved remote address, used for lastlog etc */
+ 	char *remotehost;
+ 
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	pid_t server_pid;
+ #endif
+ 
+diff -r 4d9511f98462 -r 0ad95abf8d3c svr-chansession.c
+--- a/svr-chansession.c	Sun Apr 08 02:06:54 2012 -0400
++++ b/svr-chansession.c	Sun Apr 08 01:50:52 2012 -0400
+@@ -658,7 +658,7 @@
+ 
+ 	/* uClinux will vfork(), so there'll be a race as 
+ 	connection_string is freed below. */
+-#ifndef __uClinux__
++#ifdef HAVE_FORK
+ 	chansess->connection_string = make_connection_string();
+ #endif
+ 
+@@ -670,7 +670,7 @@
+ 		ret = ptycommand(channel, chansess);
+ 	}
+ 
+-#ifndef __uClinux__	
++#ifdef HAVE_FORK	
+ 	m_free(chansess->connection_string);
+ #endif
+ 
+@@ -745,7 +745,7 @@
+ 		return DROPBEAR_FAILURE;
+ 	}
+ 	
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	pid = vfork();
+ #else
+ 	pid = fork();
+@@ -863,9 +863,9 @@
+ 	struct ChanSess *chansess = user_data;
+ 	char *usershell = NULL;
+ 
+-    /* with uClinux we'll have vfork()ed, so don't want to overwrite the
+-     * hostkey. can't think of a workaround to clear it */
+-#ifndef __uClinux__
++	/* with uClinux we'll have vfork()ed, so don't want to overwrite the
++	 * hostkey. can't think of a workaround to clear it */
++#ifdef HAVE_FORK
+ 	/* wipe the hostkey */
+ 	sign_key_free(svr_opts.hostkey);
+ 	svr_opts.hostkey = NULL;
+diff -r 4d9511f98462 -r 0ad95abf8d3c svr-session.c
+--- a/svr-session.c	Sun Apr 08 02:06:54 2012 -0400
++++ b/svr-session.c	Sun Apr 08 01:50:52 2012 -0400
+@@ -84,7 +84,7 @@
+ 
+ 	/* Initialise server specific parts of the session */
+ 	svr_ses.childpipe = childpipe;
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	svr_ses.server_pid = getpid();
+ #endif
+ 	svr_authinitialise();
+@@ -157,7 +157,7 @@
+ 
+ 	_dropbear_log(LOG_INFO, fmtbuf, param);
+ 
+-#ifdef __uClinux__
++#ifndef HAVE_FORK
+ 	/* only the main server process should cleanup - we don't want
+ 	 * forked children doing that */
+ 	if (svr_ses.server_pid == getpid())
+
diff --git a/package/dropbear/dropbear-no-mmu.patch b/package/dropbear/dropbear-no-mmu.patch
new file mode 100644
index 0000000..28d1ea3
--- /dev/null
+++ b/package/dropbear/dropbear-no-mmu.patch
@@ -0,0 +1,21 @@
+Fix fork() usage
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/svr-main.c
+===================================================================
+--- a/svr-main.c
++++ b/svr-main.c
+@@ -262,8 +262,12 @@
+ #ifdef DEBUG_NOFORK
+ 			fork_ret = 0;
+ #else
++#ifndef HAVE_FORK
++			fork_ret = vfork();
++#else
+ 			fork_ret = fork();
+ #endif
++#endif
+ 			if (fork_ret < 0) {
+ 				dropbear_log(LOG_WARNING, "Error forking: %s", strerror(errno));
+ 				goto out;
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index fea96d6..a5e177c 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -9,6 +9,7 @@ DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
 DROPBEAR_MAKE =	$(MAKE) MULTI=1 SCPPROGRESS=1 \
 		PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
+DROPBEAR_AUTORECONF = YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 DROPBEAR_MAKE += STATIC=1
-- 
1.7.9.5
