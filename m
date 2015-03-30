From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:38:49 +0200
Subject: [Buildroot] [git commit] pkg-generic: take into account
	<pkg>_EXTRA_DOWNLOADS to display "Downloading" message
Message-ID: <20150330214111.7FBE37FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48296c5afd24cb7f81693fef70881b9737b55062
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .stamp_downloaded target displays the "Downloading" message even
if there is really something to download. However, this logic only
checks for <pkg>_SOURCE and <pkg>_PATCH: it does not check if
something needs to be downloaded in <pkg>_EXTRA_DOWNLOADS.

This commit fixes that, which makes sure that the "Downloading"
message is displayed if one of the items in <pkg>_EXTRA_DOWNLOADS has
not yet been downloaded.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b44d476..003fd69 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -76,7 +76,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
 		$(call MESSAGE,"Downloading") ; \
 	else \
-		for p in $($(PKG)_PATCH) ; do \
+		for p in $($(PKG)_PATCH) $($(PKG)_EXTRA_DOWNLOADS) ; do \
 			if test ! -e $(DL_DIR)/`basename $$p` ; then \
 				$(call MESSAGE,"Downloading") ; \
 				break ; \
