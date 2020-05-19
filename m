From: Michael Walle <michael@walle.cc>
Date: Tue, 19 May 2020 22:22:34 +0200
Subject: [Buildroot] [PATCH] linux: introduce BR2_KERNEL_DTB_KEEP_DIRNAME
Message-ID: <20200519202235.13764-1-michael@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In linux, newer architectures like ARM64 and RISC-V keep their device
tree sources organized by subdirectories. When these device trees are
installed by the kernel they will keep the directory names. But
buildroot strips the prefixes when installing them into /boot or the
images directory.
Sometimes the bootloader references the device tree by name (e.g.
u-boot has the environment variable 'fdtfile') which also includes
the prefix directory.
Make it possible to keep this prefix during installation, so we can
be compatible with other distributions and make it easier for the
user, because he doesn't have to change that environment variable.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 linux/Config.in |  7 +++++++
 linux/linux.mk  | 10 ++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d7373ab25a..f9112feadc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -407,6 +407,13 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 
+config BR2_KERNEL_DTB_KEEP_DIRNAME
+	bool "Keep the directory name of the Device Tree"
+	help
+	  If enabled, the device tree blobs keep their
+	  directory prefixes when they get copied to the
+	  output image directory or the target directory.
+
 config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
 	bool "Build Device Tree with overlay support"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 69bbad99e1..846bab50d3 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -379,10 +379,12 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
-	cp $(addprefix \
-		$(LINUX_ARCH_PATH)/boot/$(if $(wildcard \
-		$(addprefix $(LINUX_ARCH_PATH)/boot/dts/,$(LINUX_DTBS))),dts/),$(LINUX_DTBS)) \
-		$(1)
+	$(foreach dtb,$(LINUX_DTBS), \
+		install -D $(addprefix \
+			$(LINUX_ARCH_PATH)/boot/$(if $(wildcard \
+			$(addprefix $(LINUX_ARCH_PATH)/boot/dts/,$(dtb))),dts/),$(dtb)) \
+			$(1)/$(if $(BR2_KERNEL_DTB_KEEP_DIRNAME),$(dtb),$(notdir $(dtb)))
+	)
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
 endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
-- 
2.20.1
