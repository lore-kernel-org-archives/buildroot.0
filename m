From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 May 2013 00:41:11 +0200
Subject: [Buildroot] [PATCH] Makefile: add variable print capabilities
Message-ID: <1369780871-26263-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: ?meric Vigier <emeric.vigier@savoirfairelinux.com>

Add a new goal that dumps all of our variables.

Taken from http://www.cmcrossroads.com/ask-mr-make/6521-dumping-every-makefile-variable

Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
[yann.morin.1998 at free.fr: drop per-variable print; refresh patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a57975e..225bc13 100644
--- a/Makefile
+++ b/Makefile
@@ -402,7 +402,7 @@ toolchain: prepare dirs dependencies $(BASE_TARGETS)
 world: toolchain $(TARGETS_ALL)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
-	legal-info legal-info-prepare legal-info-clean \
+	legal-info legal-info-prepare legal-info-clean printvars \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -730,6 +730,14 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+# printvars prints all the variables currently defined in our Makefiles
+printvars:
+	@$(foreach V, \
+		   $(sort $(.VARIABLES)), \
+		   $(if $(filter-out environment% default automatic, \
+				     $(origin $V)), \
+		   $(info $V=$($V) ($(value $V)))))
+
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
-- 
1.8.1.2
