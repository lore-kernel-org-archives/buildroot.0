From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:30 +0200
Subject: [Buildroot] [PATCH 15/15] package/pkg-generic.mk: Fix per-package
 <pkg>-{reconfigure, rebuild, reinstall}
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-16-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Many overwrites are detected on <pkg>-{reconfigure,rebuild,reinstall}.
Indeed, files previously installed by a package were detected as
overwritten on next reconfigure, rebuild or reinstall.

To avoid this, we recreate per-package host and target dir from
scratch as it was done during the first configure step.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 546370af7a..0aafd865ad 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -470,6 +470,13 @@ define pkg-graph-depends
 		$$(GRAPHS_DIR)/$$(@).dot
 endef
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define empty-per-package-directory
+	rm -rf $(HOST_DIR) $(TARGET_DIR)
+	mkdir -p $(HOST_DIR) $(TARGET_DIR)
+endef
+endif
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -1072,6 +1079,25 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
+			$$(call empty-per-package-directory)
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES))
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_EXTRACT_DEPENDENCIES))
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_DEPENDENCIES))
+			@$$(call pkg_final_rsync_before,$$(TARGET_DIR))
+			@$$(call pkg_final_rsync_before,$$(HOST_DIR),-host)
+			@$$(call pkg_size_before,$$(TARGET_DIR))
+			@$$(call pkg_size_before,$$(STAGING_DIR),-staging)
+			@$$(call pkg_size_before,$$(HOST_DIR),-host)
+			$$(call fixup-libtool-files,$$(NAME),$$(HOST_DIR))
+			$$(call fixup-libtool-files,$$(NAME),$$(STAGING_DIR))
+			$$(call fixup-python-files,$$(NAME),$$(HOST_DIR))
+			$$(call fixup-python-files,$$(NAME),$$(STAGING_DIR))
+			$$(foreach hook,$$($(2)_PER_PACKAGE_TWEAK_HOOKS),$$(call $$(hook))$$(sep))
+			@$$(call pkg_detect_overwrite_before,$$(TARGET_DIR))
+			@$$(call pkg_detect_overwrite_before,$$(HOST_DIR),-host)
+
+$(1)-clean-for-reinstall: PKG=$(2)
+$(1)-clean-for-reinstall: NAME=$(1)
 
 $(1)-reinstall:		$(1)-clean-for-reinstall $(1)
 
-- 
2.31.1
