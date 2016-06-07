From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:31:08 +0200
Subject: [Buildroot] [git commit] configs/beaglebone: Add missing
	genimage.cfg file
Message-ID: <20160607193114.4169B81871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=828c4ab06c89c2e1e615ebf0b49d0fd286f8b49c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7d0b7d3c27a6 ("configs/beaglebone: Use genimage
to produce the SD card image") introduce genimage usage,
but forgot to add the genimage config file. Fix it.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/beaglebone/genimage.cfg | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
new file mode 100644
index 0000000..0c29a80
--- /dev/null
+++ b/board/beaglebone/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"uEnv.txt",
+			"am335x-bone.dtb",
+			"am335x-boneblack.dtb"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
