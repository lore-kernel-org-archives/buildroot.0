From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 10:26:06 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/putty: fix build
 with uClibc
Message-ID: <20190328092746.491448073E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5de4984c6eaef50ae80d248317c120b1937ecba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Add patches fixing a number of build issues with uClibc. The issue fixed
in patch #2 has been reported upstream. Patch #3 has been suggested by
upstream but not applied yet.

Drop the _SUBDIR assignment. The configure script moved to top level
directory since upstream commit a947c49bec3 from 2014. This allows
AUTORECONF to find configure.ac.

Fixes:
http://autobuild.buildroot.net/results/801/801e2b2909363b5dcd9735362bb921e017569edc/
http://autobuild.buildroot.net/results/398/3984c6cdd3398645c8ad98bbe23af9090cf4bfcf/
http://autobuild.buildroot.net/results/632/632f93046f9cceffd9b604911542426c10967e0f/

Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35b72be8fea5c3b6426441a9efa18a2ad3c319a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-unix-uxpoll-need-_XOPEN_SOURCE.patch      | 39 +++++++++
 package/putty/0003-Fix-uClibc-build-issues.patch   | 93 ++++++++++++++++++++++
 package/putty/putty.mk                             |  3 +-
 3 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/package/putty/0002-unix-uxpoll-need-_XOPEN_SOURCE.patch b/package/putty/0002-unix-uxpoll-need-_XOPEN_SOURCE.patch
new file mode 100644
index 0000000000..fb4b6c26e5
--- /dev/null
+++ b/package/putty/0002-unix-uxpoll-need-_XOPEN_SOURCE.patch
@@ -0,0 +1,39 @@
+From c1b9d07d39e33e40d2ad04be176367cf48271cfd Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 26 Mar 2019 20:00:45 +0200
+Subject: [PATCH] unix/uxpoll: need _XOPEN_SOURCE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The code needs _XOPEN_SOURCE for some poll() flags.
+
+Fix this build failure with uClibc:
+
+./../unix/uxpoll.c: In function ???pollwrap_add_fd_rwx???:
+./../unix/uxpoll.c:75:32: error: ???POLLRDNORM??? undeclared (first use in this function); did you mean ???POLLNVAL????
+ #define SELECT_R_IN (POLLIN  | POLLRDNORM | POLLRDBAND)
+                                ^
+./../unix/uxpoll.c:87:19: note: in expansion of macro ???SELECT_R_IN???
+         events |= SELECT_R_IN;
+                   ^~~~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: issue reported to upstream developers
+
+ unix/uxpoll.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/unix/uxpoll.c b/unix/uxpoll.c
+index bbc5490d125d..6fe6ac7ba0c1 100644
+--- a/unix/uxpoll.c
++++ b/unix/uxpoll.c
+@@ -1,3 +1,4 @@
++#define _XOPEN_SOURCE
+ #include <poll.h>
+ 
+ #include "putty.h"
+-- 
+2.20.1
+
diff --git a/package/putty/0003-Fix-uClibc-build-issues.patch b/package/putty/0003-Fix-uClibc-build-issues.patch
new file mode 100644
index 0000000000..ceefded976
--- /dev/null
+++ b/package/putty/0003-Fix-uClibc-build-issues.patch
@@ -0,0 +1,93 @@
+From 0554cfbb926a2ba26efda08865b270af8536e0bb Mon Sep 17 00:00:00 2001
+From: Simon Tatham <anakin@pobox.com>
+Date: Tue, 26 Mar 2019 20:03:09 +0200
+Subject: [PATCH] Fix uClibc build issues
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix two uClibc build failures.
+
+Missing sys/auxv.h header:
+
+./../unix/uxutils.c:5:10: fatal error: sys/auxv.h: No such file or directory
+ #include <sys/auxv.h>
+          ^~~~~~~~~~~~
+
+Missing futimes() implementation:
+
+./../unix/uxsftpserver.c: In function ???uss_fsetstat???:
+./../unix/uxsftpserver.c:441:25: warning: implicit declaration of function ???futimes???; did you mean ???lutimes???? [-Wimplicit-function-declaration]
+ #define FD_PREFIX(func) f ## func
+                         ^
+./../unix/uxsftpserver.c:435:17: note: in expansion of macro ???FD_PREFIX???
+             if (api_prefix(utimes)(api_arg, tv) < 0)                    \
+                 ^~~~~~~~~~
+./../unix/uxsftpserver.c:470:5: note: in expansion of macro ???SETSTAT_GUTS???
+     SETSTAT_GUTS(FD_PREFIX, fd, attrs, success);
+     ^~~~~~~~~~~~
+
+unix/uxsftpserver.o: In function `uss_fsetstat':
+uxsftpserver.c:(.text+0x1058): undefined reference to `futimes'
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: patch suggested by upstream developer Simon Tatham
+
+ configure.ac        |  3 ++-
+ unix/uxsftpserver.c | 10 ++++++++++
+ unix/uxutils.c      |  3 ++-
+ 3 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 35552ed24dbe..1949ef62f219 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -173,8 +173,9 @@ AC_CHECK_LIB(X11, XOpenDisplay,
+              [GTK_LIBS="-lX11 $GTK_LIBS"
+               AC_DEFINE([HAVE_LIBX11],[],[Define if libX11.a is available])])
+ 
+-AC_CHECK_FUNCS([getaddrinfo posix_openpt ptsname setresuid strsignal updwtmpx fstatat dirfd])
++AC_CHECK_FUNCS([getaddrinfo posix_openpt ptsname setresuid strsignal updwtmpx fstatat dirfd futimes])
+ AC_CHECK_DECLS([CLOCK_MONOTONIC], [], [], [[#include <time.h>]])
++AC_CHECK_HEADERS([sys/auxv.h asm/hwcap.h])
+ AC_SEARCH_LIBS([clock_gettime], [rt], [AC_DEFINE([HAVE_CLOCK_GETTIME],[],[Define if clock_gettime() is available])])
+ 
+ AC_CACHE_CHECK([for SO_PEERCRED and dependencies], [x_cv_linux_so_peercred], [
+diff --git a/unix/uxsftpserver.c b/unix/uxsftpserver.c
+index 6fab0ba090d6..a90344e04219 100644
+--- a/unix/uxsftpserver.c
++++ b/unix/uxsftpserver.c
+@@ -412,6 +412,16 @@ static void uss_fstat(SftpServer *srv, SftpReplyBuilder *reply,
+     }
+ }
+ 
++#if !HAVE_FUTIMES
++static inline int futimes(int fd, const struct timeval tv[2])
++{
++    /* If the OS doesn't support futimes(3) then we have to pretend it
++     * always returns failure */
++    errno = EINVAL;
++    return -1;
++}
++#endif
++
+ /*
+  * The guts of setstat and fsetstat, macroised so that they can call
+  * fchown(fd,...) or chown(path,...) depending on parameters.
+diff --git a/unix/uxutils.c b/unix/uxutils.c
+index fcbcc4d422c1..f01bc2c14a2d 100644
+--- a/unix/uxutils.c
++++ b/unix/uxutils.c
+@@ -1,6 +1,7 @@
+ #include "ssh.h"
+ 
+-#if defined __linux__ && (defined __arm__ || defined __aarch64__)
++#if defined __linux__ && (defined __arm__ || defined __aarch64__) && \
++    HAVE_SYS_AUXV_H && HAVE_ASM_HWCAP_H
+ 
+ #include <sys/auxv.h>
+ #include <asm/hwcap.h>
+-- 
+2.20.1
+
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index c72c05320d..68622a5743 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -6,11 +6,12 @@
 
 PUTTY_VERSION = 0.71
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
-PUTTY_SUBDIR = unix
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CONF_OPTS = --disable-gtktest
 PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
+# Patching configure.ac
+PUTTY_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_CONF_OPTS += --with-gtk=2
