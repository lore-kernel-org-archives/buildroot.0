From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  1 Nov 2012 02:21:05 +0100
Subject: [Buildroot] [PATCH] pkg-download: Make a shallow clone for git
	downloads
Message-ID: <1351732866-29730-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When downloading from git, we clone the whole repository and then only
use the latest commit.  That's a lot of redundant stuff.  So instead,
make a shallow clone.  Unfortunately that's only possible when
downloading a branch or tag, so fall back to the old method if git gives
an error.

This speeds up the cloning of a linux git from more than 2 hours to
20 minutes on a 200KB/s link).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/pkg-download.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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
-- 
tg: (29266a3..) t/git-clone-shallow (depends on: master)
