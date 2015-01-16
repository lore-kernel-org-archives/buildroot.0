From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jan 2015 22:37:28 +0100
Subject: [Buildroot] [git commit] start-stop-daemon: fix build on non listed
	architectures
Message-ID: <20150116213818.2A4BB807EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=846f64df8b18bd3bc8178dfe7ce64312d340107b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not all Buildroot supported architectures are known to dpkg. Convert the
configure error to a warning.

Fixes:
http://autobuild.buildroot.net/results/24e/24e37550749dc15ed7223fd515fa4628803f341e/
http://autobuild.buildroot.net/results/445/445bf4742d78a0bf93b4c75dc733c4315530031e/
http://autobuild.buildroot.net/results/952/952051485f23b67ffc449360886d6757c385331f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-just-warn-on-missing-arch.patch           |   19 +++++++++++++++++++
 package/start-stop-daemon/start-stop-daemon.mk     |    2 ++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch b/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch
new file mode 100644
index 0000000..2b9cd3d
--- /dev/null
+++ b/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch
@@ -0,0 +1,19 @@
+Just warn on missing arch
+
+Some architectures are not listed in dpkg list (e.g. mips64el, xtensa, sh4a).
+Don't break the build for that.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff -Nuar dpkg-1.16.15-orig/m4/dpkg-arch.m4 dpkg-1.16.15/m4/dpkg-arch.m4
+--- dpkg-1.16.15-orig/m4/dpkg-arch.m4	2014-05-30 02:47:25.000000000 +0300
++++ dpkg-1.16.15/m4/dpkg-arch.m4	2015-01-16 06:55:19.701596362 +0200
+@@ -57,7 +57,7 @@
+ AC_MSG_CHECKING([dpkg architecture name])
+ _DPKG_ARCHITECTURE([DEB_HOST_ARCH], [dpkg_arch])
+ if test "x$dpkg_arch" = "x"; then
+-	AC_MSG_ERROR([cannot determine host dpkg architecture])
++	AC_MSG_WARN([cannot determine host dpkg architecture])
+ else
+ 	AC_MSG_RESULT([$dpkg_arch])
+ fi
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index 021edd1..5df44d4 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -20,6 +20,8 @@ START_STOP_DAEMON_CONF_ENV = \
 	dpkg_cv_c99_snprintf=yes
 START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
+# Patching m4/dpkg-arch.m4
+START_STOP_DAEMON_AUTORECONF = YES
 START_STOP_DAEMON_LICENSE = GPLv2+
 START_STOP_DAEMON_LICENSE_FILES = COPYING
 
