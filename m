From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 15:08:09 +0200
Subject: [Buildroot] [git commit] package/pkg-utils: show-info: report the
 package build directory
Message-ID: <20200425125350.A08D68FF9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4be3fbc84e1cd23ecb74c93d48729a860deafb66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some people want to be able to inspect the current state of the build,
and report information about it, like:
  - report the number of packages already built out of the total,
  - list the packages being actually built (e.g. for TLPB)
  - etc...

However, the location where a package is built is inherently an internal
detail, so expose that to the user in the output of show-info. We only
expose the location relative to the base directory (basically, either
output/ or the user-suppiled $(O)), so that show-info does not contain
local information (the output of show-info can be shared).

Interested parties will be able to poke in there to identify the stamp
files and deduce the package's state.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop at gmail.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index b6c6aeeb40..66504d0be2 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -100,6 +100,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	"build_dir": "$(patsubst $(BASE_DIR)/%,%,$($(1)_BUILDDIR))",
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
 		"install_staging": $(call yesno-to-bool,$($(1)_INSTALL_STAGING))$(comma) \
