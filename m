From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 11:28:43 +0100
Subject: [Buildroot] [git commit] sysklogd: fix build on musl
Message-ID: <20161206103227.51C207FB7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55b1114f7202ff09a1d060a112760b1e2efa477c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit add a stack of small patches that make sysklogd build fine
with the musl C library. Build with uClibc and glibc has been tested
with those patches applied as well.

The first patch is slightly rework (better description and capital
letter to the title) in preparation for upstream submission.

Fixes:

  http://autobuild.buildroot.net/results/8fa2bf73f983330884bce2e5ac31e01dee112ba9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Replace-deprecated-union-wait-with-int.patch | 28 ++++++++
 ...01-replace-deprecated-union-wait-with-int.patch | 25 -------
 .../0002-Fix-improper-header-includes.patch        | 78 ++++++++++++++++++++++
 .../0003-Remove-include-of-linux-time.h.patch      | 50 ++++++++++++++
 ...s-hand-written-klogctl-syscall-implementa.patch | 38 +++++++++++
 .../0005-Add-missing-headers-for-open-flags.patch  | 46 +++++++++++++
 ...006-syslogd.c-rename-dprintf-to-mydprintf.patch | 39 +++++++++++
 7 files changed, 279 insertions(+), 25 deletions(-)

diff --git a/package/sysklogd/0001-Replace-deprecated-union-wait-with-int.patch b/package/sysklogd/0001-Replace-deprecated-union-wait-with-int.patch
new file mode 100644
index 0000000..d3fc0dc
--- /dev/null
+++ b/package/sysklogd/0001-Replace-deprecated-union-wait-with-int.patch
@@ -0,0 +1,28 @@
+From 76685540a7882926c54bc0d1a8945b7a6abffe40 Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Fri, 7 Oct 2016 19:42:40 -0700
+Subject: [PATCH] Replace deprecated union wait with int
+
+This is needed for compatibility with glibc >= 2.24.
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ syslogd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/syslogd.c b/syslogd.c
+index ea73ea5..ace96c8 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -2094,7 +2094,7 @@ void reapchild()
+ 	(void) signal(SIGCHLD, reapchild);	/* reset signal handler -ASP */
+ 	wait ((int *)0);
+ #else
+-	union wait status;
++	int status;
+ 
+ 	while (wait3(&status, WNOHANG, (struct rusage *) NULL) > 0)
+ 		;
+-- 
+2.7.4
+
diff --git a/package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch b/package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch
deleted file mode 100644
index c9a30e9..0000000
--- a/package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 86fe87cdf097e6286e76eadcc9c11c79be6258f2 Mon Sep 17 00:00:00 2001
-From: Ryan Coe <bluemrp9@gmail.com>
-Date: Fri, 7 Oct 2016 19:42:40 -0700
-Subject: [PATCH 1/1] replace deprecated union wait with int
-
-Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
----
- syslogd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/syslogd.c b/syslogd.c
-index ea73ea5da5e935bb8cab328559f950cd3afc2d20..ace96c8be40f50d123120c0586a384a298212245 100644
---- a/syslogd.c
-+++ b/syslogd.c
-@@ -2094,7 +2094,7 @@ void reapchild()
-	(void) signal(SIGCHLD, reapchild);	/* reset signal handler -ASP */
-	wait ((int *)0);
- #else
--	union wait status;
-+	int status;
-
-	while (wait3(&status, WNOHANG, (struct rusage *) NULL) > 0)
-		;
---
-2.9.3
diff --git a/package/sysklogd/0002-Fix-improper-header-includes.patch b/package/sysklogd/0002-Fix-improper-header-includes.patch
new file mode 100644
index 0000000..3518ef0
--- /dev/null
+++ b/package/sysklogd/0002-Fix-improper-header-includes.patch
@@ -0,0 +1,78 @@
+From 7a043f619a91fbb998863c08e3e5e94a4747b11d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 28 Nov 2016 23:07:36 +0100
+Subject: [PATCH] Fix improper header includes
+
+When building with the musl C library, a number of warnings indicate
+that sysklogd is directly including headers that are considered internal
+to the C library:
+
+ - Instead of including <sys/fcntl.h>, <fcntl.h> should be included.
+
+ - Instead of including <sys/signal.h>, <signal.h> should be included.
+
+ - Instead of includeing <sys/errno.h>, <errno.h> should be included.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ klogd.c    | 2 +-
+ ksym_mod.c | 2 +-
+ syslog.c   | 2 +-
+ syslogd.c  | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/klogd.c b/klogd.c
+index 6cc80ed..a173353 100644
+--- a/klogd.c
++++ b/klogd.c
+@@ -260,7 +260,7 @@
+ #include <unistd.h>
+ #include <signal.h>
+ #include <errno.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #if !defined(__GLIBC__)
+ #include <linux/time.h>
+diff --git a/ksym_mod.c b/ksym_mod.c
+index 68cd6b6..2e69d65 100644
+--- a/ksym_mod.c
++++ b/ksym_mod.c
+@@ -113,7 +113,7 @@
+ #include <unistd.h>
+ #include <signal.h>
+ #include <errno.h>
+-#include <sys/fcntl.h>
++#include <fcntl.h>
+ #include <sys/stat.h>
+ #include "module.h"
+ #if !defined(__GLIBC__)
+diff --git a/syslog.c b/syslog.c
+index bdb3ff2..f96b43c 100644
+--- a/syslog.c
++++ b/syslog.c
+@@ -55,7 +55,7 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/file.h>
+-#include <sys/signal.h>
++#include <signal.h>
+ #include <sys/syslog.h>
+ #if 0
+ #include "syslog.h"
+diff --git a/syslogd.c b/syslogd.c
+index ace96c8..b5e8054 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -521,7 +521,7 @@ static char sccsid[] = "@(#)syslogd.c	5.27 (Berkeley) 10/10/88";
+ #define SYSLOG_NAMES
+ #include <sys/syslog.h>
+ #include <sys/param.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+-- 
+2.7.4
+
diff --git a/package/sysklogd/0003-Remove-include-of-linux-time.h.patch b/package/sysklogd/0003-Remove-include-of-linux-time.h.patch
new file mode 100644
index 0000000..374d89b
--- /dev/null
+++ b/package/sysklogd/0003-Remove-include-of-linux-time.h.patch
@@ -0,0 +1,50 @@
+From f4926a61ba2d3766255dd996bf0315bc8fa0c528 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 28 Nov 2016 23:09:03 +0100
+Subject: [PATCH] Remove include of <linux/time.h>
+
+klogd.c and ksym_mod.c currently include <linux/time.h> if GLIBC is not
+defined. Unfortunately, this breaks badly with the musl C library: this
+C library is not glibc so it doesn't define GLIBC, but it does have a
+definition of "struct timespec" in its header file, which conflict with
+the one provided by the Linux kernel headers.
+
+So, this commit simply gets rid of this header inclusion.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ klogd.c    | 3 ---
+ ksym_mod.c | 3 ---
+ 2 files changed, 6 deletions(-)
+
+diff --git a/klogd.c b/klogd.c
+index a173353..6505d96 100644
+--- a/klogd.c
++++ b/klogd.c
+@@ -262,9 +262,6 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <sys/stat.h>
+-#if !defined(__GLIBC__)
+-#include <linux/time.h>
+-#endif /* __GLIBC__ */
+ #include <stdarg.h>
+ #include <paths.h>
+ #include <stdlib.h>
+diff --git a/ksym_mod.c b/ksym_mod.c
+index 2e69d65..6e26da1 100644
+--- a/ksym_mod.c
++++ b/ksym_mod.c
+@@ -116,9 +116,6 @@
+ #include <fcntl.h>
+ #include <sys/stat.h>
+ #include "module.h"
+-#if !defined(__GLIBC__)
+-#include <linux/time.h>
+-#endif /* __GLIBC__ */
+ #include <stdarg.h>
+ #include <paths.h>
+ #include <linux/version.h>
+-- 
+2.7.4
+
diff --git a/package/sysklogd/0004-Remove-bogus-hand-written-klogctl-syscall-implementa.patch b/package/sysklogd/0004-Remove-bogus-hand-written-klogctl-syscall-implementa.patch
new file mode 100644
index 0000000..548f160
--- /dev/null
+++ b/package/sysklogd/0004-Remove-bogus-hand-written-klogctl-syscall-implementa.patch
@@ -0,0 +1,38 @@
+From fe92a7a8197241f7d6b28ea3c8214bb6d2c7fda4 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 28 Nov 2016 23:10:55 +0100
+Subject: [PATCH] Remove bogus hand-written klogctl() syscall implementation
+
+The way the hand-written klogctl() syscall is written cannot compile, as
+_syscall3() is just a function provided by the C library, so calling it
+outside of a function doesn't build.
+
+Since the musl C library provides a klogctl() function, we don't need
+this hand-written system call anyway.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ klogd.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/klogd.c b/klogd.c
+index 6505d96..9219671 100644
+--- a/klogd.c
++++ b/klogd.c
+@@ -274,13 +274,8 @@
+ 
+ #define __LIBRARY__
+ #include <linux/unistd.h>
+-#if !defined(__GLIBC__)
+-# define __NR_ksyslog __NR_syslog
+-_syscall3(int,ksyslog,int, type, char *, buf, int, len);
+-#else
+ #include <sys/klog.h>
+ #define ksyslog klogctl
+-#endif
+ 
+ #define LOG_BUFFER_SIZE 4096
+ #define LOG_LINE_LENGTH 1000
+-- 
+2.7.4
+
diff --git a/package/sysklogd/0005-Add-missing-headers-for-open-flags.patch b/package/sysklogd/0005-Add-missing-headers-for-open-flags.patch
new file mode 100644
index 0000000..1a7ad84
--- /dev/null
+++ b/package/sysklogd/0005-Add-missing-headers-for-open-flags.patch
@@ -0,0 +1,46 @@
+From 0dff338a704f4ad11a2b78871e1f2a0b8030b4d2 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 28 Nov 2016 23:12:37 +0100
+Subject: [PATCH] Add missing headers for open() flags
+
+Both pidfile.c and syslog.c use open() and its flags, but forgets to
+include all relevant headers, causing build failures with the musl C
+library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ pidfile.c | 2 ++
+ syslog.c  | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/pidfile.c b/pidfile.c
+index e0959a0..14de56f 100644
+--- a/pidfile.c
++++ b/pidfile.c
+@@ -26,8 +26,10 @@
+ 
+ #include <stdio.h>
+ #include <unistd.h>
++#include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
++#include <fcntl.h>
+ #include <string.h>
+ #include <errno.h>
+ #include <signal.h>
+diff --git a/syslog.c b/syslog.c
+index f96b43c..d09e7aa 100644
+--- a/syslog.c
++++ b/syslog.c
+@@ -57,6 +57,8 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
+ #include <sys/file.h>
+ #include <signal.h>
+ #include <sys/syslog.h>
++#include <sys/stat.h>
++#include <fcntl.h>
+ #if 0
+ #include "syslog.h"
+ #include "pathnames.h"
+-- 
+2.7.4
+
diff --git a/package/sysklogd/0006-syslogd.c-rename-dprintf-to-mydprintf.patch b/package/sysklogd/0006-syslogd.c-rename-dprintf-to-mydprintf.patch
new file mode 100644
index 0000000..a1fb533
--- /dev/null
+++ b/package/sysklogd/0006-syslogd.c-rename-dprintf-to-mydprintf.patch
@@ -0,0 +1,39 @@
+From 68213f6902d291d2ba1626fd950fd7d4a1329d33 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 28 Nov 2016 23:13:08 +0100
+Subject: [PATCH] syslogd.c: rename dprintf() to mydprintf()
+
+There is an existing kludge in syslogd.c to rename all dprintf()
+function calls and its definition to mydprintf(). This kludge is only
+applied when the glibc C library is used (i.e when GLIBC is defined),
+because glibc also provides a dprintf() function, with a different
+signature and behavior.
+
+However, the musl C library also provides the dprintf() function (with
+the same signature as the one in glibc, obviously), but does not define
+the GLIBC macro, causing a conflicting definition of dprintf.
+
+This commit fixes that by having the rename kludge used unconditionally.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ syslogd.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/syslogd.c b/syslogd.c
+index b5e8054..22a9ed5 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -818,9 +818,7 @@ void doexit(int sig);
+ void init();
+ void cfline(char *line, register struct filed *f);
+ int decode(char *name, struct code *codetab);
+-#if defined(__GLIBC__)
+ #define dprintf mydprintf
+-#endif /* __GLIBC__ */
+ static void dprintf(char *, ...);
+ static void allocate_log(void);
+ void sighup_handler();
+-- 
+2.7.4
+
