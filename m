From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Jan 2020 17:49:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/collectd: bump to version 5.10.0
Message-ID: <20200118164938.811063-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove first patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gure.ac-fix-activation-of-snmp_agent.patch | 49 -------------------
 ...protobuf-util-time_util.h-detection.patch} |  0
 package/collectd/collectd.hash                |  6 +--
 package/collectd/collectd.mk                  |  4 +-
 4 files changed, 5 insertions(+), 54 deletions(-)
 delete mode 100644 package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch
 rename package/collectd/{0002-configure.ac-fix-protobuf-util-time_util.h-detection.patch => 0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch} (100%)

diff --git a/package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch b/package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch
deleted file mode 100644
index 783d5726da..0000000000
--- a/package/collectd/0001-configure.ac-fix-activation-of-snmp_agent.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From bfb85f1840f3672518979dd4b52f012fc08b4f88 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Aug 2019 09:36:13 +0200
-Subject: [PATCH] configure.ac: fix activation of snmp_agent
-
-If netsnmp library has been built without mib loading support (through
---disable-mib-loading), build of snmp_agent fails on:
-
-src/snmp_agent.c: In function 'snmp_agent_get_asn_type':
-src/snmp_agent.c:160:47: error: dereferencing pointer to incomplete type 'struct tree'
-   return (node != NULL) ? mib_to_asn_type(node->type) : 0;
-
-struct tree is defined in net-snmp/libray/parse.h which is included by
-net-snmp/mib_api.h only if NETSNMP_DISABLE_MIB_LOADING is not set.
-
-To fix this error, check for get_tree function in netsnmp library in
-addition to init_agent in netsnmpagent library
-
-Fixes:
- - http://autobuild.buildroot.org/results/6d7ac28f154f83208f949c62d28411855f1817f8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/collectd/collectd/pull/3241]
----
- configure.ac | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index add1556b..5ac33dc7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3950,7 +3950,13 @@ if test "x$with_libnetsnmpagent" = "xyes"; then
-   )
- 
-   AC_CHECK_LIB([netsnmpagent], [init_agent],
--    [with_libnetsnmpagent="yes"],
-+    [
-+      # libnetsnmp can be built without without mib loading support
-+      AC_CHECK_LIB([netsnmp], [get_tree],
-+        [with_libnetsnmpagent="yes"],
-+        [with_libnetsnmpagent="no (libnetsnmp doesn't support mib loading)"]
-+      )
-+    ],
-     [with_libnetsnmpagent="no (libnetsnmpagent not found)"],
-     [$libnetsnmphelpers]
-   )
--- 
-2.20.1
-
diff --git a/package/collectd/0002-configure.ac-fix-protobuf-util-time_util.h-detection.patch b/package/collectd/0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch
similarity index 100%
rename from package/collectd/0002-configure.ac-fix-protobuf-util-time_util.h-detection.patch
rename to package/collectd/0001-configure.ac-fix-protobuf-util-time_util.h-detection.patch
diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index 779e16d70a..7f716b7a93 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # Locally computed checksums
-sha512	5386e4d0b9c350a0719924bf440f53bf3cdedefefe6bc7b154501dfdf7d2d98fa5dd31341cbed41023f7a129f68bda694e9d06f2da69ea2e61372d1b237b64a7	collectd-5.9.2.tar.bz2
-sha256	917c483608b9b38438b121737b510c3d68f335c091bc286aa6ebcc0c8e372a09	collectd-5.9.2.tar.bz2
-sha1	e8d0cb152194f3b51ee762a62ab647f7bb42e259	collectd-5.9.2.tar.bz2
+sha512	1296085fb19bba0c7b7d8684ec877851158b25c9f7b58fc3ae602fba7d7dc718876e730e1cdba96d39101cc5452705bb3445aaee717b219025ae816299b6a3c5	collectd-5.10.0.tar.bz2
+sha256	a03359f563023e744c2dc743008a00a848f4cd506e072621d86b6d8313c0375b	collectd-5.10.0.tar.bz2
+sha1	9d64ec4e6e834b8e417e282390e2a9c57934d3bc	collectd-5.10.0.tar.bz2
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index fd27443755..0cd86adbd4 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.9.2
+COLLECTD_VERSION = 5.10.0
 COLLECTD_SITE = \
-	https://github.com/collectd/collectd/releases/download/collectd-$(COLLECTD_VERSION)
+	https://github.com/collectd/collectd/releases/download/$(COLLECTD_VERSION)
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-- 
2.24.1
