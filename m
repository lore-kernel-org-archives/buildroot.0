From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat,  6 Jun 2020 12:50:15 +0200
Subject: [Buildroot] [PATCH] fs/ubi: expose BINARIES_DIR to ubinize.cfg
Message-ID: <20200606105015.1603519-1-alexandre.belloni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is often necessary to refer to other images that are present in
BINARIES_DIR from a custom ubinize configuration e.g. to include the kernel
in a UBI volume.

As for BR2_ROOTFS_UBIFS_PATH, replace BINARIES_DIR when copying the file.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 fs/ubi/ubi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
index d848f8b23a65..54bb81ea08a4 100644
--- a/fs/ubi/ubi.mk
+++ b/fs/ubi/ubi.mk
@@ -23,7 +23,7 @@ endif
 # don't use sed -i as it misbehaves on systems with SELinux enabled when this is
 # executed through fakeroot (see #9386)
 define ROOTFS_UBI_CMD
-	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
+	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;;s;BINARIES_DIR;$(BINARIES_DIR);' \
 		$(UBI_UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
 	$(HOST_DIR)/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
 	rm $(BUILD_DIR)/ubinize.cfg
-- 
2.26.2
