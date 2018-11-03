From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:32:52 +0100
Subject: [Buildroot] [git commit] fs/f2fs: add option to define list of
 filesystem features
Message-ID: <20181103143122.12EE37FD0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c66b119ede099d9180c63eb1171250dc6f736b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: split from the initial patch from Grzegorz]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 7 +++++++
 fs/f2fs/f2fs.mk   | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index 585b32e6a2..8a66645325 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -42,4 +42,11 @@ config BR2_TARGET_ROOTFS_F2FS_DISCARD
 	help
 	  Enable or disable discard policy.
 
+config BR2_TARGET_ROOTFS_F2FS_FEATURES
+	string "filesystem features"
+	help
+	  List of features that the F2FS filesystem should support
+	  (e.g "encrypt")
+
+
 endif # BR2_TARGET_ROOTFS_F2FS
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index 558cddf233..63e3cdae7b 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -25,12 +25,15 @@ else
 F2FS_DISCARD = 0
 endif
 
+F2FS_FEATURES = $(call qstrip,$(BR2_TARGET_ROOTFS_F2FS_FEATURES))
+
 F2FS_OPTS = \
 	-f \
 	-l "$(F2FS_LABEL)" \
 	-t $(F2FS_DISCARD) \
 	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
-	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION))
+	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION)) \
+	$(if $(F2FS_FEATURES),-O "$(F2FS_FEATURES)")
 
 ROOTFS_F2FS_DEPENDENCIES = host-f2fs-tools
 
