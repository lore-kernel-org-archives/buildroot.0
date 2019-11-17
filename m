From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 17 Nov 2019 00:09:42 -0300
Subject: [Buildroot] [PATHC v3] package/dcron: create required directories
 at startup
Message-ID: <20191117030942.3009-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

crond uses the /var/spool/cron/{crontabs,cronstamps} directories to
store the per-user crontabs and timestamps for jobs, respectively.

On systems with busybox or sysv init, /var/spool is by default a link to
/tmp (see package/skeleton-init-sysv/skeleton/). So if those directories
are created at installation time they will actually be under /tmp/spool
and will vanish at run time when a tmpfs is mounted at /tmp. In this
case crond issues error messages that can't be seen.

The error is hidden because we use start-stop-daemon to run crond in
foreground mode to create a pid file and move crond to background. In
this mode crond does not use syslog and all error messages are lost
because start-stop-daemon redirects stderr to /dev/null.

Fix these problem by means of the following changes:

- Pull a patch already submitted upstream[1] to create a pidfile, so we
  can start crond in daemon mode.
- Do not create the crontabs and cronstamps directories in the package
  installation.
- Rewrite S90dcron (following the current template) changing the startup
  method and ensuring that the required directories exist.
- Modify dcron.service to disable the pidfile (not required by systemd)
  and to ensure that the required directories exist.
- Allow the user to set alternate crontabs/cronstamps paths by means of
  the /etc/default/crond file.

1. https://github.com/dubiousjim/dcron/pull/23

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12011

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
CC: Dominique Tronche <dominique.tronche@atos.net>
CC: Alvaro G . M <alvaro.gamez@hazent.com>
CC: Yann E . MORIN <yann.morin.1998@free.fr>
---
Changes v1->v2:
- Remove "partially" from the commit message, since the fix is now
  complete
Changes v2->v3:
- Drop the menu configurations for crontabs/cronstamps paths. Use a
  /etc/default/crond file, instead).
- Create the directory at startup, not in the installation.
- Use a patch to fix the pidfile issue instead of a hack with pidof.
- Refactor S90dcron according to the current template.
---
 ...a-pid-file-if-running-in-daemon-mode.patch | 229 ++++++++++++++++++
 package/dcron/S90dcron                        |  68 ++++--
 package/dcron/dcron.mk                        |   2 +-
 package/dcron/dcron.service                   |   5 +-
 4 files changed, 285 insertions(+), 19 deletions(-)
 create mode 100644 package/dcron/0002-Create-a-pid-file-if-running-in-daemon-mode.patch

diff --git a/package/dcron/0002-Create-a-pid-file-if-running-in-daemon-mode.patch b/package/dcron/0002-Create-a-pid-file-if-running-in-daemon-mode.patch
new file mode 100644
index 0000000000..f6db7f2aa9
--- /dev/null
+++ b/package/dcron/0002-Create-a-pid-file-if-running-in-daemon-mode.patch
@@ -0,0 +1,229 @@
+From f760a5ba9335b9a65376cf8337b31e2c20d7a21f Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Sat, 16 Nov 2019 22:40:46 -0300
+Subject: [PATCH] Create a pid file if running in daemon mode
+
+- defs.h: #define PIDFILE (default /var/run/crond.pid)
+- subs.c: make fdprintf return a status, as required by the next change
+- main.c: create the pid file, exiting on failures; add options to
+  disable and set a different
+- crond.8: document the feature
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ crond.8 | 12 ++++++++++-
+ defs.h  |  3 +++
+ main.c  | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++-------
+ subs.c  |  9 ++++++---
+ 4 files changed, 75 insertions(+), 11 deletions(-)
+
+diff --git a/crond.8 b/crond.8
+index 1582235..a7e9d7c 100644
+--- a/crond.8
++++ b/crond.8
+@@ -4,7 +4,7 @@
+ crond - dillon's lightweight cron daemon
+ .SH SYNOPSIS
+ .PP
+-\f[B]crond [-s dir] [-c dir] [-t dir] [-m user\@host] [-M mailhandler] [-S|-L file] [-l loglevel] [-b|-f|-d]\f[]
++\f[B]crond [-s dir] [-c dir] [-t dir] [-m user\@host] [-M mailhandler] [-S|-L file] [-P|-p file] [-l loglevel] [-b|-f|-d]\f[]
+ .SH OPTIONS
+ .PP
+ \f[B]crond\f[] is a background daemon that parses individual
+@@ -69,6 +69,16 @@ log to specified file instead of syslog.
+ .RS
+ .RE
+ .TP
++.B -P
++do not create a process-id file.
++.RS
++.RE
++.TP
++.B -L file
++Write process-id to specified file instead of /var/run/crond.pid.
++.RS
++.RE
++.TP
+ .B -l loglevel
+ log events at the specified, or more important, loglevels.
+ The default is `notice'.
+diff --git a/defs.h b/defs.h
+index cf77b5f..8ff557f 100644
+--- a/defs.h
++++ b/defs.h
+@@ -51,6 +51,9 @@
+ #ifndef SCRONTABS
+ #define SCRONTABS	"/etc/cron.d"
+ #endif
++#ifndef PIDFILE
++#define PIDFILE		"/var/run/crond.pid"
++#endif
+ #ifndef CRONTABS
+ #define CRONTABS	"/var/spool/cron/crontabs"
+ #endif
+diff --git a/main.c b/main.c
+index 2606db8..0b84b46 100644
+--- a/main.c
++++ b/main.c
+@@ -32,11 +32,13 @@ short DebugOpt = 0;
+ short LogLevel = LOG_LEVEL;
+ short ForegroundOpt = 0;
+ short SyslogOpt = 1;
++short PidFileOpt = 1;
+ const char  *CDir = CRONTABS;
+ const char  *SCDir = SCRONTABS;
+ const char *TSDir = CRONSTAMPS;
+ const char *LogFile = NULL; 	/* opened with mode 0600 */
+ const char *LogHeader = LOGHEADER;
++const char *PidFile = PIDFILE;
+ const char *SendMail = NULL;
+ const char *Mailto = NULL;
+ char *TempDir;
+@@ -72,7 +74,7 @@ main(int ac, char **av)
+ 
+ 	opterr = 0;
+ 
+-	while ((i = getopt(ac,av,"dl:L:fbSc:s:m:M:t:")) != -1) {
++	while ((i = getopt(ac,av,"dl:L:fbSc:s:m:M:t:Pp:")) != -1) {
+ 		switch (i) {
+ 			case 'l':
+ 				{
+@@ -161,12 +163,19 @@ main(int ac, char **av)
+ 			case 'm':
+ 				if (*optarg != 0) Mailto = optarg;
+ 				break;
++			case 'P':
++				PidFileOpt = 0;
++				break;
++			case 'p':
++				PidFileOpt = 1;
++				PidFile = optarg;
++				break;
+ 			default:
+ 				/*
+ 				 * check for parse error
+ 				 */
+ 				printf("dillon's cron daemon " VERSION "\n");
+-				printf("crond [-s dir] [-c dir] [-t dir] [-m user at host] [-M mailer] [-S|-L [file]] [-l level] [-b|-f|-d]\n");
++				printf("crond [-s dir] [-c dir] [-t dir] [-m user at host] [-M mailer] [-S|-L [file]] [-P|-p [file]] [-l level] [-b|-f|-d]\n");
+ 				printf("-s            directory of system crontabs (defaults to %s)\n", SCRONTABS);
+ 				printf("-c            directory of per-user crontabs (defaults to %s)\n", CRONTABS);
+ 				printf("-t            directory of timestamps (defaults to %s)\n", CRONSTAMPS);
+@@ -174,6 +183,8 @@ main(int ac, char **av)
+ 				printf("-M mailer     (defaults to %s)\n", SENDMAIL);
+ 				printf("-S            log to syslog using identity '%s' (default)\n", LOG_IDENT);
+ 				printf("-L file       log to specified file instead of syslog\n");
++				printf("-P            do not create process-id file\n");
++				printf("-p file       write pid to specified file instead of %s\n", PIDFILE);
+ 				printf("-l loglevel   log events <= this level (defaults to %s (level %d))\n", LevelAry[LOG_LEVEL], LOG_LEVEL);
+ 				printf("-b            run in background (default)\n");
+ 				printf("-f            run in foreground\n");
+@@ -219,16 +230,48 @@ main(int ac, char **av)
+ 
+ 		int fd;
+ 		int pid;
++		int pipe_fd[2];
++		int status;
++
++		if (pipe(pipe_fd) < 0) {
++			/* pipe failed */
++			perror("pipe");
++			exit(1);
++		}
+ 
+ 		if ((pid = fork()) < 0) {
+ 			/* fork failed */
+ 			perror("fork");
+ 			exit(1);
+ 		} else if (pid > 0) {
+-			/* parent */
+-			exit(0);
++			/* parent, reads from pipe */
++			close(pipe_fd[1]);
++			if (read(pipe_fd[0], &status, sizeof(status)) > 0) {
++				exit(status);
++			}
++			/* error: got zero bytes, so child just closed the write end */
++			exit(1);
+ 		}
++
+ 		/* child continues */
++		close(pipe_fd[0]);
++		status = 0;
++
++		/* write pid file or exit */
++
++		if (PidFileOpt) {
++			if ((fd = open(PidFile, O_WRONLY|O_CREAT|O_TRUNC, 0644)) < 0) {
++				status = errno;
++				fprintf(stderr, "failed to open PID file '%s', reason: %s\n", PidFile, strerror(status));
++				goto daemon_error;
++			}
++			if (fdprintf(fd, "%d\n", getpid()) < 0) {
++				status = errno;
++				fprintf(stderr, "failed to write PID file '%s', reason: %s\n", PidFile, strerror(status));
++				goto daemon_error;
++			}
++			close(fd);
++		}
+ 
+ 		/* become session leader, detach from terminal */
+ 
+@@ -260,11 +303,16 @@ main(int ac, char **av)
+ 				fclose(stderr);
+ 				dup2(fd, 2);
+ 			} else {
+-				int n = errno;
+-				fdprintf(2, "failed to open logfile '%s', reason: %s\n", LogFile, strerror(n));
+-				exit(n);
++				status = errno;
++				fdprintf(2, "failed to open logfile '%s', reason: %s\n", LogFile, strerror(status));
++				goto daemon_error;
+ 			}
+ 		}
++daemon_error:
++		write(pipe_fd[1], &status, sizeof(status));
++		if (status != 0) {
++			exit(status);
++		}
+ 	} else {
+ 		/* daemon in foreground */
+ 
+diff --git a/subs.c b/subs.c
+index b6217e8..0dfca4b 100644
+--- a/subs.c
++++ b/subs.c
+@@ -11,7 +11,7 @@
+ 
+ Prototype void printlogf(int level, const char *ctl, ...);
+ Prototype void fdprintlogf(int level, int fd, const char *ctl, ...);
+-Prototype void fdprintf(int fd, const char *ctl, ...);
++Prototype int fdprintf(int fd, const char *ctl, ...);
+ Prototype void initsignals(void);
+ Prototype char Hostname[SMALL_BUFFER];
+ 
+@@ -40,16 +40,19 @@ fdprintlogf(int level, int fd, const char *ctl, ...)
+ 	va_end(va);
+ }
+ 
+-void
++int
+ fdprintf(int fd, const char *ctl, ...)
+ {
+ 	va_list va;
+ 	char buf[LOG_BUFFER];
++	int n;
+ 
+ 	va_start(va, ctl);
+ 	vsnprintf(buf, sizeof(buf), ctl, va);
+-	write(fd, buf, strlen(buf));
++	n = write(fd, buf, strlen(buf));
+ 	va_end(va);
++
++	return n;
+ }
+ 
+ void
+-- 
+2.18.1
+
diff --git a/package/dcron/S90dcron b/package/dcron/S90dcron
index de21d2ca13..bf72ba34fa 100644
--- a/package/dcron/S90dcron
+++ b/package/dcron/S90dcron
@@ -1,22 +1,56 @@
 #!/bin/sh
 
+DAEMON="crond"
+EXEC="/usr/sbin/$DAEMON"
+PIDFILE="/var/run/$DAEMON.pid"
+
+CROND_ARGS=""
+CRONTABS_DIR="/var/spool/cron/crontabs"
+CRONSTAMPS_DIR="/var/spool/cron/cronstamps"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	mkdir -p "$CRONTABS_DIR" "$CRONSTAMPS_DIR" \
+		&& start-stop-daemon -S -q -p "$PIDFILE" -x "$EXEC" \
+			-- $CROND_ARGS -c "$CRONTABS_DIR" -t "$CRONSTAMPS_DIR"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE" -x "$EXEC"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		# Give acpid time to send dying gasp to syslog
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
 case "$1" in
-	start)
-		printf "Starting cron ... "
-		start-stop-daemon -S -q -m -b -p /var/run/dcron.pid --exec /usr/sbin/crond -- -f
-		echo "done."
-		;;
-	stop)
-		printf "Stopping cron ..."
-		start-stop-daemon -K -q -p /var/run/dcron.pid
-		echo "done."
-		;;
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
 	*)
-		echo "usage: $0 {start|stop|restart}"
-		;;
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
diff --git a/package/dcron/dcron.mk b/package/dcron/dcron.mk
index 2ee0709af5..a89abe27be 100644
--- a/package/dcron/dcron.mk
+++ b/package/dcron/dcron.mk
@@ -19,7 +19,7 @@ define DCRON_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m0644 $(@D)/extra/root.crontab $(TARGET_DIR)/etc/cron.d/system
 	# Busybox provides run-parts, so there is no need to use nor install provided run-cron
 	$(SED) 's#/usr/sbin/run-cron#/bin/run-parts#g' $(TARGET_DIR)/etc/cron.d/system
-	$(INSTALL) -d -m0755 $(TARGET_DIR)/var/spool/cron/crontabs \
+	$(INSTALL) -d -m0755 \
 		$(TARGET_DIR)/etc/cron.daily $(TARGET_DIR)/etc/cron.hourly \
 		$(TARGET_DIR)/etc/cron.monthly $(TARGET_DIR)/etc/cron.weekly
 endef
diff --git a/package/dcron/dcron.service b/package/dcron/dcron.service
index 924ed72205..b5f40c99e3 100644
--- a/package/dcron/dcron.service
+++ b/package/dcron/dcron.service
@@ -3,7 +3,10 @@ Description=Task scheduler daemon
 After=syslog.target
 
 [Service]
-ExecStart=/usr/sbin/crond -S
+Environment=CRONTABS_DIR='/var/spool/cron/crontabs' CRONSTAMPS_DIR='/var/spool/cron/cronstamps'
+EnvironmentFile=-/etc/default/crond
+ExecStartPre= mkdir -p ${CRONTABS_DIR} ${CRONSTAMPS_DIR}
+ExecStart=/usr/sbin/crond $CROND_ARGS -P -c ${CRONTABS_DIR} -t ${CRONSTAMPS_DIR}
 Type=forking
 
 [Install]
-- 
2.18.1
