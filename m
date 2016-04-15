From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 15 Apr 2016 14:59:57 +0200
Subject: [Buildroot] [PATCH] board: add a readme for Armadeus boards.
Message-ID: <1460725197-29678-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Common readme.txt for all supported Armadeus boards.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 board/armadeus/readme.txt | 83 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 board/armadeus/readme.txt

diff --git a/board/armadeus/readme.txt b/board/armadeus/readme.txt
new file mode 100644
index 0000000..57b6998
--- /dev/null
+++ b/board/armadeus/readme.txt
@@ -0,0 +1,83 @@
+Intro
+=====
+
+Armadeus APFxx are Systems On Module (SOM) based on Freescale/NXP i.MX
+processors associated with an FPGA (except on APF28). Non volatile data are
+stored in on-module NOR or NAND Flash, depending on the model.
+These SOM can be used on Armadeus development boards or with custom docking
+boards.
+
+Supported platforms
+===================
+
+Buildroot currently supports the following Armadeus platforms with the
+associated defconfigs:
+ * APF9328 SOM + devt boards -> armadeus_apf9328_defconfig
+ * APF27 SOM + devt board    -> armadeus_apf27_defconfig
+ * APF51 SOM + devt board    -> armadeus_apf51_defconfig
+ * APF28 SOM + devt board    -> armadeus_apf28_defconfig
+
+Vanilla Linux versions are preferred to Freescale's one in these
+configurations.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+Let's say you own an APFxx SOM with it's corresponding development board, all
+you have to do is:
+
+  $ make armadeus_apfxx_defconfig
+where "apfxx" is the version of your SOM.
+
+Launch build
+------------
+
+  $ make
+
+Result of the build
+-------------------
+
+When build is finished you will endup with:
+    output/images/
+    ??? imx**-apfxxdev.dtb	[1]
+    ??? rootfs.jffs2		[2]
+    ??? rootfs.tar
+    ??? rootfs.ubi		[2]
+    ??? rootfs.ubifs		[2]
+    ??? uImage
+
+[1] Only if kernel version of SOM is supporting device tree.
+[2] .ubi/.ubifs images are not available on APF9328 and replaced by a .jffs2
+    one in this case.
+
+U-Boot building is currently not supported in these configurations.
+
+Installation
+============
+
+You will require a serial connection to the board and a TFTP server on your
+Host PC. Supposing your server is configured for exporting /tftpboot/
+directory, you will have to copy generated images to it:
+
+  $ cp output/images/uImage /tftpboot/apfxx-linux.bin
+  $ cp output/images/*.dtb /tftpboot/
+  $ cp output/images/rootfs.ubi /tftpboot/apfxx-rootfs.ubi
+  $ cp output/images/rootfs.jffs2 /tftpboot/apfxx-rootfs.jffs2
+where "apfxx" is the version of your SOM, as used with _defconfigs.
+
+Then on your serial terminal, all you have to do is:
+* interrupt the boot process and access U-Boot console by pressing any key
+  when booting,
+* configure board and server IP addresses with "ipaddr" and "serverip" envt
+  variables,
+* if you want to update kernel:
+  BIOS > run update_kernel
+* if you want to update device tree:
+  BIOS > run update_dtb
+* if you want to update rootfs:
+  BIOS > run update_rootfs
+
+That's it !
-- 
2.1.4
