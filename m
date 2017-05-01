From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 May 2017 09:26:43 +0200
Subject: [Buildroot] [PATCH 1/3] board: add stm32f429-disc1 config
Message-ID: <20170501072645.5571-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change renders the stm32f429discovery a bit more generic and reuse most
of its settings for the stm32f429-disc1 board.

Cc: Waldemar Brodkorb <wbx@openadk.org>
Cc: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 board/stmicroelectronics/stm32f429-disc1            |  1 +
 board/stmicroelectronics/stm32f429-disco/flash.sh   | 10 ++++++++--
 board/stmicroelectronics/stm32f429-disco/readme.txt |  7 ++++---
 3 files changed, 13 insertions(+), 5 deletions(-)
 create mode 120000 board/stmicroelectronics/stm32f429-disc1

diff --git a/board/stmicroelectronics/stm32f429-disc1 b/board/stmicroelectronics/stm32f429-disc1
new file mode 120000
index 000000000..6b0439142
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disc1
@@ -0,0 +1 @@
+stm32f429-disco
\ No newline at end of file
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
index 43a25b420..a1d91d234 100644
--- a/board/stmicroelectronics/stm32f429-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f429-disco/readme.txt
@@ -15,8 +15,8 @@ Wire the UART
 
 Use a USB to TTL adapter, and connect:
 
- - RX to PA9
- - TX to PA10
+ - RX to PA9 (or the RX pin on the stm32f429i-disc1 board)
+ - TX to PA10 (or the TX pin on the stm32f429i-disc1 board)
  - GND to one of the GND available on the board
 
 The UART is configured at 115200.
@@ -24,7 +24,8 @@ The UART is configured at 115200.
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f429-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f429-disco/flash.sh output/ \
+      {stm32f429discovery|stm32f429disc1}
 
 It will flash the minimal bootloader, the Device Tree Blob, and the
 kernel image which includes the root filesystem as initramfs.
-- 
2.12.2
