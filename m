From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 22:42:50 +0200
Subject: [Buildroot] [git commit] cairo: fix build of any2ppm if no fork().
Message-ID: <20140515204429.7CA329CC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e5b15d9e7ca16e0413bd002424843319eae676e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test program any2ppm can run as daemon. This feature can be disabled
at compile time, if the required headers are not present. However the
support for fork() is not checked.

Fixes http://autobuild.buildroot.net/results/4f2/4f271d55d7060d412aa336cfc2da3be3538d3594/.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cairo/cairo-004-fix-nofork-any2ppm.patch |   23 ++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/cairo/cairo-004-fix-nofork-any2ppm.patch b/package/cairo/cairo-004-fix-nofork-any2ppm.patch
new file mode 100644
index 0000000..16cc2e0
--- /dev/null
+++ b/package/cairo/cairo-004-fix-nofork-any2ppm.patch
@@ -0,0 +1,23 @@
+test: fix build of any2ppm if fork is not available.
+
+The test program any2ppm can run as daemon. This feature can be disabled at
+compile time, if the required headers are not present. However the support for
+fork() is not checked.
+
+This patch fixes this issue.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+
+Index: cairo-1.12.10/test/any2ppm.c
+===================================================================
+--- cairo-1.12.10.orig/test/any2ppm.c	2012-04-19 14:17:34.000000000 +0200
++++ cairo-1.12.10/test/any2ppm.c	2014-04-25 11:13:30.000000000 +0200
+@@ -79,7 +79,7 @@
+ 
+ #include <errno.h>
+ 
+-#if HAVE_UNISTD_H && HAVE_FCNTL_H && HAVE_SIGNAL_H && HAVE_SYS_STAT_H && HAVE_SYS_SOCKET_H && HAVE_SYS_POLL_H && HAVE_SYS_UN_H
++#if HAVE_UNISTD_H && HAVE_FCNTL_H && HAVE_SIGNAL_H && HAVE_SYS_STAT_H && HAVE_SYS_SOCKET_H && HAVE_SYS_POLL_H && HAVE_SYS_UN_H && HAVE_FORK
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <sys/stat.h>
