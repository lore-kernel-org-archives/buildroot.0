From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 30 Jul 2014 11:20:57 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Add target-clean target
Message-ID: <1406712057-9710-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This makefile target wipes the target folder and forces buildroot into rebuild it.
It's useful when you have changed the list of packages and the target
tree remains out of sync keeping old installed packages no longer needed.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

* Print a big fat warning at the end of target-clean execution

 Makefile | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Makefile b/Makefile
index 022beea..b6467e0 100644
--- a/Makefile
+++ b/Makefile
@@ -829,6 +829,25 @@ clean:
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR)
 
+target-clean:
+	rm -rf $(TARGET_DIR)
+	find $(BUILD_DIR) -name ".stamp_target_installed" -exec rm {} \;
+	rm -rf $(BUILD_DIR)/.root
+	@echo ''
+	@echo "***********************************************************"
+	@echo "*                    !!! WARNING !!!                      *"
+	@echo "*                                                         *"
+	@echo "*  Cleaning and rebuilding your rootfs won't rebuild      *"
+	@echo "*  your packages.                                         *"
+	@echo "*  If you changed something on packages configurations    *"
+	@echo "*  or their dependencies, you'll have to rebuilt them     *"
+	@echo "*  manually with:                                         *"
+	@echo "*   \"make <package>-reconfigure\"                          *"
+	@echo "*  If something goes wrong, do a full rebuild with:       *"
+	@echo "*   \"make clean\".                                         *"
+	@echo "*                                                         *"
+	@echo "***********************************************************"
+
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
 	rm -rf $(DL_DIR)
@@ -842,6 +861,7 @@ help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including .config)'
+	@echo '  target-clean           - delete all target files and forces reinstall'
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
-- 
2.0.3
