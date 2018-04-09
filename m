From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:29:46 +0200
Subject: [Buildroot] [git commit] fs/cramfs: add xip option
Message-ID: <20180409092959.48EDC80428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=265aee8c51718fe7370a3dbc91048ff60eb5909c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cramfs now has the ability to XIP all ELF files.

Cc: Nicolas Pitre <nico@linaro.org>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/cramfs/Config.in | 20 ++++++++++++++++++++
 fs/cramfs/cramfs.mk |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/fs/cramfs/Config.in b/fs/cramfs/Config.in
index b11885b4f4..89f8ad52b8 100644
--- a/fs/cramfs/Config.in
+++ b/fs/cramfs/Config.in
@@ -4,3 +4,23 @@ config BR2_TARGET_ROOTFS_CRAMFS
 	  Build a cramfs root filesystem
 
 	  https://github.com/npitre/cramfs-tools
+
+if BR2_TARGET_ROOTFS_CRAMFS
+
+config BR2_TARGET_ROOTFS_CRAMFS_XIP
+	bool "Support XIP of all ELF files"
+	help
+	  For ELF files, uncompressed and properly aligned data blocks
+	  will be automatically be mapped directly into user space
+	  whenever possible providing eXecute-In-Place (XIP) from ROM
+	  of read-only segments. Data segments mapped read-write
+	  (hence they have to be copied to RAM) may still be
+	  compressed in the cramfs image in the same file along with
+	  non compressed read-only segments. Both MMU and no-MMU
+	  systems are supported. This is particularly handy for tiny
+	  embedded systems with very tight memory constraints.
+
+	  The CRAMFS_MTD Kconfig option must also be enabled in a
+	  4.15+ kernel.
+
+endif # BR2_TARGET_ROOTFS_CRAMFS
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 8745c78031..9250638887 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -10,6 +10,14 @@ else
 CRAMFS_OPTS = -L
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_CRAMFS_XIP),y)
+ifeq ($(BR2_USE_MMU),y)
+CRAMFS_OPTS += -X -X
+else
+CRAMFS_OPTS += -X
+endif
+endif
+
 define ROOTFS_CRAMFS_CMD
 	$(HOST_DIR)/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
 endef
