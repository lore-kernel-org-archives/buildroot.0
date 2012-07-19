From: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
Date: Thu, 19 Jul 2012 15:01:18 -0400
Subject: [Buildroot] [PATCH] Makefile: add variable print capabilities
In-Reply-To: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1342724478-21701-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <1342724478-21701-2-git-send-email-emeric.vigier@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Taken from http://www.cmcrossroads.com/ask-mr-make/
6521-dumping-every-makefile-variable

Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
---
 Makefile |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d55b136..901c3c3 100644
--- a/Makefile
+++ b/Makefile
@@ -369,7 +369,8 @@ world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
+	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) \
+	printvars
 
 #############################################################
 #
@@ -377,6 +378,14 @@ world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
+printvars:
+	@$(foreach V,$(sort $(.VARIABLES)), \
+	$(if $(filter-out environment% default automatic, \
+	$(origin $V)),$(warning $V=$($V) ($(value $V)))))
+
+print-%:
+	@echo $* = $($*)
+
 $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR):
 	@mkdir -p $@
 
-- 
1.7.5.4
