From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:38:40 +0200
Subject: [Buildroot] [git commit] pkg-generic: fix the logic showing the
	"Downloading" message
Message-ID: <20150330214111.759A17FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=524a555ad1f81f132aaed0badaece1b8b95c8ae7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though the .stamp_downloaded target is executed for each package
being built, the pkg-generic infrastructure tries to not display the
"Downloading" message when there is in fact nothing to download.

Unfortunately, the logic was incorrect for the patch download: it
forgot the fact that <pkg>_PATCH can contain either file names (in
which case we assume the patch should be downloaded from <pkg>_SITE),
or full URLs. The latter case was not properly handled, as we were
checking if $(DL_DIR)/<full URL> existed, while we should be testing
if $(DL_DIR)/`basename <full URL>` exists.

This patch fixes that, which makes sure the "Downloading" message is
displayed only when necessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c1b379b..b44d476 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -77,7 +77,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		$(call MESSAGE,"Downloading") ; \
 	else \
 		for p in $($(PKG)_PATCH) ; do \
-			if test ! -e $(DL_DIR)/$$p ; then \
+			if test ! -e $(DL_DIR)/`basename $$p` ; then \
 				$(call MESSAGE,"Downloading") ; \
 				break ; \
 			fi ; \
