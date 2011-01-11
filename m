From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 22:39:05 +0100
Subject: [Buildroot] [git commit master 1/1] ubifs: Add UBI image generation
	support.
Message-ID: <20110111213923.03A17890D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f2bf06fd785de154ab96545b98952fb079310f35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UBI images are generated from UBIFS one (with ubinize tool) and are used by
bootloaders (eg U-Boot) to write UBIFS images directly on bare NAND FLASH
(see http://www.linux-mtd.infradead.org/faq/ubi.html).

[Peter: tweak help text]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Nicolas Colombain <nicolas.colombain@armadeus.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ubifs/Config.in   |   21 +++++++++++++++++++++
 fs/ubifs/ubi.mk      |   23 +++++++++++++++++++++++
 fs/ubifs/ubinize.cfg |    7 +++++++
 3 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 fs/ubifs/ubi.mk
 create mode 100644 fs/ubifs/ubinize.cfg

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index bcf409c..a5ef5f2 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -77,3 +77,24 @@ config BR2_TARGET_ROOTFS_UBIFS_LZMA
 
 endchoice
 
+config BR2_TARGET_ROOTFS_UBI
+	depends on BR2_TARGET_ROOTFS_UBIFS
+	bool "Embed into an UBI image"
+	help
+	  Build an ubi image from the ubifs one (with ubinize).
+
+config BR2_TARGET_ROOTFS_UBI_PEBSIZE
+	hex "UBI physical erase block size"
+	depends on BR2_TARGET_ROOTFS_UBI
+	default 0x20000
+	help
+	  Tells ubinize the physical eraseblock size of the flash chip
+	  the ubi image is created for.
+
+config BR2_TARGET_ROOTFS_UBI_SUBSIZE
+	int "UBI sub-page size"
+	depends on BR2_TARGET_ROOTFS_UBI
+	default 512
+	help
+	  Tells ubinize that the flash supports sub-pages and the sub-page
+	  size. Use 0 if subpages are not supported on flash chip.
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
new file mode 100644
index 0000000..c88e336
--- /dev/null
+++ b/fs/ubifs/ubi.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# Embed the ubifs image into an ubi one
+#
+#############################################################
+
+UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
+ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
+UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
+endif
+
+ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
+
+define ROOTFS_UBI_CMD
+	cp fs/ubifs/ubinize.cfg . ;\
+	echo "image=$$@fs" \
+		>> ./ubinize.cfg ;\
+	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
+	rm ubinize.cfg
+endef
+
+$(eval $(call ROOTFS_TARGET,ubi))
diff --git a/fs/ubifs/ubinize.cfg b/fs/ubifs/ubinize.cfg
new file mode 100644
index 0000000..6515271
--- /dev/null
+++ b/fs/ubifs/ubinize.cfg
@@ -0,0 +1,7 @@
+[ubifs]
+mode=ubi
+vol_id=0
+vol_type=dynamic
+vol_name=rootfs
+vol_alignment=1
+vol_flags=autoresize
-- 
1.7.2.2
