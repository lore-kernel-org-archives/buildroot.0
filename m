From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 20 Dec 2016 14:46:29 +0100
Subject: [Buildroot] [PATCH v5 12/19] infra-libtool: no longer prepend
	STAGING_DIR to libdir
In-Reply-To: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
Message-ID: <1482241596-31688-13-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since `$lt_sysroot' is now correctly filled, it is no more necessary to patch
`.la' files. Indeed, if $libdir point to `/usr/lib', libtool will also search
in `$(lt_sysroot)/usr/lib'

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/pkg-generic.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 827de62..5d12ac3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -268,17 +268,6 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
-	@$(call MESSAGE,"Fixing libtool files")
-	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
-		$(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
-			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
-			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
-				-e "s:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g") \
-			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
-			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
-				-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
-			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$(BASE_DIR):g"
 	@$(call step_end,install-staging)
 	$(Q)touch $@
 
-- 
1.9.1
