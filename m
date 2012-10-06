From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Oct 2012 13:05:26 +0200
Subject: [Buildroot] [git commit] use portable printf instead of echo -e,
	needed for MacOS X buildhost
Message-ID: <20121006193625.5D3D8997CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccd7f14cfebc8dc144411cbcb08c7651759c5298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

echo -e is not a portable way to do this, better use printf.
Works with MacOS X.

Signed-off-by: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/common.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
