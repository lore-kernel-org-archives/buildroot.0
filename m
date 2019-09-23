From: Timo Ketola <Timo.Ketola@exertus.fi>
Date: Mon, 23 Sep 2019 10:58:45 +0000
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script survive
 'console=' kernel argument
Message-ID: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When booting with 'console=<empty>' in the kernel command line (as e.g.
U-Boot does with silent flags in effect), opening /dev/console fails.
That is fatal in the /init script and kernel will panic. It is also
needless, because the kernel tries to open it anyway (well, as long as
we have console node in initramfs /dev; cpio.mk creates that alright).

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
---
 fs/cpio/init | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/cpio/init b/fs/cpio/init
index dbe09ac..72b2401 100755
--- a/fs/cpio/init
+++ b/fs/cpio/init
@@ -1,7 +1,5 @@
 #!/bin/sh
 # devtmpfs does not get automounted for initramfs
 /bin/mount -t devtmpfs devtmpfs /dev
-exec 0</dev/console
-exec 1>/dev/console
-exec 2>/dev/console
+
 exec /sbin/init "$@"
-- 
2.7.4
