From: robert.mccabe at rockwellcollins.com <robert.mccabe@rockwellcollins.com>
Date: Sat, 28 Sep 2019 12:49:37 -0500
Subject: [Buildroot] [PATCH v5] br2-ext linux-kernel-extensions support
Message-ID: <20190928174937.408-1-robert.mccabe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>

Allows br2-externals to inject custom code into the kernel tree.

Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
---
 docs/manual/customize-outside-br.txt | 14 ++++++++++++++
 linux/linux.mk                       | 13 +++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 7d3e2b1714..c3fe3d2b80 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -219,6 +219,12 @@ BR2_ROOTFS_OVERLAY=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/overlay/
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=$(BR2_EXTERNAL_BAR_42_PATH)/board/<boardname>/kernel.config
 ----

+===== Custom linux-kernel-extensions
+
+ Custom linux extensions (see xref:linux-kernel-ext[]) can be added by
+ storing them in the `linux/` directory at the root of your
+ br2-external tree.
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
index 95bde1aba5..32c0621a24 100644
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

+#Import linux-kernel-extensions from externals
+include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
+       $(ext)/linux/linux-ext-*.mk)))
+
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
 	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))

--
2.17.1
