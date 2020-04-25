From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2020 21:58:47 +0200
Subject: [Buildroot] [PATCH 1/2] board/qemu/microblaze: convert kernel patch
 to git format
Message-ID: <20200425195848.205599-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert the patch for microblaze kernel added for kernel 3.14 by
Waldemar to git format.

Note: the Waldemar Sob line is missing in the original patch:
fa2798548368d51998fad18d7f6d1ae0ed065b33

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 ...xilinx-xemaclite-add-2.00.b-revision.patch | 34 +++++++++++++++++++
 .../microblazebe-mmu/xilinx-xemaclite.patch   | 11 ------
 ...xilinx-xemaclite-add-2.00.b-revision.patch | 34 +++++++++++++++++++
 .../microblazeel-mmu/xilinx-xemaclite.patch   | 11 ------
 configs/qemu_microblazebe_mmu_defconfig       |  2 +-
 configs/qemu_microblazeel_mmu_defconfig       |  2 +-
 6 files changed, 70 insertions(+), 24 deletions(-)
 create mode 100644 board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
 delete mode 100644 board/qemu/microblazebe-mmu/xilinx-xemaclite.patch
 create mode 100644 board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
 delete mode 100644 board/qemu/microblazeel-mmu/xilinx-xemaclite.patch

diff --git a/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch b/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
new file mode 100644
index 0000000000..eb3859f858
--- /dev/null
+++ b/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
@@ -0,0 +1,34 @@
+From e96b73478232aa42b773cd19371808af69fd4b95 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 25 Apr 2020 09:49:11 +0200
+Subject: [PATCH] net: xilinx: xemaclite: add 2.00.b revision
+
+Patch added for the kernel 3.14
+- fix networking in Qemu using a small patch
+- disable DTS, because linux.bin does not include any DTB the
+  default Qemu included DTB is used and this is okay and works fine
+
+https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
+
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Waldemar Brodkorb <wbx@openadk.org>
+---
+ drivers/net/ethernet/xilinx/xilinx_emaclite.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+index 0de52e70abcc..d8c13140ca77 100644
+--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
++++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+@@ -1278,6 +1278,7 @@ static const struct of_device_id xemaclite_of_match[] = {
+ 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
++	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
+ 	{ /* end of list */ },
+-- 
+2.25.3
+
diff --git a/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch b/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch
deleted file mode 100644
index 756bfaea97..0000000000
--- a/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -Nur linux-3.14.orig/drivers/net/ethernet/xilinx/xilinx_emaclite.c linux-3.14/drivers/net/ethernet/xilinx/xilinx_emaclite.c
---- linux-3.14.orig/drivers/net/ethernet/xilinx/xilinx_emaclite.c	2014-03-31 05:40:15.000000000 +0200
-+++ linux-3.14/drivers/net/ethernet/xilinx/xilinx_emaclite.c	2014-04-11 22:53:42.000000000 +0200
-@@ -1249,6 +1249,7 @@
- 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
-+	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
- 	{ /* end of list */ },
diff --git a/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch b/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
new file mode 100644
index 0000000000..eb3859f858
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
@@ -0,0 +1,34 @@
+From e96b73478232aa42b773cd19371808af69fd4b95 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 25 Apr 2020 09:49:11 +0200
+Subject: [PATCH] net: xilinx: xemaclite: add 2.00.b revision
+
+Patch added for the kernel 3.14
+- fix networking in Qemu using a small patch
+- disable DTS, because linux.bin does not include any DTB the
+  default Qemu included DTB is used and this is okay and works fine
+
+https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
+
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Waldemar Brodkorb <wbx@openadk.org>
+---
+ drivers/net/ethernet/xilinx/xilinx_emaclite.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+index 0de52e70abcc..d8c13140ca77 100644
+--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
++++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+@@ -1278,6 +1278,7 @@ static const struct of_device_id xemaclite_of_match[] = {
+ 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
++	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
+ 	{ /* end of list */ },
+-- 
+2.25.3
+
diff --git a/board/qemu/microblazeel-mmu/xilinx-xemaclite.patch b/board/qemu/microblazeel-mmu/xilinx-xemaclite.patch
deleted file mode 100644
index 756bfaea97..0000000000
--- a/board/qemu/microblazeel-mmu/xilinx-xemaclite.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -Nur linux-3.14.orig/drivers/net/ethernet/xilinx/xilinx_emaclite.c linux-3.14/drivers/net/ethernet/xilinx/xilinx_emaclite.c
---- linux-3.14.orig/drivers/net/ethernet/xilinx/xilinx_emaclite.c	2014-03-31 05:40:15.000000000 +0200
-+++ linux-3.14/drivers/net/ethernet/xilinx/xilinx_emaclite.c	2014-04-11 22:53:42.000000000 +0200
-@@ -1249,6 +1249,7 @@
- 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
-+	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
- 	{ /* end of list */ },
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index d14d2fcf65..ad741fec7f 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -24,7 +24,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.91"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
-BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
+BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 71018e9e36..0bd117d536 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -24,7 +24,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.91"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
-BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
+BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
-- 
2.25.3
