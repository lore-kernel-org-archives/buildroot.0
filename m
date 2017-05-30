From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:29:20 +0200
Subject: [Buildroot] [git commit] package/xen: Backport a header include fix
	for makedev
Message-ID: <20170530212954.AA3B282765@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1c2c432a914e1da9022f370906c06d139e41aee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

maekdev() is available from sys/types.h but only due to a bug in glibc. This
is being fixed by printing an error when using makedev() from sys/types.h.
To fix the issue we should include sys/sysmacros.h for makedev(). As this
has already been fixed in upstream Xen we can backport the patch.

Fixes:
    http://autobuild.buildroot.net/results/552/552e66d764885341b2fe208a0e4382b5fe05ea9d/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...07-tools-include-sys-sysmacros.h-on-Linux.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch b/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
new file mode 100644
index 0000000..91019cf
--- /dev/null
+++ b/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
@@ -0,0 +1,52 @@
+From 796dea37fb229c34740f98bf80f3263d7a4e3c6d Mon Sep 17 00:00:00 2001
+From: Olaf Hering <olaf@aepfle.de>
+Date: Wed, 15 Mar 2017 07:01:34 +0000
+Subject: [PATCH] tools: include sys/sysmacros.h on Linux
+
+Due to a bug in the glibc headers the macros makedev(), major() and
+minor() where available by including sys/types.h. This bug was
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
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
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
