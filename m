From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 31 Oct 2012 09:53:52 +0000
Subject: [Buildroot] [PATCH buildroot] fs/common: Create initial console
	device
Message-ID: <1351677232-14959-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

A /dev/console node must be present in rootfs when the Linux kernel
boots otherwise the kernel will print the following warning:
"Warning: unable to open an initial console"

This is because when we use an initramfs along with devtmpfs, the /dev
directory is not populated at this point. This can cause problems when a
program (e.g ldso with early debugging enabled) opens a standard file
descriptor for read/write before these descriptors are actually created by
the init process later on.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 fs/common.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index debf7db..d7383d1 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -55,6 +55,12 @@ endif
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
+	# create initial console if devtmpfs is used
+ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS),y)
+	echo -e 'pushd $(TARGET_DIR)/dev/ > /dev/null 2>&1' >> $(FAKEROOT_SCRIPT)
+	echo -e '/bin/mknod -m 622 console c 5 1' >> $(FAKEROOT_SCRIPT)
+	echo -e 'popd > /dev/null 2>&1' >> $(FAKEROOT_SCRIPT)
+endif
 	chmod a+x $(FAKEROOT_SCRIPT)
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
-- 
1.7.1
