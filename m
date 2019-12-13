From: zhou qi <atmgnd@outlook.com>
Date: Fri, 13 Dec 2019 14:55:39 +0000
Subject: [Buildroot] PATCH 2019.11 stable release,
 glibc/gcc busybox incompatible
Message-ID: <TY2PR02MB3727097C4CD9FC2CE591C5C1C9540@TY2PR02MB3727.apcprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I may found a bug of 2019.11 release, plz someone (developers) test it.

I found use the 2019.11 release to build i386 image have following error for busybox/gcc


traps: xxx[xxx] general protection ip:xxx sp:xxx error:0 in libc.so[xxx+xxx]

I added a patch to busybox(in dir packages/busybox/), then the error does not shown again. The patch just remove
all busybox i386 specific build flags. Here is the content of it.

--- busybox-1.31.1.orig/arch/i386/Makefile          2019-06-10 18:50:53.000000000 +0800
+++ busybox-1.31.1/arch/i386/Makefile 2019-12-12 09:50:28.072043566 +0800
@@ -4,10 +4,10 @@
 # Allow i486 insns (basically, bswap insn)
# Do not try to tune for 486+ (might add padding)
-CFLAGS += $(call cc-option,-march=i486 -mtune=i386,)
+# CFLAGS += $(call cc-option,-march=i486 -mtune=i386,)
-ifeq ($(CONFIG_STACK_OPTIMIZATION_386),y)
+# ifeq ($(CONFIG_STACK_OPTIMIZATION_386),y)
# -mpreferred-stack-boundary=2 is essential in preventing gcc 4.2.x
# from aligning stack to 16 bytes. (Which is gcc's way of supporting SSE).
-CFLAGS += $(call cc-option,-mpreferred-stack-boundary=2,)
-endif
+# CFLAGS += $(call cc-option,-mpreferred-stack-boundary=2,)
+# endif


And I tried to downgrade the gcc version, it could fixed the issue too.
Here is the procedure to reproduce the bug.

I downloaded 2019.11 stable release from https://buildroot.org/downloads/buildroot-2019.11.tar.gz
And use the following command to build a simple i386 image.

  1.  make pc_x86_64_defconfig
  2.  make menuconfig
# chang arch to i386, change libc to glibc save the config, then type

  1.  make

use qemu to test:
sudo ~/opt/qemu-4.1.1/bin/qemu-system-x86_64 --enable-kvm output/images/disk.img -m 512 -boot d -usb -device usb-tablet -soundhw sb16 -monitor stdio -cpu qemu64 -vga std

after boot, type some some busybox command, the you I get those errors:


traps: xxx[xxx] general protection ip:xxx sp:xxx error:0 in libc.so[xxx+xxx]


here is the links how I get those patch.

https://github.com/openwrt/openwrt/commit/7a97588bc6ae70a134456833d4d489148e38a5aa

https://github.com/openwrt/openwrt/commit/b8d9a064f08614ac6f6b0ec26eab1450cf8b7544

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=550986> for Windows 10

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191213/60bdcad2/attachment.html>
