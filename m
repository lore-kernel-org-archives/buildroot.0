From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 19:21:39 +0100
Subject: [Buildroot] [git commit] Revert "package/smartmontools: fix build
 without stack-protector"
Message-ID: <20200223181012.54F3C8E818@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa8877fb02f7be054c944ea4b7bdfecd7a010be2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit dc171f123c6b320c4930ba00debeb34fede82d99, which was
aimed at the next branch, not master.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...onfigure.ac-fix-stack-protector-detection.patch | 38 ----------------------
 package/smartmontools/smartmontools.mk             |  2 --
 2 files changed, 40 deletions(-)

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
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 89831089c9..bad7da2d16 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -8,8 +8,6 @@ SMARTMONTOOLS_VERSION = 6.5
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
-# 0001-configure.ac-fix-stack-protector-detection.patch
-SMARTMONTOOLS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 SMARTMONTOOLS_CONF_OPTS += --with-libcap-ng
