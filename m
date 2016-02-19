From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 19 Feb 2016 17:08:59 +0000
Subject: [Buildroot] [PATCH 3/9] boards: stm32f469-disco: Add a post-image
	script
In-Reply-To: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
References: <1455901745-18486-1-git-send-email-lee.jones@linaro.org>
Message-ID: <1455901745-18486-4-git-send-email-lee.jones@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Once each of the; bootloader, kernel, host utilities and rootfs have
been successfully built and packaged, this post-image script will
endeavour to flash the relevant images onto the board.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh

diff --git a/board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh b/board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh
new file mode 100755
index 0000000..281660b
--- /dev/null
+++ b/board/stmicroelectronics/stm32/stm32f469-disco/post-image.sh
@@ -0,0 +1,12 @@
+#!/bin/bash
+
+$HOST_DIR/usr/bin/openocd -f board/stm32f469discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase $BINARIES_DIR/stm32f469i-disco.bin 0x08000000" \
+  -c "flash write_image erase $BINARIES_DIR/stm32f469-disco.dtb 0x08004000" \
+  -c "flash write_image erase $BINARIES_DIR/xipImage 0x08008000" \
+  -c "reset run" \
+  -c "shutdown"
-- 
1.9.1
