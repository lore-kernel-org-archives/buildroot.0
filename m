From: Michel Marti <mma@objectxp.com>
Date: Fri,  8 Apr 2016 10:23:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] tzdata: Reorder zone list to avoid
	missing links
In-Reply-To: <1459939293-4711-1-git-send-email-mma@objectxp.com>
References: <1459939293-4711-1-git-send-email-mma@objectxp.com>
Message-ID: <1460103807-8770-1-git-send-email-mma@objectxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'backward' zone references entries from other zones (e.g. Pacific/*)
that have not yet been compiled, leading to missing links. To fix this,
take-over the zone list sort order from upstream 'tzdata' and also ensure
that make fails if zic terminates with a non-zero exit code.

Signed-off-by: Michel Marti <mma@objectxp.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tzdata/tzdata.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 1b3efb4..948ab4f 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -12,9 +12,11 @@ TZDATA_DEPENDENCIES = host-tzdata
 HOST_TZDATA_DEPENDENCIES = host-zic
 TZDATA_LICENSE = Public domain
 
+# Take care when re-ordering this list since this might break zone
+# dependencies
 TZDATA_DEFAULT_ZONELIST = \
-	africa antarctica asia australasia backward etcetera \
-	europe factory northamerica pacificnew southamerica
+	africa antarctica asia australasia europe northamerica \
+	southamerica pacificnew etcetera backward systemv factory
 
 ifeq ($(call qstrip,$(BR2_TARGET_TZ_ZONELIST)),default)
 TZDATA_ZONELIST = $(TZDATA_DEFAULT_ZONELIST)
@@ -49,8 +51,8 @@ endef
 define HOST_TZDATA_BUILD_CMDS
 	(cd $(@D); \
 		for zone in $(TZDATA_ZONELIST); do \
-			$(ZIC) -d _output/posix -y yearistype.sh $$zone; \
-			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone; \
+			$(ZIC) -d _output/posix -y yearistype.sh $$zone || exit 1; \
+			$(ZIC) -d _output/right -L leapseconds -y yearistype.sh $$zone || exit 1; \
 		done; \
 	)
 endef
-- 
2.8.1
