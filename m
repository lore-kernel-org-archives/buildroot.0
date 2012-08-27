From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 26 Aug 2012 20:12:55 -0400
Subject: [Buildroot] [PATCH] Replace DL_DIR refs in the GIT/SVN/HG download
Message-ID: <1346026375-15339-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If DL_DIR is set to a relative path, then the download helpers
for GIT, SVN, and HG fail, because they reference DL_DIR or
$(PKG)_DL_DIR from within the DL_DIR directory.  (But the
relative path is relative to TOPDIR.)  All of these cases can
be avoided, since the location of the cloned repo is always
$(DL_DIR)/$($(PKG)_BASE_NAME), which can be used to make
the helpers simpler, as well as more friendly to the relative
DL_DIR definition.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/pkg-download.mk |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9e98581..a7cef0e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -68,11 +68,11 @@ define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
 	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
-	pushd $($(PKG)_BASE_NAME) > /dev/null && \
+	cd $($(PKG)_BASE_NAME) && \
 	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
-	popd > /dev/null && \
-	rm -rf $($(PKG)_DL_DIR) && \
+		gzip -c > ../$($(PKG)_SOURCE) && \
+	cd .. && \
+	rm -rf $($(PKG)_BASE_NAME) && \
 	popd > /dev/null)
 endef
 
@@ -104,9 +104,9 @@ endef
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_DL_DIR) && \
+	$(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	$(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
-	rm -rf $($(PKG)_DL_DIR) && \
+	rm -rf $($(PKG)_BASE_NAME) && \
 	popd > /dev/null)
 endef
 
@@ -140,8 +140,8 @@ define DOWNLOAD_HG
 	(pushd $(DL_DIR) > /dev/null && \
 	$(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	$(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
-	              --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
-	rm -rf $($(PKG)_DL_DIR) && \
+	              --rev $($(PKG)_DL_VERSION) ./$($(PKG)_SOURCE) && \
+	rm -rf $($(PKG)_BASE_NAME) && \
 	popd > /dev/null)
 endef
 
-- 
1.7.9.5
