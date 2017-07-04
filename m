From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue,  4 Jul 2017 18:22:35 +0200
Subject: [Buildroot] [PATCH v6 06/10] core: sanitize RPATH in host tree at
	the very end of the build
In-Reply-To: <1499185359-8293-1-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
Message-ID: <1499185359-8293-7-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We introduce the "finalize-host" target for that purpose.
We need the patchelf host utility to check and fix the rpath.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d8db3f4..f5646ad 100644
--- a/Makefile
+++ b/Makefile
@@ -550,7 +550,15 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 .PHONY: world
-world: target-post-image
+world: target-post-image host-finalize
+
+.PHONY: host-finalize
+host-finalize:
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(TOPDIR)/support/scripts/fix-rpath host
+
+# We need patchelf for RPATH sanitization
+PACKAGES += host-patchelf
 
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
-- 
2.7.4
