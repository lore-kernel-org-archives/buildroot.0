From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Apr 2018 21:32:52 +0200
Subject: [Buildroot] [PATCH RFC] legal-info: add option to store manifest in
 rootfs
Message-ID: <20180426193252.19616-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some users want to be able to easily ship the manifest of the legal-info
directly in the target filesystem.

Those users currently hack their ways around, usign a post-build script
that calls back to generate legal-info; this is a bit hackish...

Add an option to that effect.

Reported-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 8 ++++++++
 Makefile  | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 62d2dc3473..d6a2c8930c 100644
--- a/Config.in
+++ b/Config.in
@@ -692,6 +692,14 @@ config BR2_REPRODUCIBLE
 	  This is labeled as an experimental feature, as not all
 	  packages behave properly to ensure reproducibility.
 
+config BR2_LEGAL_IN_TARGET
+	bool "Include legal-info manifest in target"
+	help
+	  If you say 'y' here, then the listing of all the packages
+	  included in the build, as well as their version, license(s),
+	  upstrem URL, etc.. will be stored in a manifest file in the
+	  rootfs, in the file: /usr/share/doc/legal-info/manifest.csv
+
 endmenu
 
 comment "Security Hardening Options"
diff --git a/Makefile b/Makefile
index 54f940659c..7bff89a36f 100644
--- a/Makefile
+++ b/Makefile
@@ -688,7 +688,7 @@ $(TARGETS_ROOTFS): target-finalize
 target-finalize: ROOTFS=
 
 .PHONY: target-finalize
-target-finalize: $(PACKAGES)
+target-finalize: $(PACKAGES) $(if $(BR2_LEGAL_IN_TARGET),legal-info)
 	@$(call MESSAGE,"Finalizing target directory")
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
@@ -746,6 +746,11 @@ endif
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
 	$(TOPDIR)/support/scripts/fix-rpath target
 
+ifeq ($(BR2_LEGAL_IN_TARGET),y)
+	$(INSTALL) -D -m 0644 $(LEGAL_MANIFEST_CSV_TARGET) \
+		$(TARGET_DIR)/usr/share/doc/legal-info/$(notdir $(LEGAL_MANIFEST_CSV_TARGET))
+endif
+
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 		$(call MESSAGE,"Copying overlay $(d)"); \
 		rsync -a --ignore-times --keep-dirlinks $(RSYNC_VCS_EXCLUSIONS) \
-- 
2.14.1
