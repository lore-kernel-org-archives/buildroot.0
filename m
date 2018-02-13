From: Chris Brandt <chris.brandt@renesas.com>
Date: Tue, 13 Feb 2018 14:54:49 -0500
Subject: [Buildroot] [PATCH 2/2] cramfs: add xip option
In-Reply-To: <20180213195449.51516-1-chris.brandt@renesas.com>
References: <20180213195449.51516-1-chris.brandt@renesas.com>
Message-ID: <20180213195449.51516-3-chris.brandt@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cramfs now has the ability to XIP all ELF files.

Cc: Nicolas Pitre <nico@linaro.org>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 fs/cramfs/Config.in | 17 +++++++++++++++++
 fs/cramfs/cramfs.mk |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/fs/cramfs/Config.in b/fs/cramfs/Config.in
index b11885b4f4..5b97479c85 100644
--- a/fs/cramfs/Config.in
+++ b/fs/cramfs/Config.in
@@ -4,3 +4,20 @@ config BR2_TARGET_ROOTFS_CRAMFS
 	  Build a cramfs root filesystem
 
 	  https://github.com/npitre/cramfs-tools
+
+if BR2_TARGET_ROOTFS_CRAMFS
+
+config BR2_TARGET_ROOTFS_CRAMFS_XIP
+	bool "Support XIP of all ELF files"
+	help
+	  For ELF files, uncompressed and properly aligned data blocks will be
+	  automatically be mapped directly into user space whenever possible providing
+	  eXecute-In-Place (XIP) from ROM of read-only segments. Data segments mapped
+	  read-write (hence they have to be copied to RAM) may still be compressed in
+	  the cramfs image in the same file along with non compressed read-only
+	  segments. Both MMU and no-MMU systems are supported. This is particularly
+	  handy for tiny embedded systems with very tight memory constraints.
+
+	  The CRAMFS_MTD Kconfig option must also be enabled in a 4.15+ kernel.
+
+endif # BR2_TARGET_ROOTFS_CRAMFS
diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index fe2b458c0e..68b776f298 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -4,6 +4,14 @@
 #
 ################################################################################
 
+ifeq ($(BR2_TARGET_ROOTFS_CRAMFS_XIP),y)
+ifeq ($(BR2_USE_MMU),y)
+CRAMFS_OPTS = -X -X
+else
+CRAMFS_OPTS = -X
+endif
+endif
+
 define ROOTFS_CRAMFS_CMD
 	$(HOST_DIR)/bin/mkcramfs $(CRAMFS_OPTS) $(TARGET_DIR) $@
 endef
-- 
2.16.1
