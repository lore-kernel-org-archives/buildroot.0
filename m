From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:26 +0100
Subject: [Buildroot] [PATCH 04/19] infra/pkg-generic: use \0 to separate .la
 files as they are found
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <5688bc85cedd5583b847131ee3243b80405e678f.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just in case some package is wild enough to install a .la file with a
space in its name (or worse, a \n).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b8febe8c5..eb41f97241 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -294,7 +294,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	@$(call MESSAGE,"Fixing libtool files")
-	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
+	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" -print0 \
+	| xargs -0 --no-run-if-empty \
 		$(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
 			$(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
-- 
2.14.1
