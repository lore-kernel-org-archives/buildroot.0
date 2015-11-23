From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:47 +0100
Subject: [Buildroot] [PATCH 17/51] core/legal-info: generate a hash of all
	saved files
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <c5429b51639c27b6770d01282dc7beee72fd581d.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having a hash of the saved files can be interesting for the recipient to
verify the integrity of the files.

We remove the warning file earlier, to exclude it from the hash list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5e62275..947f941 100644
--- a/Makefile
+++ b/Makefile
@@ -662,8 +662,13 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 		cat support/legal-info/README.warnings-header \
 			$(LEGAL_WARNINGS) >>$(LEGAL_REPORT); \
 		cat $(LEGAL_WARNINGS); fi
-	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 	@rm -f $(LEGAL_WARNINGS)
+	@find $(LEGAL_INFO_DIR) -type f -exec sha256sum {} + \
+	 |sed -r -e 's:  $(LEGAL_INFO_DIR)/+:  :' \
+	 |sort -k2 \
+	 >$(BUILD_DIR)/legal-info.sha256
+	@mv $(BUILD_DIR)/legal-info.sha256 $(LEGAL_INFO_DIR)/legal-info.sha256
+	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
 show-targets:
 	@echo $(PACKAGES) $(TARGETS_ROOTFS)
-- 
1.9.1
