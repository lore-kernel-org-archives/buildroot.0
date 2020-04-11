From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 10:12:28 +0200
Subject: [Buildroot] [PATCH 3/8] core/show-info: report install types for
 virtual packages too
In-Reply-To: <cover.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <df507703c3c71ec7f2f774ee140bcde5cb9a8a5b.1586592741.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although virtual packages do not usually install anything, they do
participate in the dependency chain, and they also transition smoothly
from 'not handled yet' all the way down to 'all set'. And in fact, it
happens that some virtual packages do install something; for example,
the virtual package 'toolchain' does tweak the musl headers during a
post staging hook.

As such, people may want to know when those packages have been handled.
To that goal, they will need to know what stampfile to look at (the
target, staging, or images ones) to identify what step the virtual
package is at.

So, report the type of install steps for virtual packages too, which
means for all packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
---
 package/pkg-utils.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 14101fcc2a..b6c6aeeb40 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -100,6 +100,11 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	$(if $(filter target,$($(1)_TYPE)), \
+		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
+		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
+		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
+	)
 	"dependencies": [
 		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
 	],
@@ -112,11 +117,6 @@ define _json-info-pkg-details
 	"version": "$($(1)_DL_VERSION)",
 	"licenses": "$($(1)_LICENSE)",
 	"dl_dir": "$($(1)_DL_SUBDIR)",
-	$(if $(filter target,$($(1)_TYPE)), \
-		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
-		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
-		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
-	)
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
 		{
-- 
2.20.1
