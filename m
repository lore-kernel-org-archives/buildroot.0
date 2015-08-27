From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 27 Aug 2015 23:22 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
	on first boot
In-Reply-To: <55DED20A.5030800@wsystem.com>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
 <55DED20A.5030800@wsystem.com>
Message-ID: <5881659.QqO7LoEYvS@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Beno?t,

On Thursday 27 August 2015 11:02:02 Beno?t Th?baudeau wrote:
> Hi Vivien, Yann, all,
> 
> On 22/08/2015 22:01, Beno?t Th?baudeau wrote:
[...]
> So the initial contents of the unused space on the SD card seem to have an
> influence, and there seems to be a bug somewhere (Linux, resize2fs,
> genext2fs, tune2fs, or lack of call to e2fsck before calling resize2fs but
> this would not be reliable with an online partition).
> 
> Then I retried with a 16-GiB SD card on a Raspberry Pi B, and it was very
> slow too. Same if the resize is performed on a PC. However, it's very quick
> with raspi-config and the latest Raspbian image. The main difference seemed
> to be the block size (4 KiB on Raspbian vs. 1 KiB with mke2img), so I
> hacked mke2img to test with genext2fs -B 4096 and tune2fs -J size=4, but it
> did not make things faster, only the image bigger (about 512 MiB, probably
> the minimal size for 4-KiB blocks). So I don't know which ones, but it's
> probably some ext4 parameters that are having an influence on the resize2fs
> speed here. Any idea?
Yes, I have an idea :-) Did you try sparse_super?

In fact a did nearly same task a few month ago and I found same problem. For 
information, I use following script to fill disk with last partition:

diff --git 1/sdflash.sh 2/sdflash.sh
new file mode 100755
index 0000000..5f9a9d5
--- /dev/null
+++ 2/sdflash.sh
@@ -0,0 +1,48 @@
+#!/bin/bash
+#
+# Copy a disk image to sdcard card and resize last partition in order to use
+# whole disk
+#
+
+device=$1
+image=$2
+
+if [ "$device" = "" ]; then
+    echo "Usage: $0 DEVICE IMAGE"
+    echo "Example: $0 /dev/sdd images/disk.img"
+    exit 1
+fi
+
+sfdisk -R $device       || exit 1
+echo "Copying $image to $device"
+dd if=$image of=$device conv=fsync,notrunc || exit 1
+sfdisk -R $device       || exit 1
+for part in 4 3 2 1; do
+    for file in $device$part ${device}p${part}; do
+        if [ -e $file ]; then
+            ID=$(sfdisk --print-id $device $part)
+            if [[ "0x$ID" -eq 0x83 ]]; then
+                e2fsck -f $file
+                [ $? -le 1 ] || exit 1
+                tune2fs -O sparse_super -c 0 -i 0 $file
+                [ $? -eq 0 ] || exit 1
+                e2fsck -yf $file > /dev/null
+                [ $? -le 1 ] || exit 1
+                sleep 1
+                echo ',+,' | sfdisk -L -D -uM -N $part $device
+                [ $? -eq 0 ] || exit 1
+                resize2fs $file
+                [ $? -eq 0 ] || exit 1
+                e2fsck -f $file
+                [ $? -le 1 ] || exit 1
+                exit 0
+            else
+                echo "Unknown partition type"
+                exit 1
+            fi
+        fi
+    done
+done
+echo "Cannot find partition on $device"
+exit 1
+


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
