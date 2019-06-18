From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 18 Jun 2019 18:46:50 +0300
Subject: [Buildroot] [PATCH v2] fb-test-app: Revert upstream 77bdfc6 "add
 function to place framebuffer ..."
Message-ID: <20190618154650.51149-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch breaks at least hotplug displays to work.

More details in submitted PR to the upstream, i.e.
https://github.com/prpplague/fb-test-app/pull/5.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
- now correct patch
 ...ion-to-place-framebuffer-in-graphics.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/fb-test-app/0001-Revert-add-function-to-place-framebuffer-in-graphics.patch

diff --git a/package/fb-test-app/0001-Revert-add-function-to-place-framebuffer-in-graphics.patch b/package/fb-test-app/0001-Revert-add-function-to-place-framebuffer-in-graphics.patch
new file mode 100644
index 0000000000..f8e5fb3c26
--- /dev/null
+++ b/package/fb-test-app/0001-Revert-add-function-to-place-framebuffer-in-graphics.patch
@@ -0,0 +1,49 @@
+From f960002becced31ea6ce1e1160b4e1b24ef9afa5 Mon Sep 17 00:00:00 2001
+From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+Date: Tue, 18 Jun 2019 18:26:28 +0300
+Subject: [PATCH 1/1] Revert "add function to place framebuffer in graphics
+ mode"
+
+First of all, it's completely unclear why /dev/tty1 is being hardcoded.
+Second, the function may switch the console to a wrong mode without restoring.
+Last, but not least, this breaks display in hotplug mode in my case.
+
+I have an SPI panel connected and I load an overlay to enable it. If I ran
+fb-test and do unload-load cycle, display becomes unusable till the reboot.
+
+Revert hack commit 77bdfc6ccbebb39caed4ac167a983ad3ad1e1ccb for good.
+
+Link: https://github.com/HED-Inc/fb-test-app/commit/ef9c21a2e55160ad52c40f7c2a07fcab95e484e1
+Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+---
+ common.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/common.c b/common.c
+index a341dbe..1f47d00 100644
+--- a/common.c
++++ b/common.c
+@@ -31,19 +31,13 @@
+ #include <sys/mman.h>
+ 
+ #include <linux/fb.h>
+-#include <linux/kd.h>
+ 
+ #include "common.h"
+ 
+ void fb_open(int fb_num, struct fb_info *fb_info)
+ {
+ 	char str[64];
+-	int fd,tty;
+-
+-	tty = open("/dev/tty1", O_RDWR);
+-
+-	if(ioctl(tty, KDSETMODE, KD_GRAPHICS) == -1)
+-		printf("Failed to set graphics mode on tty1\n");
++	int fd;
+ 
+ 	sprintf(str, "/dev/fb%d", fb_num);
+ 	fd = open(str, O_RDWR);
+-- 
+2.20.1
+
-- 
2.20.1
