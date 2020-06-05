From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 00:07:25 +0200
Subject: [Buildroot] [git commit] linux: introduce
 BR2_KERNEL_DTB_KEEP_DIRNAME
Message-ID: <20200605220909.063087FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4eef9a3959f6f24218b042033db0f48825f01f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 7 +++++++
 linux/linux.mk  | 9 +++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f85d72068c..61e84f00b4 100644
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
index ea7490d613..c3859a59d5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -378,10 +378,11 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
-	cp $(addprefix \
-		$(LINUX_ARCH_PATH)/boot/$(if $(wildcard \
-		$(addprefix $(LINUX_ARCH_PATH)/boot/dts/,$(LINUX_DTBS))),dts/),$(LINUX_DTBS)) \
-		$(1)
+	$(foreach dtb,$(LINUX_DTBS), \
+		install -D \
+			$(or $(wildcard $(LINUX_ARCH_PATH)/boot/dts/$(dtb)),$(LINUX_ARCH_PATH)/boot/$(dtb)) \
+			$(1)/$(if $(BR2_KERNEL_DTB_KEEP_DIRNAME),$(dtb),$(notdir $(dtb)))
+	)
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
 endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
