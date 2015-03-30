From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:39:17 +0200
Subject: [Buildroot] [git commit] pkg-generic: allow full URLs for
	<pkg>_EXTRA_DOWNLOADS
Message-ID: <20150330214111.94A887FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb76b6101a7ce5eeaaef32c53570c3e20f72076f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current logic for <pkg>_EXTRA_DOWNLOADS assumes that it is a list
of files, all hosted at <pkg>_SITE. However, just like for
<pkg>_PATCH, it may be useful to specify <pkg>_EXTRA_DOWNLOADS entries
that are hosted on a different site than the package <pkg>_SITE.

This commit implements this, by re-using the same logic as the one
used for <pkg>_PATCH.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3c86878..22b3fb9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -81,7 +81,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	done
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
+	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),\
+		$(if $(findstring ://,$(p)),\
+			$(call DOWNLOAD,$(p)),\
+			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
+		)\
+	$(sep))
 	$(foreach p,$($(PKG)_PATCH),\
 		$(if $(findstring ://,$(p)),\
 			$(call DOWNLOAD,$(p)),\
