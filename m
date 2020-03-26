From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:27:43 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: update patch that fixes
 --with-net-snmp
Message-ID: <20200326211425.713E48834B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f19a8811594304a2b07ecf5d26959bc29882354e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The final solution accepted upstream differs from the local patch applied
earlier in Buildroot (commit 4ff6e5239240a4e1bdf73c41d6e9bff9473ec62c).

Update the local code accordingly.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-configure.ac-fix-with-netsnmp.patch       | 44 +++++++++++++---------
 package/syslog-ng/syslog-ng.mk                     |  2 +-
 2 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch b/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
index f5b2a39bba..4d531aedd0 100644
--- a/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
+++ b/package/syslog-ng/0002-configure.ac-fix-with-netsnmp.patch
@@ -1,7 +1,7 @@
-From 39ab118a7e79b223941b50b372c8ed51f0e21f4b Mon Sep 17 00:00:00 2001
+From bc327e4deb44f6b7a380a85d0b344647ea162ea9 Mon Sep 17 00:00:00 2001
 From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 Date: Mon, 16 Mar 2020 15:41:03 +0100
-Subject: [PATCH] configure.ac: fix --with-netsnmp
+Subject: [PATCH] configure.ac: fix --with-net-snmp
 
 The option '--with-net-snmp' did not work, because later checks were using
 the variable '$with_netsnmp' rather than '$with_net_snmp'.
@@ -10,32 +10,40 @@ There are two possible solutions:
 - make the option '--with-netsnmp'
 - change the internal variables
 
-Taking into account that latest upstream has moved away from autotools and
-towards cmake, we opt for the first option that has the least amount of
-changes.
+Opt for the second option so the user-visible options remain the same.
 
 Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-Upstream-status: not applicable (latest upstream moved to cmake)
-
+Upstream-status: backport
 ---
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index bfc85c32d..392ab8bf3 100644
+index 75901bd98..6e8462c37 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -148,8 +148,8 @@ AC_ARG_WITH(libnet,
+@@ -151,7 +151,7 @@ AC_ARG_WITH(libnet,
+ AC_ARG_WITH(net-snmp,
+    [  --with-net-snmp=path      use path to net-snmp-config script],
     ,
-    [with_libnet=""])
+-   [with_netsnmp=""])
++   [with_net_snmp=""])
  
--AC_ARG_WITH(net-snmp,
--   [  --with-net-snmp=path      use path to net-snmp-config script],
-+AC_ARG_WITH(netsnmp,
-+   [  --with-netsnmp=path      use path to net-snmp-config script],
-    ,
-    [with_netsnmp=""])
+ AC_ARG_WITH(pidfile-dir,
+    [  --with-pidfile-dir=path   Use path as the directory for storing pidfiles],
+@@ -1104,10 +1104,10 @@ dnl afsnmp module & net-snmp headers/libraries
+ dnl ***************************************************************************
+ AC_MSG_CHECKING(whether to enable snmp destination driver)
+ 
+-if test "x$with_netsnmp" = "x"; then
++if test "x$with_net_snmp" = "x"; then
+    NETSNMP_CONFIG="`which net-snmp-config`"
+ else
+-   NETSNMP_CONFIG="$with_netsnmp/net-snmp-config"
++   NETSNMP_CONFIG="$with_net_snmp/net-snmp-config"
+ fi
  
+ if test "x$enable_afsnmp" = "xyes"; then
 -- 
 2.24.1
 
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 203f2c96b6..a0c21a8907 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -100,7 +100,7 @@ endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 SYSLOG_NG_DEPENDENCIES += netsnmp
 SYSLOG_NG_CONF_OPTS += --enable-snmp-dest
-SYSLOG_NG_CONF_OPTS += --with-netsnmp="$(STAGING_DIR)/usr/bin"
+SYSLOG_NG_CONF_OPTS += --with-net-snmp="$(STAGING_DIR)/usr/bin"
 else
 SYSLOG_NG_CONF_OPTS += --disable-snmp-dest
 endif
