From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 15:25:19 +0100
Subject: [Buildroot] [PATCH 3/5 v2] linux: fix extensions
In-Reply-To: <cover.1426342904.git.yann.morin.1998@free.fr>
References: <cover.1426342904.git.yann.morin.1998@free.fr>
Message-ID: <95ae759e2efb3ef5d0efb1553cd11c4273bd8b63.1426342904.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the move to the kconfig-package infra, linux extensions are
broken.

In our linux package, extensions are applied as pre-patch hooks.

Before the kconfig-package infra, we had custom rules for the
linux-*config targets, which were of the form:

    linux-menuconfig: linux-configure
        $(MAKE) -C $(LINUX_DIR) menuconfig

This caused the linux tree to be fully configured before running the
configurators, and thus linux dependencies were entirely fullfilled, and
extensions were properly applied.

Since we migrated (in dff25ea), the kconfig-package infra introduces a
(hidden, internal) intermediate step 'kconfig-fixup' and decorelates the
kconfig-part of the configuration from the actual package-part of the
configuration:

    linux-configure -------> kconfig-fixup --> .config --> $(LINUX_CONFIG_FILE)
                        /
    linux-menuconfig --'

As thus, this (very useful!) use-case breaks (starting from a clean
Buildroot tree):

    make menuconfig
        -> enable a kernel and at least one extension
        -> save and exit
    make linux-menuconfig
        -> extensions are not available

Fix that by using the newly-introduced patch-dependencies, so that
extensions are available before we try to patch the linux kernel.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 linux/linux-ext-fbtft.mk   | 2 +-
 linux/linux-ext-rtai.mk    | 2 +-
 linux/linux-ext-xenomai.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/linux-ext-fbtft.mk b/linux/linux-ext-fbtft.mk
index 36f4fd2..6892c89 100644
--- a/linux/linux-ext-fbtft.mk
+++ b/linux/linux-ext-fbtft.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_FBTFT),y)
 # Add dependency to fbtft package (download helper for the fbtft source)
-LINUX_DEPENDENCIES += fbtft
+LINUX_PATCH_DEPENDENCIES += fbtft
 
 # for linux >= 3.15 install to drivers/video/fbdev/fbtft
 # for linux < 3.15 install to drivers/video/fbtft
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index bf998d5..942b430 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_RTAI),y)
 # Add dependency to RTAI (user-space) which provide kernel patches
-LINUX_DEPENDENCIES += rtai-patch
+LINUX_PATCH_DEPENDENCIES += rtai
 
 RTAI_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_RTAI_PATCH))
 
diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 84d2c17..f6a5ffd 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_LINUX_KERNEL_EXT_XENOMAI),y)
 # Add dependency to xenomai (user-space) which provide ksrc part
-LINUX_DEPENDENCIES += xenomai
+LINUX_PATCH_DEPENDENCIES += xenomai
 
 # Adeos patch version
 XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
-- 
1.9.1
