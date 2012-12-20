From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Dec 2012 15:25:10 +0100
Subject: [Buildroot] [git commit] linux: Support multiple device tree build
Message-ID: <20121220162903.697679A3D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd1aa62cceff4aa9072d7933042480c20cfd07ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    5 +++--
 linux/linux.mk  |    7 +++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 910d9a5..9ebe0c9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -261,11 +261,12 @@ config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
 endchoice
 
 config BR2_LINUX_KERNEL_INTREE_DTS_NAME
-	string "Device Tree Source file name"
+	string "Device Tree Source file names"
 	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
 	help
 	 Name of the device tree source file, without
-	 the trailing .dts
+	 the trailing .dts. You can provide a list of
+	 dts files to build, separated by spaces.
 
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Device Tree Source file path"
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..3321d80 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -187,10 +187,13 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTS_NAME).dtb
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) \
+		$(addsuffix .dtb, $(call qstrip, $(KERNEL_DTS_NAME)))
 endef
 define LINUX_INSTALL_DTB
-	cp $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
+	cp $(addprefix $(KERNEL_ARCH_PATH)/boot/, \
+		$(addsuffix .dtb, $(call qstrip, $(KERNEL_DTS_NAME)))) \
+		$(BINARIES_DIR)/
 endef
 endif
 endif
