From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 18:34:07 +0200
Subject: [Buildroot] [git commit] mtd: restore installation of libmtd to
	staging
Message-ID: <20170701163122.6E70181971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=065a57eb2e8aab34b49e9c23378f8b0e2bb886ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 67117adc891e06154d23a01b8c8ee348c63e78eb backed out the
deployment of libmtd headers (libmtd.h, libubi.h, ubi-media.h) to
staging and these may be needed by packages that work directly with MTD,
for example swupdate. mtd also produces libmtd.a and libubi.a which are
needed by those packages.

Tested by configuring swupdate to use MTD and verifying that swupdate
now compiles and links.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
[Thomas: change to a post-install staging hook, and add comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3df641e..df2e5a3 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -97,5 +97,17 @@ define MTD_INSTALL_TARGET_CMDS
 	)
 endef
 
+# Those libraries are not installed by "make install", but are needed
+# by other packages, such as swupdate.
+define MTD_INSTALL_LIBS
+	$(INSTALL) -D -m 0755 $(@D)/include/libmtd.h $(STAGING_DIR)/usr/include/mtd/libmtd.h
+	$(INSTALL) -D -m 0755 $(@D)/include/libubi.h $(STAGING_DIR)/usr/include/mtd/libubi.h
+	$(INSTALL) -D -m 0755 $(@D)/include/mtd/ubi-media.h $(STAGING_DIR)/usr/include/mtd/ubi-media.h
+	$(INSTALL) -D -m 0755 $(@D)/libmtd.a $(STAGING_DIR)/usr/lib/libmtd.a
+	$(INSTALL) -D -m 0755 $(@D)/libubi.a $(STAGING_DIR)/usr/lib/libubi.a
+endef
+
+MTD_POST_INSTALL_STAGING_HOOKS += MTD_INSTALL_LIBS
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
