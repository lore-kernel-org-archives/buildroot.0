From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:01:33 +0200
Subject: [Buildroot] [git commit] linux-firmware: add amdgpu firmware blobs
Message-ID: <20180428200149.23F4389078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f4ad10470762275380b555632fc59807acc210d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for Volcanic Islands (VI), Sea Islands (CI) and Southern
Islands (SI) cards.

This firmware files will be needed if linux kernel is compiled with
amdgpu enabled.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
[Thomas: add hash for LICENSE.amdgpu]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fb64c527f9..074bcc6c78 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -19,6 +19,11 @@ endmenu # Audio
 
 menu "Video firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU
+	bool "AMD GPU video card firmware"
+	help
+	  Firmware files for AMD GPU video cards.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_I915
 	bool "Intel i915 video card firmware"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index c766689fc1..0106db2ffb 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,6 +1,7 @@
 # Locally calculated
 sha256 d253f7abb32e0407bcc840a5bddba1dc20190bb4a4bb6d40512f279fde384671 linux-firmware-65b1c68c63f974d72610db38dfae49861117cae2.tar.gz
 sha256 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9 LICENCE.Abilis
+sha256 448a367f518ff62c0501ded89c3da03cd3b632aa05bf62b4d5b969b136476d96 LICENSE.amdgpu
 sha256 38f2037aa14631b4b29826d7a99379613c41a97064d1defdee30a7a022138b20 LICENCE.Marvell
 sha256 802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2 LICENCE.atheros_firmware
 sha256 3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 11231613e9..46ab9d5ffe 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -14,6 +14,11 @@ LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMDGPU),y)
+LINUX_FIRMWARE_DIRS += amdgpu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amdgpu
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_I915),y)
 LINUX_FIRMWARE_DIRS += i915
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.i915
