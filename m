From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:30:43 +0100
Subject: [Buildroot] [git commit] package/mender: do not automatically
 select uboot tools if uboot is selected
Message-ID: <20210316200709.8181D87F6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=136f317c68e98882d1c146baa1804395a992d548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because uboot requires a set of unique patches for each board, the
upstream package developers are phasing out supporting uboot wherever
possible.  Instead, they recommend using Grub2 as a secondary
bootloader and using the mender-grubenv package.

Because the mender-grubenv file provides it's own fw_printenv script,
it is not possible to know if U-Boot's fw_printenv or mender-grubenv's
fw_printenv should be used.

As such, remove selecting uboot tools when uboot is selected, and
instead add a more comprehensive note in the help section about what
Mender requires for uboot and grub2-based systems, with a link to the
meta-mender github project for the base uboot patches, and a link to
the official documentation on manual uboot integration.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/Config.in | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 6a80c410ce..accee4676a 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -5,14 +5,34 @@ config BR2_PACKAGE_MENDER
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
 
+	  Notes:
+	  For systems using uboot as the bootloader:
+	    - uboot must have the mender uboot patches applied.
+	    - uboot-tools must be selected.
+	    - fw_printenv must be functional on the device.
+	  The Mender Uboot patches are at:
+	  https://github.com/mendersoftware/meta-mender/
+
+	  For more information on Manual U-Boot integration, see:
+	  https://docs.mender.io/2.6/system-updates-yocto-project/board-integration/bootloader-support/u-boot/manual-u-boot-integration
+
+	  For systems using Grub2 as the bootloader:
+	    - Mender depends on the mender-grubenv package.
+	    - The mender-grubenv package provides a fw_printenv script,
+	      which is not compatible with the uboot-tools fw_printenv
+	      script.
+
+	  The mender project recommends using uboot to load Grub2 as a
+	  secondary bootloader whenever possible. Using Grub2 as a
+	  secondary bootloader prevents users from porting the patches
+	  for uboot to each new device.
+
 	  https://github.com/mendersoftware/mender
 
 comment "mender needs a toolchain w/ threads"
