From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 15 Dec 2017 11:48:00 -0200
Subject: [Buildroot] [PATCH 2/2] iqvlinux: add patch to support Linux kernel
 4.12 and later
In-Reply-To: <20171215134800.29328-1-casantos@datacom.ind.br>
References: <20171215134800.29328-1-casantos@datacom.ind.br>
Message-ID: <20171215134800.29328-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on machines with four NIC models:

- Intel(R) Ethernet Connection X553 10 GbE SFP+
- Intel(R) Ethernet Connection X553 1 GbE
- Intel(R) Ethernet Connection I354
- Intel(R) I210 Gigabit Network Connection

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 .../0001-Support-Linux-kernel-4.12-and-later.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
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
-- 
2.14.3
