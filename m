From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  9 Apr 2020 22:58:55 +0200
Subject: [Buildroot] [PATCH] core/show-info: do not show install types for
 host packages
Message-ID: <20200409205855.21194-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By their very nature, host packages have no target, staging, or
images install steps; they have a single install step, that is
always performed.

However, we currently report those three types of install, which
is misleading at best, and really incorrect.

If we were to report any install type for host package, that would
be a single one, and it would always be true.

So, do not report any install type for host packages, as it does
not make sense to report anything that is always true.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-utils.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d324934dba..14101fcc2a 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -112,9 +112,11 @@ define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
 	"dl_dir": "$($(1)_DL_SUBDIR)",
-	"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET)),
-	"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING)),
-	"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES)),
+	$(if $(filter target,$($(1)_TYPE)), \
+		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
+		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
+		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
+	)
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-- 
2.20.1
