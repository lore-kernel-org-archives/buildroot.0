From: Kees van Unen <keesvanunen@hotmail.com>
Date: Fri, 15 Dec 2017 15:38:47 +0000
Subject: [Buildroot] FW: [PATCH v2 2/2] iqvlinux: add patch to support Linux
 kernel 4.12 and later
In-Reply-To: <20171215153830.4864-2-casantos@datacom.ind.br>
References: <20171215153830.4864-1-casantos@datacom.ind.br>,
 <20171215153830.4864-2-casantos@datacom.ind.br>
Message-ID: <1dee37a93a4d46608e30f2e623482b91@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensCarlos Santos
Verzonden: vrijdag 15 december 2017 16:38:30 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: buildroot at buildroot.org
CC: Romain Naour
Onderwerp: [Buildroot] [PATCH v2 2/2] iqvlinux: add patch to support Linux kernel 4.12 and later

Tested on machines with four NIC models:

- Intel(R) Ethernet Connection X553 10 GbE SFP+
- Intel(R) Ethernet Connection X553 1 GbE
- Intel(R) Ethernet Connection I354
- Intel(R) I210 Gigabit Network Connection

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2
  - Move comment about the patch, in package/iqvlinux/Config.in, to the
    this commit.
---
 .../0001-Support-Linux-kernel-4.12-and-later.patch | 66 ++++++++++++++++++++++
 package/iqvlinux/Config.in                         |  7 ++-
 2 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch

diff --git a/package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch b/package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
new file mode 100644
index 0000000000..22ee03cdc9
--- /dev/null
+++ b/package/iqvlinux/0001-Support-Linux-kernel-4.12-and-later.patch
@@ -0,0 +1,66 @@
+From 517d70780b903caa41ee93adbbb9bb985da23a29 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Tue, 12 Dec 2017 13:40:44 -0200
+Subject: [PATCH] Support Linux kernel 4.12 and later
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ src/linux/driver/linuxdrivermemory_i.c | 5 +++++
+ src/linux/driver/linuxdriveros_i.c     | 5 +++++
+ src/linux/driver/linuxnaldriver.c      | 5 +++++
+ 3 files changed, 15 insertions(+)
+
+diff --git a/src/linux/driver/linuxdrivermemory_i.c b/src/linux/driver/linuxdrivermemory_i.c
+index bdf1d42..53366d7 100644
+--- a/src/linux/driver/linuxdrivermemory_i.c
++++ b/src/linux/driver/linuxdrivermemory_i.c
+@@ -49,7 +49,12 @@
+ #include <linux/errno.h>
+ #include <linux/fs.h>
+ #include <linux/mm.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
++#include <linux/uaccess.h>
++#else
+ #include <asm/uaccess.h>
++#endif
+ #include <linux/pci.h>
+ #include <linux/delay.h>
+
+diff --git a/src/linux/driver/linuxdriveros_i.c b/src/linux/driver/linuxdriveros_i.c
+index 653bec9..43df25e 100644
+--- a/src/linux/driver/linuxdriveros_i.c
++++ b/src/linux/driver/linuxdriveros_i.c
+@@ -49,7 +49,12 @@
+ #include <linux/errno.h>
+ #include <linux/fs.h>
+ #include <linux/mm.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
++#include <linux/uaccess.h>
++#else
+ #include <asm/uaccess.h>
++#endif
+ #include <linux/pci.h>
+ #include <linux/delay.h>
+
+diff --git a/src/linux/driver/linuxnaldriver.c b/src/linux/driver/linuxnaldriver.c
+index 93c2f80..c1ddbcf 100644
+--- a/src/linux/driver/linuxnaldriver.c
++++ b/src/linux/driver/linuxnaldriver.c
+@@ -39,7 +39,12 @@
+ #include <linux/fs.h>
+ #include <linux/mm.h>
+ #include <linux/version.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
++#include <linux/uaccess.h>
++#else
+ #include <asm/uaccess.h>
++#endif
+ #include "naltypes.h"
+ #include "nalioctl.h"
+ #include "linuxnaldriver.h"
+--
+2.14.3
+
diff --git a/package/iqvlinux/Config.in b/package/iqvlinux/Config.in
index 09502d141e..73804ac02a 100644
--- a/package/iqvlinux/Config.in
+++ b/package/iqvlinux/Config.in
@@ -2,8 +2,11 @@ config BR2_PACKAGE_IQVLINUX
        bool "iqvlinux"
        depends on BR2_LINUX_KERNEL
        help
-         Intel Ethernet Adapter Debug Driver for Linux (iqvlinux),
-         which supports kernel versions 2.6.x up through 4.0.x.
+         Intel Ethernet Adapter Debug Driver for Linux (iqvlinux).
+
+         Officially supports kernel versions 2.6.x up through 4.0.x but
+         the Buildroot package contains a patch to allow it to be built
+         on newer kernel versions.

          This debug driver supports all Intel's networking Tools based
          on the SDK version 2.19.36.0 or higher which support Intel
--
2.14.3

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
