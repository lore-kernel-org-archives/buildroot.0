From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:56:11 +0200
Subject: [Buildroot] [git commit] package/pkg-utils: show-info: do not show
 install types for host packages
Message-ID: <20200425124156.8A7A88FF8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a9048e069707f369c55146dd6d64b7f913470e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Cc: eeppeliteloop at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
