From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 20:31:37 +0100
Subject: [Buildroot] [git commit] fs/ubifs: work around fakeroot / sed -i
	issue on systems with SELinux enabled
Message-ID: <20161127202537.5F8397FE2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01354e1a0f4333ffee40a20260a5689e3846560c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #9386

GNU sed -i misbehaves on systems with SELinux enabled, as it tries to copy
to the SELinux security context (xattr) from the source file to to the new
destination file, which fails under fakeroot and leaves the file with 000
permissions, causing ubinize to fail when it cannot read to configuration
file.

So as a workaround, combine the install and tweak steps in a single
sed with a redirect to the destination file instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ubifs/ubi.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index cda4bf4..e488cb5 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -20,9 +20,11 @@ else
 UBINIZE_CONFIG_FILE_PATH = fs/ubifs/ubinize.cfg
 endif
 
+# don't use sed -i as it misbehaves on systems with SELinux enabled when this is
+# executed through fakeroot (see #9386)
 define ROOTFS_UBI_CMD
-	$(INSTALL) -m 0644 $(UBINIZE_CONFIG_FILE_PATH) $(BUILD_DIR)/ubinize.cfg
-	$(SED) 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' $(BUILD_DIR)/ubinize.cfg
+	sed 's;BR2_ROOTFS_UBIFS_PATH;$@fs;' \
+		$(UBINIZE_CONFIG_FILE_PATH) > $(BUILD_DIR)/ubinize.cfg
 	$(HOST_DIR)/usr/sbin/ubinize -o $@ $(UBI_UBINIZE_OPTS) $(BUILD_DIR)/ubinize.cfg
 	rm $(BUILD_DIR)/ubinize.cfg
 endef
