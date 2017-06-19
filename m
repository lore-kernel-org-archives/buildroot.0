From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 19 Jun 2017 16:14:36 -0500
Subject: [Buildroot] [PATCH 1/1] paxtest: new package
Message-ID: <1497906876-27014-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PaX regression test suite

Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                                  |  1 +
 .../0001-genpaxtest-move-log-location.patch        | 54 ++++++++++++++++++++++
 package/paxtest/Config.in                          |  5 ++
 package/paxtest/paxtest.hash                       |  2 +
 package/paxtest/paxtest.mk                         | 30 ++++++++++++
 5 files changed, 92 insertions(+)
 create mode 100644 package/paxtest/0001-genpaxtest-move-log-location.patch
 create mode 100644 package/paxtest/Config.in
 create mode 100644 package/paxtest/paxtest.hash
 create mode 100644 package/paxtest/paxtest.mk

diff --git a/package/Config.in b/package/Config.in
index c997e2a..b9d5f9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1774,6 +1774,7 @@ endmenu
 
 menu "Security"
 	source "package/checkpolicy/Config.in"
+	source "package/paxtest/Config.in"
 	source "package/policycoreutils/Config.in"
 	source "package/refpolicy/Config.in"
 	source "package/sepolgen/Config.in"
diff --git a/package/paxtest/0001-genpaxtest-move-log-location.patch b/package/paxtest/0001-genpaxtest-move-log-location.patch
new file mode 100644
index 0000000..9fc898d
--- /dev/null
+++ b/package/paxtest/0001-genpaxtest-move-log-location.patch
@@ -0,0 +1,54 @@
+From 623d99e4f557ef9cd771006e4f916c12d22a07a8 Mon Sep 17 00:00:00 2001
+From: David Graziano <david.graziano@rockwellcollins.com>
+Date: Mon, 12 Jun 2017 10:41:45 -0500
+Subject: [PATCH] genpaxtest: move log location
+
+Move log location to /tmp instead of local directory.
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
+@@ -43,26 +43,26 @@ else
+ fi
+ export LD_LIBRARY_PATH
+ 
+-cat <<__end__ | tee paxtest.log
++cat <<__end__ | tee /tmp/paxtest.log
+ PaXtest - Copyright(c) 2003,2004 by Peter Busser <peter@adamantix.org>
+ Released under the GNU Public Licence version 2 or later
+ 
+ __end__
+ 
+-echo "Mode: \$1" >>paxtest.log
+-uname -a >>paxtest.log
+-echo >>paxtest.log
++echo "Mode: \$1" >>/tmp/paxtest.log
++uname -a >>/tmp/paxtest.log
++echo >>/tmp/paxtest.log
+ 
+-echo 'Writing output to paxtest.log'
++echo 'Writing output to /tmp/paxtest.log'
+ echo 'It may take a while for the tests to complete'
+ 
+ for i in $*
+ do
+ 	${RUNDIR}/\$i
+-done >>paxtest.log 2>&1
++done >>/tmp/paxtest.log 2>&1
+ 
+ echo "Test results:"
+-cat paxtest.log
++cat /tmp/paxtest.log
+ 
+ echo
+ 
+-- 
+1.9.1
+
diff --git a/package/paxtest/Config.in b/package/paxtest/Config.in
new file mode 100644
index 0000000..f5ed60d
--- /dev/null
+++ b/package/paxtest/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PAXTEST
+	bool "paxtest"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  PaX regression test suite
diff --git a/package/paxtest/paxtest.hash b/package/paxtest/paxtest.hash
new file mode 100644
index 0000000..3fe4ee5
--- /dev/null
+++ b/package/paxtest/paxtest.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	c36fbc1c95d11b2c8c92ae8a9a1a40dbe98c7f6725621c7a46807a022a18a54c  paxtest_0.9.11.orig.tar.gz
diff --git a/package/paxtest/paxtest.mk b/package/paxtest/paxtest.mk
new file mode 100644
index 0000000..bc4b9e5
--- /dev/null
+++ b/package/paxtest/paxtest.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# paxtest
+#
+################################################################################
+
+PAXTEST_VERSION = 0.9.11
+PAXTEST_SOURCE = paxtest_$(PAXTEST_VERSION).orig.tar.gz
+PAXTEST_SITE = http://http.debian.net/debian/pool/main/p/paxtest
+PAXTEST_LICENSE = GPL-2.0+
+PAXTEST_LICENSE_FILES = README
+
+PAXTEST_MAKE_OPTS = \
+	CC=$(TARGET_CC) \
+	LD=$(TARGET_LD)
+
+PAXTEST_INSTALL_TARGET_OPTS = \
+	DESTDIR=$(TARGET_DIR) \
+	BINDIR="usr/bin" \
+	RUNDIR="usr/lib"
+
+define PAXTEST_BUILD_CMDS
+	$(MAKE) -C $(@D) $(PAXTEST_MAKE_OPTS) linux
+endef
+
+define PAXTEST_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -f Makefile.psm install $(PAXTEST_INSTALL_TARGET_OPTS)
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
