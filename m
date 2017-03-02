From: Guo Ren <ren_guo@c-sky.com>
Date: Thu,  2 Mar 2017 21:03:48 +0800
Subject: [Buildroot] [PATCH 1/3] configs: add defconfig for Nationalchip
	gx6605s dev board.
Message-ID: <1488459830-18097-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 DEVELOPERS                     |   4 ++
 board/csky/gx6605s/gdbinit     |  25 ++++++++++
 board/csky/post-image.sh       |   4 ++
 board/csky/readme.txt          | 106 +++++++++++++++++++++++++++++++++++++++++
 configs/csky_gx6605s_defconfig |  19 ++++++++
 5 files changed, 158 insertions(+)
 create mode 100644 board/csky/gx6605s/gdbinit
 create mode 100755 board/csky/post-image.sh
 create mode 100644 board/csky/readme.txt
 create mode 100644 configs/csky_gx6605s_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bf07c3..6495a9e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -592,6 +592,10 @@ F:	package/sdl2/
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 
+N:	Guo Ren <ren_guo@c-sky.com>
+F:	board/csky
+F:	configs/csky_*
+
 N:	Gustavo Zacarias <gustavo@zacarias.com.ar>
 F:	arch/Config.in.powerpc
 F:	board/qemu/
diff --git a/board/csky/gx6605s/gdbinit b/board/csky/gx6605s/gdbinit
new file mode 100644
index 0000000..0a6d8ab
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
diff --git a/board/csky/post-image.sh b/board/csky/post-image.sh
new file mode 100755
index 0000000..7bead4f
--- /dev/null
+++ b/board/csky/post-image.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# copy board/csky/xxx/gdbinit to images/.gdbinit for
+BOARD_DIR="$(dirname $0)"
+cp -af $BOARD_DIR/${2}/gdbinit $BINARIES_DIR/.gdbinit
diff --git a/board/csky/readme.txt b/board/csky/readme.txt
new file mode 100644
index 0000000..f670773
--- /dev/null
+++ b/board/csky/readme.txt
@@ -0,0 +1,106 @@
+C-SKY Development Kit
+
+Intro
+=====
+
+C-SKY is a CPU Architecture from www.c-sky.com and has it own instruction set.
+Just like arm and mips in linux/arch, it named as 'csky'.
+
+For C-SKY linux kernel it's made up of three components:
+1. linux/arch/csky contains the CPU related linux arch implement, eg: mmu,
+   task-switch, cache control, ... default git repo is here:
+
+   http://github.com/c-sky/csky-linux
+
+2. linux/addons contains the SOC's drivers which haven't committed in official
+   linux source code, but we really need them to make the board run.
+   Here is the default addons git repo:
+
+   http://github.com/c-sky/csky-addons
+
+   Some C-SKY soc vendor has it own addons git repo. And you can specify
+   the git-repo in buildroot configuration.
+
+3. Official Linux kernel source from www.kernel.org :)
+
+Buildroot will download cross compiler tools and make them together building,
+finally setup the rootfs with the packages which spicified in buildroot 
+configuration.
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
+  $ make # All will be done, just wait :)
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    ??? vmlinux
+    ??? rootfs.tar
+    ??? <board name>.dtb
+    ??? .gdbinit
+
+How to run it
+=============
+
+1. Download the Jtag-Server here:
+
+   https://pan.baidu.com/s/1o7VEPbO
+
+   install it and run it:
+
+   $ DebugServerConsole -ddc -rstwait 1000 -prereset -port 1025
+
+2. Prepare the nfs-server in your linux PC. You can get the step in google, we
+   don't mention it here.
+
+   Then extract output/images/rootfs.tar to your nfsroot.
+
+3. Modified the bootargs in board/csky/<board>/<board>.dts'. You should
+   specify the correct nfsroot= and ip=, for example in gx6605s.dts:
+
+	chosen {
+   		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/nfs\
+rw nfsroot=192.168.101.230:/opt/nfs/test,v3,tcp,nolock ip=192.168.101.25";
+	}
+
+   You need cd to buildroot dir and '$ make' again to update the dts in
+   output/images
+
+
+4. Setup the Console with the rate 115200/8-N-1.
+
+5. cd to the output/images and run.
+
+   For gx6605s, you need plug a usb ethernet card:
+   $csky-linux-gdb vmlinux
+
+Finish
+======
+
+Any question contact me here:
+
+ren_guo at c-sky.com
+
+-----------
+Best Regards
+
+Guo Ren
+
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
new file mode 100644
index 0000000..ad99b6c
--- /dev/null
+++ b/configs/csky_gx6605s_defconfig
@@ -0,0 +1,19 @@
+BR2_csky=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/csky/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="gx6605s"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/3549ac308d427b0adb98b410d0acd82449fb5c13.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"
-- 
1.9.1
