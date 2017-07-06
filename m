From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  5 Jul 2017 21:35:09 -0500
Subject: [Buildroot] [PATCH v2 1/1] paxtest: new package
Message-ID: <1499308509-30051-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PaX regression test suite

Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Changes v1 -> v2
 - Ran check-package script against all pkg files
 - Added new patch to fix alignment build failure on ARM/NIOS2

[Thomas P
 - Added DEVELOPERS
 - Commented about GLIBC depends and ran test-pkg to verify
   why.
 - Added URL in Config.in
 - Updated pkg to 0.9.15 and refactored move log location patch
 - Cleaned up MAKE OPTS use and added MAKE ENV
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-genpaxtest-move-log-location.patch        | 30 +++++++++++++
 ...paxtest-page-alignment-ARM-and-NIOS2-arch.patch | 49 ++++++++++++++++++++++
 package/paxtest/Config.in                          |  8 ++++
 package/paxtest/paxtest.hash                       |  2 +
 package/paxtest/paxtest.mk                         | 26 ++++++++++++
 7 files changed, 117 insertions(+)
 create mode 100644 package/paxtest/0001-genpaxtest-move-log-location.patch
 create mode 100644 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch
 create mode 100644 package/paxtest/Config.in
 create mode 100644 package/paxtest/paxtest.hash
 create mode 100644 package/paxtest/paxtest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4faa1a8..1edeb67 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1143,6 +1143,7 @@ F:	package/libsepol/
 F:	package/libqmi/
 F:	package/nginx-upload/
 F:	package/omniorb/
+F:	package/paxtest/
 F:	package/policycoreutils/
 F:	package/python-ipy/
 F:	package/python-posix-ipc/
diff --git a/package/Config.in b/package/Config.in
index 46c78a0..c97da17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1788,6 +1788,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
 	source "package/sepolgen/Config.in"
diff --git a/package/paxtest/0001-genpaxtest-move-log-location.patch b/package/paxtest/0001-genpaxtest-move-log-location.patch
new file mode 100644
index 0000000..6447d53
--- /dev/null
+++ b/package/paxtest/0001-genpaxtest-move-log-location.patch
@@ -0,0 +1,30 @@
+From 623d99e4f557ef9cd771006e4f916c12d22a07a8 Mon Sep 17 00:00:00 2001
+From: David Graziano <david.graziano@rockwellcollins.com>
+Date: Mon, 12 Jun 2017 10:41:45 -0500
+Subject: [PATCH] genpaxtest: move log location
+
+Move log location to /var/log instead of local directory.
+(For read-only filesystems)
+
+Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
+---
+ genpaxtest | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/genpaxtest b/genpaxtest
+index 5a22e15..d62b15e 100644
+--- a/genpaxtest
++++ b/genpaxtest
+@@ -35,7 +35,7 @@
+        exit 1
+ fi
+
+-LOG=\$HOME/paxtest.log
++LOG=/var/log/paxtest.log
+ [ -n "\$1" ] && LOG=\$1
+ touch "\$LOG"
+ if [ ! -e "\$LOG" ]; then
+ 
+-- 
+1.9.1
+
diff --git a/package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch b/package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch
new file mode 100644
index 0000000..8e836d6
--- /dev/null
+++ b/package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch
@@ -0,0 +1,49 @@
+From 70406ad5668a15fedce2ae1ed3bc4fad04d9f040 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Wed, 5 Jul 2017 20:47:42 -0500
+Subject: [PATCH] paxtest: page alignment ARM and NIOS2 arch
+
+- Extended ARM range from ARMv6-v7 to also include v4-v7
+- Added NIOS2 arch to conditionally have smaller alignment
+
+Submitted Upstream to pageexec at freemail.hu.  Also posted a
+bug to both (Hardened) Suse and Gentoo's bugtrackers.
+https://bugzilla.opensuse.org/show_bug.cgi?id=1047422
+https://bugs.gentoo.org/show_bug.cgi?id=623946
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ paxtest.h | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/paxtest.h b/paxtest.h
+index 8623bfb..a230c1a 100644
+--- a/paxtest.h
++++ b/paxtest.h
+@@ -5,13 +5,21 @@
+ #include <unistd.h>
+ 
+ /*
+- * ARMv6 and ARMv7 do not like 64k alignment, 32k is ok
++ * ARMv4 through ARMv7 do not like 64k alignment, 32k is ok
+  */
+-#if defined(__arm__) && __ARM_ARCH >= 6 && __ARM_ARCH <= 7
++#if defined(__arm__) && __ARM_ARCH >= 4 && __ARM_ARCH <= 7
+ #define PAGE_SIZE_MAX  (32768)
+ #else
+ #define PAGE_SIZE_MAX	0x10000	/* 64k should cover most arches */
+ #endif
++
++/*
++ * NIOS2's assemblier doesn't like 64k alignment
++ */
++#if defined(__nios2_arch__)
++#define PAGE_SIZE_MAX  (32768)
++#endif
++
+ #ifndef __aligned
+ #define __aligned(x)	__attribute__((aligned(x)))
+ #endif
+-- 
+1.9.1
+
diff --git a/package/paxtest/Config.in b/package/paxtest/Config.in
new file mode 100644
index 0000000..5782d46
--- /dev/null
+++ b/package/paxtest/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PAXTEST
+	bool "paxtest"
+	# No UCLIBC or MUSL because __NO_A_OUT_SUPPORT
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  PaX regression test suite
+
+	  http://pax.grsecurity.net/docs
diff --git a/package/paxtest/paxtest.hash b/package/paxtest/paxtest.hash
new file mode 100644
index 0000000..c10566c
--- /dev/null
+++ b/package/paxtest/paxtest.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	d553848431fd8c2ab6c8361b62e5cedfed1cc1d60088241f4a33d2af15dd667f	paxtest-0.9.15.tar.gz
diff --git a/package/paxtest/paxtest.mk b/package/paxtest/paxtest.mk
new file mode 100644
index 0000000..fe88571
--- /dev/null
+++ b/package/paxtest/paxtest.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# paxtest
+#
+################################################################################
+
+PAXTEST_VERSION = 0.9.15
+PAXTEST_SOURCE = paxtest-$(PAXTEST_VERSION).tar.gz
+PAXTEST_SITE = https://www.grsecurity.net/~spender
+PAXTEST_LICENSE = GPL-2.0+
+PAXTEST_LICENSE_FILES = README
+
+# Not using TARGET_CONFIGURE_OPTS as this package needs to set it's own
+# compile/link flags to do checks for things like if -fPIE is working, etc
+
+define PAXTEST_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC) LD=$(TARGET_LD) linux
+endef
+
+define PAXTEST_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		BINDIR="usr/bin" \
+		RUNDIR="usr/lib" -f Makefile.psm install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
