From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:29 +0200
Subject: [Buildroot] [PATCH 33/34] reproducible/cpio: generate reproducible
	cpio archives
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-33-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sort the file list to get a deterministic file order.
---
 fs/cpio/cpio.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index e0e925d..81018a4 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -35,9 +35,9 @@ else
 ROOTFS_CPIO_DEPENDENCIES += host-cpio
 
 define ROOTFS_CPIO_CMD
-	find $(TARGET_DIR) -print0 | \
-	xargs -0 touch -h -d @$(SOURCE_DATE_EPOCH) && \
-	cd $(TARGET_DIR) && find . | $(CPIO_REPRODUCIBLE) --quiet -o -H newc > $@
+	find $(TARGET_DIR) | \
+	xargs touch -h -d @$(SOURCE_DATE_EPOCH) && \
+	cd $(TARGET_DIR) && find . | sort | $(CPIO_REPRODUCIBLE) --quiet -o -H newc > $@
 endef
 endif
 
-- 
2.7.4
