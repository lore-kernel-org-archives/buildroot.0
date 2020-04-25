From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:59:19 +0200
Subject: [Buildroot] [git commit] package/pkg-utils: show-info: virtual
 packages can also install things
Message-ID: <20200425125350.987F38FF9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e142ae55b3f25d24fdf9418af148a2b889641b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although most virtual packages do not install anything, some of them
do. For example, the virtual package 'toolchain' does tweak the musl
headers during a post staging hook.

So, it makes sense for "show-info" to report if a virtual package has
its target, staging and/or image installation steps enabled or not.

This commit changes show-info to report the type of install steps for
virtual packages too, which means for all packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
