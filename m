From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 23 Mar 2017 08:54:47 +0100
Subject: [Buildroot] [RFC PATCH v3 04/10] core: sanitize RPATH in host tree
	at the very end of the build
In-Reply-To: <1490255693-9134-1-git-send-email-wg@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
Message-ID: <1490255693-9134-5-git-send-email-wg@grandegger.com>
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
index fb2c235..41d100e 100644
--- a/Makefile
+++ b/Makefile
@@ -543,7 +543,12 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
+# We need patchelf for RPATH sanitation
+PACKAGES += host-patchelf
+
 world: target-post-image
+	@$(call MESSAGE,"Rendering the SDK relocatable")
+	$(TOPDIR)/support/scripts/fix-rpath host
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-- 
1.9.1
