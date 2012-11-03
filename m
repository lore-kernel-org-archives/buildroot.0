From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 00:55:35 +0100
Subject: [Buildroot] [git commit] pkg-download: Make a shallow clone for git
	downloads
Message-ID: <20121104090716.8261D99929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dd4bcf1eb55f957dba2351f3626933f06adb107
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When downloading from git, we clone the whole repository and then only
use the latest commit.  That's a lot of redundant stuff.  So instead,
make a shallow clone.  Unfortunately that's only possible when
downloading a branch or tag, so fall back to the old method if git gives
an error.

This speeds up the cloning of a linux git from more than 2 hours to
20 minutes on a 200KB/s link).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-download.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index fa9a3e8..6c57244 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -73,10 +73,13 @@ domainseparator=$(if $(1),$(1),/)
 # "external dependencies" of a given build configuration.
 ################################################################################
 
+# Try a shallow clone - but that only works if the version is a ref (tag or
+# branch). Fall back on a full clone if it's a generic sha1.
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	 ($(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) || \
+	  $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
 		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
