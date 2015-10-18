From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:05:02 +0200
Subject: [Buildroot] [PATCH 3/3] linux: don't build appended DTB image in
	place and support multiple images
In-Reply-To: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1445202302-2720-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the linux.mk logic for appended DTB image does the
appending of the DTB in place, directly at the end of the zImage using
a >> sign. This is incorrect because if you run "make linux-rebuild"
multiple times, you get the DTB appended over and over again to the
image.

Since keeping the 'zImage' or 'uImage' name for the appended DTB image
is not very clear, this commit moves to using the 'zImage.<dtb>' and
'uImage.<dtb>' format. This way, we can clearly distinguish the
original image from the appended one.

In addition, this naming scheme easily allows to generate *multiple*
appended DTB images: from one zImage, you can generate multiple
zImage.<dtb> for several DTBs, and then generate (if requested) the
corresponding uImage.<dtb>.

To achieve this, this commit:

 - Changes the definition of LINUX_APPENDED_DTB to iterate over
   $(KERNEL_DTS_NAME), and generate a zImage.<dtb> image for each of
   them.

 - Changes the addition of LINUX_APPENDED_DTB for appended uImage to
   also iterate over $(KERNEL_DTS_NAME).

 - Provide a different implementation of LINUX_INSTALL_IMAGE which
   installs all the appended DTB images (but not the bare image)

 - Remove the checks that verified that only one DT name is passed
   when appended DTB is used, since we now support generating multiple
   DT images.

Some of the tested configuration:

 - Normal uImage with several DTBs

   BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
   BR2_LINUX_KERNEL_UIMAGE=y
   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x200000"
   BR2_LINUX_KERNEL_DTS_SUPPORT=y
   BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-xp-matrix armada-xp-gp armada-370-mirabox"

   Contents of output/images/:

   armada-370-mirabox.dtb  armada-xp-gp.dtb  armada-xp-matrix.dtb  uImage

 - Normal zImage with several DTBs

   BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
   BR2_LINUX_KERNEL_ZIMAGE=y
   BR2_LINUX_KERNEL_DTS_SUPPORT=y
   BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-xp-matrix armada-xp-gp armada-370-mirabox"

   Contents of output/images:

   armada-370-mirabox.dtb  armada-xp-gp.dtb  armada-xp-matrix.dtb  zImage

 - Appended uImage with several DTBs:

   BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
   BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
   BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x200000"
   BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-xp-matrix armada-xp-gp armada-370-mirabox"

   Contents of output/images:

   uImage.armada-370-mirabox  uImage.armada-xp-gp  uImage.armada-xp-matrix

 - Appended zImage with several DTBs:

   BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
   BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
   BR2_LINUX_KERNEL_INTREE_DTS_NAME="armada-xp-matrix armada-xp-gp armada-370-mirabox"

   Contents of output/images:

   zImage.armada-370-mirabox  zImage.armada-xp-gp  zImage.armada-xp-matrix

In all configurations, the contents of output/target/boot/ was the
same if BR2_LINUX_KERNEL_INSTALL_TARGET=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 59e1bb4..297ef83 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -246,11 +246,15 @@ endif # BR2_LINUX_KERNEL_DTS_SUPPORT
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 define LINUX_APPEND_DTB
-	if [ -e $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb ]; then \
-		cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb; \
-	else \
-		cat $(KERNEL_ARCH_PATH)/boot/dts/$(KERNEL_DTS_NAME).dtb; \
-	fi >> $(KERNEL_ARCH_PATH)/boot/zImage
+	(cd $(KERNEL_ARCH_PATH)/boot; \
+		for dtb in $(KERNEL_DTS_NAME); do \
+			if test -e $${dtb}.dtb ; then \
+				dtbpath=$${dtb}.dtb ; \
+			else \
+				dtbpath=dts/$${dtb}.dtb ; \
+			fi ; \
+			cat zImage $${dtbpath} > zImage.$${dtb} || exit 1; \
+		done)
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 # We need to generate a new u-boot image that takes into
@@ -258,11 +262,14 @@ ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 # of the image. To do so, we first need to retrieve both load
 # address and entry point for the kernel from the already
 # generate uboot image before using mkimage -l.
-LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
+LINUX_APPEND_DTB += ; \
+	MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
 	sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
-	$(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
-	-T kernel -C none $${MKIMAGE_ARGS} \
-	-d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
+	for dtb in $(KERNEL_DTS_NAME); do \
+		$(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
+			-T kernel -C none $${MKIMAGE_ARGS} \
+			-d $(KERNEL_ARCH_PATH)/boot/zImage.$${dtb} $(LINUX_IMAGE_PATH).$${dtb}; \
+	done
 endif
 endif
 
@@ -279,9 +286,20 @@ define LINUX_BUILD_CMDS
 	$(LINUX_APPEND_DTB)
 endef
 
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
+# When a DTB was appended, install the potential several images with
+# appended DTBs.
+define LINUX_INSTALL_IMAGE
+	mkdir -p $(1)
+	cp $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).* $(1)
+endef
+else
+# Otherwise, just install the unique image generated by the kernel
+# build process.
 define LINUX_INSTALL_IMAGE
 	$(INSTALL) -m 0644 -D $(LINUX_IMAGE_PATH) $(1)/$(LINUX_IMAGE_NAME)
 endef
+endif
 
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
@@ -290,7 +308,6 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
-
 define LINUX_INSTALL_HOST_TOOLS
 	# Installing dtc (device tree compiler) as host tool, if selected
 	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
@@ -377,13 +394,6 @@ $(error No kernel device tree source specified, check your \
 BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
-ifneq ($(words $(KERNEL_DTS_NAME)),1)
-$(error Kernel with appended device tree needs exactly one DTS source. \
-	Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
-endif
-endif
-
 endif # BR_BUILDING
 
 $(eval $(kconfig-package))
-- 
2.6.2
