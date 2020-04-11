From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 10:12:31 +0200
Subject: [Buildroot] [PATCH 6/8] core/show-info: report package stamp files
In-Reply-To: <cover.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <39b4e30872bf54a34bf482576022c0d025b89b25.1586592741.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

People (and scripts) who want to report on the build progress, will want
to look at the various stamp files.

However, the names of those stamp files are purely an implementation
detail (even if they are very unlikely to ever change).

So, expose the names of those stampfiles in show-info, so that
interested parties do not have to hard-code them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
---
 package/pkg-utils.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 98e3ede3d1..e7bfc39283 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -107,6 +107,29 @@ define _json-info-pkg
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
 		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
 	)
+	"stamp_files": {
+		$(if $($(1)_OVERRIDE_SRCDIR), \
+			"rsync": "$(notdir $($(1)_TARGET_RSYNC))"$(comma) \
+			, \
+			"download": "$(notdir $($(1)_TARGET_SOURCE))"$(comma) \
+			"extract": "$(notdir $($(1)_TARGET_EXTRACT))"$(comma) \
+			"patch": "$(notdir $($(1)_TARGET_PATCH))"$(comma) \
+		)
+		"configure": "$(notdir $($(1)_TARGET_CONFIGURE))",
+		"build": "$(notdir $($(1)_TARGET_BUILD))",
+		$(if $(filter YES,$($(1)_INSTALL_STAGING)),\
+			"install_staging": "$(notdir $($(1)_TARGET_INSTALL_STAGING))"$(comma) \
+		)
+		$(if $(filter YES,$($(1)_INSTALL_TARGET)),\
+			"install_target": "$(notdir $($(1)_TARGET_INSTALL_TARGET))"$(comma) \
+		)
+		$(if $(filter YES,$($(1)_INSTALL_IMAGES)),\
+			"install_images": "$(notdir $($(1)_TARGET_INSTALL_IMAGES))"$(comma) \
+		)
+		$(if $(filter host,$($(1)_TYPE)), \
+			"install":  "$(notdir $($(1)_TARGET_INSTALL_HOST))"$(comma) \
+		)
+	},
 	"dependencies": [
 		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
 	],
-- 
2.20.1
