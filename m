From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 27 Jun 2017 12:26:42 +0200
Subject: [Buildroot] [PATCH v4 06/11] core: sanitize RPATH in host tree at
	the very end of the build
In-Reply-To: <1498559207-8050-1-git-send-email-wg@grandegger.com>
References: <1498559207-8050-1-git-send-email-wg@grandegger.com>
Message-ID: <1498559207-8050-7-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need the patchelf host utility to check and fix the rpath.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index bda4a05..e492342 100644
--- a/Makefile
+++ b/Makefile
@@ -551,6 +551,11 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 .PHONY: world
 world: target-post-image
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(TOPDIR)/support/scripts/fix-rpath host
+
+# We need patchelf for RPATH sanitation
+PACKAGES += host-patchelf
 
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
-- 
2.7.4
