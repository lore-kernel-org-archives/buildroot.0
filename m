From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Jun 2017 23:05:09 +0200
Subject: [Buildroot] [PATCH v2 2/2] mtd: switch to a foreach loop for
	installation
In-Reply-To: <1496955910-32315-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1496955910-32315-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1496955910-32315-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Such a construct allows to bail out if the installation of one of the
program fails, which the current shell-based for loop doesn't do.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - New patch in this version.
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
-- 
2.7.4
