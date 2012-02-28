From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Tue, 28 Feb 2012 10:25:19 -0300
Subject: [Buildroot] [PATCH] Makefile.package.in: GIT: add support to fetch
	git submodules
Message-ID: <1330435519-21011-1-git-send-email-aletes.xgr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
---
 package/Makefile.package.in |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index ea44c6c..863e866 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -147,13 +147,15 @@ domainseparator=$(if $(1),$(1),/)
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	$(GIT) clone -n $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	pushd $($(PKG)_BASE_NAME) > /dev/null && \
-	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
+	$(GIT) checkout $($(PKG)_VERSION) && \
+	$(GIT) submodule init && \
+	$(GIT) submodule update && \
+	$(TAR) czf $(DL_DIR)/$($(PKG)_SOURCE) . &&\
 	popd > /dev/null && \
 	rm -rf $($(PKG)_DL_DIR) && \
-	popd > /dev/null)
+	popd > /dev/null)    
 endef
 
 # TODO: improve to check that the given PKG_DL_VERSION exists on the remote
-- 
1.7.9
