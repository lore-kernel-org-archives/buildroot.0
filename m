From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Oct 2011 14:04:56 +0200
Subject: [Buildroot] [git commit] oprofile: bump to version 0.9.7 and fixes
Message-ID: <20111027132528.844C68F290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a56a141e09b1540875abb572229e5eaec68aef8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Bump to version 0.9.7
* Style fixes
* Build fix for x86: i386 is expected, not some other random i?86 as arch

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...le-0.9.7-001-avr32-enable-lookup_dcookie.patch} |    0
 ...h => oprofile-0.9.7-002-no-query-modules.patch} |    0
 package/oprofile/oprofile.mk                       |   21 ++++++++++---------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch b/package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch
similarity index 100%
rename from package/oprofile/oprofile-0.9.4-001-avr32-enable-lookup_dcookie.patch
rename to package/oprofile/oprofile-0.9.7-001-avr32-enable-lookup_dcookie.patch
diff --git a/package/oprofile/oprofile-0.9.4-002-no-query-modules.patch b/package/oprofile/oprofile-0.9.7-002-no-query-modules.patch
similarity index 100%
rename from package/oprofile/oprofile-0.9.4-002-no-query-modules.patch
rename to package/oprofile/oprofile-0.9.7-002-no-query-modules.patch
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index ae4cdde..734839f 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -3,25 +3,26 @@
 # oprofile
 #
 #############################################################
-OPROFILE_VERSION := 0.9.6
-OPROFILE_CONF_OPT :=	--localstatedir=/var \
-			--with-kernel-support
 
-OPROFILE_BINARIES := utils/ophelp
-OPROFILE_BINARIES += pp/opannotate pp/oparchive pp/opgprof pp/opreport opjitconv/opjitconv
-OPROFILE_BINARIES += daemon/oprofiled
+OPROFILE_VERSION = 0.9.7
+OPROFILE_CONF_OPT = --localstatedir=/var --with-kernel-support
+OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
+OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv daemon/oprofiled
 
+ifeq ($(BR2_i386),y)
+OPROFILE_ARCH = i386
+endif
 ifeq ($(BR2_powerpc),y)
-OPROFILE_ARCH := ppc
+OPROFILE_ARCH = ppc
 endif
 ifeq ($(BR2_x86_64),y)
-OPROFILE_ARCH := x86-64
+OPROFILE_ARCH = x86-64
 endif
 ifeq ($(OPROFILE_ARCH),)
-OPROFILE_ARCH := $(BR2_ARCH)
+OPROFILE_ARCH = $(BR2_ARCH)
 endif
 
-OPROFILE_DEPENDENCIES := popt binutils
+OPROFILE_DEPENDENCIES = popt binutils
 
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
