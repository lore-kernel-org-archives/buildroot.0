From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Jul 2021 10:43:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/tftpd: fix static build
Message-ID: <20210710084313.893425-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/913e8b75422c8beba60df5ea2e2c9e431364566e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-__progname-is-provided-by-libc.patch | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/tftpd/0002-__progname-is-provided-by-libc.patch

diff --git a/package/tftpd/0002-__progname-is-provided-by-libc.patch b/package/tftpd/0002-__progname-is-provided-by-libc.patch
new file mode 100644
index 0000000000..220fda0646
--- /dev/null
+++ b/package/tftpd/0002-__progname-is-provided-by-libc.patch
@@ -0,0 +1,65 @@
+From 18ac1e26f756dd47fef33f5f706b0ec8fa696216 Mon Sep 17 00:00:00 2001
+From: Thorsten Glaser <tg@mirbsd.de>
+Date: Thu, 31 Jul 2014 16:29:41 +0930
+Subject: __progname[] is provided by libc
+
+Rename local variable to tftpd_progname to avoid a clash with glibc
+global symbols and work around Debian bug #519006 (Closes: #564052).
+
+[ hpa: specifically, double-underscore symbols in C are reserved for
+  the implementation, i.e. compiler/libc. ]
+
+Signed-off-by: Ron Lee <ron@debian.org>
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git/commit/?id=18ac1e26f756dd47fef33f5f706b0ec8fa696216]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tftpd/tftpd.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tftpd/tftpd.c b/tftpd/tftpd.c
+index 88d2812..91f5ae1 100644
+--- a/tftpd/tftpd.c
++++ b/tftpd/tftpd.c
+@@ -76,7 +76,7 @@ static int ai_fam = AF_INET;
+ #define TRIES   6               /* Number of attempts to send each packet */
+ #define TIMEOUT_LIMIT ((1 << TRIES)-1)
+ 
+-const char *__progname;
++const char *tftpd_progname;
+ static int peer;
+ static unsigned long timeout  = TIMEOUT;        /* Current timeout value */
+ static unsigned long rexmtval = TIMEOUT;       /* Basic timeout value */
+@@ -387,9 +387,9 @@ int main(int argc, char **argv)
+     /* basename() is way too much of a pain from a portability standpoint */
+ 
+     p = strrchr(argv[0], '/');
+-    __progname = (p && p[1]) ? p + 1 : argv[0];
++    tftpd_progname = (p && p[1]) ? p + 1 : argv[0];
+ 
+-    openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
++    openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
+ 
+     srand(time(NULL) ^ getpid());
+ 
+@@ -938,14 +938,14 @@ int main(int argc, char **argv)
+        syslog daemon gets restarted by the time we get here. */
+     if (secure && standalone) {
+         closelog();
+-        openlog(__progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
++        openlog(tftpd_progname, LOG_PID | LOG_NDELAY, LOG_DAEMON);
+     }
+ 
+ #ifdef HAVE_TCPWRAPPERS
+     /* Verify if this was a legal request for us.  This has to be
+        done before the chroot, while /etc is still accessible. */
+     request_init(&wrap_request,
+-                 RQ_DAEMON, __progname,
++                 RQ_DAEMON, tftpd_progname,
+                  RQ_FILE, fd,
+                  RQ_CLIENT_SIN, &from, RQ_SERVER_SIN, &myaddr, 0);
+     sock_methods(&wrap_request);
+-- 
+cgit 1.2.3-1.el7
+
-- 
2.30.2
