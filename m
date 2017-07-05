From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:10 +0200
Subject: [Buildroot] [PATCH v7 5/9] core: sanitize RPATH in host tree at the
	very end of the build
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-6-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We introduce the "finalize-host" target for that purpose.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1a826fc..2a265e0 100644
--- a/Makefile
+++ b/Makefile
@@ -553,7 +553,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 .PHONY: world
-world: target-post-image
+world: target-post-image host-finalize
+
+.PHONY: host-finalize
+host-finalize:
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(TOPDIR)/support/scripts/fix-rpath host
 
 # When creating HOST_DIR, also symlink usr -> .
 $(HOST_DIR):
-- 
2.7.4
