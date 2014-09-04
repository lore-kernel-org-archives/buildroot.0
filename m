From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Sep 2014 17:27:56 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: add patch to fix
	build issue on gcc <= 4.5
Message-ID: <20140904152909.BB4729D5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5f31ade0374f107937e6204c4dd9879407dc217
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/e28/e28080f53f33b66fbb244e30a040aaf0a458bce5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-adjust-gcc-version-conditions-for-pragma.patch |   62 ++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
new file mode 100644
index 0000000..052bf4b
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
@@ -0,0 +1,62 @@
+From 67c2a89004f867151d0ad6acc5e10dee76be454f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 2 Sep 2014 21:57:30 +0200
+Subject: [PATCH] os/log: adjust gcc version conditions for #pragma
+
+In commit e67f2d7e0f9189beb2907fa06cff5ecc7f35f922 ("gcc 4.2.1 doesn't
+support #pragma GCC diagnostic ignored"), some compile time
+conditionals were added around the #pragma usage. Those conditionals
+ensure that the #pragma are not used on gcc <= 4.2.
+
+However, the usage of #pragma diagnostic inside functions was only
+added in gcc 4.6, and a build failure is therefore experienced with
+gcc 4.5:
+
+log.c: In function 'LogInit':
+log.c:199:9: error: #pragma GCC diagnostic not allowed inside functions
+log.c:201:9: warning: format not a string literal, argument types not checked
+log.c:212:9: error: #pragma GCC diagnostic not allowed inside functions
+log.c:214:17: warning: format not a string literal, argument types not checked
+
+$ ./host/usr/bin/powerpc-linux-gnu-gcc -v
+[...]
+gcc version 4.5.2 (Sourcery G++ Lite 2011.03-38)
+
+This patch therefore adjusts the compile time conditionals to make
+sure the #pragma is not used on gcc <= 4.5, and only used on gcc >=
+4.6.
+
+Submitted upstream:
+
+  http://lists.x.org/archives/xorg-devel/2014-September/043716.html
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ os/log.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/os/log.c b/os/log.c
+index 2a721b9..629021e 100644
+--- a/os/log.c
++++ b/os/log.c
+@@ -195,7 +195,7 @@ LogInit(const char *fname, const char *backup)
+     char *logFileName = NULL;
+ 
+     if (fname && *fname) {
+-#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 2
++#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 5
+ #pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ #endif
+         if (asprintf(&logFileName, fname, display) == -1)
+@@ -208,7 +208,7 @@ LogInit(const char *fname, const char *backup)
+                 char *suffix;
+                 char *oldLog;
+ 
+-#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 2
++#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 5
+ #pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ #endif
+                 if ((asprintf(&suffix, backup, display) == -1) ||
+-- 
+2.0.0
+
