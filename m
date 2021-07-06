From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 22:53:19 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: perform .la files
 fixup in per-package HOST_DIR
Message-ID: <20210706204015.0EC5792C93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31af8797d530706926694f58abbde9ac9bfb98d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixup-libtool-files was called on per-package STAGING_DIR.
Some host-xxxx packages have their .la files with directories
pointing outside their own per-package directory.

This commit, calling fixup-libtool-files on HOST_DIR, fixes this
issue.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 7afcd05de9..ff877598e3 100644
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
@@ -252,6 +253,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(TARGET_DIR))
 	@$(call pkg_size_before,$(STAGING_DIR),-staging)
 	@$(call pkg_size_before,$(HOST_DIR),-host)
+	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
