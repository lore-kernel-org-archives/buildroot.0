From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:32:36 +0200
Subject: [Buildroot] [git commit] mtd: switch to a foreach loop for
	installation
Message-ID: <20170620203153.4B541800E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=590c4104c12e3968d4bdfe85002fb4cd75c4e942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Such a construct allows to bail out if the installation of one of the
program fails, which the current shell-based for loop doesn't do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 52ad96c..3df641e 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -92,9 +92,9 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS)	+= mkfs.ubifs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_INTEGCK)		+= integck
 
 define MTD_INSTALL_TARGET_CMDS
-	for f in $(MTD_TARGETS_y) ; do \
-		$(INSTALL) -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
-	done
+	$(foreach f,$(MTD_TARGETS_y), \
+		$(INSTALL) -D -m 0755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(notdir $(f))
+	)
 endef
 
 $(eval $(autotools-package))
