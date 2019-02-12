From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 19:59:11 +0100
Subject: [Buildroot] [git commit branch/next] openssh: add upstream security
 fixes
Message-ID: <20190213214530.8D3F9835F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fe3741bc4197f6bff48236f357f5db1269586c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2019-6109: Due to missing character encoding in the progress
display, a malicious server (or Man-in-The-Middle attacker) can employ
crafted object names to manipulate the client output, e.g., by using
ANSI control codes to hide additional files being transferred. This
affects refresh_progress_meter() in progressmeter.c.

CVE-2019-6111: Due to the scp implementation being derived from 1983
rcp, the server chooses which files/directories are sent to the client.
However, the scp client only performs cursory validation of the object
name returned (only directory traversal attacks are prevented). A
malicious scp server (or Man-in-The-Middle attacker) can overwrite
arbitrary files in the scp client target directory. If recursive
operation (-r) is performed, the server can manipulate subdirectories as
well (for example, to overwrite the .ssh/authorized_keys file).

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nitize-scp-filenames-via-snmprintf.-To-do.patch | 275 +++++++++++++++++++++
 ...eck-in-scp-client-that-filenames-sent-dur.patch | 186 ++++++++++++++
 2 files changed, 461 insertions(+)

diff --git a/package/openssh/0002-upstream-Sanitize-scp-filenames-via-snmprintf.-To-do.patch b/package/openssh/0002-upstream-Sanitize-scp-filenames-via-snmprintf.-To-do.patch
new file mode 100644
index 0000000000..e5d137ef11
--- /dev/null
+++ b/package/openssh/0002-upstream-Sanitize-scp-filenames-via-snmprintf.-To-do.patch
@@ -0,0 +1,275 @@
+From 5979bdfeca813dd7e997a1edb0f928d77ce70304 Mon Sep 17 00:00:00 2001
+From: "dtucker at openbsd.org" <dtucker@openbsd.org>
+Date: Wed, 23 Jan 2019 08:01:46 +0000
+Subject: [PATCH] upstream: Sanitize scp filenames via snmprintf. To do this we
+ move
+
+the progressmeter formatting outside of signal handler context and have the
+atomicio callback called for EINTR too.  bz#2434 with contributions from djm
+and jjelen at redhat.com, ok djm@
+
+OpenBSD-Commit-ID: 1af61c1f70e4f3bd8ab140b9f1fa699481db57d8
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status (openssh-portable): backported from commit 8976f1c4b27
+---
+ atomicio.c      | 20 ++++++++++++++-----
+ progressmeter.c | 53 ++++++++++++++++++++++---------------------------
+ progressmeter.h |  3 ++-
+ scp.c           |  1 +
+ sftp-client.c   | 16 ++++++++-------
+ 5 files changed, 51 insertions(+), 42 deletions(-)
+
+diff --git a/atomicio.c b/atomicio.c
+index f854a06f5f50..d91bd7621c12 100644
+--- a/atomicio.c
++++ b/atomicio.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: atomicio.c,v 1.28 2016/07/27 23:18:12 djm Exp $ */
++/* $OpenBSD: atomicio.c,v 1.29 2019/01/23 08:01:46 dtucker Exp $ */
+ /*
+  * Copyright (c) 2006 Damien Miller. All rights reserved.
+  * Copyright (c) 2005 Anil Madhavapeddy. All rights reserved.
+@@ -65,9 +65,14 @@ atomicio6(ssize_t (*f) (int, void *, size_t), int fd, void *_s, size_t n,
+ 		res = (f) (fd, s + pos, n - pos);
+ 		switch (res) {
+ 		case -1:
+-			if (errno == EINTR)
++			if (errno == EINTR) {
++				/* possible SIGALARM, update callback */
++				if (cb != NULL && cb(cb_arg, 0) == -1) {
++					errno = EINTR;
++					return pos;
++				}
+ 				continue;
+-			if (errno == EAGAIN || errno == EWOULDBLOCK) {
++			} else if (errno == EAGAIN || errno == EWOULDBLOCK) {
+ #ifndef BROKEN_READ_COMPARISON
+ 				(void)poll(&pfd, 1, -1);
+ #endif
+@@ -122,9 +127,14 @@ atomiciov6(ssize_t (*f) (int, const struct iovec *, int), int fd,
+ 		res = (f) (fd, iov, iovcnt);
+ 		switch (res) {
+ 		case -1:
+-			if (errno == EINTR)
++			if (errno == EINTR) {
++				/* possible SIGALARM, update callback */
++				if (cb != NULL && cb(cb_arg, 0) == -1) {
++					errno = EINTR;
++					return pos;
++				}
+ 				continue;
+-			if (errno == EAGAIN || errno == EWOULDBLOCK) {
++			} else if (errno == EAGAIN || errno == EWOULDBLOCK) {
+ #ifndef BROKEN_READV_COMPARISON
+ 				(void)poll(&pfd, 1, -1);
+ #endif
+diff --git a/progressmeter.c b/progressmeter.c
+index fe9bf52e4c90..add462dde500 100644
+--- a/progressmeter.c
++++ b/progressmeter.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: progressmeter.c,v 1.45 2016/06/30 05:17:05 dtucker Exp $ */
++/* $OpenBSD: progressmeter.c,v 1.46 2019/01/23 08:01:46 dtucker Exp $ */
+ /*
+  * Copyright (c) 2003 Nils Nordman.  All rights reserved.
+  *
+@@ -31,6 +31,7 @@
+ 
+ #include <errno.h>
+ #include <signal.h>
++#include <stdarg.h>
+ #include <stdio.h>
+ #include <string.h>
+ #include <time.h>
+@@ -39,6 +40,7 @@
+ #include "progressmeter.h"
+ #include "atomicio.h"
+ #include "misc.h"
++#include "utf8.h"
+ 
+ #define DEFAULT_WINSIZE 80
+ #define MAX_WINSIZE 512
+@@ -61,7 +63,7 @@ static void setscreensize(void);
+ void refresh_progress_meter(void);
+ 
+ /* signal handler for updating the progress meter */
+-static void update_progress_meter(int);
++static void sig_alarm(int);
+ 
+ static double start;		/* start progress */
+ static double last_update;	/* last progress update */
+@@ -74,6 +76,7 @@ static long stalled;		/* how long we have been stalled */
+ static int bytes_per_second;	/* current speed in bytes per second */
+ static int win_size;		/* terminal window size */
+ static volatile sig_atomic_t win_resized; /* for window resizing */
++static volatile sig_atomic_t alarm_fired;
+ 
+ /* units for format_size */
+ static const char unit[] = " KMGT";
+@@ -126,9 +129,17 @@ refresh_progress_meter(void)
+ 	off_t bytes_left;
+ 	int cur_speed;
+ 	int hours, minutes, seconds;
+-	int i, len;
+ 	int file_len;
+ 
++	if ((!alarm_fired && !win_resized) || !can_output())
++		return;
++	alarm_fired = 0;
++
++	if (win_resized) {
++		setscreensize();
++		win_resized = 0;
++	}
++
+ 	transferred = *counter - (cur_pos ? cur_pos : start_pos);
+ 	cur_pos = *counter;
+ 	now = monotime_double();
+@@ -158,16 +169,11 @@ refresh_progress_meter(void)
+ 
+ 	/* filename */
+ 	buf[0] = '\0';
+-	file_len = win_size - 35;
++	file_len = win_size - 36;
+ 	if (file_len > 0) {
+-		len = snprintf(buf, file_len + 1, "\r%s", file);
+-		if (len < 0)
+-			len = 0;
+-		if (len >= file_len + 1)
+-			len = file_len;
+-		for (i = len; i < file_len; i++)
+-			buf[i] = ' ';
+-		buf[file_len] = '\0';
++		buf[0] = '\r';
++		snmprintf(buf+1, sizeof(buf)-1 , &file_len, "%*s",
++		    file_len * -1, file);
+ 	}
+ 
+ 	/* percent of transfer done */
+@@ -228,22 +234,11 @@ refresh_progress_meter(void)
+ 
+ /*ARGSUSED*/
+ static void
+-update_progress_meter(int ignore)
++sig_alarm(int ignore)
+ {
+-	int save_errno;
+-
+-	save_errno = errno;
+-
+-	if (win_resized) {
+-		setscreensize();
+-		win_resized = 0;
+-	}
+-	if (can_output())
+-		refresh_progress_meter();
+-
+-	signal(SIGALRM, update_progress_meter);
++	signal(SIGALRM, sig_alarm);
++	alarm_fired = 1;
+ 	alarm(UPDATE_INTERVAL);
+-	errno = save_errno;
+ }
+ 
+ void
+@@ -259,10 +254,9 @@ start_progress_meter(const char *f, off_t filesize, off_t *ctr)
+ 	bytes_per_second = 0;
+ 
+ 	setscreensize();
+-	if (can_output())
+-		refresh_progress_meter();
++	refresh_progress_meter();
+ 
+-	signal(SIGALRM, update_progress_meter);
++	signal(SIGALRM, sig_alarm);
+ 	signal(SIGWINCH, sig_winch);
+ 	alarm(UPDATE_INTERVAL);
+ }
+@@ -286,6 +280,7 @@ stop_progress_meter(void)
+ static void
+ sig_winch(int sig)
+ {
++	signal(SIGWINCH, sig_winch);
+ 	win_resized = 1;
+ }
+ 
+diff --git a/progressmeter.h b/progressmeter.h
+index bf179dca6518..8f6678060195 100644
+--- a/progressmeter.h
++++ b/progressmeter.h
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: progressmeter.h,v 1.3 2015/01/14 13:54:13 djm Exp $ */
++/* $OpenBSD: progressmeter.h,v 1.4 2019/01/23 08:01:46 dtucker Exp $ */
+ /*
+  * Copyright (c) 2002 Nils Nordman.  All rights reserved.
+  *
+@@ -24,4 +24,5 @@
+  */
+ 
+ void	start_progress_meter(const char *, off_t, off_t *);
++void	refresh_progress_meter(void);
+ void	stop_progress_meter(void);
+diff --git a/scp.c b/scp.c
+index 4f3fdcd3db89..4a342a63873c 100644
+--- a/scp.c
++++ b/scp.c
+@@ -585,6 +585,7 @@ scpio(void *_cnt, size_t s)
+ 	off_t *cnt = (off_t *)_cnt;
+ 
+ 	*cnt += s;
++	refresh_progress_meter();
+ 	if (limit_kbps > 0)
+ 		bandwidth_limit(&bwlimit, s);
+ 	return 0;
+diff --git a/sftp-client.c b/sftp-client.c
+index 4986d6d8d291..2bc698f868bc 100644
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -101,7 +101,9 @@ sftpio(void *_bwlimit, size_t amount)
+ {
+ 	struct bwlimit *bwlimit = (struct bwlimit *)_bwlimit;
+ 
+-	bandwidth_limit(bwlimit, amount);
++	refresh_progress_meter();
++	if (bwlimit != NULL)
++		bandwidth_limit(bwlimit, amount);
+ 	return 0;
+ }
+ 
+@@ -121,8 +123,8 @@ send_msg(struct sftp_conn *conn, struct sshbuf *m)
+ 	iov[1].iov_base = (u_char *)sshbuf_ptr(m);
+ 	iov[1].iov_len = sshbuf_len(m);
+ 
+-	if (atomiciov6(writev, conn->fd_out, iov, 2,
+-	    conn->limit_kbps > 0 ? sftpio : NULL, &conn->bwlimit_out) !=
++	if (atomiciov6(writev, conn->fd_out, iov, 2, sftpio,
++	    conn->limit_kbps > 0 ? &conn->bwlimit_out : NULL) !=
+ 	    sshbuf_len(m) + sizeof(mlen))
+ 		fatal("Couldn't send packet: %s", strerror(errno));
+ 
+@@ -138,8 +140,8 @@ get_msg_extended(struct sftp_conn *conn, struct sshbuf *m, int initial)
+ 
+ 	if ((r = sshbuf_reserve(m, 4, &p)) != 0)
+ 		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	if (atomicio6(read, conn->fd_in, p, 4,
+-	    conn->limit_kbps > 0 ? sftpio : NULL, &conn->bwlimit_in) != 4) {
++	if (atomicio6(read, conn->fd_in, p, 4, sftpio,
++	    conn->limit_kbps > 0 ? &conn->bwlimit_in : NULL) != 4) {
+ 		if (errno == EPIPE || errno == ECONNRESET)
+ 			fatal("Connection closed");
+ 		else
+@@ -157,8 +159,8 @@ get_msg_extended(struct sftp_conn *conn, struct sshbuf *m, int initial)
+ 
+ 	if ((r = sshbuf_reserve(m, msg_len, &p)) != 0)
+ 		fatal("%s: buffer error: %s", __func__, ssh_err(r));
+-	if (atomicio6(read, conn->fd_in, p, msg_len,
+-	    conn->limit_kbps > 0 ? sftpio : NULL, &conn->bwlimit_in)
++	if (atomicio6(read, conn->fd_in, p, msg_len, sftpio,
++	    conn->limit_kbps > 0 ? &conn->bwlimit_in : NULL)
+ 	    != msg_len) {
+ 		if (errno == EPIPE)
+ 			fatal("Connection closed");
+-- 
+2.20.1
+
diff --git a/package/openssh/0003-upstream-check-in-scp-client-that-filenames-sent-dur.patch b/package/openssh/0003-upstream-check-in-scp-client-that-filenames-sent-dur.patch
new file mode 100644
index 0000000000..98ce5cd876
--- /dev/null
+++ b/package/openssh/0003-upstream-check-in-scp-client-that-filenames-sent-dur.patch
@@ -0,0 +1,186 @@
+From f853123eda6b279a87be48e18bbea8dec82a94f2 Mon Sep 17 00:00:00 2001
+From: "djm at openbsd.org" <djm@openbsd.org>
+Date: Sat, 26 Jan 2019 22:41:28 +0000
+Subject: [PATCH] upstream: check in scp client that filenames sent during
+
+remote->local directory copies satisfy the wildcard specified by the user.
+
+This checking provides some protection against a malicious server
+sending unexpected filenames, but it comes at a risk of rejecting wanted
+files due to differences between client and server wildcard expansion rules.
+
+For this reason, this also adds a new -T flag to disable the check.
+
+reported by Harry Sintonen
+fix approach suggested by markus@;
+has been in snaps for ~1wk courtesy deraadt@
+
+OpenBSD-Commit-ID: 00f44b50d2be8e321973f3c6d014260f8f7a8eda
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status (openssh-portable): backported from commit 8976f1c4b2
+---
+ scp.1 | 12 +++++++++++-
+ scp.c | 37 +++++++++++++++++++++++++++++--------
+ 2 files changed, 40 insertions(+), 9 deletions(-)
+
+diff --git a/scp.1 b/scp.1
+index 0e5cc1b2d675..397e7709195a 100644
+--- a/scp.1
++++ b/scp.1
+@@ -18,7 +18,7 @@
+ .Nd secure copy (remote file copy program)
+ .Sh SYNOPSIS
+ .Nm scp
+-.Op Fl 346BCpqrv
++.Op Fl 346BCpqrTv
+ .Op Fl c Ar cipher
+ .Op Fl F Ar ssh_config
+ .Op Fl i Ar identity_file
+@@ -208,6 +208,16 @@ to use for the encrypted connection.
+ The program must understand
+ .Xr ssh 1
+ options.
++.It Fl T
++Disable strict filename checking.
++By default when copying files from a remote host to a local directory
++.Nm
++checks that the received filenames match those requested on the command-line
++to prevent the remote end from sending unexpected or unwanted files.
++Because of differences in how various operating systems and shells interpret
++filename wildcards, these checks may cause wanted files to be rejected.
++This option disables these checks at the expense of fully trusting that
++the server will not send unexpected filenames.
+ .It Fl v
+ Verbose mode.
+ Causes
+diff --git a/scp.c b/scp.c
+index 4a342a63873c..7b0a08efb274 100644
+--- a/scp.c
++++ b/scp.c
+@@ -94,6 +94,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <fnmatch.h>
+ #include <limits.h>
+ #include <locale.h>
+ #include <pwd.h>
+@@ -375,14 +376,14 @@ void verifydir(char *);
+ struct passwd *pwd;
+ uid_t userid;
+ int errs, remin, remout;
+-int pflag, iamremote, iamrecursive, targetshouldbedirectory;
++int Tflag, pflag, iamremote, iamrecursive, targetshouldbedirectory;
+ 
+ #define	CMDNEEDS	64
+ char cmd[CMDNEEDS];		/* must hold "rcp -r -p -d\0" */
+ 
+ int response(void);
+ void rsource(char *, struct stat *);
+-void sink(int, char *[]);
++void sink(int, char *[], const char *);
+ void source(int, char *[]);
+ void tolocal(int, char *[]);
+ void toremote(int, char *[]);
+@@ -421,8 +422,9 @@ main(int argc, char **argv)
+ 	addargs(&args, "-oRemoteCommand=none");
+ 	addargs(&args, "-oRequestTTY=no");
+ 
+-	fflag = tflag = 0;
+-	while ((ch = getopt(argc, argv, "dfl:prtvBCc:i:P:q12346S:o:F:")) != -1)
++	fflag = Tflag = tflag = 0;
++	while ((ch = getopt(argc, argv,
++	    "dfl:prtTvBCc:i:P:q12346S:o:F:")) != -1) {
+ 		switch (ch) {
+ 		/* User-visible flags. */
+ 		case '1':
+@@ -501,9 +503,13 @@ main(int argc, char **argv)
+ 			setmode(0, O_BINARY);
+ #endif
+ 			break;
++		case 'T':
++			Tflag = 1;
++			break;
+ 		default:
+ 			usage();
+ 		}
++	}
+ 	argc -= optind;
+ 	argv += optind;
+ 
+@@ -534,7 +540,7 @@ main(int argc, char **argv)
+ 	}
+ 	if (tflag) {
+ 		/* Receive data. */
+-		sink(argc, argv);
++		sink(argc, argv, NULL);
+ 		exit(errs != 0);
+ 	}
+ 	if (argc < 2)
+@@ -792,7 +798,7 @@ tolocal(int argc, char **argv)
+ 			continue;
+ 		}
+ 		free(bp);
+-		sink(1, argv + argc - 1);
++		sink(1, argv + argc - 1, src);
+ 		(void) close(remin);
+ 		remin = remout = -1;
+ 	}
+@@ -968,7 +974,7 @@ rsource(char *name, struct stat *statp)
+ 	 (sizeof(type) != 4 && sizeof(type) != 8))
+ 
+ void
+-sink(int argc, char **argv)
++sink(int argc, char **argv, const char *src)
+ {
+ 	static BUF buffer;
+ 	struct stat stb;
+@@ -984,6 +990,7 @@ sink(int argc, char **argv)
+ 	unsigned long long ull;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048], visbuf[2048];
++	char *src_copy = NULL, *restrict_pattern = NULL;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -1008,6 +1015,17 @@ sink(int argc, char **argv)
+ 	(void) atomicio(vwrite, remout, "", 1);
+ 	if (stat(targ, &stb) == 0 && S_ISDIR(stb.st_mode))
+ 		targisdir = 1;
++	if (src != NULL && !iamrecursive && !Tflag) {
++		/*
++		 * Prepare to try to restrict incoming filenames to match
++		 * the requested destination file glob.
++		 */
++		if ((src_copy = strdup(src)) == NULL)
++			fatal("strdup failed");
++		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
++			*restrict_pattern++ = '\0';
++		}
++	}
+ 	for (first = 1;; first = 0) {
+ 		cp = buf;
+ 		if (atomicio(read, remin, cp, 1) != 1)
+@@ -1112,6 +1130,9 @@ sink(int argc, char **argv)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
++		if (restrict_pattern != NULL &&
++		    fnmatch(restrict_pattern, cp, 0) != 0)
++			SCREWUP("filename does not match request");
+ 		if (targisdir) {
+ 			static char *namebuf;
+ 			static size_t cursize;
+@@ -1149,7 +1170,7 @@ sink(int argc, char **argv)
+ 					goto bad;
+ 			}
+ 			vect[0] = xstrdup(np);
+-			sink(1, vect);
++			sink(1, vect, src);
+ 			if (setimes) {
+ 				setimes = 0;
+ 				if (utimes(vect[0], tv) < 0)
+-- 
+2.20.1
+
