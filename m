From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Aug 2020 20:38:32 +0200
Subject: [Buildroot] [RFC PATCH 2/2] package/iproute2: bump version to 5.8.0
In-Reply-To: <20200818183832.7947-1-petr.vorel@gmail.com>
References: <20200818183832.7947-1-petr.vorel@gmail.com>
Message-ID: <20200818183832.7947-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

this requires previous patch for uclibc and also my previous musl patch [1].

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20200818163642.20407-1-petr.vorel at gmail.com/

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
