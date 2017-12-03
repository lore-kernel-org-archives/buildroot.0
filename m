From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  3 Dec 2017 14:56:16 +0200
Subject: [Buildroot] [PATCH 5/8] odroidc2: add mainline genimage
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203125619.30919-5-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add mainline's image layout as it differs from the vendor's one because it doesn't
have the signed firmware bundled in the uboot image.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/genimage-mainline.cfg | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 board/hardkernel/odroidc2/genimage-mainline.cfg

diff --git a/board/hardkernel/odroidc2/genimage-mainline.cfg b/board/hardkernel/odroidc2/genimage-mainline.cfg
new file mode 100644
index 0000000000..77e4d6dd2f
--- /dev/null
+++ b/board/hardkernel/odroidc2/genimage-mainline.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"meson-gxbb-odroidc2.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "uboot-odc2.img"
+		offset = 49664
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
-- 
2.15.1
