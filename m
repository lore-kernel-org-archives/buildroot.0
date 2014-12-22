From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 09:49:15 +0100
Subject: [Buildroot] [git commit] opkg: bump to 0.2.4 and fix build failure
Message-ID: <20141222085024.57AB780551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=872e102386825e0780d12e7d1af6f97c84beb519
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps opkg to 0.2.4, and adds a new patch to fix a build
failure apparently caused by the recent bump of the libtool version:

  http://autobuild.buildroot.org/results/5fc/5fc9fa24563213d1ad77e55ab52c8e59bf21055f/

It also refreshes the existing patch, turns it into a Git formatted
patch, and fixes a typo in its title.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...patch => 0001-Disable-tests-and-manpages.patch} |   21 +++++++++---
 ...002-Fix-libtool-issue-with-recent-libtool.patch |   35 ++++++++++++++++++++
 package/opkg/opkg.mk                               |    2 +-
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/package/opkg/0001-no-tests-no-man.patch b/package/opkg/0001-Disable-tests-and-manpages.patch
similarity index 52%
rename from package/opkg/0001-no-tests-no-man.patch
rename to package/opkg/0001-Disable-tests-and-manpages.patch
index 87d3bf9..b816766 100644
--- a/package/opkg/0001-no-tests-no-man.patch
+++ b/package/opkg/0001-Disable-tests-and-manpages.patch
@@ -1,4 +1,7 @@
-Disable tests and mapages
+From 1c8e21e220ed0af6de3ab776d3edf8f0be69e779 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 22 Dec 2014 09:45:08 +0100
+Subject: [PATCH 1/2] Disable tests and manpages
 
 Tests are forcibly statically linked to libopkg, which does not work in
 a shared-only build.
@@ -10,15 +13,23 @@ Note: dynamically linking with libopkg is also possible, but that would
 not be upstreamable (too much changes already in upstream).
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff -durN opkg-v0.2.2.orig/Makefile.am opkg-v0.2.2/Makefile.am
---- opkg-v0.2.2.orig/Makefile.am	2014-04-01 22:31:59.000000000 +0200
-+++ opkg-v0.2.2/Makefile.am	2014-12-13 14:13:49.684618796 +0100
+diff --git a/Makefile.am b/Makefile.am
+index 8baa62c..497b774 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -1,6 +1,6 @@
- ACLOCAL_AMFLAGS = -I shave
+ ACLOCAL_AMFLAGS = -I shave -I m4
  
 -SUBDIRS = libbb libopkg src tests utils man
 +SUBDIRS = libbb libopkg src utils
  
  
  HOST_CPU=@host_cpu@
+-- 
+2.1.0
+
diff --git a/package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch b/package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch
new file mode 100644
index 0000000..4ba2bd3
--- /dev/null
+++ b/package/opkg/0002-Fix-libtool-issue-with-recent-libtool.patch
@@ -0,0 +1,35 @@
+From 932bf10f259a82ffc17060c032bfdddd0436ca2d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 22 Dec 2014 09:45:33 +0100
+Subject: [PATCH 2/2] Fix libtool issue with recent libtool
+
+With recent libtool versions, autoreconf complains that the set of
+directories in AC_CONFIG_MACRO_DIR doesn't match the ones passed in
+ACLOCAL_AMFLAGS. This patch fixes that by using AC_CONFIG_MACRO_DIRS
+instead.
+
+Note that this patch will no longer be needed once we bump to opkg
+0.3.0, since the shave/ macro directory has been removed.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1ea2e78..0e3964d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,8 +3,7 @@ AC_INIT([opkg], [0.2.4])
+ AC_CONFIG_SRCDIR([libopkg/pkg.c])
+ 
+ AC_CONFIG_AUX_DIR([conf])
+-AC_CONFIG_MACRO_DIR([m4])
+-AC_CONFIG_MACRO_DIR([shave])
++AC_CONFIG_MACRO_DIRS([shave m4])
+ 
+ AM_INIT_AUTOMAKE
+ AC_CONFIG_HEADERS(config.h)
+-- 
+2.1.0
+
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index ae795a4..dcc625a 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_VERSION = v0.2.2
+OPKG_VERSION = v0.2.4
 OPKG_SITE = http://git.yoctoproject.org/git/opkg
 OPKG_SITE_METHOD = git
 # Uses PKG_CHECK_MODULES() in configure.ac
