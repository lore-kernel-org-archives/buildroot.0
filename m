From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Apr 2019 22:51:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 3.9.8
Message-ID: <20190406205109.1038-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-DVMRP-report-missing-subnet.patch    | 35 -------------------
 package/mrouted/mrouted.hash                  |  3 +-
 package/mrouted/mrouted.mk                    |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 package/mrouted/0001-DVMRP-report-missing-subnet.patch

diff --git a/package/mrouted/0001-DVMRP-report-missing-subnet.patch b/package/mrouted/0001-DVMRP-report-missing-subnet.patch
deleted file mode 100644
index 023c8cfd8d..0000000000
--- a/package/mrouted/0001-DVMRP-report-missing-subnet.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 687f41680d51585e9a5a135e39efee330588bea7 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Fri, 11 Sep 2015 12:49:30 -0500
-Subject: [PATCH 1/1] DVMRP report missing subnet
-
-Accepted upstream and will be included in 3.9.8.
-https://github.com/troglobit/mrouted/commit/512af5ffe0f48ffa2ba3b45898c66c2a561a5c2d
-
-A subnet is missing in the DVMRP report sent to it's neighbor after
-the initial probe occurs.  The issue was with the traversal of a double
-linked list from end to start. Once the traversing pointer reaches
-the start of routing table for loop (condition) it would break and
-always drop the first subnet.
-
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
----
- route.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/route.c b/route.c
-index f74e601..9fe779d 100644
---- a/route.c
-+++ b/route.c
-@@ -1193,7 +1193,7 @@ static int report_chunk(int which_routes, struct rtentry *start_rt, vifi_t vifi,
- 
-     p = send_buf + MIN_IP_HEADER_LEN + IGMP_MINLEN;
- 
--    for (r = start_rt; r != routing_table; r = r->rt_prev) {
-+    for (r = start_rt; r != NULL; r = r->rt_prev) {
- 	if (which_routes == CHANGED_ROUTES && !(r->rt_flags & RTF_CHANGED)) {
- 	    nrt++;
- 	    continue;
--- 
-1.9.1
-
diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index d5069e5fd9..8f10e014e3 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 181908f7025c5a2dee2e50d86888780469eaa9e1bd42d3eca9dfed8274aecd3d  mrouted-3.9.7.tar.gz
+sha256 179636d211a82d0140a3488c6b65e634b4838da23e50d8cdee15ef03fe9b46af  mrouted-3.9.8.tar.gz
+sha256 2e6c7d9e92afc391f584290c3817f2cdec1501621cf820abbd4bc4adc2e5b2ef  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 731e79eb86..b9a4eaba45 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 3.9.7
+MROUTED_VERSION = 3.9.8
 MROUTED_SITE = $(call github,troglobit,mrouted,$(MROUTED_VERSION))
 MROUTED_DEPENDENCIES = host-bison
 MROUTED_LICENSE = BSD-3-Clause
-- 
2.20.1
