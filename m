From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 16:39:40 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: tweak only .la files
 that need it
Message-ID: <20190317160439.E54E78F173@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8623cc5deb59747c91687ac5a25087ba694b45a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when we tweak the .la files, we do so unconditionally on all
.la files, even those we already fixed in a previous run.

This has the nasty side effect that each .la file will be reported as
being touched by all packages that are installed after the package that
actually installed said .la file.

Since we can't easily know what files were installed by a package (that
is an instrumentation hook, and comes after the mangling), we use a
trick (like is done in libtool?): we do mangle all files, each into a
temporary location; if the result is identical to the input, we remove
the temporary, while if the result differs from the output, we move
the temporary to replace the input.

Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 62c2e221f7..db7f06ddbe 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -294,7 +294,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	@$(call MESSAGE,"Fixing libtool files")
-	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
+	for la in $$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
+		cp -a "$${la}" "$${la}.fixed" && \
 		$(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
 			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
@@ -303,7 +304,14 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
 				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
 			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$(BASE_DIR):g"
+			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
+			"$${la}.fixed" && \
+		if cmp -s "$${la}" "$${la}.fixed"; then \
+			rm -f "$${la}.fixed"; \
+		else \
+			mv "$${la}.fixed" "$${la}"; \
+		fi || exit 1; \
+	done
 	@$(call step_end,install-staging)
 	$(Q)touch $@
 
