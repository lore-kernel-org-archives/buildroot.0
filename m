From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 31 Aug 2017 11:49:32 +0200
Subject: [Buildroot] [PATCH 2/2] bluez5_utils: add upstream patch to fix
	timeout issue with fw download
In-Reply-To: <20170831094932.11121-1-joerg.krause@embedded.rocks>
References: <20170831094932.11121-1-joerg.krause@embedded.rocks>
Message-ID: <20170831094932.11121-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch [1] for the hciattach tool to fix timeout issue when
downloading firmware to Broadcom bluetooth chips.

[1] https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=76255f732d68aef2b90d36d9c7be51a9e1739ce7

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...cm43xx-fix-the-delay-timer-for-firmware-d.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/bluez5_utils/0002-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch

diff --git a/package/bluez5_utils/0002-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch b/package/bluez5_utils/0002-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
new file mode 100644
index 0000000000..2802510b98
--- /dev/null
+++ b/package/bluez5_utils/0002-hciattach-bcm43xx-fix-the-delay-timer-for-firmware-d.patch
@@ -0,0 +1,38 @@
+From 3b341fb421ef61db7782bf1314ec693828467de9 Mon Sep 17 00:00:00 2001
+From: Andy Duan <fugang.duan@nxp.com>
+Date: Wed, 23 Nov 2016 17:12:12 +0800
+Subject: [PATCH] hciattach: bcm43xx: fix the delay timer for firmware download
+
+From the log in .bcm43xx_load_firmware():
+        /* Wait 50ms to let the firmware placed in download mode */
+        nanosleep(&tm_mode, NULL);
+
+But timespec tm_mode is real is 50us. Correct the delayed timer count.
+
+Backported from:
+https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=76255f732d68aef2b90d36d9c7be51a9e1739ce7
+
+Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ tools/hciattach_bcm43xx.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/hciattach_bcm43xx.c b/tools/hciattach_bcm43xx.c
+index 81f38cb..ac1b3c1 100644
+--- a/tools/hciattach_bcm43xx.c
++++ b/tools/hciattach_bcm43xx.c
+@@ -228,8 +228,8 @@ static int bcm43xx_set_speed(int fd, struct termios *ti, uint32_t speed)
+ static int bcm43xx_load_firmware(int fd, const char *fw)
+ {
+ 	unsigned char cmd[] = { HCI_COMMAND_PKT, 0x2e, 0xfc, 0x00 };
+-	struct timespec tm_mode = { 0, 50000 };
+-	struct timespec tm_ready = { 0, 2000000 };
++	struct timespec tm_mode = { 0, 50000000 };
++	struct timespec tm_ready = { 0, 200000000 };
+ 	unsigned char resp[CC_MIN_SIZE];
+ 	unsigned char tx_buf[1024];
+ 	int len, fd_fw, n;
+-- 
+1.9.1
+
-- 
2.14.1
