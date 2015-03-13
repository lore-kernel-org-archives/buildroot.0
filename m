From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2015 19:57:29 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix use of extensions
In-Reply-To: <cover.1426272973.git.yann.morin.1998@free.fr>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
Message-ID: <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, using externsaions is flawed and does not work in a very
reproducible way, starting from a _clean_ tree:

    make menuconfig
        -> enable a kernel and any externsion (fbtft is nice, since
           it works for recent kernels)

    make linux-menuconfig

Observe how it is not patching the kernel tree with the extensions prior
to running the linux configuratin UI?

This is because dependencies are only acted on at configure time, which
is a step further after the kconfig stage. This probably was not an
issue before we switched to the kconfig infra for the kernel, but that
use-case was completely missed at the time (blame me!).

Fix that:

  - first, the dependency on extensions is moved to a dependency of the
    patch step;

  - then, to avoid circular dependencies (e.g. linux->rtai->linux), do
    not add extensions to LINUX_DEPENDENCIES, instead, add them to a
    special variable, from which we derive both the list of dependencies
    and the list of post-patch hooks.

This makes it slightly easier to write linux extensions: no need to
delve in the .stamp_patched internals for each extension, just a
function to (conditionally) define and a variable to assign.

(Note: this should go into a section of the manual...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-ext-fbtft.mk   | 6 ++----
 linux/linux-ext-rtai.mk    | 6 ++----
 linux/linux-ext-xenomai.mk | 6 ++----
 linux/linux.mk             | 7 +++++++
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
index 36f4fd2..f89b830 100644
--- a/linux/linux-ext-fbtft.mk
+++ b/linux/linux-ext-fbtft.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_FBTFT),y)
-# Add dependency to fbtft package (download helper for the fbtft source)
-LINUX_DEPENDENCIES += fbtft
+
+LINUX_EXTENSIONS += fbtft
 
 # for linux >= 3.15 install to drivers/video/fbdev/fbtft
 # for linux < 3.15 install to drivers/video/fbtft
@@ -23,6 +23,4 @@ define FBTFT_PREPARE_KERNEL
 	echo 'obj-y += fbtft/' >> $${dest}/Makefile
 endef
 
-LINUX_PRE_PATCH_HOOKS += FBTFT_PREPARE_KERNEL
-
 endif #BR2_LINUX_KERNEL_EXT_FBTFT
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index bf998d5..2c272b0 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_RTAI),y)
-# Add dependency to RTAI (user-space) which provide kernel patches
-LINUX_DEPENDENCIES += rtai-patch
+
+LINUX_EXTENSIONS += rtai
 
 RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
 
@@ -42,6 +42,4 @@ define RTAI_PREPARE_KERNEL
 endef
 endif
 
-LINUX_PRE_PATCH_HOOKS += RTAI_PREPARE_KERNEL
-
 endif #BR2_LINUX_EXT_RTAI
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 84d2c17..51c5bd9 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
-# Add dependency to xenomai (user-space) which provide ksrc part
-LINUX_DEPENDENCIES += xenomai
+
+LINUX_EXTENSIONS += xenomai
 
 # Adeos patch version
 XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
@@ -25,6 +25,4 @@ define XENOMAI_PREPARE_KERNEL
 		--verbose
 endef
 
-LINUX_PRE_PATCH_HOOKS += XENOMAI_PREPARE_KERNEL
-
 endif #BR2_LINUX_EXT_XENOMAI
diff --git a/linux/linux.mk b/linux/linux.mk
index b1aca41..eb02619 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -333,8 +333,15 @@ endef
 # included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
+# Include extension-provided post-patch hooks
+LINUX_PRE_PATCH_HOOKS = $(call UPPERCASE,$(patsubst %,%_PREPARE_KERNEL,$(LINUX_EXTENSIONS)))
+
 $(eval $(kconfig-package))
 
+# We need to extract and patch all extensions before we can patch the # kernel.
+# Needs to be _after_ we call kconfig-package, because we need LINUX_DIR
+$(LINUX_DIR)/.stamp_patched: | $(patsubst %,%-patch,$(LINUX_EXTENSIONS))
+
 # Support for rebuilding the kernel after the cpio archive has
 # been generated in $(BINARIES_DIR)/rootfs.cpio.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
-- 
1.9.1
