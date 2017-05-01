From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 May 2017 12:24:36 +0200
Subject: [Buildroot] [PATCH v3 1/3] board: add stm32f429-disc1 config
Message-ID: <20170501102438.9403-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change renders the stm32f429discovery a bit more generic and reuse most
of its settings for the stm32f429-disc1 board.

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Davide Viti <zinosat@tiscali.it>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- fix cc emails

changes v2 -> v3:
- remove symlink (ThomasP)
- list supported board in readme file (ThomasP)
---
 board/stmicroelectronics/stm32f429-disco/flash.sh   | 10 ++++++++--
 board/stmicroelectronics/stm32f429-disco/readme.txt |  9 ++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32f429-disco/flash.sh
index ffb8fcffa..74021369a 100755
--- a/board/stmicroelectronics/stm32f429-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f429-disco/flash.sh
@@ -1,14 +1,20 @@
 #!/bin/bash
 
 OUTPUT_DIR=$1
+BOARD_NAME=${2:-stm32f429discovery}
 
 if ! test -d "${OUTPUT_DIR}" ; then
     echo "ERROR: no output directory specified."
-    echo "Usage: $0 OUTPUT_DIR"
+    echo "Usage: $0 OUTPUT_DIR BOARD_NAME"
+    echo ""
+    echo "Arguments:"
+    echo "    OUTPUT_DIR    The Buildroot output directory."
+    echo "    BOARD_NAME    One of the available boards among:"
+    echo "                  stm32f429discovery, stm32f429disc1"
     exit 1
 fi
 
-${OUTPUT_DIR}/host/usr/bin/openocd -f board/stm32f429discovery.cfg \
+${OUTPUT_DIR}/host/usr/bin/openocd -f board/${BOARD_NAME}.cfg \
   -c "init" \
   -c "reset init" \
   -c "flash probe 0" \
diff --git a/board/stmicroelectronics/stm32f429-disco/readme.txt b/board/stmicroelectronics/stm32f429-disco/readme.txt
index 43a25b420..f512cb2e9 100644
--- a/board/stmicroelectronics/stm32f429-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f429-disco/readme.txt
@@ -4,6 +4,12 @@ STM32F429 Discovery
 This tutorial describes how to use the predefined Buildroot
 configuration for the STM32F429 Discovery evaluation platform.
 
+Supported HW
+------------
+
+ - STM32F429I-DISCO evaluation board
+ - STM32F429I-DISC1 evaluation board
+
 Building
 --------
 
@@ -24,7 +30,8 @@ The UART is configured at 115200.
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f429-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f429-disco/flash.sh output/ \
+      {stm32f429discovery|stm32f429disc1}
 
 It will flash the minimal bootloader, the Device Tree Blob, and the
 kernel image which includes the root filesystem as initramfs.
-- 
2.12.2
