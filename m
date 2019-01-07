From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:27 +0100
Subject: [Buildroot] [PATCH 05/19] infra/pkg-generic: tweak only .la files
 installed by the current package
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <0c6a57955cae7f2233bd2cfc60ab404b09224a31.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when we tweak the .la files, we do so unconditionally on all
.la files, even those we already fixed in a previous run.

This has the nasty side effect that each .la file will be reported as
being touched by all packages that are installed after the package that
actually installed said .la file.

We fix that by limiting the search for .la files to those that have been
actually touched during the install step, now that we have the proper
timestamp for it.

Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index eb41f97241..3de8a99675 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -294,7 +294,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
 	@$(call MESSAGE,"Fixing libtool files")
-	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" -print0 \
+	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" -print0 -newer $@_before \
 	| xargs -0 --no-run-if-empty \
 		$(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
 			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
-- 
2.14.1
