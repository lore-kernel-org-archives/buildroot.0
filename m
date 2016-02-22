From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Feb 2016 18:59:26 +0000
Subject: [Buildroot] [PATCH v2 12/15] boards: stm32f429-disco: Add a helper
	script to flash images
In-Reply-To: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
References: <1456167569-8713-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1456167569-8713-13-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Once each of the; bootloader, kernel, host utilities and rootfs
have been successfully built and packaged, the user run this
helper script to flash the relevant images onto the board.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 board/stmicroelectronics/stm32/stm32f429-disco/flash.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 board/stmicroelectronics/stm32/stm32f429-disco/flash.sh

diff --git a/board/stmicroelectronics/stm32/stm32f429-disco/flash.sh b/board/stmicroelectronics/stm32/stm32f429-disco/flash.sh
new file mode 100755
index 0000000..5f1d7e4
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f429-disco/flash.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+output/host/usr/bin/openocd -f board/stm32f429discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase $BINARIES_DIR/stm32f429i-disco.bin 0x08000000" \
+  -c "flash write_image erase $BINARIES_DIR/stm32f429-disco.dtb 0x08004000" \
+  -c "flash write_image erase $BINARIES_DIR/xipImage 0x08008000" \
+  -c "reset run" \
+  -c "shutdown"
-- 
1.9.1
