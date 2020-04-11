From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 10:12:30 +0200
Subject: [Buildroot] [PATCH 5/8] core/show-info: report whether a package is
 overriden
In-Reply-To: <cover.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <524b53bb81ecd33c55b242d239bee93f57c6c98b.1586592741.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a package is overridden, the download, extract, and patch
stampfiles are replaced by a single rsync stampfile.

People (and scripts) who want to report on the current status of the
build, will want to know what stamp file to look at.

Expose in show-info whether the package is overridden or not.

We do not expose the override location, because this is a purely-local
information, and show info should never contain such local information
(the output of show-info can be shared). Besides, that information is
already known by the user, as they passed it to Buildroot via local.mk
to begin with.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 66504d0be2..98e3ede3d1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -100,6 +100,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	"overriden": $(if $($(1)_OVERRIDE_SRCDIR),true,false),
 	"build_dir": "$(patsubst $(BASE_DIR)/%,%,$($(1)_BUILDDIR))",
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
-- 
2.20.1
