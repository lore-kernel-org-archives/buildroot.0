From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:47:15 +0100
Subject: [Buildroot] [git commit] configs: add defconfig for Nationalchip
	gx6605s dev board
Message-ID: <20170320214725.9DAC782618@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a4131d101cf0d8bc35ce15672524f144c925fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
[Thomas: drop post-image script copying the gdbinit file, and suggest
to use gdb -x option instead to point to the gdbinit file in board/.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                 |  1 +
 DEVELOPERS                     |  2 +
 board/csky/gx6605s/gdbinit     | 25 ++++++++++++
 board/csky/readme.txt          | 87 ++++++++++++++++++++++++++++++++++++++++++
 configs/csky_gx6605s_defconfig | 17 +++++++++
 5 files changed, 132 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cb9e6fc..678cb69 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -86,6 +86,7 @@ beaglebone_defconfig: *defconfig
 beaglebone_qt5_defconfig: *defconfig
 chromebook_snow_defconfig: *defconfig
 ci20_defconfig: *defconfig
+csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
 firefly_rk3288_defconfig: *defconfig
 firefly_rk3288_demo_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index ad30895..ddd9b6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -612,6 +612,8 @@ F:	package/liquid-dsp/
 
 N:	Guo Ren <ren_guo@c-sky.com>
 F:	arch/Config.in.csky
+F:	board/csky/
+F:	configs/csky_*
 
 N:	Gustavo Zacarias <gustavo@zacarias.com.ar>
 F:	arch/Config.in.powerpc
diff --git a/board/csky/gx6605s/gdbinit b/board/csky/gx6605s/gdbinit
new file mode 100644
index 0000000..d602aad
--- /dev/null
+++ b/board/csky/gx6605s/gdbinit
@@ -0,0 +1,25 @@
+tar jtag jtag://127.0.0.1:1025
+reset
+
+# setup CCR (Cache Config Reg)
+# 0-1:MP,2:IE,3:DE,4:WB,5:RS,6:Z,7:BE
+set $cr18 = 0x7d
+
+# vendor custom setup, double cache line & preload
+set $cr30 = 0xc
+
+# pin mux for serial8250
+set *(unsigned int *) 0xa030a14c |= (1 << 22) | (1 << 23)
+
+# pass devicetree blob
+# r2 is magic
+# r3 is address
+set $r2 = 0x20150401
+set $r3 = 0x92000000
+restore gx6605s.dtb binary 0x92000000
+
+# flush cache
+set $cr17 = 0x33
+
+load
+
diff --git a/board/csky/readme.txt b/board/csky/readme.txt
new file mode 100644
index 0000000..a820e3b
--- /dev/null
+++ b/board/csky/readme.txt
@@ -0,0 +1,87 @@
+C-SKY Development Kit
+
+Intro
+=====
+
+C-SKY is a CPU Architecture from www.c-sky.com and has it own instruction set.
+Just like arm and mips in linux/arch, it named as 'csky'.
+
+gx6605s develop board is made by Hangzhou Nationalchip and C-SKY.
+
+Hardware Spec:
+  * CPU: ck610 up to 594Mhz
+  * Integrate with 64MB ddr2 in SOC.
+  * Integrate with hardware Jtag.
+  * Integrate with usb-to-serial chip.
+  * USB ehci controller in SOC.
+  * Power Supply: DC 5V from two micro-usb.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+The csky_gx6605s_defconfig configuration is a sample configuration with
+all that is required to bring the gx6605s Development Board:
+
+  $ make csky_gx6605s_defconfig
+
+Build everything
+----------------
+
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    ????????? vmlinux
+    ????????? rootfs.ext2
+    ????????? <board name>.dtb
+
+How to run it
+=============
+
+Prepare Jtag-Server
+-------------------
+
+  Download the Jtag-Server here:
+
+  https://github.com/c-sky/tools/raw/master/DebugServerConsole-linux-x86_64-V4.2.00-20161213.tar.gz
+
+  Go to the unpacked directory:
+
+  $./DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
+
+  Perhaps you need to use "sudo", which need libusb to detect c510:b210
+
+  $ sudo ./DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
+
+Prepare USB drive
+-----------------
+
+  You sould determine which device associated to the usb drive
+  carefully. eg:
+
+  $ cat /proc/partitions
+   8       48    1971712 sdd
+   8       49     976720 sdd1
+
+  $ sudo dd if=rootfs.ext2 of=/dev/sdd1
+  $ sudo sync
+
+Run
+---
+
+  Plug the usb drive on gx6605s dev board.
+
+  Setup the Console with the rate 115200/8-N-1.
+
+  $ ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux
+
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
new file mode 100644
index 0000000..5f39c53
--- /dev/null
+++ b/configs/csky_gx6605s_defconfig
@@ -0,0 +1,17 @@
+BR2_csky=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/314c498ddc8c43a66ca96ff3af7da98e10fa1cc6.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"
+BR2_TARGET_ROOTFS_EXT2=y
