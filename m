From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Dec 2015 15:38:36 +0100
Subject: [Buildroot] [git commit] package/pixman: disable tests
Message-ID: <20151205144026.8E02C803EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e7081abb15632e88597a7d9defa99538e91f220
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests are broken on some architectures because of an incomplete fenv.

Since the tests are not really useful in the Buildroot environment, just
disable them.

Fixes a lot of build failures:
    http://autobuild.buildroot.org/results/cd7/cd722620832c28d22eacfc43336f6952b82305ff/
    http://autobuild.buildroot.org/results/3f4/3f4f1e88988d66b052432885b4f044a0eddcee2c/
    ...

Pixman was already autoreconfed (but that was not needed). Since we now
really need to autoreconf it, add a comment stating why we do.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pixman/0001-Disable-tests.patch | 29 +++++++++++++++++++++++++++++
 package/pixman/pixman.mk                |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/package/pixman/0001-Disable-tests.patch b/package/pixman/0001-Disable-tests.patch
new file mode 100644
index 0000000..dfadd69
--- /dev/null
+++ b/package/pixman/0001-Disable-tests.patch
@@ -0,0 +1,29 @@
+From 9b8132738c364fc3c886e81e7d383aaff80dc867 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 5 Dec 2015 12:00:53 +0100
+Subject: [PATCH] Disable tests
+
+Tests are causing build failures on some architectures that are missing
+a proper fenv.h, so just disable them.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Status: Buildroot specific, not suitable for upstream in this state.
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5137c9e..eae79fd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = pixman demos test
++SUBDIRS = pixman demos
+ 
+ pkgconfigdir=$(libdir)/pkgconfig
+ pkgconfig_DATA=pixman-1.pc
+-- 
+1.9.1
+
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index cbf57fe..8281773 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -12,6 +12,8 @@ PIXMAN_LICENSE_FILES = COPYING
 
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
+
+# For 0001-Disable-tests.patch
 PIXMAN_AUTORECONF = YES
 
 # don't build gtk based demos
