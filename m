From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 19:59:07 +0200
Subject: [Buildroot] [git commit] netsnmp: add fix for CVE-2012-2141
Message-ID: <20120822175933.09AA997267@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26506d3bea9aabd0d849b6e3c01eadd16bb47595
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/netsnmp/netsnmp-CVE-2012-2141.patch |   36 +++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

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
