From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Tue, 27 Jun 2017 20:56:10 -0700
Subject: [Buildroot] [PATCH] mtd: restore installation of libmtd to staging
Message-ID: <20170628035610.9945-1-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 67117adc891e06154d23a01b8c8ee348c63e78eb backed out the
deployment of libmtd headers (libmtd.h, libubi.h, ubi-media.h) to
staging and these may be needed by packages that work directly with MTD,
for example swupdate. mtd also produces libmtd.a and libubi.a which are
needed by those packages.

Tested by configuring swupdate to use MTD and verifying that swupdate
now compiles and links.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/mtd/mtd.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3df641e..bcd2363 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -97,5 +97,13 @@ define MTD_INSTALL_TARGET_CMDS
 	)
 endef
 
+define MTD_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
+	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
+	$(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
+	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
+	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
