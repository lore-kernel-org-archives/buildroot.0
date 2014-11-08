From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 22:15:07 +0100
Subject: [Buildroot] [git commit] libiscsi: only build the test tool and
	ld-iscsi if we have shared libs
Message-ID: <20141108214405.09386B2EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79d390aa0a1f5001b54d98e6b788f32f1243c0c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backporting an upstream patch to fix a failure when doing a static
build:

/br/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc -shared -o
ld_iscsi.so ld_iscsi.o -ldl
/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld:
ld_iscsi.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be
used when making a shared object; recompile with -fPIC
ld_iscsi.o: could not read symbols: Bad value
collect2: error: ld returned 1 exit status

Upstream commit:
  https://github.com/sahlberg/libiscsi/commit/3d6c2be3428d88682cecfa2a4ad172aaacffb318

Fixes:
  http://autobuild.buildroot.net/results/7a9/7a9caf1f4080c2c4b04ee3b13c1240f475a22ea7/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nly-build-the-test-tool-and-ld-iscsi-iff-.patch |   55 ++++++++++++++++++++
 1 files changed, 55 insertions(+), 0 deletions(-)

diff --git a/package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch b/package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch
new file mode 100644
index 0000000..d57a208
--- /dev/null
+++ b/package/libiscsi/0006-configure-only-build-the-test-tool-and-ld-iscsi-iff-.patch
@@ -0,0 +1,55 @@
+Only build the test tool and ld-iscsi if we have shared libraries
+
+Backporting an upstream patch to fix a failure when doing a static
+build:
+
+/br/output/host/usr/bin/mipsel-ctng-linux-uclibc-gcc -shared -o 
+ld_iscsi.so ld_iscsi.o -ldl
+/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld: 
+ld_iscsi.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be 
+used when making a shared object; recompile with -fPIC
+ld_iscsi.o: could not read symbols: Bad value
+collect2: error: ld returned 1 exit status
+
+Upstream commit:
+  https://github.com/sahlberg/libiscsi/commit/3d6c2be3428d88682cecfa2a4ad172aaacffb318
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 3d6c2be3428d88682cecfa2a4ad172aaacffb318 Mon Sep 17 00:00:00 2001
+From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+Date: Wed, 22 Oct 2014 17:44:03 -0700
+Subject: [PATCH] configure: only build the test tool and ld-iscsi iff we have shared libraries
+
+Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+---
+ configure.ac |    5 ++---
+ 1 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5e18ff4..e9c5c93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,8 +10,6 @@ AM_PROG_AR
+ LT_INIT
+ 
+ AC_CANONICAL_HOST
+-AM_CONDITIONAL(LD_ISCSI,
+-               [expr "$host_os" : linux > /dev/null 2>&1])
+ AM_PROG_CC_C_O
+ 
+ enable_write_strings="yes"
+@@ -108,8 +106,9 @@ else
+   AC_MSG_NOTICE(You need libcunit to build the test suite.)
+   AC_MSG_NOTICE(The scsi/iscsi test suite will not be built.)
+ fi
+-AM_CONDITIONAL(ISCSITEST, [test "$ac_cv_have_cunit" = yes])
++AM_CONDITIONAL(ISCSITEST, [test "$ac_cv_have_cunit" = yes -a "$enable_shared" = "yes"])
+ 
++AM_CONDITIONAL(LD_ISCSI, [expr "(" "$host_os" : "linux" ")" "&" "$enable_shared" "=" "yes"])
+ 
+ AC_CHECK_MEMBER([struct CU_SuiteInfo.pSetUpFunc],
+ 		[AC_DEFINE([HAVE_CU_SUITEINFO_PSETUPFUNC], 1,
+-- 
+1.7.1
+
