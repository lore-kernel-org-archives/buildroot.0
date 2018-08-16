From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Aug 2018 22:11:39 +0200
Subject: [Buildroot] [PATCH 3/3] sheevaplug: add a basic readme
In-Reply-To: <20180816201139.19656-1-peter@korsgaard.com>
References: <20180816201139.19656-1-peter@korsgaard.com>
Message-ID: <20180816201139.19656-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Describing how to update the board.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/sheevaplug/readme.txt | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 board/sheevaplug/readme.txt

diff --git a/board/sheevaplug/readme.txt b/board/sheevaplug/readme.txt
new file mode 100644
index 0000000000..e0ed2684c9
--- /dev/null
+++ b/board/sheevaplug/readme.txt
@@ -0,0 +1,36 @@
+Sheevaplug
+==========
+
+Once the build process is finished you will have the following files
+in the output/images/ directory:
+
+- u-boot.kwb
+- uImage.kirkwood-sheevaplug
+- rootfs.jffs2
+
+Copy these to a TFTP server, connect ethernet and mini-USB cable and
+power up the board. Stop the board in U-Boot and update U-Boot by
+executing:
+
+setenv serverip <ipaddress-of-tftp-server>
+setenv bootfile <path/to/u-boot.kwb>
+bootp
+nand erase 0x0 0x80000
+nand write $fileaddr 0x0 0x80000
+reset
+
+Once the new U-Boot boots up, stop it again and update Linux kernel
+and rootfs by:
+
+setenv serverip <ipaddress-of-tftp-server>
+setenv bootfile <path/to/uImage.kirkwood-sheevaplug>
+bootp
+nand erase.part kernel
+nand write $fileaddr kernel 0x400000
+
+setenv bootfile <path/to/rootfs.jffs2>
+bootp
+nand erase.part rootfs
+nand write $fileaddr rootfs $filesize
+
+reset
-- 
2.11.0
