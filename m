From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 11 Mar 2012 17:51:18 +0100
Subject: [Buildroot] [PATCH 5/5] Microblaze: Added defconfig for Avnet S6LX9
	Microboard
Message-ID: <4F5CD806.6040209@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Hoffmann <sho@relinux.de>

---
 board/Avnet/Avnet_S6LX9_MicroBoard/README          |   64 +++++
 board/Avnet/Avnet_S6LX9_MicroBoard/TODO            |   19 ++
 board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu.dts     |  247 ++++++++++++++++++++
 .../Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu_defconfig |   68 ++++++
 configs/Avnet_S6LX9_MicroBoard_defconfig           |   17 ++
 5 files changed, 415 insertions(+), 0 deletions(-)
 create mode 100644 board/Avnet/Avnet_S6LX9_MicroBoard/README
 create mode 100644 board/Avnet/Avnet_S6LX9_MicroBoard/TODO
 create mode 100644 board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu.dts
 create mode 100644 board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu_defconfig
 create mode 100644 configs/Avnet_S6LX9_MicroBoard_defconfig

diff --git a/board/Avnet/Avnet_S6LX9_MicroBoard/README b/board/Avnet/Avnet_S6LX9_MicroBoard/README
new file mode 100644
index 0000000..a2e9247
--- /dev/null
+++ b/board/Avnet/Avnet_S6LX9_MicroBoard/README
@@ -0,0 +1,64 @@
+This is the buildroot board support for the Avnet Spartan6 LX9 MicroBoard.
+
+The board can be bought from Avnet or from Trenz for a low prize.
+
+To run the Linux built with buildroot you have to install the FPGA bitfile
+and the u-boot boot loader as described in the totorial available on
+
+    http://www.em.avnet.com/s6microboard
+
+The image file (default name is simpleImage.lx9_mmu.ub) has to be
+copied to your tftp folder (often /tftpboot/).
+
+Sample session:
+
+SPI Bootloader
+Loading binary image
+from flash @ address: 00060000
+to RAM address: 83f00000
+Done
+
+
+SDRAM :
+                Icache:ON
+                Dcache:ON
+        U-Boot Start:0x83f00000
+SF: Got idcode 20 ba 18 10 01
+*** Warning - bad CRC, using default environment
+
+Net:   Xilinx_Emaclite
+MAC:   00:0a:35:00:63:37
+U-BOOT for Avnet-LX9-Microboard-AXI-tiny-13.1
+
+BOOTP broadcast 1
+DHCP client bound to address 192.168.11.122
+Hit any key to stop autoboot:  0
+U-Boot-PetaLinux> tftp simpleImage.lx9_mmu.ub
+Using Xilinx_Emaclite device
+TFTP from server 192.168.11.10; our IP address is 192.168.11.122
+Filename 't.ub'.
+Load address: 0x80002000
+Loading: #################################################################
+         #################################################################
+         #################################################################
+         #################################################################
+         #################################################################
+         ##############################
+done
+Bytes transferred = 5207724 (4f76ac hex)
+U-Boot-PetaLinux> bootm
+## Booting kernel from Legacy Image at 80002000 ...
+   Image Name:   Linux-3.1.0
+   Image Type:   MicroBlaze Linux Kernel Image (uncompressed)
+   Data Size:    5207660 Bytes =  5 MB
+   Load Address: 80000000
+   Entry Point:  80000000
+   Verifying Checksum ... OK
+   Loading Kernel Image ... OK
+OK
+## Transferring control to Linux (at address 80000000), 0x80000000 ramdisk 0x00000000, FDT 0x00000000...
+Early console on uartlite at 0x40600000
+..... boot log skipped
+
+Welcome to Microblaze Buildroot
+Microblaze login:
diff --git a/board/Avnet/Avnet_S6LX9_MicroBoard/TODO b/board/Avnet/Avnet_S6LX9_MicroBoard/TODO
new file mode 100644
index 0000000..ca5ee94
--- /dev/null
+++ b/board/Avnet/Avnet_S6LX9_MicroBoard/TODO
@@ -0,0 +1,19 @@
+TODO list for the Spartan LX9 Microboard
+
+Generate u-boot within buildroot
+================================
+Currently, we need to use the u-boot provided by Avnet.
+
+Provide config files for qemu
+=============================
+
+Generate toolchain
+==================
+Currently the GNU toolchain provided by Xilinx has to be used.
+Xilinx does not provide a toolchain suitable to build a mmu-less
+Linux system, but omitting the mmu saved space within the FPGA.
+
+Bring up mmu-less system
+========================
+Hopefully this is easy as soon as we have a working toolchain
+with flt support.
diff --git a/board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu.dts b/board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu.dts
new file mode 100644
index 0000000..8ffedd9
--- /dev/null
+++ b/board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu.dts
@@ -0,0 +1,247 @@
+/*
+ * Device Tree Generator version: 1.3
+ *
+ * (C) Copyright 2007-2008 Xilinx, Inc.
+ * (C) Copyright 2007-2009 Michal Simek
+ *
+ * Michal SIMEK <monstr@monstr.eu>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 of
+ * the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ * MA 02111-1307 USA
+ *
+ * CAUTION: This file is automatically generated by libgen.
+ * Version: Xilinx EDK 13.2 EDK_O.61xd
+ *
+ * XPS project directory: device-tree_bsp_230-orig
+ */
+
+/dts-v1/;
+/ {
+    #address-cells = <1>;
+    #size-cells = <1>;
+    compatible = "xlnx,microblaze";
+    model = "testing";
+    MCB3_LPDDR: memory at 80000000 {
+        device_type = "memory";
+        reg = < 0x80000000 0x4000000 >;
+    } ;
+    aliases {
+        ethernet0 = &Ethernet_MAC;
+        serial0 = &USB_Uart;
+    } ;
+    chosen {
+        bootargs = "console=ttyUL0";
+        linux,stdout-path = "/axi at 0/serial at 40600000";
+    } ;
+    cpus {
+        #address-cells = <1>;
+        #cpus = <0x1>;
+        #size-cells = <0>;
+        microblaze_0: cpu at 0 {
+            clock-frequency = <66666667>;
+            compatible = "xlnx,microblaze-8.20.a";
+            d-cache-baseaddr = <0x80000000>;
+            d-cache-highaddr = <0x83ffffff>;
+            d-cache-line-size = <0x10>;
+            d-cache-size = <0x2000>;
+            device_type = "cpu";
+            i-cache-baseaddr = <0x80000000>;
+            i-cache-highaddr = <0x83ffffff>;
+            i-cache-line-size = <0x10>;
+            i-cache-size = <0x2000>;
+            model = "microblaze,8.20.a";
+            reg = <0>;
+            timebase-frequency = <66666667>;
+            xlnx,addr-tag-bits = <0xd>;
+            xlnx,allow-dcache-wr = <0x1>;
+            xlnx,allow-icache-wr = <0x1>;
+            xlnx,area-optimized = <0x0>;
+            xlnx,avoid-primitives = <0x0>;
+            xlnx,branch-target-cache-size = <0x0>;
+            xlnx,cache-byte-size = <0x2000>;
+            xlnx,d-axi = <0x1>;
+            xlnx,d-lmb = <0x1>;
+            xlnx,d-plb = <0x0>;
+            xlnx,data-size = <0x20>;
+            xlnx,dcache-addr-tag = <0xd>;
+            xlnx,dcache-always-used = <0x1>;
+            xlnx,dcache-byte-size = <0x2000>;
+            xlnx,dcache-data-width = <0x0>;
+            xlnx,dcache-force-tag-lutram = <0x0>;
+            xlnx,dcache-interface = <0x0>;
+            xlnx,dcache-line-len = <0x4>;
+            xlnx,dcache-use-fsl = <0x0>;
+            xlnx,dcache-use-writeback = <0x0>;
+            xlnx,dcache-victims = <0x0>;
+            xlnx,debug-enabled = <0x1>;
+            xlnx,div-zero-exception = <0x0>;
+            xlnx,dynamic-bus-sizing = <0x1>;
+            xlnx,ecc-use-ce-exception = <0x0>;
+            xlnx,edge-is-positive = <0x1>;
+            xlnx,endianness = <0x1>;
+            xlnx,family = "spartan6";
+            xlnx,fault-tolerant = <0x0>;
+            xlnx,fpu-exception = <0x0>;
+            xlnx,freq = <0x3f940ab>;
+            xlnx,fsl-data-size = <0x20>;
+            xlnx,fsl-exception = <0x0>;
+            xlnx,fsl-links = <0x0>;
+            xlnx,i-axi = <0x0>;
+            xlnx,i-lmb = <0x1>;
+            xlnx,i-plb = <0x0>;
+            xlnx,icache-always-used = <0x1>;
+            xlnx,icache-data-width = <0x0>;
+            xlnx,icache-force-tag-lutram = <0x0>;
+            xlnx,icache-interface = <0x0>;
+            xlnx,icache-line-len = <0x4>;
+            xlnx,icache-streams = <0x0>;
+            xlnx,icache-use-fsl = <0x0>;
+            xlnx,icache-victims = <0x0>;
+            xlnx,ill-opcode-exception = <0x0>;
+            xlnx,instance = "microblaze_0";
+            xlnx,interconnect = <0x2>;
+            xlnx,interconnect-m-axi-dc-aw-register = <0x0>;
+            xlnx,interconnect-m-axi-dc-read-issuing = <0x2>;
+            xlnx,interconnect-m-axi-dc-w-register = <0x0>;
+            xlnx,interconnect-m-axi-dc-write-issuing = <0x20>;
+            xlnx,interconnect-m-axi-dp-read-issuing = <0x1>;
+            xlnx,interconnect-m-axi-dp-write-issuing = <0x1>;
+            xlnx,interconnect-m-axi-ic-read-issuing = <0x2>;
+            xlnx,interconnect-m-axi-ip-read-issuing = <0x1>;
+            xlnx,interrupt-is-edge = <0x0>;
+            xlnx,lockstep-slave = <0x0>;
+            xlnx,mmu-dtlb-size = <0x1>;
+            xlnx,mmu-itlb-size = <0x1>;
+            xlnx,mmu-privileged-instr = <0x0>;
+            xlnx,mmu-tlb-access = <0x3>;
+            xlnx,mmu-zones = <0x2>;
+            xlnx,number-of-pc-brk = <0x1>;
+            xlnx,number-of-rd-addr-brk = <0x0>;
+            xlnx,number-of-wr-addr-brk = <0x0>;
+            xlnx,opcode-0x0-illegal = <0x0>;
+            xlnx,optimization = <0x0>;
+            xlnx,pvr = <0x0>;
+            xlnx,pvr-user1 = <0x0>;
+            xlnx,pvr-user2 = <0x0>;
+            xlnx,reset-msr = <0x0>;
+            xlnx,sco = <0x0>;
+            xlnx,stream-interconnect = <0x0>;
+            xlnx,unaligned-exceptions = <0x0>;
+            xlnx,use-barrel = <0x1>;
+            xlnx,use-branch-target-cache = <0x0>;
+            xlnx,use-dcache = <0x1>;
+            xlnx,use-div = <0x0>;
+            xlnx,use-ext-brk = <0x1>;
+            xlnx,use-ext-nm-brk = <0x1>;
+            xlnx,use-extended-fsl-instr = <0x0>;
+            xlnx,use-fpu = <0x0>;
+            xlnx,use-hw-mul = <0x1>;
+            xlnx,use-icache = <0x1>;
+            xlnx,use-interrupt = <0x1>;
+            xlnx,use-mmu = <0x3>;
+            xlnx,use-msr-instr = <0x1>;
+            xlnx,use-pcmp-instr = <0x0>;
+            xlnx,use-stack-protection = <0x0>;
+        } ;
+    } ;
+    axi4lite_0: axi at 0 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "xlnx,axi-interconnect-1.03.a", "simple-bus";
+        ranges ;
+        Ethernet_MAC: ethernet at 40e00000 {
+            compatible = "xlnx,axi-ethernetlite-1.00.a", "xlnx,xps-ethernetlite-1.00.a";
+            device_type = "network";
+            interrupt-parent = <&microblaze_0_intc>;
+            interrupts = < 2 0 >;
+            local-mac-address = [ 00 0a 35 aa de 00 ];
+//            phy-handle = <&phy0>;
+            reg = < 0x40e00000 0x10000 >;
+            xlnx,duplex = <0x1>;
+            xlnx,family = "spartan6";
+            xlnx,include-global-buffers = <0x0>;
+            xlnx,include-internal-loopback = <0x0>;
+            xlnx,include-mdio = <0x1>;
+            xlnx,include-phy-constraints = <0x1>;
+            xlnx,interconnect-s-axi-read-acceptance = <0x1>;
+            xlnx,interconnect-s-axi-write-acceptance = <0x1>;
+            xlnx,rx-ping-pong = <0x0>;
+            xlnx,s-axi-aclk-period-ps = <0x3a98>;
+            xlnx,s-axi-id-width = <0x1>;
+            xlnx,s-axi-supports-narrow-burst = <0x0>;
+            xlnx,tx-ping-pong = <0x0>;
+/*
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                phy0: phy at 7 {
+                    compatible = "marvell,88e1111";
+                    device_type = "ethernet-phy";
+                    reg = <7>;
+                } ;
+            } ;
+*/
+        } ;
+        SPI_FLASH: spi at 40a00000 {
+            compatible = "xlnx,axi-spi-1.01.a", "xlnx,xps-spi-2.00.a";
+            interrupt-parent = <&microblaze_0_intc>;
+            interrupts = < 1 2 >;
+            reg = < 0x40a00000 0x10000 >;
+            xlnx,family = "spartan6";
+            xlnx,fifo-exist = <0x1>;
+            xlnx,num-ss-bits = <0x1>;
+            xlnx,num-transfer-bits = <0x8>;
+            xlnx,sck-ratio = <0x4>;
+        } ;
+        USB_Uart: serial at 40600000 {
+            clock-frequency = <66666667>;
+            compatible = "xlnx,axi-uartlite-1.02.a", "xlnx,xps-uartlite-1.00.a";
+            current-speed = <115200>;
+            device_type = "serial";
+            interrupt-parent = <&microblaze_0_intc>;
+            interrupts = < 3 0 >;
+            port-number = <0>;
+            reg = < 0x40600000 0x10000 >;
+            xlnx,baudrate = <0x1c200>;
+            xlnx,data-bits = <0x8>;
+            xlnx,family = "spartan6";
+            xlnx,odd-parity = <0x1>;
+            xlnx,s-axi-aclk-freq-hz = <0x3f940ab>;
+            xlnx,use-parity = <0x0>;
+        } ;
+        microblaze_0_intc: interrupt-controller at 41200000 {
+            #interrupt-cells = <0x2>;
+            compatible = "xlnx,axi-intc-1.01.a", "xlnx,xps-intc-1.00.a";
+            interrupt-controller ;
+            reg = < 0x41200000 0x10000 >;
+            xlnx,kind-of-intr = <0xc>;
+            xlnx,num-intr-inputs = <0x4>;
+        } ;
+        system_timer: timer at 41c00000 {
+            clock-frequency = <66666667>;
+            compatible = "xlnx,axi-timer-1.02.a", "xlnx,xps-timer-1.00.a";
+            interrupt-parent = <&microblaze_0_intc>;
+            interrupts = < 0 2 >;
+            reg = < 0x41c00000 0x10000 >;
+            xlnx,count-width = <0x20>;
+            xlnx,family = "spartan6";
+            xlnx,gen0-assert = <0x1>;
+            xlnx,gen1-assert = <0x1>;
+            xlnx,one-timer-only = <0x0>;
+            xlnx,trig0-assert = <0x1>;
+            xlnx,trig1-assert = <0x1>;
+        } ;
+    } ;
+} ;
diff --git a/board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu_defconfig b/board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu_defconfig
new file mode 100644
index 0000000..5d01ca0
--- /dev/null
+++ b/board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu_defconfig
@@ -0,0 +1,68 @@
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_KALLSYMS_EXTRA_PASS=y
+# CONFIG_HOTPLUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_SHMEM is not set
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_OPT_LIB_ASM is not set
+CONFIG_KERNEL_BASE_ADDR=0x80000000
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan6"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+# CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR is not set
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_XILINX_MICROBLAZE0_HW_VER="8.20.a"
+CONFIG_HZ_100=y
+CONFIG_MMU=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_FORCE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_XILINX_EMACLITE=y
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_CIFS=y
+CONFIG_CIFS_STATS=y
+CONFIG_CIFS_STATS2=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_SLAB=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_INFO=y
+CONFIG_EARLY_PRINTK=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/configs/Avnet_S6LX9_MicroBoard_defconfig b/configs/Avnet_S6LX9_MicroBoard_defconfig
new file mode 100644
index 0000000..ec0dad2
--- /dev/null
+++ b/configs/Avnet_S6LX9_MicroBoard_defconfig
@@ -0,0 +1,17 @@
+BR2_microblaze=y
+BR2_microblazeel=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu_defconfig"
+BR2_LINUX_KERNEL_DTS_FILE="board/Avnet/Avnet_S6LX9_MicroBoard/lx9_mmu.dts"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="simpleImage.lx9_mmu"
-- 
1.7.0.4



-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
