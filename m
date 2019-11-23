From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 11:44:51 +0100
Subject: [Buildroot] [git commit] package/linux-serial-test: bump version
Message-ID: <20191123103809.359E28F427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01d8b65dc733b399a0335ebdf22642b3a15a9883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update fixes both the below mentioned build error when handling
undefined baud rates, and makes the patch for MIPS obsolete.

No other changes will be introduced with this update.

Fixes:
http://autobuild.buildroot.net/results/ef77cbe220619050eb9d46c78ae79a94eea8aa8b

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...l-test.c-fix-missing-CMSPAR-define-on-MIP.patch | 54 ----------------------
 package/linux-serial-test/linux-serial-test.hash   |  2 +-
 package/linux-serial-test/linux-serial-test.mk     |  2 +-
 3 files changed, 2 insertions(+), 56 deletions(-)

diff --git a/package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch b/package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch
deleted file mode 100644
index fe5a1c6813..0000000000
--- a/package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c34767aa22623a21369f1464c52fc4635895223c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 8 Nov 2019 18:25:35 +0100
-Subject: [PATCH] linux-serial-test.c: fix missing CMSPAR define on MIPS
-
-This patch is an adaptation of
-https://git.busybox.net/buildroot/diff/package/freerdp/0003-add-missing-define.patch?id=78cd32631e959e04b1a2f18be7b0757e21482438
-
-linux-serial-test.c uses CMSPAR, which is defined by glibc in
-bits/termios.h.
-
-glibc has two flavours of bits/termios.h: a generic one and an
-architecture-specific one. When installing, glibc will install the
-architecture-specific file if it exists, otherwise it installs the
-generic file. Only Alpha, MIPS, PPC and Sparc have their own
-bits/termios.h.
-
-The generic bits/termios.h, as well as the Alpha, PPC and Sparc flavours
-do define CMSPAR. However, the MIPS flavour does not define it.
-
-Define CMSPAR to the value from the generic value, which is also the
-value known to the Linux kernel for MIPS.
-
-Fixes:
- - http://autobuild.buildroot.org/results/1350cc46dcb285772b1a4c90aec6ba38fdb11e3c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cbrake/linux-serial-test/pull/20]
----
- linux-serial-test.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/linux-serial-test.c b/linux-serial-test.c
-index 5e7504e..0d4a919 100644
---- a/linux-serial-test.c
-+++ b/linux-serial-test.c
-@@ -17,6 +17,14 @@
- #include <linux/serial.h>
- #include <errno.h>
- 
-+/* 
-+ * glibc for MIPS has its own bits/termios.h which does not define
-+ * CMSPAR, so we vampirise the value from the generic bits/termios.h
-+ */
-+#ifndef CMSPAR
-+#define CMSPAR 010000000000
-+#endif
-+
- // command line args
- int _cl_baud = 0;
- char *_cl_port = NULL;
--- 
-2.23.0
-
diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
index e8844528b9..5cbf00a7e4 100644
--- a/package/linux-serial-test/linux-serial-test.hash
+++ b/package/linux-serial-test/linux-serial-test.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  edbb3ec1f287ec0fb96bac4e6a580a024af1d16b767a15f3c1b0163ff518fb71  linux-serial-test-5d11b31d9c9807cd58e53a8628bc6402b6fe7fac.tar.gz
+sha256  bfc25088e960c18e151f978b13d893dbee9a3e377e062bd56caab1bd409e4dcb  linux-serial-test-13bea838f2a7573d2a68a6d95fc9d1f153b580be.tar.gz
 sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSES/MIT
diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
index 42894ed181..b0f5fe4ebf 100644
--- a/package/linux-serial-test/linux-serial-test.mk
+++ b/package/linux-serial-test/linux-serial-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_SERIAL_TEST_VERSION = 5d11b31d9c9807cd58e53a8628bc6402b6fe7fac
+LINUX_SERIAL_TEST_VERSION = 13bea838f2a7573d2a68a6d95fc9d1f153b580be
 LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
 LINUX_SERIAL_TEST_LICENSE = MIT
 LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
