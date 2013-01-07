From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue,  8 Jan 2013 00:01:18 +0200
Subject: [Buildroot] [PATCH] new variable <pkg>_CONFIG_FIXUP
In-Reply-To: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357596078-7762-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/pkg-generic.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a570ad7..a410ad1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -121,6 +121,14 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call MESSAGE,"Installing to staging directory")
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	@$(call MESSAGE,"Fixing package configuration files")
+	for file in $($(PKG)_CONFIG_FIXUP); do \
+		if [ -e $(STAGING_DIR)/usr/bin/$${file} ]; then \
+			$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+				-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+				$(STAGING_DIR)/usr/bin/$${file} ;\
+		fi \
+	done
 	$(Q)touch $@
 
 # Install to images dir
-- 
1.7.7.6
