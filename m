From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:00 +0200
Subject: [Buildroot] [PATCH 04/34] reproducibility: make rootfs.tar
	reproducible
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-4-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By generating a tarball with a deterministic file order and date.
---
 fs/tar/tar.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 28219cf..06a4d7c 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -6,8 +6,19 @@
 
 TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
 
+ifneq ($(BR2_REPRODUCIBLE),y)
 define ROOTFS_TAR_CMD
 	tar -c$(TAR_OPTS)f $@ --numeric-owner -C $(TARGET_DIR) .
 endef
+else
+define ROOTFS_TAR_CMD
+	cd $(TARGET_DIR) && { \
+		find . -\( -! -type d -o -empty -\) -print0 | \
+		sort -z | \
+		tar --null -T - -c$(TAR_OPTS)f $@ --mtime=@$(SOURCE_DATE_EPOCH) --numeric-owner; \
+	}
+endef
+endif
+
 
 $(eval $(call ROOTFS_TARGET,tar))
-- 
2.7.4
