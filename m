From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:12:04 +0200
Subject: [Buildroot] [git commit] linux: allow br2-externals to provide
 their own Linux extensions
Message-ID: <20190928200651.4BD7E821C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c26eafa96cabd597a5cce534133ee0ff996b800c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/customize-outside-br.txt | 14 ++++++++++++++
 linux/linux.mk                       | 13 +++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 7d3e2b1714..5f7d623aea 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -219,6 +219,12 @@ BR2_ROOTFS_OVERLAY=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/overlay/
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/kernel.config
 ----
 
+===== Additional Linux kernel extensions
+
+Additional Linux kernel extensions (see xref:linux-kernel-ext[]) can
+be added by storing them in the `linux/` directory at the root of a
+br2-external tree.
+
 ===== Example layout
 
 Here is an example layout using all features of br2-external (the sample
@@ -315,6 +321,14 @@ illustration, of course):
   |     |$(eval $(toolchain-external-package))
   |     `----
   |
+  |- linux/Config.ext.in
+  |     |config BR2_LINUX_KERNEL_EXT_EXAMPLE_DRIVER
+  |     |    bool "example-external-driver"
+  |     |    help
+  |     |      Example external driver
+  |     |---
+  |- linux/linux-ext-example-driver.mk
+  |
   |- configs/my-board_defconfig
   |     |BR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL_BAR_42_PATH)/patches/"
   |     |BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/overlay/"
diff --git a/linux/linux.mk b/linux/linux.mk
index 95bde1aba5..b9e72107df 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -514,14 +514,19 @@ endef
 #
 # Note: our package infrastructure uses the full-path of the last-scanned
 # Makefile to determine what package we're currently defining, using the
-# last directory component in the path. As such, including other Makefile,
-# like below, before we call one of the *-package macro is usally not
-# working.
+# last directory component in the path. As such, including other Makefiles,
+# like below, before we call one of the *-package macros usually doesn't
+# work.
 # However, since the files we include here are in the same directory as
 # the current Makefile, we are OK. But this is a hard requirement: files
-# included here *must* be in the same directory!
+# included here *must* either be in this same directory OR within a
+# another directory with the name "linux" (in the BR2_EXTERNAL case).
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
+# Import linux-kernel-extensions from br2-externals
+include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
+       $(ext)/linux/linux-ext-*.mk)))
+
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
 
