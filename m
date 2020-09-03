From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  3 Sep 2020 17:57:28 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/iproute2: bump version to 5.8.0
In-Reply-To: <20200903155728.19448-1-petr.vorel@gmail.com>
References: <20200903155728.19448-1-petr.vorel@gmail.com>
Message-ID: <20200903155728.19448-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For uclibc it requires v1.0.35, which contains 8bc41f131 ("Add {name,
open}_to_handle_at() implementation").

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I tested this and it looks like the patch didn't apply, when tested with ./utils/test-pkg:

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                    bootlin-x86-64-glibc [ 3/45]: OK
                        br-aarch64-glibc [ 4/45]: OK
                           br-arcle-hs38 [ 5/45]: FAILED
                            br-arm-basic [ 6/45]: FAILED
                  br-arm-cortex-a9-glibc [ 7/45]: OK
                   br-arm-cortex-a9-musl [ 8/45]: OK
                   br-arm-cortex-m4-full [ 9/45]: SKIPPED
                             br-arm-full [10/45]: FAILED
                    br-arm-full-nothread [11/45]: FAILED
                      br-arm-full-static [12/45]: FAILED
                br-i386-pentium-mmx-musl [13/45]: OK
                   br-i386-pentium4-full [14/45]: FAILED
                    br-microblazeel-full [15/45]: OK
                      br-mipsel-o32-full [16/45]: FAILED
                 br-mips32r6-el-hf-glibc [17/45]: OK
                      br-mips64-n64-full [18/45]: FAILED
                 br-mips64r6-el-hf-glibc [19/45]: OK
                       br-m68k-5208-full [20/45]: SKIPPED
                      br-m68k-68040-full [21/45]: FAILED
                          br-nios2-glibc [22/45]: OK
                      br-openrisc-uclibc [23/45]: OK
                  br-powerpc-e500mc-full [24/45]: FAILED
               br-powerpc-603e-basic-cpp [25/45]: FAILED
             br-powerpc64le-power8-glibc [26/45]: OK
               br-powerpc64-power7-glibc [27/45]: OK
                              br-riscv32 [28/45]: OK
                              br-riscv64 [29/45]: OK
                         br-riscv64-musl [30/45]: OK
                             br-sh4-full [31/45]: FAILED
                         br-sparc-uclibc [32/45]: FAILED
                        br-sparc64-glibc [33/45]: OK
                          br-xtensa-full [34/45]: FAILED
                    br-x86-64-core2-full [35/45]: FAILED
                          br-x86-64-musl [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                           sourcery-mips [43/45]: OK
                         sourcery-mips64 [44/45]: OK
                          sourcery-nios2 [45/45]: OK

But locally tested it works. Where can be a problem?

Kind regards,
Petr

 .../0001-devlink-update-include-files.patch   | 55 -------------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/iproute2/0001-devlink-update-include-files.patch

diff --git a/package/iproute2/0001-devlink-update-include-files.patch b/package/iproute2/0001-devlink-update-include-files.patch
deleted file mode 100644
index 8cc6e4ec60..0000000000
--- a/package/iproute2/0001-devlink-update-include-files.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 12fafa27c7b306e6c397e858f4d5a8159500f659 Mon Sep 17 00:00:00 2001
-From: Stephen Hemminger <stephen@networkplumber.org>
-Date: Thu, 11 Jun 2020 09:46:46 -0700
-Subject: devlink: update include files
-
-Use the tool iwyu to get more complete list of includes for
-all the bits used by devlink.
-
-This should also fix build with musl libc.
-
-Fixes: c4dfddccef4e ("fix JSON output of mon command")
-Reported-off-by: Dan Robertson <dan@dlrobertson.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=12fafa27c7b306e6c397e858f4d5a8159500f659]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- devlink/devlink.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/devlink/devlink.c b/devlink/devlink.c
-index 507972c3..ce2e4676 100644
---- a/devlink/devlink.c
-+++ b/devlink/devlink.c
-@@ -19,18 +19,25 @@
- #include <limits.h>
- #include <errno.h>
- #include <inttypes.h>
-+#include <signal.h>
-+#include <time.h>
-+#include <netinet/in.h>
-+#include <arpa/inet.h>
- #include <sys/sysinfo.h>
- #define _LINUX_SYSINFO_H /* avoid collision with musl header */
- #include <linux/genetlink.h>
- #include <linux/devlink.h>
-+#include <linux/netlink.h>
- #include <libmnl/libmnl.h>
- #include <netinet/ether.h>
-+#include <sys/select.h>
-+#include <sys/socket.h>
- #include <sys/types.h>
- 
- #include "SNAPSHOT.h"
- #include "list.h"
- #include "mnlg.h"
--#include "json_writer.h"
-+#include "json_print.h"
- #include "utils.h"
- #include "namespace.h"
- 
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index b2a9e21e11..4d82de4c46 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  725dc7ba94aae54c6f8d4223ca055d9fb4fe89d6994b1c03bfb4411c4dd10f21  iproute2-5.7.0.tar.xz
+sha256  cfcd1f890290f8c8afcc91d9444ad929b9252c16f9ab3f286c50dd3c59dc646e  iproute2-5.8.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 1b71f5c06a..98fbe4f3cd 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.7.0
+IPROUTE2_VERSION = 5.8.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.28.0
