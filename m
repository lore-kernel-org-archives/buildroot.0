From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Aug 2012 09:19:42 -0300
Subject: [Buildroot] [PATCH] netsnmp: add fix for CVE-2012-2141
Message-ID: <1345551582-3645-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netsnmp/netsnmp-CVE-2012-2141.patch |   36 +++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/netsnmp/netsnmp-CVE-2012-2141.patch

diff --git a/package/netsnmp/netsnmp-CVE-2012-2141.patch b/package/netsnmp/netsnmp-CVE-2012-2141.patch
new file mode 100644
index 0000000..1b34b9c
--- /dev/null
+++ b/package/netsnmp/netsnmp-CVE-2012-2141.patch
@@ -0,0 +1,36 @@
+From 4c5633f1603e4bd03ed05c37d782ec8911759c47 Mon Sep 17 00:00:00 2001
+From: Robert Story <rstory@freesnmp.com>
+Date: Mon, 14 May 2012 11:40:06 -0400
+Subject: [PATCH] NEWS: snmp: BUG: 3526549: CVE-2012-2141 Array index error leading to crash
+
+---
+ agent/mibgroup/agent/extend.c |    6 +++++-
+ 1 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/agent/mibgroup/agent/extend.c b/agent/mibgroup/agent/extend.c
+index d00475f..1f8586a 100644
+--- a/agent/mibgroup/agent/extend.c
++++ b/agent/mibgroup/agent/extend.c
+@@ -1126,7 +1126,7 @@ _extend_find_entry( netsnmp_request_info       *request,
+              * ...and check the line requested is valid
+              */
+             line_idx = *table_info->indexes->next_variable->val.integer;
+-            if (eptr->numlines < line_idx)
++            if (line_idx < 1 || line_idx > eptr->numlines)
+                 return NULL;
+         }
+         return eptr;
+@@ -1299,6 +1299,10 @@ handle_nsExtendOutput2Table(netsnmp_mib_handler          *handler,
+                  * Determine which line we've been asked for....
+                  */
+                 line_idx = *table_info->indexes->next_variable->val.integer;
++                if (line_idx < 1 || line_idx > extension->numlines) {
++                    netsnmp_set_request_error(reqinfo, request, SNMP_NOSUCHINSTANCE);
++                    continue;
++                }
+                 cp  = extension->lines[line_idx-1];
+ 
+                 /* 
+-- 
+1.7.4.1
+
-- 
1.7.8.6
