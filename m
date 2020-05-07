From: Chris Packham <judge.packham@gmail.com>
Date: Thu,  7 May 2020 15:46:30 +1200
Subject: [Buildroot] [PATCH] syslog-ng: Version bump to 2.27.1
Message-ID: <20200507034630.29267-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to 2.27.1 and drop patch applied upstream.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 .../0002-configure.ac-fix-with-netsnmp.patch  | 49 -------------------
 package/syslog-ng/syslog-ng.conf              |  2 +-
 package/syslog-ng/syslog-ng.hash              |  2 +-
 package/syslog-ng/syslog-ng.mk                |  2 +-
 4 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch

diff --git a/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch b/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
deleted file mode 100644
index 4d531aedd0..0000000000
--- a/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From bc327e4deb44f6b7a380a85d0b344647ea162ea9 Mon Sep 17 00:00:00 2001
-From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Date: Mon, 16 Mar 2020 15:41:03 +0100
-Subject: [PATCH] configure.ac: fix --with-net-snmp
-
-The option '--with-net-snmp' did not work, because later checks were using
-the variable '$with_netsnmp' rather than '$with_net_snmp'.
-
-There are two possible solutions:
-- make the option '--with-netsnmp'
-- change the internal variables
-
-Opt for the second option so the user-visible options remain the same.
-
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-status: backport
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 75901bd98..6e8462c37 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -151,7 +151,7 @@ AC_ARG_WITH(libnet,
- AC_ARG_WITH(net-snmp,
-    [  --with-net-snmp=path      use path to net-snmp-config script],
-    ,
--   [with_netsnmp=""])
-+   [with_net_snmp=""])
- 
- AC_ARG_WITH(pidfile-dir,
-    [  --with-pidfile-dir=path   Use path as the directory for storing pidfiles],
-@@ -1104,10 +1104,10 @@ dnl afsnmp module & net-snmp headers/libraries
- dnl ***************************************************************************
- AC_MSG_CHECKING(whether to enable snmp destination driver)
- 
--if test "x$with_netsnmp" = "x"; then
-+if test "x$with_net_snmp" = "x"; then
-    NETSNMP_CONFIG="`which net-snmp-config`"
- else
--   NETSNMP_CONFIG="$with_netsnmp/net-snmp-config"
-+   NETSNMP_CONFIG="$with_net_snmp/net-snmp-config"
- fi
- 
- if test "x$enable_afsnmp" = "xyes"; then
--- 
-2.24.1
-
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index e23d80580d..cad1d9c94d 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.26
+ at version: 3.27
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index edb7efe195..ca4b59cd4e 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 90214223864df252cea80dbb35c88a2464edcbbb2c9fbc6f6f6c13ee60cb62cd  syslog-ng-3.26.1.tar.gz
+sha256 c54c633c97f7fd8dd68261cfd784a76211e6e52965178e3aa4d0e32b899d61b3  syslog-ng-3.27.1.tar.gz
 sha256 e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index a0c21a8907..8c19fe74a3 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.26.1
+SYSLOG_NG_VERSION = 3.27.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.25.1
