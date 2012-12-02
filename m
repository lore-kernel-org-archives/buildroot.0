From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 08:07:04 -0800
Subject: [Buildroot] [git commit] pkg-download.mk: Fix shallow clone
Message-ID: <20121202160725.CF72696FF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d1f5fc29efd40d61e8a185a22e3ee6f52c10d43c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some git versions (e.g. 1.7.0) do not treat trying to shallow clone
a non existing branch or tag as a fatal error but report a warning
and clone HEAD instead. Thus the fallback mechanism does not work
in this case.

This patch introduces a check for the presence of the requested
version as a branch or tag before trying the shallow clone. It
also removes the need to do two clones when a sha1 is given as
a packege version.

[Peter: use cut -f2-]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-download.mk |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 6c57244..ea01b05 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -74,12 +74,19 @@ domainseparator=$(if $(1),$(1),/)
 ################################################################################
 
 # Try a shallow clone - but that only works if the version is a ref (tag or
-# branch). Fall back on a full clone if it's a generic sha1.
+# branch). Before trying to do a shallow clone we check if $($(PKG)_DL_VERSION)
+# is in the list provided by git ls-remote. If not we fall back on a full clone.
+#
+# Messages for the type of clone used are provided to ease debugging in case of
+# problems
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	 ($(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) || \
-	  $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) && \
+	 ((test `git ls-remote  $($(PKG)_SITE) | cut -f 2- | grep $($(PKG)_DL_VERSION)` && \
+	   echo "Doing shallow clone" && \
+	   $(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) || \
+	  (echo "Doing full clone" && \
+	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
