From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Wed, 21 Oct 2015 10:57:06 +0200
Subject: [Buildroot] [PATCH v2] board/freescale: switch create-boot-sd.sh to
	parted
In-Reply-To: <CAAMH-ysuKMKY6AXbtJqALq0jr3fs1-j0e_Pf=Qrm8BvUuTimKg@mail.gmail.com>
References: <CAAMH-ysuKMKY6AXbtJqALq0jr3fs1-j0e_Pf=Qrm8BvUuTimKg@mail.gmail.com>
Message-ID: <1445417826-9634-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with version 2.26, sfdisk defaults to a unit of 512 B sectors.
With those recent versions of sfdisk, the create-boot-sd.sh script ends
up creating a boot partition of 240 KB, which is too small to contain a
Linux kernel.

As it is difficult to address both pre and post v2.26 sfdisk versions in
a single command, we change the create-boot-sd.sh script to use parted
instead. While at it, we set the boot partition size to 64 MB, which
should be enough for everyone.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>

---


Hi,

This is a second proposal, using parted this time. Even with sfdisk
`--unit' parameter, I could not find an eleguant solution to support all
versions of sfdisk, sorry. Please let me know if you find switching to
parted acceptable.

This is tested on Sabre AI with an i.MX6 Quad.

Best regards,

V.


Changes in v2
-------------
- Switch to parted, as advised by Gary.
- Fix spelling in commit message, spotted by Luca.


 board/freescale/create-boot-sd.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/freescale/create-boot-sd.sh b/board/freescale/create-boot-sd.sh
index af45115..d80bd52 100755
--- a/board/freescale/create-boot-sd.sh
+++ b/board/freescale/create-boot-sd.sh
@@ -59,10 +59,12 @@ sync
 # - Bootloader at offset 1024
 # - FAT partition starting at 1MB offset, containing uImage and *.dtb
 # - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
-sfdisk ${DEV} <<EOF
-32,480,b
-512,,L
-EOF
+parted --script "${DEV}" \
+       mklabel msdos \
+       unit MiB \
+       mkpart primary fat16 1 64 \
+       mkpart primary ext2 64 100% \
+       print
 
 sync
 
-- 
2.6.1
