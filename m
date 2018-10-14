From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 22:00:54 +0200
Subject: [Buildroot] [PATCH 1/3] mdadm: convert to generic-package
Message-ID: <20181014200056.20220-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is absolutely no reason for mdadm.mk to use autotools-package:
this package does not have any configure script at all, and its
Makefile is not generated using automake.

Therefore, convert it to use the generic-package
infrastructure. Compared to the previous code, we are now using
$(TARGET_CONFIGURE_OPTS), which passes our CPPFLAGS. This overrides
the CPPFLAGS from mdadm's Makefile, so we repeat the only CPPFLAGS
flag passed in the Makefile, -DBINDIR.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mdadm/mdadm.mk | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 207b0be60d..6efade981d 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -10,14 +10,19 @@ MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 
-MDADM_MAKE_OPTS = \
-	CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" CC="$(TARGET_CC)" CHECK_RUN_DIR=0 -C $(MDADM_DIR) mdadm
-
-MDADM_INSTALL_TARGET_OPTS = \
-	DESTDIR=$(TARGET_DIR)/usr -C $(MDADM_DIR) install-mdadm
+define MDADM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
+		CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/usr/sbin\\\"" \
+		CHECK_RUN_DIR=0 \
+		mdadm
+endef
 
-define MDADM_CONFIGURE_CMDS
-	# Do nothing
+define MDADM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR)/usr \
+		install-mdadm
 endef
 
-$(eval $(autotools-package))
+$(eval $(generic-package))
-- 
2.14.4
