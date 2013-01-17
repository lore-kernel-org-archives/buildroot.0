From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 17 Jan 2013 22:16:10 +0000
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
Message-ID: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

uClibc 0.9.31.1 fails to build for avr32 using recent (3.7.x) kernel
headers. The build failure looks like the following.

  CC libc/inet/if_index.os
In file included from /home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/linux/include/linux/rtnetlink.h:6,
                 from libc/inet/netlinkaccess.h:34,
                 from libc/inet/if_index.c:36:
/home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/linux/include/linux/if_link.h:291: error: expected specifier-qualifier-list before '__be16'
make[1]: *** [libc/inet/if_index.os] Error 1
make[1]: Leaving directory `/home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/uClibc-0.9.31.1'
make: *** [/home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/uClibc-0.9.31.1/lib/libc.a] Error 2

This patch adjusts the system type definitions in the netlinkaccess.h
header, updating the types to match those used in uClibc 0.9.33.2.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...0.9.31.1-netlinkaccess-header-types.patch.avr32 |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31.1-netlinkaccess-header-types.patch.avr32

diff --git a/toolchain/uClibc/uClibc-0.9.31.1-netlinkaccess-header-types.patch.avr32 b/toolchain/uClibc/uClibc-0.9.31.1-netlinkaccess-header-types.patch.avr32
new file mode 100644
index 0000000..5e7027c
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31.1-netlinkaccess-header-types.patch.avr32
@@ -0,0 +1,37 @@
+uClibc 0.9.31.1 fails to build for avr32 using recent (3.7.x) kernel
+headers. The build failure looks like the following.
+
+  CC libc/inet/if_index.os
+In file included from /home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/linux/include/linux/rtnetlink.h:6,
+                 from libc/inet/netlinkaccess.h:34,
+                 from libc/inet/if_index.c:36:
+/home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/linux/include/linux/if_link.h:291: error: expected specifier-qualifier-list before '__be16'
+make[1]: *** [libc/inet/if_index.os] Error 1
+make[1]: Leaving directory `/home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/uClibc-0.9.31.1'
+make: *** [/home/simond/TrainFX/code/git/third_party/buildroot.backports/output/toolchain/uClibc-0.9.31.1/lib/libc.a] Error 2
+
+This patch adjusts the system type definitions in the netlinkaccess.h
+header, updating the types to match those used in uClibc 0.9.33.2.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/libc/inet/netlinkaccess.h b/libc/inet/netlinkaccess.h
+--- a/libc/inet/netlinkaccess.h	2011-06-08 19:58:40.000000000 +0100
++++ b/libc/inet/netlinkaccess.h	2012-12-20 12:16:34.251965672 +0000
+@@ -22,15 +22,8 @@
+ #include <features.h>
+ #include <stdint.h>
+ #include <unistd.h>
+-#include <sys/types.h>
+-
+ #if defined __ASSUME_NETLINK_SUPPORT || defined __UCLIBC_USE_NETLINK__
+-#define _LINUX_TYPES_H
+-typedef uint8_t __u8;
+-typedef uint16_t __u16;
+-typedef uint32_t __u32;
+-typedef uint64_t __u64;
+-typedef int32_t __s32;
++#include <asm/types.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/netlink.h>
+ 
-- 
1.7.10.4
