From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 22:00:13 +0100
Subject: [Buildroot] [PATCH v1] package/start-stop-daemon: bump version to
 1.20.7.1
Message-ID: <20210321210013.10407-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- rebased 0001-add-uclibc-alias-and-musl.patch
- rebased 0002-just-warn-on-missing-arch.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-add-uclibc-alias-and-musl.patch      | 58 ++++++++++++-------
 .../0002-just-warn-on-missing-arch.patch      | 38 ++++++++----
 .../start-stop-daemon/start-stop-daemon.hash  |  4 +-
 .../start-stop-daemon/start-stop-daemon.mk    |  4 +-
 4 files changed, 66 insertions(+), 38 deletions(-)

diff --git a/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch b/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
index 64dc00d72c..acba5ad8e2 100644
--- a/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
+++ b/package/start-stop-daemon/0001-add-uclibc-alias-and-musl.patch
@@ -1,30 +1,44 @@
+From 31e4116ec355701e239cddcca720314523512a47 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Sun, 21 Mar 2021 17:59:15 +0100
+Subject: [PATCH] add uclibc alias and musl
+
 Make linux-uclibcgnueabi an alias for linux-uclibceabi since it's
 what we use in buildroot toolchains.
 Slightly tweak musleabi to match the buildroot-used tuple.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Rebased on 1.20.7.1]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ data/ostable | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff -Nura dpkg-1.18.3.orig/ostable dpkg-1.18.3/ostable
---- dpkg-1.18.3.orig/ostable	2015-10-15 08:05:04.471762555 -0300
-+++ dpkg-1.18.3/ostable	2015-10-15 08:11:05.206132648 -0300
-@@ -12,10 +12,10 @@
- # system part of the output of the GNU config.guess script.
+diff --git a/data/ostable b/data/ostable
+index 99c1f88..087dc6e 100644
+--- a/data/ostable
++++ b/data/ostable
+@@ -14,10 +14,10 @@
+ #   system part of the output of the GNU config.guess script.
  #
  # <Debian name>		<GNU name>		<config.guess regex>
--uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibceabi
-+uclibceabi-linux	linux-uclibceabi	linux[^-]*-uclibc.*eabi
- uclibc-linux		linux-uclibc		linux[^-]*-uclibc
- musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
--musl-linux		linux-musl		linux[^-]*-musl
-+musl-linux		linux-musl		linux[^-]*-musl[^-]*
- gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
- gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
- gnuabin32-linux		linux-gnuabin32		linux[^-]*-gnuabin32
-@@ -34,6 +34,6 @@
- bsd-netbsd		netbsd			netbsd[^-]*
- bsd-openbsd		openbsd			openbsd[^-]*
- sysv-solaris		solaris			solaris[^-]*
--uclibceabi-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibceabi
-+uclibceabi-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibc.*eabi
- uclibc-uclinux		uclinux-uclibc		uclinux[^-]*(-uclibc.*)?
- tos-mint		mint			mint[^-]*
+-eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibceabi
++eabi-uclibc-linux	linux-uclibceabi	linux[^-]*-uclibc.*eabi
+ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
+ eabihf-musl-linux	linux-musleabihf	linux[^-]*-musleabihf
+-base-musl-linux		linux-musl		linux[^-]*-musl
++base-musl-linux		linux-musl		linux[^-]*-musl[^-]*
+ eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
+ eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
+ abin32-gnu-linux	linux-gnuabin32		linux[^-]*-gnuabin32
+@@ -38,6 +38,6 @@ base-bsd-netbsd		netbsd			netbsd[^-]*
+ base-bsd-openbsd	openbsd			openbsd[^-]*
+ base-sysv-aix		aix			aix[^-]*
+ base-sysv-solaris	solaris			solaris[^-]*
+-eabi-uclibc-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibceabi
++eabi-uclibc-uclinux	uclinux-uclibceabi	uclinux[^-]*-uclibc.*eabi
+ base-uclibc-uclinux	uclinux-uclibc		uclinux[^-]*(-uclibc.*)?
+ base-tos-mint		mint			mint[^-]*
+-- 
+2.30.2
+
diff --git a/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch b/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch
index 2b9cd3db17..fc1f0f0743 100644
--- a/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch
+++ b/package/start-stop-daemon/0002-just-warn-on-missing-arch.patch
@@ -1,19 +1,33 @@
+From 7b20d3f012013edd4e3bb48541bd2bda10dac186 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 21 Mar 2021 18:03:28 +0100
+Subject: [PATCH] just warn on missing arch
+
 Just warn on missing arch
 
 Some architectures are not listed in dpkg list (e.g. mips64el, xtensa, sh4a).
 Don't break the build for that.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Rebased on 1.20.7.1]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
-diff -Nuar dpkg-1.16.15-orig/m4/dpkg-arch.m4 dpkg-1.16.15/m4/dpkg-arch.m4
---- dpkg-1.16.15-orig/m4/dpkg-arch.m4	2014-05-30 02:47:25.000000000 +0300
-+++ dpkg-1.16.15/m4/dpkg-arch.m4	2015-01-16 06:55:19.701596362 +0200
-@@ -57,7 +57,7 @@
- AC_MSG_CHECKING([dpkg architecture name])
- _DPKG_ARCHITECTURE([DEB_HOST_ARCH], [dpkg_arch])
- if test "x$dpkg_arch" = "x"; then
--	AC_MSG_ERROR([cannot determine host dpkg architecture])
-+	AC_MSG_WARN([cannot determine host dpkg architecture])
- else
- 	AC_MSG_RESULT([$dpkg_arch])
- fi
+ m4/dpkg-arch.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/dpkg-arch.m4 b/m4/dpkg-arch.m4
+index 71044c9..1394531 100644
+--- a/m4/dpkg-arch.m4
++++ b/m4/dpkg-arch.m4
+@@ -58,7 +58,7 @@ AC_DEFUN([DPKG_ARCHITECTURE], [
+   AC_MSG_CHECKING([dpkg architecture name])
+   _DPKG_ARCHITECTURE([DEB_HOST_ARCH], [dpkg_arch])
+   AS_IF([test "x$dpkg_arch" = "x"], [
+-    AC_MSG_ERROR([cannot determine host dpkg architecture])
++    AC_MSG_WARN([cannot determine host dpkg architecture])
+   ], [
+     AC_MSG_RESULT([$dpkg_arch])
+   ])
+-- 
+2.30.2
+
diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
index e5d1d91129..61a15afb3f 100644
--- a/package/start-stop-daemon/start-stop-daemon.hash
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -1,4 +1,4 @@
-# From http://ftp.de.debian.org/debian/pool/main/d/dpkg/dpkg_1.18.10.dsc
-sha256  025524da41ba18b183ff11e388eb8686f7cc58ee835ed7d48bd159c46a8b6dc5  dpkg_1.18.10.tar.xz
+# From https://snapshot.debian.org/archive/debian/20210109T083441Z/pool/main/d/dpkg/dpkg_1.20.7.1.dsc
+sha256  0aad2de687f797ef8ebdabc7bafd16dc1497f1ce23bd9146f9aa73f396a5636f  dpkg_1.20.7.1.tar.xz
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index 01a6719762..9db767dd16 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -7,9 +7,9 @@
 # Debian start-stop-daemon is part of dpkg. Since start-stop-daemon is the only
 # interesting tool in it, we call the buildroot package start-stop-daemon.
 
-START_STOP_DAEMON_VERSION = 1.18.10
+START_STOP_DAEMON_VERSION = 1.20.7.1
 START_STOP_DAEMON_SOURCE = dpkg_$(START_STOP_DAEMON_VERSION).tar.xz
-START_STOP_DAEMON_SITE = http://snapshot.debian.org/archive/debian/20160731T221931Z/pool/main/d/dpkg
+START_STOP_DAEMON_SITE = https://snapshot.debian.org/archive/debian/20210109T083441Z/pool/main/d/dpkg
 START_STOP_DAEMON_CONF_OPTS = \
 	--disable-dselect \
 	--disable-update-alternatives \
-- 
2.30.2
