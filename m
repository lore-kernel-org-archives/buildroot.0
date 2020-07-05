From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jul 2020 22:57:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] fs/ubi: expose
 BINARIES_DIR to ubinize.cfg
Message-ID: <20200705205623.B64D2864DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cc70cff026a63fb712f42056fc4d5fbd9f19b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

It is often necessary to refer to other images that are present in
BINARIES_DIR from a custom ubinize configuration e.g. to include the
kernel in a UBI volume.

As we do for BR2_ROOTFS_UBIFS_PATH, replace BINARIES_DIR when copying
the file.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
[yann.morin.1998 at free.fr:
  - add the blurb in the help text
  - rewrap commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 145ee99bc95f99bd6b8aa0ed4a0220173ca7ec25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 fs/ubi/Config.in | 5 +++++
 fs/ubi/ubi.mk    | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ubi/Config.in b/fs/ubi/Config.in
index 85b1c56bb0..3427ea0518 100644
--- a/fs/ubi/Config.in
+++ b/fs/ubi/Config.in
@@ -38,6 +38,11 @@ config BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
 	  So the volume defined for the root filesystem can specify the
 	  image path as:  image=BR2_ROOTFS_UBIFS_PATH
 
+	  Buildroot also replaces the string "BINARIES_DIR" with the
+	  value of $(BINARIES_DIR), so that it is possible to reference
+	  other build artefacts (e.g. to include the kernel in a UBI
+	  volume).
+
 config BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE
 	string "Configuration file path"
 	depends on BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG
diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
index d848f8b23a..54bb81ea08 100644
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
