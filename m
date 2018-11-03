From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:29:32 +0100
Subject: [Buildroot] [git commit] fs/f2fs: add option to define discard
 policy
Message-ID: <20181103143122.095EA7FD0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e5c0925afe1a7e6b236e671027ea159b09345e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[Thomas: split from the initial patch from Grzegorz]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/f2fs/Config.in | 6 ++++++
 fs/f2fs/f2fs.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/fs/f2fs/Config.in b/fs/f2fs/Config.in
index 71101d2b57..585b32e6a2 100644
--- a/fs/f2fs/Config.in
+++ b/fs/f2fs/Config.in
@@ -36,4 +36,10 @@ config BR2_TARGET_ROOTFS_F2FS_OVERPROVISION
 	  Leave at 0 to use the default overprovision ratio of
 	  mkfs.f2fs.
 
+config BR2_TARGET_ROOTFS_F2FS_DISCARD
+	bool "discard policy"
+	default y
+	help
+	  Enable or disable discard policy.
+
 endif # BR2_TARGET_ROOTFS_F2FS
diff --git a/fs/f2fs/f2fs.mk b/fs/f2fs/f2fs.mk
index cf79779d2e..558cddf233 100644
--- a/fs/f2fs/f2fs.mk
+++ b/fs/f2fs/f2fs.mk
@@ -19,9 +19,16 @@ ifneq ($(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION),0)
 F2FS_OVERPROVISION = $(BR2_TARGET_ROOTFS_F2FS_OVERPROVISION)
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_F2FS_DISCARD),y)
+F2FS_DISCARD = 1
+else
+F2FS_DISCARD = 0
+endif
+
 F2FS_OPTS = \
 	-f \
 	-l "$(F2FS_LABEL)" \
+	-t $(F2FS_DISCARD) \
 	$(if $(F2FS_COLD_FILES),-e "$(F2FS_COLD_FILES)") \
 	$(if $(F2FS_OVERPROVISION),-o $(F2FS_OVERPROVISION))
 
