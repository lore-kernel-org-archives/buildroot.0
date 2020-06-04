From: Michael Walle <michael@walle.cc>
Date: Fri,  5 Jun 2020 00:11:21 +0200
Subject: [Buildroot] [PATCH v5 2/3] linux: introduce
 BR2_KERNEL_DTB_KEEP_DIRNAME
In-Reply-To: <20200604221123.1850-1-michael@walle.cc>
References: <20200604221123.1850-1-michael@walle.cc>
Message-ID: <20200604221123.1850-2-michael@walle.cc>
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
Hi,

formerly, this was a seperate patch. But because the sl28 board also needs
another patch now, I combined all of them into one patch series. So
actually, there is no v2, nor a v3 of this patch.

Changes since v4:
 make the Makefile expression more readable, thanks Yann

Changes since v3:
 none

Changes since v2:
 none

 linux/Config.in | 7 +++++++
 linux/linux.mk  | 9 +++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e335931575..814e6ceded 100644
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
index 60dc343efa..0fe2c5fa27 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -377,10 +377,11 @@ endef
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
-- 
2.20.1
