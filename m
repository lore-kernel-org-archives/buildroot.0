From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jun 2012 23:33:18 +0200
Subject: [Buildroot] [git commit] radvd: fix bashism in configure.ac
Message-ID: <20120618213341.9DB4C96F3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e73f03d579aeb194ded0f9951571553a8422dd23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c3d0d04f8b3df63b3206cecf54dfdd67a4c7ccfb/build-end.log

Patch sent upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/radvd/radvd-configure.ac-fix-bashism.patch |   31 ++++++++++++++++++++
 package/radvd/radvd.mk                             |    1 +
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/radvd/radvd-configure.ac-fix-bashism.patch b/package/radvd/radvd-configure.ac-fix-bashism.patch
new file mode 100644
index 0000000..a635cf8
--- /dev/null
+++ b/package/radvd/radvd-configure.ac-fix-bashism.patch
@@ -0,0 +1,31 @@
+From ce34738107678cb76e3da34cd16dc9a34d8dd242 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 18 Jun 2012 23:12:05 +0200
+Subject: [PATCH] configure.ac: fix bashism
+
+'==' is a bashism, breaking configure on systems where /bin/sh isn't bash
+(E.G. Ubuntu).  Fixes:
+
+http://autobuild.buildroot.net/results/c3d0d04f8b3df63b3206cecf54dfdd67a4c7ccfb/build-end.log
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3ab6667..c3b907b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -176,7 +176,7 @@ dnl Checks for library functions.
+ AC_CHECK_FUNCS(getopt_long)
+ 
+ CONDITIONAL_SOURCES="device-${arch}.${OBJEXT} ${CONDITIONAL_SOURCES}"
+-if test x${arch} == xlinux ; then
++if test x${arch} = xlinux ; then
+ 	CONDITIONAL_SOURCES="privsep-${arch}.${OBJEXT} ${CONDITIONAL_SOURCES}"
+ 	AC_DEFINE(USE_PRIVSEP, 1, [Use privsep])
+ fi
+-- 
+1.7.10
+
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index e63e8e0..474a299 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -7,6 +7,7 @@
 RADVD_VERSION = 1.8.5
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = flex host-flex
+RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d
