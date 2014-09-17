From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 17 Sep 2014 22:11:15 +0200
Subject: [Buildroot] [PATCH v2] Add support for Flattened Image Trees
In-Reply-To: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
References: <1410981210-7788-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <3d2b0e86-ff3d-47b7-a9db-68a4e530cb82@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor Yefremov <yegorslists@googlemail.com> schreef:
>This patch provides an option to specify a FIT source
>file (*.its), that will usually be stored in a board directory,
>and the resulting blob file name (*.itb).
>
>Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>---
>Changes:
>	v2: moved configuration to fs infra instead of linux
>
> fs/Config.in     |  1 +
> fs/fit/Config.in | 28 ++++++++++++++++++++++++++++
> fs/fit/fit.mk    | 19 +++++++++++++++++++
> 3 files changed, 48 insertions(+)
> create mode 100644 fs/fit/Config.in
> create mode 100644 fs/fit/fit.mk
>
>diff --git a/fs/Config.in b/fs/Config.in
>index 5853113..8d882d0 100644
>--- a/fs/Config.in
>+++ b/fs/Config.in
>@@ -4,6 +4,7 @@ source "fs/cloop/Config.in"
> source "fs/cpio/Config.in"
> source "fs/cramfs/Config.in"
> source "fs/ext2/Config.in"
>+source "fs/fit/Config.in"
> source "fs/initramfs/Config.in"
> source "fs/iso9660/Config.in"
> source "fs/jffs2/Config.in"
>diff --git a/fs/fit/Config.in b/fs/fit/Config.in
>new file mode 100644
>index 0000000..add4d27
>--- /dev/null
>+++ b/fs/fit/Config.in
>@@ -0,0 +1,28 @@
>+config BR2_TARGET_ROOTFS_FIT
>+	bool "Flattened Image Tree support"
>+	help
>+	  Compile a flattened image tree source into a flattened
>+	  image tree blob. Select the *.its file to compile in the

Minor comment: I would use the word Specify instead of Select here.

>+	  options below.
>+
>+if BR2_TARGET_ROOTFS_FIT
>+
>+config BR2_FIT_PATH
>+	string "Flattened Image Tree source file path"
>+	help
>+	  Path to the image tree tree source files.
>+
>+config BR2_FIT_BLOB_NAME
>+	string "Flattened Image Tree blob file name"
>+	help
>+	  File name for the resulting FIT blob.
>+
>+config BR2_FIT_INSTALL_TARGET
>+	bool "Install Flattened Image Tree blob to /boot in target"
>+	depends on !BR2_TARGET_ROOTFS_INITRAMFS
>+	help
>+	  Select this option to have the FIT image installed to
>+	  /boot in the target root filesystem.
>+
>+endif
>+
>diff --git a/fs/fit/fit.mk b/fs/fit/fit.mk
>new file mode 100644
>index 0000000..84cc91c
>--- /dev/null
>+++ b/fs/fit/fit.mk
>@@ -0,0 +1,19 @@
>+################################################################################
>+#
>+# Build the FIT image
>+#
>+################################################################################
>+
>+ifeq ($(BR2_FIT_INSTALL_TARGET),y)
>+define FIT_INSTALL_ITB_TARGET
>+	cp $(BINARIES_DIR)/$(BR2_LINUX_KERNEL_FIT_BLOB_NAME) $(TARGET_DIR)/boot/
>+endef
>+endif
>+
>+define ROOTFS_FIT_CMD
>+	cp $(BR2_FIT_PATH) $(BINARIES_DIR)
>+	mkimage -f $(BINARIES_DIR)/`basename $(BR2_FIT_PATH)` $(BINARIES_DIR)/$(BR2_FIT_BLOB_NAME)
>+	$(FIT_INSTALL_ITB_TARGET)
>+endef
>+
>+$(eval $(call ROOTFS_TARGET,fit))

Should we add a check on the presence of the source file to print a nice error message instead of a weird error if it doesn't exist?

Also, instead of using basename you could use the make function $(file xxx).

Finally I think you should use $(call qstrip,xxxx) on the string options.

Best regards,
Thomas
