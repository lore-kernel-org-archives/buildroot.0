From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 21:45:05 +0200
Subject: [Buildroot] [git commit] radvd: bump to version 1.9.1
Message-ID: <20120715202017.C6D749540B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfd9f83c1d8b0859e67b0064cf7bca919e9b22a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/Config.in                            |    1 +
 package/radvd/radvd-configure.ac-fix-bashism.patch |   31 --------------------
 package/radvd/radvd.mk                             |    4 +-
 3 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index 20e7e55..90c1fd4 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RADVD
 	bool "radvd"
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
+	select BR2_PACKAGE_LIBDAEMON
 	depends on BR2_INET_IPV6
 	help
 	  IPv6 Router Advertisement Daemon.
diff --git a/package/radvd/radvd-configure.ac-fix-bashism.patch b/package/radvd/radvd-configure.ac-fix-bashism.patch
deleted file mode 100644
index a635cf8..0000000
--- a/package/radvd/radvd-configure.ac-fix-bashism.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ce34738107678cb76e3da34cd16dc9a34d8dd242 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Mon, 18 Jun 2012 23:12:05 +0200
-Subject: [PATCH] configure.ac: fix bashism
-
-'==' is a bashism, breaking configure on systems where /bin/sh isn't bash
-(E.G. Ubuntu).  Fixes:
-
-http://autobuild.buildroot.net/results/c3d0d04f8b3df63b3206cecf54dfdd67a4c7ccfb/build-end.log
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3ab6667..c3b907b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -176,7 +176,7 @@ dnl Checks for library functions.
- AC_CHECK_FUNCS(getopt_long)
- 
- CONDITIONAL_SOURCES="device-${arch}.${OBJEXT} ${CONDITIONAL_SOURCES}"
--if test x${arch} == xlinux ; then
-+if test x${arch} = xlinux ; then
- 	CONDITIONAL_SOURCES="privsep-${arch}.${OBJEXT} ${CONDITIONAL_SOURCES}"
- 	AC_DEFINE(USE_PRIVSEP, 1, [Use privsep])
- fi
--- 
-1.7.10
-
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 474a299..3471f9d 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.8.5
+RADVD_VERSION = 1.9.1
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = flex host-flex
+RADVD_DEPENDENCIES = flex libdaemon host-flex host-pkg-config
 RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
