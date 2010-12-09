From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  9 Dec 2010 10:55:13 +0100
Subject: [Buildroot] [PATCH 15/16] bzip2: ensure target directories exist
	before copying into
In-Reply-To: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291888514-31385-16-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Also simply installation rules a little

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/bzip2/bzip2.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 3f341ee..38bb461 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -39,7 +39,9 @@ define BZIP2_BUILD_CMDS
 endef
 
 define BZIP2_INSTALL_STAGING_CMDS
-	cp $(@D)/bzlib.h $(STAGING_DIR)/usr/include/
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/lib
 	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(STAGING_DIR)/usr/lib/
 	cp $(@D)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
@@ -49,9 +51,7 @@ define BZIP2_INSTALL_STAGING_CMDS
 	)
 endef
 
-# make sure busybox doesn't get overwritten by make install
 define BZIP2_INSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,bzip2 bunzip2 bzcat)
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
 	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(TARGET_DIR)/usr/lib/
-- 
1.7.2.3
