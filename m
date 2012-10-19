From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Oct 2012 20:12:04 -0300
Subject: [Buildroot] [PATCH] netsnmp: bump to version 5.7.2
Message-ID: <1350688324-25979-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/netsnmp-CVE-2012-2141.patch |   36 ---------------------------
 package/netsnmp/netsnmp-swinst-crash.patch  |   17 ------------
 package/netsnmp/netsnmp.mk                  |    2 +-
 3 files changed, 1 insertions(+), 54 deletions(-)
 delete mode 100644 package/netsnmp/netsnmp-CVE-2012-2141.patch
 delete mode 100644 package/netsnmp/netsnmp-swinst-crash.patch

diff --git a/package/netsnmp/netsnmp-CVE-2012-2141.patch b/package/netsnmp/netsnmp-CVE-2012-2141.patch
deleted file mode 100644
index 1b34b9c..0000000
--- a/package/netsnmp/netsnmp-CVE-2012-2141.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4c5633f1603e4bd03ed05c37d782ec8911759c47 Mon Sep 17 00:00:00 2001
-From: Robert Story <rstory@freesnmp.com>
-Date: Mon, 14 May 2012 11:40:06 -0400
-Subject: [PATCH] NEWS: snmp: BUG: 3526549: CVE-2012-2141 Array index error leading to crash
-
----
- agent/mibgroup/agent/extend.c |    6 +++++-
- 1 files changed, 5 insertions(+), 1 deletions(-)
-
-diff --git a/agent/mibgroup/agent/extend.c b/agent/mibgroup/agent/extend.c
-index d00475f..1f8586a 100644
---- a/agent/mibgroup/agent/extend.c
-+++ b/agent/mibgroup/agent/extend.c
-@@ -1126,7 +1126,7 @@ _extend_find_entry( netsnmp_request_info       *request,
-              * ...and check the line requested is valid
-              */
-             line_idx = *table_info->indexes->next_variable->val.integer;
--            if (eptr->numlines < line_idx)
-+            if (line_idx < 1 || line_idx > eptr->numlines)
-                 return NULL;
-         }
-         return eptr;
-@@ -1299,6 +1299,10 @@ handle_nsExtendOutput2Table(netsnmp_mib_handler          *handler,
-                  * Determine which line we've been asked for....
-                  */
-                 line_idx = *table_info->indexes->next_variable->val.integer;
-+                if (line_idx < 1 || line_idx > extension->numlines) {
-+                    netsnmp_set_request_error(reqinfo, request, SNMP_NOSUCHINSTANCE);
-+                    continue;
-+                }
-                 cp  = extension->lines[line_idx-1];
- 
-                 /* 
--- 
-1.7.4.1
-
diff --git a/package/netsnmp/netsnmp-swinst-crash.patch b/package/netsnmp/netsnmp-swinst-crash.patch
deleted file mode 100644
index f7298a6..0000000
--- a/package/netsnmp/netsnmp-swinst-crash.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fixes runtime error with uClibc (and possibly others).
-
-Original patch and bug description:
-http://sourceforge.net/tracker/?func=detail&aid=3436528&group_id=12694&atid=312694
-
---- net-snmp-5.7.1/agent/mibgroup/host/data_access/swinst_pkginfo.c
-+++ /home/fabled//net-snmp-5.7.1.patched/agent/mibgroup/host/data_access/swinst_pkginfo.c
-@@ -140,7 +140,8 @@
-         memcpy( entry->swDate, cp, date_len );
-         entry->swDate_len = date_len;
-     }
--    closedir( d );
-+    if (d != NULL)
-+        closedir( d );
- 
-     DEBUGMSGTL(("swinst:load:arch"," loaded %d entries\n",
-                 (int)CONTAINER_SIZE(container)));
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index bbe0dbb..2670cf3 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NETSNMP_VERSION = 5.7.1
+NETSNMP_VERSION = 5.7.2
 NETSNMP_SITE = http://downloads.sourceforge.net/project/net-snmp/net-snmp/$(NETSNMP_VERSION)
 NETSNMP_SOURCE = net-snmp-$(NETSNMP_VERSION).tar.gz
 NETSNMP_LICENSE = Various BSD-like
-- 
1.7.8.6
