From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2020 21:47:27 +0100
Subject: [Buildroot] [PATCH 1/3] configs/beaglebone_qt5: switch to using KMS
 instead of wayland+weston
In-Reply-To: <cover.1607633239.git.yann.morin.1998@free.fr>
References: <cover.1607633239.git.yann.morin.1998@free.fr>
Message-ID: <513aafb89da88453c8514687923abc80376c20a8.1607633239.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

weston does not work on the ti-sgx SDK, so switch to using KMS directly,
and drop the wayland-related config options.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr: split into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/beaglebone/readme.txt                       | 12 +++++++++++-
 .../rootfs_overlay/etc/qt5/eglfs_kms_cfg.json     | 15 +++++++++++++++
 configs/beaglebone_qt5_defconfig                  |  5 +----
 3 files changed, 27 insertions(+), 5 deletions(-)
 create mode 100644 board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json

diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index e6647dad2a..231e977a89 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -7,7 +7,7 @@ Description
 This configuration will build a complete image for the beaglebone and
 the TI AM335x-EVM, the board type is identified by the on-board
 EEPROM. The configuration is based on the
-ti-processor-sdk-02.00.00.00. Device tree blobs for beaglebone
+ti-processor-sdk-06.01.00.08. Device tree blobs for beaglebone
 variants and the evm-sk are built too.
 
 For Qt5 support support use the beaglebone_qt5_defconfig.
@@ -43,10 +43,20 @@ output/images/
 To copy the image file to the sdcard use dd:
 $ dd if=output/images/sdcard.img of=/dev/XXX
 
+
+Running Qt5 hellowindow opengl demo:
+===================
+# export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
+# export QT_QPA_PLATFORM=eglfs
+# export QT_QPA_EGLFS_INTEGRATION=none
+# /usr/lib/qt/examples/opengl/hellowindow/hellowindow
+
+
 Tested hardware
 ===============
 am335x-evm (rev. 1.1A)
 beagleboneblack (rev. A5A)
 beaglebone (rev. A6)
 
+2020, Adam Duskett <aduskett@gmail.com>
 2016, Lothar Felten <lothar.felten@gmail.com>
diff --git a/board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json b/board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
new file mode 100644
index 0000000000..76f5e7d379
--- /dev/null
+++ b/board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
@@ -0,0 +1,15 @@
+{
+  "device": "/dev/dri/card0",
+  "hwcursor": false,
+  "pbuffers": true,
+  "outputs": [
+    {
+      "name": "VGA1",
+      "mode": "off"
+    },
+    {
+      "name": "HDMI1",
+      "mode": "1024x768"
+    }
+  ]
+}
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index 5f7b911e5d..6e0371a7d3 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -20,11 +20,8 @@ BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
 BR2_PACKAGE_QT5BASE_EXAMPLES=y
 BR2_PACKAGE_QT5BASE_EGLFS=y
-BR2_PACKAGE_QT5BASE_DEFAULT_QPA="wayland"
+BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
 BR2_PACKAGE_QT5QUICKCONTROLS=y
-BR2_PACKAGE_QT5WAYLAND=y
-BR2_PACKAGE_QT5WAYLAND_COMPOSITOR=y
-BR2_PACKAGE_WESTON=y
 BR2_PACKAGE_TI_SGX_DEMOS=y
 BR2_PACKAGE_TI_SGX_KM=y
 BR2_PACKAGE_TI_SGX_UM=y
-- 
2.25.1
