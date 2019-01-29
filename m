From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:04 +0000
Subject: [Buildroot] [PATCH 3/8] board/raspberrypi: post-image,
 include .config dfs files.
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-4-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change pulls dts filenames from the .config file instead of
specifying the required dts files in a board config file.
This reduces duplication and makes it possible to specify different
dts files in the config file to have it appear in the resultant
image. You would want to do so if you were using mainline kernel
sources.

The device tree declarations were removed from the board .conf files.

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/post-image.sh        | 7 +++++++
 board/raspberrypi/raspberrypi.conf     | 3 ---
 board/raspberrypi/raspberrypi0.conf    | 1 -
 board/raspberrypi/raspberrypi0w.conf   | 1 -
 board/raspberrypi/raspberrypi2.conf    | 1 -
 board/raspberrypi/raspberrypi3-64.conf | 3 ---
 board/raspberrypi/raspberrypi3.conf    | 3 ---
 7 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 5cc25a9ac6..900bf1eae2 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -63,6 +63,13 @@ if $INCLUDE_OVERLAYS; then
 	FILES+=( "rpi-firmware/overlays" )
 fi
 
+# Pull device tree names from the .config file.
+eval `grep BR2_LINUX_KERNEL_INTREE_DTS_NAME .config`
+for dts in $BR2_LINUX_KERNEL_INTREE_DTS_NAME
+do
+	FILES+=( "$(basename $dts).dtb" )
+done
+
 for i in ${!FILES[*]}
 do
 	FILES[$i]="\"${FILES[$i]}\","
diff --git a/board/raspberrypi/raspberrypi.conf b/board/raspberrypi/raspberrypi.conf
index 962cf726e2..7b511fd0fc 100644
--- a/board/raspberrypi/raspberrypi.conf
+++ b/board/raspberrypi/raspberrypi.conf
@@ -1,6 +1,3 @@
 FILES=(
-	"bcm2708-rpi-b.dtb"
-	"bcm2708-rpi-b-plus.dtb"
-	"bcm2708-rpi-cm.dtb"
 	"zImage"
 )
diff --git a/board/raspberrypi/raspberrypi0.conf b/board/raspberrypi/raspberrypi0.conf
index 132540b543..7b511fd0fc 100644
--- a/board/raspberrypi/raspberrypi0.conf
+++ b/board/raspberrypi/raspberrypi0.conf
@@ -1,4 +1,3 @@
 FILES=(
-	"bcm2708-rpi-b-plus.dtb"
 	"zImage"
 )
diff --git a/board/raspberrypi/raspberrypi0w.conf b/board/raspberrypi/raspberrypi0w.conf
index 27b4ec2399..7b511fd0fc 100644
--- a/board/raspberrypi/raspberrypi0w.conf
+++ b/board/raspberrypi/raspberrypi0w.conf
@@ -1,4 +1,3 @@
 FILES=(
-	"bcm2708-rpi-0-w.dtb"
 	"zImage"
 )
diff --git a/board/raspberrypi/raspberrypi2.conf b/board/raspberrypi/raspberrypi2.conf
index ea7d2402a6..7b511fd0fc 100644
--- a/board/raspberrypi/raspberrypi2.conf
+++ b/board/raspberrypi/raspberrypi2.conf
@@ -1,4 +1,3 @@
 FILES=(
-	"bcm2709-rpi-2-b.dtb"
 	"zImage"
 )
diff --git a/board/raspberrypi/raspberrypi3-64.conf b/board/raspberrypi/raspberrypi3-64.conf
index 11cb88e191..6e810367d0 100644
--- a/board/raspberrypi/raspberrypi3-64.conf
+++ b/board/raspberrypi/raspberrypi3-64.conf
@@ -1,6 +1,3 @@
 FILES=(
-	"bcm2710-rpi-3-b.dtb"
-	"bcm2710-rpi-3-b-plus.dtb"
-	"bcm2837-rpi-3-b.dtb"
 	"Image"
 )
diff --git a/board/raspberrypi/raspberrypi3.conf b/board/raspberrypi/raspberrypi3.conf
index 51df913860..7b511fd0fc 100644
--- a/board/raspberrypi/raspberrypi3.conf
+++ b/board/raspberrypi/raspberrypi3.conf
@@ -1,6 +1,3 @@
 FILES=(
-	"bcm2710-rpi-3-b.dtb"
-	"bcm2710-rpi-3-b-plus.dtb"
-	"bcm2710-rpi-cm3.dtb"
 	"zImage"
 )
-- 
2.11.0
