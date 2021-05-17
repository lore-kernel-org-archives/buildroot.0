From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 22:44:46 +0200
Subject: [Buildroot] [git commit] Makefile: remove cpe-updates on clean
Message-ID: <20210517201629.5932087A49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f187371d002fb321a175233afddb50b2b6c3607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fd7312940aef (Makefile: add new missing-cpe target) added the
rule to generate a set of files to update the NVD.

For an in-tree build, 'make clean' remove the output directory, so
those files are removed. But for an out-of-tree build, the output
directory is not removed, so those files still linger around after a
clean.

Explicitly remove them on clean, to cater for both cases.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matthew Weber <matthew.weber@collins.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 75ef7f5eb5..c3305f46e9 100644
--- a/Makefile
+++ b/Makefile
@@ -229,6 +229,8 @@ LEGAL_MANIFEST_CSV_HOST = $(LEGAL_INFO_DIR)/host-manifest.csv
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+CPE_UPDATES_DIR = $(BASE_DIR)/cpe-updates
+
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -947,11 +949,11 @@ pkg-stats:
 
 .PHONY: missing-cpe
 missing-cpe:
-	$(Q)mkdir -p $(O)/cpe-updates
+	$(Q)mkdir -p $(CPE_UPDATES_DIR)
 	$(Q)cd "$(CONFIG_DIR)" ; \
 	$(TOPDIR)/support/scripts/gen-missing-cpe \
 		--nvd-path $(DL_DIR)/buildroot-nvd \
-		--output $(O)/cpe-updates
+		--output $(CPE_UPDATES_DIR)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -1087,7 +1089,7 @@ printvars:
 clean:
 	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR)
 
 .PHONY: distclean
 distclean: clean
