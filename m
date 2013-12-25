From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:36:39 +0100
Subject: [Buildroot] [git commit] package: make package download from
	Mercurial repositories more robust
Message-ID: <20131225113704.DA2949C1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a10073b6b0a70feea944cbd77914cb51c7a558f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, when cloning a Mercurial repository,
aborting the clone could (in some cases) leave behind an empty directory.
As a result, a later clone would fail.

Signed-off-by: Mathias De Mar?? <mathias.demare@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
