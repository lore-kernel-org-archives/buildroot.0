From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  7 Mar 2021 14:25:36 -0800
Subject: [Buildroot] [PATCH 4/4] package/mender: Do not automatically select
 uboot tools if uboot is selected
In-Reply-To: <20210307222536.2743089-1-aduskett@gmail.com>
References: <20210307222536.2743089-1-aduskett@gmail.com>
Message-ID: <20210307222536.2743089-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Because uboot requires a set of unique patches for each board, the upstream
package developers are phasing out supporting uboot wherever possible.
Instead, they recommend using Grub as a secondary bootloader and using
mender-grubenv whenever possible.

As such, remove selecting uboot tools when uboot is selected, and instead add
a note in the help section about what Mender requires for uboot and grub-based
systems.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mender/Config.in | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 6a80c410ce..6c84157734 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -5,14 +5,24 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XZ
-	select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # runtime
-	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT # runtime
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
 	  running at the embedded device, as well as a server that
 	  manages deployments across many devices.
 
+	  Note:
+	  For systems using uboot as the bootloader:
+	    - uboot must be patched with the mender uboot patches.
+	    - uboot-tools must be selected.
+	    - fw_printenv must be functional on the device.
+
+	  For systems using Grub as the bootloader:
+	    - Mender depends on the mender-grubenv package.
+
+	  The mender project recommends using uboot to load Grub as a
+	  secondary bootloader when possible.
+
 	  https://github.com/mendersoftware/mender
 
 comment "mender needs a toolchain w/ threads"
-- 
2.25.1
