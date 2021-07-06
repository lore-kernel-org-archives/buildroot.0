From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:46 +0200
Subject: [Buildroot] [PATCH v2 03/18] package/pkg-generic.mk: perform .la
 files fixup in per-package HOST_DIR
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-4-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixup-libtool-files was called on per-package STAGING_DIR.
Some host-xxxx packages have their .la files with directories
pointing outside their own per-package directory.

This commit, calling fixup-libtool-files on HOST_DIR, fixes this
issue.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
 - Used '... -print0 | xargs -0 -r ...' construction.

 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 05b2095664..88707e2f8d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -97,7 +97,8 @@ endif
 # $2: staging directory of the package
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define fixup-libtool-files
-	$(Q)find $(2)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
+	$(Q)find $(2) \( -path '$(2)/lib*' -o -path '$(2)/usr/lib*' \) \
+		-name "*.la" -print0 | xargs -0 --no-run-if-empty \
 		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g"
 endef
 endif
@@ -251,6 +252,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
+	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
-- 
2.31.1
