From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Apr 2018 23:31:44 +0200
Subject: [Buildroot] [git commit] keepalived: add patch to disable PIE
Message-ID: <20180405213312.3A84F863B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e509e04dedd02f672fc17662a27f80dddb58dbd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PIE breaks the build on m68k and Microblaze, so let's add a patch that
disables using PIE by default in keepalived. Obviously, when we start
seriously testing the BR2_RELRO_FULL option, we will realize that it
is broken on some architectures, and will probably disable it on m68k
and Microblaze.

Fixes:

  http://autobuild.buildroot.net/results/a536f5947b3b70fdaecad1af5542572c504ad046/
  http://autobuild.buildroot.net/results/0ffbf1e8d181c9463847a5b2be6f9baa18face24/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure.ac-do-not-force-PIE.patch       | 38 ++++++++++++++++++++++
 package/keepalived/keepalived.mk                   |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/package/keepalived/0001-configure.ac-do-not-force-PIE.patch b/package/keepalived/0001-configure.ac-do-not-force-PIE.patch
new file mode 100644
index 0000000000..b51a4e334b
--- /dev/null
+++ b/package/keepalived/0001-configure.ac-do-not-force-PIE.patch
@@ -0,0 +1,38 @@
+From 4da31a615412e15f7658d21770708e8084be149c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 4 Apr 2018 22:29:45 +0200
+Subject: [PATCH] configure.ac: do not force PIE
+
+PIE is not necessarily supported on all architectures, so leave it up
+to the user to pass the appropriate CFLAGS/LDFLAGS if he wants to use
+PIE.
+
+This fixes the build on the m68k and Microblaze architecture:
+
+  http://autobuild.buildroot.net/results/a536f5947b3b70fdaecad1af5542572c504ad046/
+  http://autobuild.buildroot.net/results/0ffbf1e8d181c9463847a5b2be6f9baa18face24/
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/acassen/keepalived/pull/830
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c344f07e..06545c91 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -233,8 +233,8 @@ AC_SUBST(ARFLAGS)
+ # AC_PROG_LIBTOOL
+ 
+ KA_CPPFLAGS="$kernelinc"
+-KA_CFLAGS="-Wall -Wunused -Wstrict-prototypes -Wextra -g -O2 -fPIE -D_GNU_SOURCE"
+-KA_LDFLAGS="-pie"
++KA_CFLAGS="-Wall -Wunused -Wstrict-prototypes -Wextra -g -O2 -D_GNU_SOURCE"
++KA_LDFLAGS=""
+ KA_LIBS=
+ NEED_LIBDL=No
+ #KA_LIBTOOLFLAGS =
+-- 
+2.14.3
+
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 0fa1b79e3a..e8a280a19c 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -9,6 +9,8 @@ KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl popt
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
+# 0001-configure.ac-do-not-force-PIE.patch
+KEEPALIVED_AUTORECONF = YES
 KEEPALIVED_CONF_OPTS += --disable-dbus
 
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
