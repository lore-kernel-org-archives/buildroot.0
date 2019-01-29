From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:05 +0000
Subject: [Buildroot] [PATCH 4/8] board/raspberrypi: post-image,
 include .config kernel target.
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-5-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Read the .config file to find if either a zImage or an Image is
being built, and include them in the final fat volume if so.

This change means that the config files specific for each version
of the pi are now empty. So they are removed.

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/post-image.sh        | 9 +++++++++
 board/raspberrypi/raspberrypi.conf     | 3 ---
 board/raspberrypi/raspberrypi0.conf    | 3 ---
 board/raspberrypi/raspberrypi0w.conf   | 3 ---
 board/raspberrypi/raspberrypi2.conf    | 3 ---
 board/raspberrypi/raspberrypi3-64.conf | 3 ---
 board/raspberrypi/raspberrypi3.conf    | 3 ---
 7 files changed, 9 insertions(+), 18 deletions(-)
 delete mode 100644 board/raspberrypi/raspberrypi.conf
 delete mode 100644 board/raspberrypi/raspberrypi0.conf
 delete mode 100644 board/raspberrypi/raspberrypi0w.conf
 delete mode 100644 board/raspberrypi/raspberrypi2.conf
 delete mode 100644 board/raspberrypi/raspberrypi3-64.conf
 delete mode 100644 board/raspberrypi/raspberrypi3.conf

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 900bf1eae2..c082dada3c 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -70,6 +70,15 @@ do
 	FILES+=( "$(basename $dts).dtb" )
 done
 
+# Pull the kernel target from the .config file.
+eval `egrep '^BR2_LINUX_KERNEL_Z?IMAGE=y$' .config`
+if [ "${BR2_LINUX_KERNEL_IMAGE}" = 'y' ]; then
+	FILES+=( "Image" )
+fi
+if [ "${BR2_LINUX_KERNEL_ZIMAGE}" = 'y' ]; then
+	FILES+=( "zImage" )
+fi
+
 for i in ${!FILES[*]}
 do
 	FILES[$i]="\"${FILES[$i]}\","
diff --git a/board/raspberrypi/raspberrypi.conf b/board/raspberrypi/raspberrypi.conf
deleted file mode 100644
index 7b511fd0fc..0000000000
--- a/board/raspberrypi/raspberrypi.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-FILES=(
-	"zImage"
-)
diff --git a/board/raspberrypi/raspberrypi0.conf b/board/raspberrypi/raspberrypi0.conf
deleted file mode 100644
index 7b511fd0fc..0000000000
--- a/board/raspberrypi/raspberrypi0.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-FILES=(
-	"zImage"
-)
diff --git a/board/raspberrypi/raspberrypi0w.conf b/board/raspberrypi/raspberrypi0w.conf
deleted file mode 100644
index 7b511fd0fc..0000000000
--- a/board/raspberrypi/raspberrypi0w.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-FILES=(
-	"zImage"
-)
diff --git a/board/raspberrypi/raspberrypi2.conf b/board/raspberrypi/raspberrypi2.conf
deleted file mode 100644
index 7b511fd0fc..0000000000
--- a/board/raspberrypi/raspberrypi2.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-FILES=(
-	"zImage"
-)
diff --git a/board/raspberrypi/raspberrypi3-64.conf b/board/raspberrypi/raspberrypi3-64.conf
deleted file mode 100644
index 6e810367d0..0000000000
--- a/board/raspberrypi/raspberrypi3-64.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-FILES=(
-	"Image"
-)
diff --git a/board/raspberrypi/raspberrypi3.conf b/board/raspberrypi/raspberrypi3.conf
deleted file mode 100644
index 7b511fd0fc..0000000000
--- a/board/raspberrypi/raspberrypi3.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-FILES=(
-	"zImage"
-)
-- 
2.11.0
