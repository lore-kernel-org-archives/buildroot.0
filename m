From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:43:13 +0200
Subject: [Buildroot] [git commit] fs/ubifs: allow extra options to be passed
	to ubifs creation tools
Message-ID: <20130425205440.633559B83E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0f3cb1cbeba376a8a8105b58f7f85e63baa11fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow extra options to be passed to ubifs creation tools.

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ubifs/Config.in |   12 ++++++++++++
 fs/ubifs/ubi.mk    |    2 ++
 fs/ubifs/ubifs.mk  |    4 +++-
 3 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
index 0a798d8..d716fc0 100644
--- a/fs/ubifs/Config.in
+++ b/fs/ubifs/Config.in
@@ -87,6 +87,12 @@ config BR2_TARGET_ROOTFS_UBIFS_XZ
 
 endchoice
 
+config BR2_TARGET_ROOTFS_UBIFS_OPTS
+	string "Additional mkfs.ubifs options"
+	depends on BR2_TARGET_ROOTFS_UBIFS
+	help
+	  Any additional mkfs.ubifs options you may want to include.
+
 config BR2_TARGET_ROOTFS_UBI
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	bool "Embed into an UBI image"
@@ -108,3 +114,9 @@ config BR2_TARGET_ROOTFS_UBI_SUBSIZE
 	help
 	  Tells ubinize that the flash supports sub-pages and the sub-page
 	  size. Use 0 if subpages are not supported on flash chip.
+
+config BR2_TARGET_ROOTFS_UBI_OPTS
+	string "Additional ubinize options"
+	depends on BR2_TARGET_ROOTFS_UBI
+	help
+	  Any additional ubinize options you may want to include.
diff --git a/fs/ubifs/ubi.mk b/fs/ubifs/ubi.mk
index 51ab42d..e9033e8 100644
--- a/fs/ubifs/ubi.mk
+++ b/fs/ubifs/ubi.mk
@@ -10,6 +10,8 @@ ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
 UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
 endif
 
+UBI_UBINIZE_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBI_OPTS))
+
 ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
 
 define ROOTFS_UBI_CMD
diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 8506dbd..dca2e04 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -16,10 +16,12 @@ ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_NONE),y)
 UBIFS_OPTS += -x none
 endif
 
+UBIFS_OPTS += $(call qstrip,$(BR2_TARGET_ROOTFS_UBIFS_OPTS))
+
 ROOTFS_UBIFS_DEPENDENCIES = host-mtd
 
 define ROOTFS_UBIFS_CMD
 	$(HOST_DIR)/usr/sbin/mkfs.ubifs -d $(TARGET_DIR) $(UBIFS_OPTS) -o $@
 endef
 
-$(eval $(call ROOTFS_TARGET,ubifs))
\ No newline at end of file
+$(eval $(call ROOTFS_TARGET,ubifs))
