From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:15:47 +0200
Subject: [Buildroot] [git commit] mrouted: DVMRP missing subnet
Message-ID: <20151012191905.9427581E96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f3531812c50a9440f44b4775456db5c997f9422
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../mrouted/0001-DVMRP-report-missing-subnet.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/mrouted/0001-DVMRP-report-missing-subnet.patch b/package/mrouted/0001-DVMRP-report-missing-subnet.patch
new file mode 100644
index 0000000..023c8cf
--- /dev/null
+++ b/package/mrouted/0001-DVMRP-report-missing-subnet.patch
@@ -0,0 +1,35 @@
+From 687f41680d51585e9a5a135e39efee330588bea7 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Fri, 11 Sep 2015 12:49:30 -0500
+Subject: [PATCH 1/1] DVMRP report missing subnet
+
+Accepted upstream and will be included in 3.9.8.
+https://github.com/troglobit/mrouted/commit/512af5ffe0f48ffa2ba3b45898c66c2a561a5c2d
+
+A subnet is missing in the DVMRP report sent to it's neighbor after
+the initial probe occurs.  The issue was with the traversal of a double
+linked list from end to start. Once the traversing pointer reaches
+the start of routing table for loop (condition) it would break and
+always drop the first subnet.
+
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
+---
+ route.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/route.c b/route.c
+index f74e601..9fe779d 100644
+--- a/route.c
++++ b/route.c
+@@ -1193,7 +1193,7 @@ static int report_chunk(int which_routes, struct rtentry *start_rt, vifi_t vifi,
+ 
+     p = send_buf + MIN_IP_HEADER_LEN + IGMP_MINLEN;
+ 
+-    for (r = start_rt; r != routing_table; r = r->rt_prev) {
++    for (r = start_rt; r != NULL; r = r->rt_prev) {
+ 	if (which_routes == CHANGED_ROUTES && !(r->rt_flags & RTF_CHANGED)) {
+ 	    nrt++;
+ 	    continue;
+-- 
+1.9.1
+
