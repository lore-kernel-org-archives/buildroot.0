From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Aug 2019 19:40:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: snmp_agent needs netsnmp
 mibs
Message-ID: <20190806174009.14158-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

snmp_agent plugin was added in version 5.8.0 by
https://github.com/collectd/collectd/commit/8aba9d6e33dea747e4e27e35457f00c287e2c678

It depends on "struct tree" (from net-snmp/library/parse.h) which is
included if BR2_PACKAGE_NETSNMP_ENABLE_MIBS is set

Fix this error by updating configure.ac to check for get_tree in
addition to init_agent

Fixes:
 - http://autobuild.buildroot.org/results/3e24a7671e65974815072f92efaa490d2950b3d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-activation-of-snmp_agent.patch | 49 +++++++++++++++++++
 package/collectd/collectd.mk                  |  2 +
 2 files changed, 51 insertions(+)
 create mode 100644 package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch

diff --git a/package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch b/package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch
new file mode 100644
index 0000000000..783d5726da
--- /dev/null
+++ b/package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch
@@ -0,0 +1,49 @@
+From bfb85f1840f3672518979dd4b52f012fc08b4f88 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 6 Aug 2019 09:36:13 +0200
+Subject: [PATCH] configure.ac: fix activation of snmp_agent
+
+If netsnmp library has been built without mib loading support (through
+--disable-mib-loading), build of snmp_agent fails on:
+
+src/snmp_agent.c: In function 'snmp_agent_get_asn_type':
+src/snmp_agent.c:160:47: error: dereferencing pointer to incomplete type 'struct tree'
+   return (node != NULL) ? mib_to_asn_type(node->type) : 0;
+
+struct tree is defined in net-snmp/libray/parse.h which is included by
+net-snmp/mib_api.h only if NETSNMP_DISABLE_MIB_LOADING is not set.
+
+To fix this error, check for get_tree function in netsnmp library in
+addition to init_agent in netsnmpagent library
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6d7ac28f154f83208f949c62d28411855f1817f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/collectd/collectd/pull/3241]
+---
+ configure.ac | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index add1556b..5ac33dc7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3950,7 +3950,13 @@ if test "x$with_libnetsnmpagent" = "xyes"; then
+   )
+ 
+   AC_CHECK_LIB([netsnmpagent], [init_agent],
+-    [with_libnetsnmpagent="yes"],
++    [
++      # libnetsnmp can be built without without mib loading support
++      AC_CHECK_LIB([netsnmp], [get_tree],
++        [with_libnetsnmpagent="yes"],
++        [with_libnetsnmpagent="no (libnetsnmp doesn't support mib loading)"]
++      )
++    ],
+     [with_libnetsnmpagent="no (libnetsnmpagent not found)"],
+     [$libnetsnmphelpers]
+   )
+-- 
+2.20.1
+
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 8eb7aa2ec0..c73008becd 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -11,6 +11,8 @@ COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
 COLLECTD_LICENSE = MIT (daemon, plugins), GPL-2.0 (plugins), LGPL-2.1 (plugins)
 COLLECTD_LICENSE_FILES = COPYING
+# We're patching configure.ac
+COLLECTD_AUTORECONF = YES
 
 # These require unmet dependencies, are fringe, pointless or deprecated
 COLLECTD_PLUGINS_DISABLE = \
-- 
2.20.1
