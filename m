From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 10:12:32 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list of
 build steps
In-Reply-To: <cover.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

People (and scritps) who want to report on the build progress, now know
where and what to look for (build directory and stampfiles), but they
also need to know the ordering of those stampfiles.

The stampfiles item is a dictionary; dictionaries are guaranteed to not
be ordered, so even if we output the stampfiles in order, we can expect
users of that dictionary to get them back in order.

Expose the build steps in a list, which is guaranteed to be ordered.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
---
 package/pkg-utils.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e7bfc39283..bcdbf568fe 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -130,6 +130,21 @@ define _json-info-pkg
 			"install":  "$(notdir $($(1)_TARGET_INSTALL_HOST))"$(comma) \
 		)
 	},
+	"build_steps": [
+		$(if $($(1)_OVERRIDE_SRCDIR), \
+			"rsync"$(comma) \
+			, \
+			"download"$(comma) \
+			"extract"$(comma) \
+			"patch"$(comma) \
+		)
+		"build",
+		"configure",
+		$(if $(filter YES,$($(1)_INSTALL_STAGING)),"install_staging"$(comma))
+		$(if $(filter YES,$($(1)_INSTALL_TARGET)),"install_target"$(comma))
+		$(if $(filter YES,$($(1)_INSTALL_IMAGES)),"install_images"$(comma))
+		$(if $(filter host,$($(1)_TYPE)),"install"$(comma))
+	],
 	"dependencies": [
 		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
 	],
-- 
2.20.1
