From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Apr 2019 19:12:31 +0200
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 1.6
Message-ID: <20190406171029.979008D517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8995c40e209fd96f3852edcedcc7559c7d38a083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github
- Drop all patches (already in version or not needed anymore)
- Switch to autotools infrastructure
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Replace-deprecated-union-wait-with-int.patch | 28 --------
 .../0002-Fix-improper-header-includes.patch        | 78 ----------------------
 .../0003-Remove-include-of-linux-time.h.patch      | 50 --------------
 ...s-hand-written-klogctl-syscall-implementa.patch | 38 -----------
 .../0005-Add-missing-headers-for-open-flags.patch  | 46 -------------
 ...006-syslogd.c-rename-dprintf-to-mydprintf.patch | 39 -----------
 package/sysklogd/Config.in                         |  2 +-
 package/sysklogd/sysklogd.hash                     |  5 +-
 package/sysklogd/sysklogd.mk                       | 20 +++---
 9 files changed, 12 insertions(+), 294 deletions(-)

diff --git a/package/sysklogd/0001-Replace-deprecated-union-wait-with-int.patch b/package/sysklogd/0001-Replace-deprecated-union-wait-with-int.patch
deleted file mode 100644
index d3fc0dc188..0000000000
--- a/package/sysklogd/0001-Replace-deprecated-union-wait-with-int.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 76685540a7882926c54bc0d1a8945b7a6abffe40 Mon Sep 17 00:00:00 2001
-From: Ryan Coe <bluemrp9@gmail.com>
-Date: Fri, 7 Oct 2016 19:42:40 -0700
-Subject: [PATCH] Replace deprecated union wait with int
-
-This is needed for compatibility with glibc >= 2.24.
-
-Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
----
- syslogd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/syslogd.c b/syslogd.c
-index ea73ea5..ace96c8 100644
---- a/syslogd.c
-+++ b/syslogd.c
-@@ -2094,7 +2094,7 @@ void reapchild()
- 	(void) signal(SIGCHLD, reapchild);	/* reset signal handler -ASP */
- 	wait ((int *)0);
- #else
--	union wait status;
-+	int status;
- 
- 	while (wait3(&status, WNOHANG, (struct rusage *) NULL) > 0)
- 		;
--- 
-2.7.4
-
diff --git a/package/sysklogd/0002-Fix-improper-header-includes.patch b/package/sysklogd/0002-Fix-improper-header-includes.patch
deleted file mode 100644
index 3518ef0270..0000000000
--- a/package/sysklogd/0002-Fix-improper-header-includes.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 7a043f619a91fbb998863c08e3e5e94a4747b11d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 28 Nov 2016 23:07:36 +0100
-Subject: [PATCH] Fix improper header includes
-
-When building with the musl C library, a number of warnings indicate
-that sysklogd is directly including headers that are considered internal
-to the C library:
-
- - Instead of including <sys/fcntl.h>, <fcntl.h> should be included.
-
- - Instead of including <sys/signal.h>, <signal.h> should be included.
-
- - Instead of includeing <sys/errno.h>, <errno.h> should be included.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- klogd.c    | 2 +-
- ksym_mod.c | 2 +-
- syslog.c   | 2 +-
- syslogd.c  | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/klogd.c b/klogd.c
-index 6cc80ed..a173353 100644
---- a/klogd.c
-+++ b/klogd.c
-@@ -260,7 +260,7 @@
- #include <unistd.h>
- #include <signal.h>
- #include <errno.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #include <sys/stat.h>
- #if !defined(__GLIBC__)
- #include <linux/time.h>
-diff --git a/ksym_mod.c b/ksym_mod.c
-index 68cd6b6..2e69d65 100644
---- a/ksym_mod.c
-+++ b/ksym_mod.c
-@@ -113,7 +113,7 @@
- #include <unistd.h>
- #include <signal.h>
- #include <errno.h>
--#include <sys/fcntl.h>
-+#include <fcntl.h>
- #include <sys/stat.h>
- #include "module.h"
- #if !defined(__GLIBC__)
-diff --git a/syslog.c b/syslog.c
-index bdb3ff2..f96b43c 100644
---- a/syslog.c
-+++ b/syslog.c
-@@ -55,7 +55,7 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <sys/file.h>
--#include <sys/signal.h>
-+#include <signal.h>
- #include <sys/syslog.h>
- #if 0
- #include "syslog.h"
-diff --git a/syslogd.c b/syslogd.c
-index ace96c8..b5e8054 100644
---- a/syslogd.c
-+++ b/syslogd.c
-@@ -521,7 +521,7 @@ static char sccsid[] = "@(#)syslogd.c	5.27 (Berkeley) 10/10/88";
- #define SYSLOG_NAMES
- #include <sys/syslog.h>
- #include <sys/param.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <sys/ioctl.h>
- #include <sys/stat.h>
- #include <sys/wait.h>
--- 
-2.7.4
-
diff --git a/package/sysklogd/0003-Remove-include-of-linux-time.h.patch b/package/sysklogd/0003-Remove-include-of-linux-time.h.patch
deleted file mode 100644
index 374d89bd05..0000000000
--- a/package/sysklogd/0003-Remove-include-of-linux-time.h.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From f4926a61ba2d3766255dd996bf0315bc8fa0c528 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 28 Nov 2016 23:09:03 +0100
-Subject: [PATCH] Remove include of <linux/time.h>
-
-klogd.c and ksym_mod.c currently include <linux/time.h> if GLIBC is not
-defined. Unfortunately, this breaks badly with the musl C library: this
-C library is not glibc so it doesn't define GLIBC, but it does have a
-definition of "struct timespec" in its header file, which conflict with
-the one provided by the Linux kernel headers.
-
-So, this commit simply gets rid of this header inclusion.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- klogd.c    | 3 ---
- ksym_mod.c | 3 ---
- 2 files changed, 6 deletions(-)
-
-diff --git a/klogd.c b/klogd.c
-index a173353..6505d96 100644
---- a/klogd.c
-+++ b/klogd.c
-@@ -262,9 +262,6 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <sys/stat.h>
--#if !defined(__GLIBC__)
--#include <linux/time.h>
--#endif /* __GLIBC__ */
- #include <stdarg.h>
- #include <paths.h>
- #include <stdlib.h>
-diff --git a/ksym_mod.c b/ksym_mod.c
-index 2e69d65..6e26da1 100644
---- a/ksym_mod.c
-+++ b/ksym_mod.c
-@@ -116,9 +116,6 @@
- #include <fcntl.h>
- #include <sys/stat.h>
- #include "module.h"
--#if !defined(__GLIBC__)
--#include <linux/time.h>
--#endif /* __GLIBC__ */
- #include <stdarg.h>
- #include <paths.h>
- #include <linux/version.h>
--- 
-2.7.4
-
diff --git a/package/sysklogd/0004-Remove-bogus-hand-written-klogctl-syscall-implementa.patch b/package/sysklogd/0004-Remove-bogus-hand-written-klogctl-syscall-implementa.patch
deleted file mode 100644
index 548f160718..0000000000
--- a/package/sysklogd/0004-Remove-bogus-hand-written-klogctl-syscall-implementa.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From fe92a7a8197241f7d6b28ea3c8214bb6d2c7fda4 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 28 Nov 2016 23:10:55 +0100
-Subject: [PATCH] Remove bogus hand-written klogctl() syscall implementation
-
-The way the hand-written klogctl() syscall is written cannot compile, as
-_syscall3() is just a function provided by the C library, so calling it
-outside of a function doesn't build.
-
-Since the musl C library provides a klogctl() function, we don't need
-this hand-written system call anyway.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- klogd.c | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/klogd.c b/klogd.c
-index 6505d96..9219671 100644
---- a/klogd.c
-+++ b/klogd.c
-@@ -274,13 +274,8 @@
- 
- #define __LIBRARY__
- #include <linux/unistd.h>
--#if !defined(__GLIBC__)
--# define __NR_ksyslog __NR_syslog
--_syscall3(int,ksyslog,int, type, char *, buf, int, len);
--#else
- #include <sys/klog.h>
- #define ksyslog klogctl
--#endif
- 
- #define LOG_BUFFER_SIZE 4096
- #define LOG_LINE_LENGTH 1000
--- 
-2.7.4
-
diff --git a/package/sysklogd/0005-Add-missing-headers-for-open-flags.patch b/package/sysklogd/0005-Add-missing-headers-for-open-flags.patch
deleted file mode 100644
index 1a7ad84868..0000000000
--- a/package/sysklogd/0005-Add-missing-headers-for-open-flags.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0dff338a704f4ad11a2b78871e1f2a0b8030b4d2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 28 Nov 2016 23:12:37 +0100
-Subject: [PATCH] Add missing headers for open() flags
-
-Both pidfile.c and syslog.c use open() and its flags, but forgets to
-include all relevant headers, causing build failures with the musl C
-library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- pidfile.c | 2 ++
- syslog.c  | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/pidfile.c b/pidfile.c
-index e0959a0..14de56f 100644
---- a/pidfile.c
-+++ b/pidfile.c
-@@ -26,8 +26,10 @@
- 
- #include <stdio.h>
- #include <unistd.h>
-+#include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/file.h>
-+#include <fcntl.h>
- #include <string.h>
- #include <errno.h>
- #include <signal.h>
-diff --git a/syslog.c b/syslog.c
-index f96b43c..d09e7aa 100644
---- a/syslog.c
-+++ b/syslog.c
-@@ -57,6 +57,8 @@ static char sccsid[] = "@(#)syslog.c	5.28 (Berkeley) 6/27/90";
- #include <sys/file.h>
- #include <signal.h>
- #include <sys/syslog.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
- #if 0
- #include "syslog.h"
- #include "pathnames.h"
--- 
-2.7.4
-
diff --git a/package/sysklogd/0006-syslogd.c-rename-dprintf-to-mydprintf.patch b/package/sysklogd/0006-syslogd.c-rename-dprintf-to-mydprintf.patch
deleted file mode 100644
index a1fb5331e4..0000000000
--- a/package/sysklogd/0006-syslogd.c-rename-dprintf-to-mydprintf.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 68213f6902d291d2ba1626fd950fd7d4a1329d33 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 28 Nov 2016 23:13:08 +0100
-Subject: [PATCH] syslogd.c: rename dprintf() to mydprintf()
-
-There is an existing kludge in syslogd.c to rename all dprintf()
-function calls and its definition to mydprintf(). This kludge is only
-applied when the glibc C library is used (i.e when GLIBC is defined),
-because glibc also provides a dprintf() function, with a different
-signature and behavior.
-
-However, the musl C library also provides the dprintf() function (with
-the same signature as the one in glibc, obviously), but does not define
-the GLIBC macro, causing a conflicting definition of dprintf.
-
-This commit fixes that by having the rename kludge used unconditionally.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- syslogd.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/syslogd.c b/syslogd.c
-index b5e8054..22a9ed5 100644
---- a/syslogd.c
-+++ b/syslogd.c
-@@ -818,9 +818,7 @@ void doexit(int sig);
- void init();
- void cfline(char *line, register struct filed *f);
- int decode(char *name, struct code *codetab);
--#if defined(__GLIBC__)
- #define dprintf mydprintf
--#endif /* __GLIBC__ */
- static void dprintf(char *, ...);
- static void allocate_log(void);
- void sighup_handler();
--- 
-2.7.4
-
diff --git a/package/sysklogd/Config.in b/package/sysklogd/Config.in
index 4188fb8274..fda58e020e 100644
--- a/package/sysklogd/Config.in
+++ b/package/sysklogd/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_SYSKLOGD
 	help
 	  System log daemons syslogd and klogd.
 
-	  http://www.infodrom.org/projects/sysklogd/
+	  https://github.com/troglobit/sysklogd/
diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index dd5b89a884..6f7ab6ece8 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,2 +1,3 @@
-# Locally calculated from download (no sig, hash)
-sha256	5166c185ae23c92e8b9feee66a6e3d0bc944bf673112f53e3ecf62e08ce7c201	sysklogd-1.5.1.tar.gz
+# Locally calculated
+sha256	1e9e18564c5bba474954d55ea6e2a0e3dc1bc145d8973c5fd098b088a9be9ceb	sysklogd-1.6.tar.gz
+sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 976438c110..8cd7f9573c 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,24 +4,20 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 1.5.1
-SYSKLOGD_SITE = http://www.infodrom.org/projects/sysklogd/download
+SYSKLOGD_VERSION = 1.6
+SYSKLOGD_SITE = $(call github,troglobit,sysklogd,v$(SYSKLOGD_VERSION))
 SYSKLOGD_LICENSE = GPL-2.0+
 SYSKLOGD_LICENSE_FILES = COPYING
+#??From git
+SYSKLOGD_AUTORECONF = YES
 
-# Override SKFLAGS which is used as CFLAGS.
-define SYSKLOGD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) SKFLAGS="$(TARGET_CFLAGS) -DSYSV" \
-		-C $(@D)
-endef
-
-define SYSKLOGD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/sbin/syslogd
-	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/sbin/klogd
+define SYSKLOGD_INSTALL_SAMPLE_CONFIG
 	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
 		$(TARGET_DIR)/etc/syslog.conf
 endef
 
+SYSKLOGD_POST_INSTALL_TARGET_HOOKS += SYSKLOGD_INSTALL_SAMPLE_CONFIG
+
 define SYSKLOGD_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysklogd/S01syslogd \
 		$(TARGET_DIR)/etc/init.d/S01syslogd
@@ -41,4 +37,4 @@ define SYSKLOGD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/syslog.service
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
