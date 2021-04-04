From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 12:30:26 +0200
Subject: [Buildroot] [git commit] package/smartmontools: bump to version 7.2
Message-ID: <20210404101716.ECE51813F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3d4f83e5a64f8858355d96721f6a205da087b88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so autoreconf

https://www.smartmontools.org/browser/tags/RELEASE_7_2/smartmontools/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure.ac-fix-stack-protector-detection.patch | 38 ----------------------
 package/smartmontools/smartmontools.hash           |  8 ++---
 package/smartmontools/smartmontools.mk             |  4 +--
 3 files changed, 5 insertions(+), 45 deletions(-)

diff --git a/package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch b/package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch
deleted file mode 100644
index 63f51fc9bc..0000000000
--- a/package/smartmontools/0001-configure.ac-fix-stack-protector-detection.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 6bd18b0b7b4d916e474ba84707eb784a643b3e71 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 23 Feb 2020 16:23:20 +0100
-Subject: [PATCH] configure.ac: fix stack-protector detection
-
-Use AC_LINK_IFELSE instead of AC_COMPILE_IFELSE to check for
-stack-protector availability as some compilers could missed the needed
-library (-lssp or -lssp_nonshared) at linking step:
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-g++  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -Wall -W -Wformat=2 -fstack-protector-strong   -o smartctl smartctl.o atacmdnames.o atacmds.o ataidentify.o ataprint.o dev_ata_cmd_set.o dev_intelliprop.o dev_interface.o dev_jmb39x_raid.o json.o knowndrives.o nvmecmds.o nvmeprint.o scsicmds.o scsiata.o scsinvme.o scsiprint.o utility.o     os_linux.o cciss.o dev_areca.o    -lselinux
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
-
-Fixes:
- - http://autobuild.buildroot.org/results/0de9f2a69fa2a39164211299f8a429d2fec6935a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://www.smartmontools.org/ticket/1302]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 87470d8a..ccb457e1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -770,7 +770,7 @@ if test "$GXX" = "yes"; then
-     AC_MSG_CHECKING([whether $CXX supports $option])
-     save_CXXFLAGS=$CXXFLAGS
-     CXXFLAGS="$CXXFLAGS $option"
--    AC_COMPILE_IFELSE([AC_LANG_PROGRAM()], [res=yes], [res=no; CXXFLAGS=$save_CXXFLAGS])
-+    AC_LINK_IFELSE([AC_LANG_PROGRAM()], [res=yes], [res=no; CXXFLAGS=$save_CXXFLAGS])
-     AC_MSG_RESULT([$res])
-   done
- else
--- 
-2.25.0
-
diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index bec007aabd..3c5535b29a 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.1/
-md5  430cd5f64caa4524018b536e5ecd9c29  smartmontools-7.1.tar.gz
-sha1  207dc2b50cab1c6fba7bc248665fbbe3189374e1  smartmontools-7.1.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.2/
+md5  e8d134c69ae4959a05cb56b31172ffb1  smartmontools-7.2.tar.gz
+sha1  8d68241096f6ed5b1bbcd8b427fa4a881c1f3e33  smartmontools-7.2.tar.gz
 
 # Locally computed
-sha256  3f734d2c99deb1e4af62b25d944c6252de70ca64d766c4c7294545a2e659b846  smartmontools-7.1.tar.gz
+sha256  5cd98a27e6393168bc6aaea070d9e1cd551b0f898c52f66b2ff2e5d274118cd6  smartmontools-7.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 1f4448cb84..215db1ae69 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.1
+SMARTMONTOOLS_VERSION = 7.2
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
 SMARTMONTOOLS_CPE_ID_VENDOR = smartmontools
-# We're patching configure.ac
-SMARTMONTOOLS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
