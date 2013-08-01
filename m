From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 08:01:45 +0200
Subject: [Buildroot] [git commit] Makefile: add variable print capabilities
Message-ID: <20130801060329.A128E9AF8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98b616d7610e315e4270000fa34d35b875790b29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new goal that dumps all of our variables.

Taken from http://www.cmcrossroads.com/ask-mr-make/6521-dumping-every-makefile-variable

Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
[yann.morin.1998 at free.fr: drop per-variable print; refresh patch]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 0cd7f55..5a0c64a 100644
--- a/Makefile
+++ b/Makefile
@@ -407,7 +407,7 @@ toolchain: prepare dirs dependencies $(BASE_TARGETS)
 world: toolchain $(TARGETS_ALL)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
-	legal-info legal-info-prepare legal-info-clean \
+	legal-info legal-info-prepare legal-info-clean printvars \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -731,6 +731,14 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+# printvars prints all the variables currently defined in our Makefiles
+printvars:
+	@$(foreach V, \
+		$(sort $(.VARIABLES)), \
+		$(if $(filter-out environment% default automatic, \
+				$(origin $V)), \
+		$(info $V=$($V) ($(value $V)))))
+
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(BASE_DIR)/staging \
