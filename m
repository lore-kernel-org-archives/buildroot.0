From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 26 Jun 2014 08:17:39 -0500
Subject: [Buildroot] [PATCH 1/1] pkg-download: fix svn download for deleted
	path
Message-ID: <1403788659-1936-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a SVN path has been deleted in a future revision, downloading a
package's source will fail using 'svn checkout -r'. Fix using
URL at REV syntax since the SVN command will then verify the path at the
specified version. Without using the URL at REV syntax, the SVN command
will attempt to verify the path exists on the the HEAD revision before
checking out the path at the specified revision.

Error seen if SVN path has been deleted in HEAD using svn checkout -r:
  svn: E160013: '/svn/path/' path not found

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/pkg-download.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4cfb913..e07fd1b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -145,14 +145,14 @@ endef
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	$(SVN) export $($(PKG)_SITE)@$($(PKG)_DL_VERSION) $($(PKG)_DL_DIR) && \
 	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
 endef
 
 define SOURCE_CHECK_SVN
-  $(SVN) ls $($(PKG)_SITE) > /dev/null
+  $(SVN) ls $($(PKG)_SITE)@$($(PKG)_DL_VERSION) > /dev/null
 endef
 
 define SHOW_EXTERNAL_DEPS_SVN
-- 
1.7.9.5
