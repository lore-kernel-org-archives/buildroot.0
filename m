From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 30 May 2017 10:26:13 -0700
Subject: [Buildroot] [PATCH v2] package/xen: Backport a header include fix
	for makedev
Message-ID: <20170530172613.12571-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

maekdev() is avaliable from sys/types.h but only due to a bug in glibc. This
is being fixed by printing an error when using makedev() from sys/types.h.
To fix the issue we should innclude sys/sysmacros.h for makedev(). As this
has already been fixed in upstream Xen we can backport the patch.

Fixes:
    http://autobuild.buildroot.net/results/552/552e66d764885341b2fe208a0e4382b5fe05ea9d/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
v2:
 - Update commit message to match the buildroot style.
 - Rebase on master.

 ...07-tools-include-sys-sysmacros.h-on-Linux.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch

diff --git a/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch b/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
new file mode 100644
index 000000000..67f040617
--- /dev/null
+++ b/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
@@ -0,0 +1,51 @@
+From 796dea37fb229c34740f98bf80f3263d7a4e3c6d Mon Sep 17 00:00:00 2001
+From: Olaf Hering <olaf@aepfle.de>
+Date: Wed, 15 Mar 2017 07:01:34 +0000
+Subject: [PATCH] tools: include sys/sysmacros.h on Linux
+
+Due to a bug in the glibc headers the macros makedev(), major() and
+minor() where avaialble by including sys/types.h. This bug was
+addressed in glibc-2.25 by introducing a warning when these macros are
+used. Since Xen is build with -Werror this new warning cause a compile
+error.
+
+Use sys/sysmacros.h to define these three macros.
+
+blktap2 is already Linux specific. The kernel header which was used to
+get makedev() does not provided it anymore, and it was wrong to use a
+kernel header anyway.
+
+Signed-off-by: Olaf Hering <olaf@aepfle.de>
+Acked-by: Wei Liu <wei.liu2@citrix.com>
+---
+ tools/blktap2/control/tap-ctl-allocate.c | 1 +
+ tools/libxl/libxl_osdeps.h               | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/tools/blktap2/control/tap-ctl-allocate.c b/tools/blktap2/control/tap-ctl-allocate.c
+index 8a6471e987..187cadcde7 100644
+--- a/tools/blktap2/control/tap-ctl-allocate.c
++++ b/tools/blktap2/control/tap-ctl-allocate.c
+@@ -33,6 +33,7 @@
+ #include <string.h>
+ #include <getopt.h>
+ #include <libgen.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/ioctl.h>
+diff --git a/tools/libxl/libxl_osdeps.h b/tools/libxl/libxl_osdeps.h
+index a40d62066b..de1d24ecae 100644
+--- a/tools/libxl/libxl_osdeps.h
++++ b/tools/libxl/libxl_osdeps.h
+@@ -39,6 +39,7 @@
+ #define SYSFS_PCI_DEV          "/sys/bus/pci/devices"
+ #define SYSFS_PCIBACK_DRIVER   "/sys/bus/pci/drivers/pciback"
+ #define NETBACK_NIC_NAME       "vif%u.%d"
++#include <sys/sysmacros.h>
+ #include <pty.h>
+ #include <uuid/uuid.h>
+ #elif defined(__sun__)
+-- 
+2.11.0
+
-- 
2.11.0
