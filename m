From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Oct 2015 12:26:02 +0200
Subject: [Buildroot] [git commit] sane-backends: bump to version 1.0.25
Message-ID: <20151007103312.C711281EC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e049d1a908caa24f60bac9e39b2147de6f2d9dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.0.25
- Update hash file. The hash value provided by the alioth.debian.org URL
  is wrong, so use the one provided by www.sane-project.org. I have
  reported this upstream.
- Remove unnecessary patches:
  0002-remove-unsafe-headers-path.patch
  0003-remove-cups-and-systemd-support.patch

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-remove-unsafe-headers-path.patch          |   24 --------
 .../0003-remove-cups-and-systemd-support.patch     |   56 --------------------
 package/sane-backends/sane-backends.hash           |    4 +-
 package/sane-backends/sane-backends.mk             |    4 +-
 4 files changed, 4 insertions(+), 84 deletions(-)

diff --git a/package/sane-backends/0002-remove-unsafe-headers-path.patch b/package/sane-backends/0002-remove-unsafe-headers-path.patch
deleted file mode 100644
index 6217b0a..0000000
--- a/package/sane-backends/0002-remove-unsafe-headers-path.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 3c03e4b81c9de73e57a56029f7f8cda8bec24e91 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 10 Jan 2015 15:48:21 +0100
-Subject: [PATCH] configure.in: remove unsafe headers path
-
-Forcing /usr/local/include headers path in CFLAGS is unsafe for
-cross-compilation.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
-[Gustavo: update to just patch configure and avoid an autoreconf]
----
-
-diff -Nura sane-backends-1.0.24.orig/configure sane-backends-1.0.24/configure
---- sane-backends-1.0.24.orig/configure	2015-05-01 09:51:19.479785064 -0300
-+++ sane-backends-1.0.24/configure	2015-05-01 09:51:48.411767378 -0300
-@@ -5192,8 +5192,6 @@
- fi
- 
- 
--INCLUDES="${INCLUDES} -I/usr/local/include"
--
- 
- if test "${ac_cv_c_compiler_gnu}" = "yes"; then
-   NORMAL_CFLAGS="\
diff --git a/package/sane-backends/0003-remove-cups-and-systemd-support.patch b/package/sane-backends/0003-remove-cups-and-systemd-support.patch
deleted file mode 100644
index e9a637e..0000000
--- a/package/sane-backends/0003-remove-cups-and-systemd-support.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-These tests use absolute directories and host leakage is granted
-when cups and systemd are around. In fact there's no way these could work
-in any predictable manner.
-
-CUPS support was in fact disabled upstream since it's not required
-in commit efb04936b8ad3bf313c289a522ae5832e22c1b7e
-
-And for systemd we never handled it properly anyway.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura sane-backends-1.0.24.orig/configure sane-backends-1.0.24/configure
---- sane-backends-1.0.24.orig/configure	2015-05-01 09:51:19.479785064 -0300
-+++ sane-backends-1.0.24/configure	2015-05-01 10:08:49.834447226 -0300
-@@ -9649,33 +9649,6 @@
- 
- fi
- 
--$as_echo "checking for cups"
--if test -e /usr/include/cups/cups.h ; then
--
--$as_echo "#define HAVE_CUPS 1" >>confdefs.h
--
--	with_cups="yes"
--	LIBS="-lcups  $LIBS"
--else
--	$as_echo "cups.h not found, you may want to install a cups development package"
--	$as_echo "in order to autodetect network scanners in kodakaio."
--	with_cups="no"
--fi
--
--$as_echo_n "Checking for systemd..."
--if test -e /usr/include/systemd/sd-daemon.h ; then
--
--$as_echo "#define HAVE_SYSTEMD 1" >>confdefs.h
--
--    with_systemd="yes"
--    SYSTEMD_LIBS=" -lsystemd-daemon"
--
--    $as_echo "yes"
--else
--    with_systemd="no"
--    $as_echo "no"
--fi
--
- 
- # Check whether --enable-libusb_1_0 was given.
- if test "${enable_libusb_1_0+set}" = set; then :
-@@ -21180,7 +21153,6 @@
- echo "IPv6 support:  `eval eval echo ${ipv6}`"
- echo "Avahi support: `eval eval echo ${enable_avahi}`"
- echo "SNMP support:  `eval eval echo ${with_snmp}`"
--echo "CUPS support:  `eval eval echo ${with_cups}`"
- echo "-> The following backends will be built:"
- for backend in ${BACKENDS} ; do
-   echo $ECHO_N "${backend} "
diff --git a/package/sane-backends/sane-backends.hash b/package/sane-backends/sane-backends.hash
index 44aea50..a7693e2 100644
--- a/package/sane-backends/sane-backends.hash
+++ b/package/sane-backends/sane-backends.hash
@@ -1,2 +1,2 @@
-# From https://alioth.debian.org/frs/download.php/file/3956/sane-backends-1.0.24.tar.gz.md5
-md5	1ca68e536cd7c1852322822f5f6ac3a4	sane-backends-1.0.24.tar.gz
+# From http://www.sane-project.org/sane-md5sums.txt
+md5 f9ed5405b3c12f07c6ca51ee60225fe7  sane-backends-1.0.25.tar.gz
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 3cb81a9..0c0b5a9 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SANE_BACKENDS_VERSION = 1.0.24
-SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/3958
+SANE_BACKENDS_VERSION = 1.0.25
+SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/4146
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPLv2+
 SANE_BACKENDS_LICENSE_FILES = COPYING
