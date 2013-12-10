From: =?UTF-8?q?Mathias=20De=20Mar=C3=A9?= <mathias.demare@gmail.com>
Date: Tue, 10 Dec 2013 19:31:30 +0100
Subject: [Buildroot] [PATCH 1/1] package: make package download from
	Mercurial repositories more robust
Message-ID: <1386700290-4813-1-git-send-email-mathias.demare@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, when cloning a Mercurial repository,
aborting the clone could (in some cases) leave behind an empty directory.
As a result, a later clone would fail.

Signed-off-by: Mathias De Mar? <mathias.demare@gmail.com>
---
 package/pkg-download.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 758b211..c00689b 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -178,6 +178,7 @@ endef
 define DOWNLOAD_HG
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
+	rm -rf $($(PKG)_BASE_NAME) && \
 	$(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
 	$(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
 	              --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
-- 
1.8.1.2
