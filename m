From: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Date: Thu, 20 Sep 2012 10:01:17 +0200
Subject: [Buildroot] [PATCH] use portable printf instead of echo -e,
 needed for MacOS X buildhost
Message-ID: <20120920080117.GA4747@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

echo -e is not a portable way to do this, better use printf.
Works with MacOS X.

Signed-off-by: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
---
 fs/common.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index debf7db..0f0eae9 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -49,9 +49,9 @@ $(BINARIES_DIR)/rootfs.$(1): $(ROOTFS_$(2)_DEPENDENCIES)
 ifneq ($(ROOTFS_DEVICE_TABLES),)
 	cat $(ROOTFS_DEVICE_TABLES) > $(FULL_DEVICE_TABLE)
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
-	echo -e '$(subst $(sep),\n,$(PACKAGES_DEVICES_TABLE))' >> $(FULL_DEVICE_TABLE)
+	printf '$(subst $(sep),\n,$(PACKAGES_DEVICES_TABLE))' >> $(FULL_DEVICE_TABLE)
 endif
-	echo -e '$(subst $(sep),\n,$(PACKAGES_PERMISSIONS_TABLE))' >> $(FULL_DEVICE_TABLE)
+	printf '$(subst $(sep),\n,$(PACKAGES_PERMISSIONS_TABLE))' >> $(FULL_DEVICE_TABLE)
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
-- 
1.7.11.1
