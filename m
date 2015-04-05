From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 18:04:17 +0200
Subject: [Buildroot] [git commit] gpm: add patch to fix build with the musl
	C library
Message-ID: <20150405160508.ABB4781940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ef3af9fdf0ee0effa922fd6eef1daf9160a6f04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backported from upstream Git repository.

Fixes:

  http://autobuild.buildroot.org/results/a4b/a4b076d2750056710ab85e364e9e2c687af971cc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ded-musl-support-to-libgpm-and-the-daemon.patch |   71 ++++++++++++++++++++
 1 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch b/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
new file mode 100644
index 0000000..1e1e919
--- /dev/null
+++ b/package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch
@@ -0,0 +1,71 @@
+From eb0e14f8a5c414603b2e882df54b9fec138104ec Mon Sep 17 00:00:00 2001
+From: Dima Krasner <dima@dimakrasner.com>
+Date: Wed, 12 Nov 2014 23:06:46 +0200
+Subject: [PATCH] Added musl support to libgpm and the daemon.
+
+[Upstream patch backported from the github repository,
+https://github.com/telmich/gpm/commit/d88fb1de5803c366ab62f7de9ee5d83207fb2afe.]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/daemon/open_console.c  | 1 +
+ src/prog/display-buttons.c | 1 +
+ src/prog/display-coords.c  | 1 +
+ src/prog/gpm-root.y        | 4 ++--
+ 4 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/daemon/open_console.c b/src/daemon/open_console.c
+index 98297c9..4d6c0af 100644
+--- a/src/daemon/open_console.c
++++ b/src/daemon/open_console.c
+@@ -21,6 +21,7 @@
+ 
+ #include <fcntl.h>                  /* open and co.      */
+ #include <sys/stat.h>               /* stat()            */
++#include <sys/types.h>              /* major()           */
+ #include <sys/ioctl.h>              /* ioctl             */
+ 
+ /* Linux specific (to be outsourced in gpm2 */
+diff --git a/src/prog/display-buttons.c b/src/prog/display-buttons.c
+index de8e5b2..38d2f11 100644
+--- a/src/prog/display-buttons.c
++++ b/src/prog/display-buttons.c
+@@ -36,6 +36,7 @@
+ #include <stdio.h>            /* printf()             */
+ #include <time.h>             /* time()               */
+ #include <errno.h>            /* errno                */
++#include <sys/select.h>       /* fd_set and FD_*      */
+ #include <gpm.h>              /* gpm information      */
+ 
+ /* display resulting data */
+diff --git a/src/prog/display-coords.c b/src/prog/display-coords.c
+index ed15c8a..411283a 100644
+--- a/src/prog/display-coords.c
++++ b/src/prog/display-coords.c
+@@ -37,6 +37,7 @@
+ #include <stdio.h>            /* printf()             */
+ #include <time.h>             /* time()               */
+ #include <errno.h>            /* errno                */
++#include <sys/select.h>       /* fd_set and FD_*      */
+ #include <gpm.h>              /* gpm information      */
+ 
+ /* display resulting data */
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index 069d801..188ae35 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -1199,9 +1199,9 @@ int main(int argc, char **argv)
+ #if defined(__GLIBC__)
+    __sigemptyset(&childaction.sa_mask);
+ #else /* __GLIBC__ */
+-   childaction.sa_mask=0;
++   sigemptyset(&childaction.sa_mask);
+ #endif /* __GLIBC__ */
+-   childaction.sa_flags=SA_INTERRUPT; /* need to break the select() call */
++   childaction.sa_flags=0;
+    sigaction(SIGCHLD,&childaction,NULL);
+ 
+    /*....................................... Connect and get your buffer */
+-- 
+2.1.0
+
