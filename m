From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:13 +0100
Subject: [Buildroot] [PATCH 42/55] u-boot: add CROSS_COMPILE/ARCH when
	building host tools
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <48f0a1d15dca61bed170c0342e781800c057c7b6.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even when building the host tools, for some reason U-Boot tries to
execute the cross-compiler, so tell it which cross-compiler to use in
order to avoid failure such as:

/usr/bin/make -j12 -C /home/test/outputs/test-253-mini2440_defconfig/build/u-boot-custom tools
make[1]: arm-linux-gcc: Command not found
make[1]: Entering directory `/home/test/outputs/test-253-mini2440_defconfig/build/u-boot-custom'
for dir in tools examples api_examples ; do /usr/bin/make -C $dir _depend ; done
Generating include/autoconf.mk
/bin/sh: line 3: arm-linux-gcc: command not found

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 9719207..93825e1 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -144,7 +144,7 @@ $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 # uImage.
 $(MKIMAGE): $(U_BOOT_DIR)/.patched
 	mkdir -p $(@D)
-	$(MAKE) -C $(U_BOOT_DIR) tools
+	$(MAKE) -C $(U_BOOT_DIR) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) tools
 	cp -dpf $(U_BOOT_DIR)/tools/mkimage $(@D)
 
 # Build manually mkimage for the target
-- 
1.7.0.4
