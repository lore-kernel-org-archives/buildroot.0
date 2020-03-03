From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 22:15:57 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: fix symlink support
Message-ID: <20200309140908.B7CC681268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55df4059d24b86d894f99229908f0c36f2a731f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Linux-firmware's commit 9cfefbd7fbda ("Remove duplicate symlinks")
symlinks aren't distributed anymore. They are rather created at
installation time by a script provided in the project, copy-firmware.sh.
The description of the symlinks is done in the WHENCE file. Since the
bump to version 20200122, in commit 48cc1a89ae04, installation for many
firmwares was broken as Buildroot tried to install missing symlinks from
Linux-firmware.

The fix is not only to remove now missing symlinks, but to add logic to
create those symlinks as kernel modules will depend on them. The
solution taken by this patch is to create dynamically symlinks based on
their description in the WHENCE file *and* only if the file they'll
point to was installed in the target directory.

Fixes: 48cc1a89ae04 ("package/linux-firmware: bump to version 20200122")
Cc: james.hilliard1 at gmail.com
Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
[yann.morin.1998 at free.fr:
  - don't use a post-install hook
  - consolidate grep+sed into a single sed
  - split long ling
  - detect ln error and exit
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 33 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index fd90f261fa..009202d604 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -71,9 +71,7 @@ endif
 
 # rt2xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
-# rt3090.bin is a symlink to rt2860.bin
-# rt3070.bin is a symlink to rt2870.bin
-LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin
+LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt3071.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink-firmware.txt
 endif
 
@@ -214,8 +212,6 @@ endif
 
 # sd8688
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688),y)
-LINUX_FIRMWARE_FILES += libertas/sd8688.bin libertas/sd8688_helper.bin
-# The two files above are but symlinks to those two ones:
 LINUX_FIRMWARE_FILES += mrvl/sd8688.bin mrvl/sd8688_helper.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
@@ -320,12 +316,10 @@ endif
 
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
-# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
 LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl1271-fw-2.bin \
 	ti-connectivity/wl1271-fw-ap.bin \
 	ti-connectivity/wl1271-fw.bin \
-	ti-connectivity/wl1271-nvs.bin \
 	ti-connectivity/wl127x-fw-3.bin \
 	ti-connectivity/wl127x-fw-plt-3.bin \
 	ti-connectivity/wl127x-nvs.bin \
@@ -341,15 +335,12 @@ endif
 
 # wl128x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X),y)
-# wl1271-nvs.bin and wl12xx-nvs.bin are symlinks to wl127x-nvs.bin
 LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl128x-fw-3.bin \
 	ti-connectivity/wl128x-fw-ap.bin \
 	ti-connectivity/wl128x-fw-plt-3.bin \
 	ti-connectivity/wl128x-fw.bin \
-	ti-connectivity/wl1271-nvs.bin \
 	ti-connectivity/wl128x-nvs.bin \
-	ti-connectivity/wl12xx-nvs.bin \
 	ti-connectivity/wl127x-nvs.bin \
 	ti-connectivity/wl128x-fw-4-mr.bin \
 	ti-connectivity/wl128x-fw-4-plt.bin \
@@ -363,13 +354,11 @@ endif
 
 # wl18xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX),y)
-# wl1271-nvs.bin is a symlink to wl127x-nvs.bin
 LINUX_FIRMWARE_FILES += \
 	ti-connectivity/wl18xx-fw.bin \
 	ti-connectivity/wl18xx-fw-2.bin \
 	ti-connectivity/wl18xx-fw-3.bin \
 	ti-connectivity/wl18xx-fw-4.bin \
-	ti-connectivity/wl1271-nvs.bin \
 	ti-connectivity/wl127x-nvs.bin \
 	ti-connectivity/TIInit_7.2.31.bts
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
@@ -563,8 +552,7 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QAT_DH895XCC),y)
-# qat_mmp.bin is a symlink to qat_895xcc_mmp.bin
-LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin qat_mmp.bin
+LINUX_FIRMWARE_FILES += qat_895xcc.bin qat_895xcc_mmp.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qat_firmware
 endif
 
@@ -615,10 +603,27 @@ LINUX_FIRMWARE_LICENSE_FILES = $(sort $(LINUX_FIRMWARE_ALL_LICENSE_FILES))
 
 endif
 
+# Some firmware are distributed as a symlink, for drivers to load them using a
+# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
+# symlinks") those symlink aren't distributed in linux-firmware but are created
+# automatically by its copy-firmware.sh script during the installation, which
+# parses the WHENCE file where symlinks are described. We follow the same logic
+# here, adding symlink only for firmwares installed in the target directory.
+# The grep/sed parsing is taken from the script mentioned before.
+define LINUX_FIRMWARE_CREATE_SYMLINKS
+	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
+	while read f d; do \
+		if test -f $(TARGET_DIR)/lib/firmware/$$d; then \
+			ln -sf $$d $(TARGET_DIR)/lib/firmware/$$f || exit 1; \
+		fi ; \
+	done
+endef
+
 define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib/firmware
 	$(LINUX_FIRMWARE_INSTALL_FILES)
 	$(LINUX_FIRMWARE_INSTALL_DIRS)
+	$(LINUX_FIRMWARE_CREATE_SYMLINKS)
 endef
 
 $(eval $(generic-package))
