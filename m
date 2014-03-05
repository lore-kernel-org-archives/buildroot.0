From: =?UTF-8?q?Mathias=20De=20Mar=C3=A9?= <mathias.demare@gmail.com>
Date: Wed,  5 Mar 2014 07:54:12 +0100
Subject: [Buildroot] [PATCH 1/1] package: make package download from
	Mercurial repositories more robust
Message-ID: <1394002452-5114-1-git-send-email-mathias.demare@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, after cloning a Mercurial repository,
an interrupted 'hg archive' operation would leave behind a partial
archive. This caused future archive operations to fail.

Signed-off-by: Mathias De Mar? <mathias.demare@gmail.com>
---
 package/pkg-download.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 85842de..6f53f53 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -176,13 +176,19 @@ define SHOW_EXTERNAL_DEPS_SCP
 endef
 
 
+# Download a file using Mercurial.
+# In case a previous clone failed, remove the directory.
+# To handle interrupted archive operations, use a temporary directory,
+# and remove this directory before archiving again.
 define DOWNLOAD_HG
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
 	rm -rf $($(PKG)_BASE_NAME) && \
 	$(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
+	rm -rf $(DL_DIR)/$($(PKG)_SOURCE).tmp && \
 	$(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
-	              --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
+			--rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE).tmp && \
+	mv $(DL_DIR)/$($(PKG)_SOURCE).tmp $(DL_DIR)/$($(PKG)_SOURCE) && \
 	rm -rf $($(PKG)_DL_DIR) && \
 	popd > /dev/null)
 endef
-- 
1.8.1.2
