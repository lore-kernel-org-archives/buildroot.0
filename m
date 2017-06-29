From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 29 Jun 2017 16:32:47 -0700
Subject: [Buildroot] [PATCH] package/xen: Upgrade Xen to version 4.9.0
Message-ID: <20170629233247.13091-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upgrade the Xen package to Xen 4.9.0. This also means we can remove
almost all of the patches we were prviously carrying.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
This patch applies ontop of my earlier package/xen: Fix builds with GCC 7
patch. I want to fix the 4.8.1 build issue before upgrading to 4.9.0 incase
anyone is ever interested in building 4.8.1. This way the commit before 4.9.0
will work if anyone checks it out.

 ...ktap2-vhd-Remove-unused-struct-stat-stats.patch | 30 --------
 ...003-tools-blktap2-Fix-missing-header-file.patch | 31 --------
 ...p2-remove-unused-inclusion-of-sys-sysctl..patch | 31 --------
 ...ls-Use-POSIX-poll.h-instead-of-sys-poll.h.patch | 83 ----------------------
 ...se-POSIX-signal.h-instead-of-sys-signal.h.patch | 41 -----------
 ...07-tools-include-sys-sysmacros.h-on-Linux.patch | 52 --------------
 package/xen/0008-arm-fix-build-with-gcc-7.patch    | 69 ------------------
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  4 +-
 9 files changed, 3 insertions(+), 340 deletions(-)
 delete mode 100644 package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
 delete mode 100644 package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
 delete mode 100644 package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
 delete mode 100644 package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
 delete mode 100644 package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch
 delete mode 100644 package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
 delete mode 100644 package/xen/0008-arm-fix-build-with-gcc-7.patch

diff --git a/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch b/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
deleted file mode 100644
index 533a6889a..000000000
--- a/package/xen/0002-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 341c75bf4661aa0b5411d5dcc6334ab22e0bb158 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Tue, 20 Dec 2016 11:46:58 -0800
-Subject: [PATCH] tools/blktap2/vhd: Remove unused struct stat stats
-
-The unsued variable 'struct stat stats' causes build errors in some
-situations. As it isn't used just remove it.
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
----
- tools/blktap2/vhd/lib/libvhd-journal.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tools/blktap2/vhd/lib/libvhd-journal.c b/tools/blktap2/vhd/lib/libvhd-journal.c
-index 26e26e7..862890f 100644
---- a/tools/blktap2/vhd/lib/libvhd-journal.c
-+++ b/tools/blktap2/vhd/lib/libvhd-journal.c
-@@ -1260,7 +1260,6 @@ vhd_journal_create(vhd_journal_t *j, const char *file, const char *jfile)
- 	int i, err;
- 	size_t size;
- 	off_t off;
--	struct stat stats;
- 
- 	memset(j, 0, sizeof(vhd_journal_t));
- 	j->jfd = -1;
--- 
-2.7.4
-
diff --git a/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch b/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
deleted file mode 100644
index 5d6f0cb4a..000000000
--- a/package/xen/0003-tools-blktap2-Fix-missing-header-file.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1226317351b4154ed6460b778f2490614f47b9d4 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Tue, 20 Dec 2016 11:46:59 -0800
-Subject: [PATCH] tools/blktap2: Fix missing header file
-
-To avoid build errors relating to missing declarations of ssize_t add
-the appropriate header file to atomic.h.
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
----
- tools/blktap2/include/atomicio.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/blktap2/include/atomicio.h b/tools/blktap2/include/atomicio.h
-index 7eccf20..5a1120e 100644
---- a/tools/blktap2/include/atomicio.h
-+++ b/tools/blktap2/include/atomicio.h
-@@ -25,6 +25,8 @@
-  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#include <sys/types.h>
-+
- /*
-  * Ensure all of data on socket comes through. f==read || f==vwrite
-  */
--- 
-2.7.4
-
diff --git a/package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch b/package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
deleted file mode 100644
index 2d82be4df..000000000
--- a/package/xen/0004-tools-blktap2-remove-unused-inclusion-of-sys-sysctl..patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 74858c9eaf335658b4c19cb4a848bb721065c233 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Tue, 20 Dec 2016 11:47:00 -0800
-Subject: [PATCH] tools/blktap2: remove unused inclusion of sys/sysctl.l
-
-That header file is not used. Removing it would avoid build error with
-musl libc, which doesn't have that header file.
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
-[ wei: rewrote commit message ]
-Acked-by: Wei Liu <wei.liu2@citrix.com>
----
- tools/blktap2/drivers/block-remus.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tools/blktap2/drivers/block-remus.c b/tools/blktap2/drivers/block-remus.c
-index 079588d..7401800 100644
---- a/tools/blktap2/drivers/block-remus.c
-+++ b/tools/blktap2/drivers/block-remus.c
-@@ -54,7 +54,6 @@
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <sys/param.h>
--#include <sys/sysctl.h>
- #include <unistd.h>
- #include <sys/stat.h>
- 
--- 
-2.7.4
-
diff --git a/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch b/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index 01843fb3b..000000000
--- a/package/xen/0005-tools-Use-POSIX-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From e407387926de4c75abd17bd1396caa95d35a4bea Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Mon, 17 Apr 2017 13:04:11 -0700
-Subject: [PATCH] tools: Use POSIX poll.h instead of sys/poll.h
-
-The POSIX spec specifies to use:
-    #include <poll.h>
-instead of:
-    #include <sys/poll.h>
-as seen here:
-    http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
-
-This removes the warning:
-    #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
-when building with the musl C-library.
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
-Release-acked-by: Julien Grall <julien.grall@arm.com>
----
- tools/libxl/libxl_internal.h               | 2 +-
- tools/tests/xen-access/xen-access.c        | 2 +-
- tools/xenstat/libxenstat/src/xenstat_qmp.c | 2 +-
- tools/xentrace/xentrace.c                  | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
-index be24b76dfa..5d082c5704 100644
---- a/tools/libxl/libxl_internal.h
-+++ b/tools/libxl/libxl_internal.h
-@@ -38,7 +38,7 @@
- #include <ctype.h>
- 
- #include <sys/mman.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/select.h>
- #include <sys/stat.h>
- #include <sys/time.h>
-diff --git a/tools/tests/xen-access/xen-access.c b/tools/tests/xen-access/xen-access.c
-index ff4d289b45..238011e010 100644
---- a/tools/tests/xen-access/xen-access.c
-+++ b/tools/tests/xen-access/xen-access.c
-@@ -36,7 +36,7 @@
- #include <signal.h>
- #include <unistd.h>
- #include <sys/mman.h>
--#include <sys/poll.h>
-+#include <poll.h>
- 
- #include <xenctrl.h>
- #include <xenevtchn.h>
-diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/xenstat/libxenstat/src/xenstat_qmp.c
-index a87c9373c2..3fda487d49 100644
---- a/tools/xenstat/libxenstat/src/xenstat_qmp.c
-+++ b/tools/xenstat/libxenstat/src/xenstat_qmp.c
-@@ -14,7 +14,7 @@
- #include <fcntl.h>
- #include <sys/types.h>
- #include <sys/socket.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/un.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
-index f09fe6cf19..364a6fdad5 100644
---- a/tools/xentrace/xentrace.c
-+++ b/tools/xentrace/xentrace.c
-@@ -24,7 +24,7 @@
- #include <getopt.h>
- #include <assert.h>
- #include <ctype.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <sys/statvfs.h>
- 
- #include <xen/xen.h>
--- 
-2.11.0
-
diff --git a/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch b/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch
deleted file mode 100644
index 40a8c5008..000000000
--- a/package/xen/0006-tools-Use-POSIX-signal.h-instead-of-sys-signal.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 67315f02798cdccb186bd12dc5be94a7aec90852 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Mon, 17 Apr 2017 14:15:54 -0700
-Subject: [PATCH] tools: Use POSIX signal.h instead of sys/signal.h
-
-The POSIX spec specifies to use:
-    #include <signal.h>
-instead of:
-    #include <sys/signal.h>
-as seen here:
-   http://pubs.opengroup.org/onlinepubs/009695399/functions/signal.html
-
-This removes the warning:
-    #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
-when building with the musl C-library.
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Acked-by: Razvan Cojocaru <rcojocaru@bitdefender.com>
-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
-Release-acked-by: Julien Grall <julien.grall@arm.com>
----
- tools/blktap2/drivers/tapdisk-server.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/blktap2/drivers/tapdisk-server.c b/tools/blktap2/drivers/tapdisk-server.c
-index eecde3d23f..71315bb069 100644
---- a/tools/blktap2/drivers/tapdisk-server.c
-+++ b/tools/blktap2/drivers/tapdisk-server.c
-@@ -30,7 +30,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <sys/ioctl.h>
--#include <sys/signal.h>
-+#include <signal.h>
- 
- #include "tapdisk-utils.h"
- #include "tapdisk-server.h"
--- 
-2.11.0
-
diff --git a/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch b/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
deleted file mode 100644
index 91019cf99..000000000
--- a/package/xen/0007-tools-include-sys-sysmacros.h-on-Linux.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 796dea37fb229c34740f98bf80f3263d7a4e3c6d Mon Sep 17 00:00:00 2001
-From: Olaf Hering <olaf@aepfle.de>
-Date: Wed, 15 Mar 2017 07:01:34 +0000
-Subject: [PATCH] tools: include sys/sysmacros.h on Linux
-
-Due to a bug in the glibc headers the macros makedev(), major() and
-minor() where available by including sys/types.h. This bug was
-addressed in glibc-2.25 by introducing a warning when these macros are
-used. Since Xen is build with -Werror this new warning cause a compile
-error.
-
-Use sys/sysmacros.h to define these three macros.
-
-blktap2 is already Linux specific. The kernel header which was used to
-get makedev() does not provided it anymore, and it was wrong to use a
-kernel header anyway.
-
-Signed-off-by: Olaf Hering <olaf@aepfle.de>
-Acked-by: Wei Liu <wei.liu2@citrix.com>
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
- tools/blktap2/control/tap-ctl-allocate.c | 1 +
- tools/libxl/libxl_osdeps.h               | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/tools/blktap2/control/tap-ctl-allocate.c b/tools/blktap2/control/tap-ctl-allocate.c
-index 8a6471e987..187cadcde7 100644
---- a/tools/blktap2/control/tap-ctl-allocate.c
-+++ b/tools/blktap2/control/tap-ctl-allocate.c
-@@ -33,6 +33,7 @@
- #include <string.h>
- #include <getopt.h>
- #include <libgen.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/ioctl.h>
-diff --git a/tools/libxl/libxl_osdeps.h b/tools/libxl/libxl_osdeps.h
-index a40d62066b..de1d24ecae 100644
---- a/tools/libxl/libxl_osdeps.h
-+++ b/tools/libxl/libxl_osdeps.h
-@@ -39,6 +39,7 @@
- #define SYSFS_PCI_DEV          "/sys/bus/pci/devices"
- #define SYSFS_PCIBACK_DRIVER   "/sys/bus/pci/drivers/pciback"
- #define NETBACK_NIC_NAME       "vif%u.%d"
-+#include <sys/sysmacros.h>
- #include <pty.h>
- #include <uuid/uuid.h>
- #elif defined(__sun__)
--- 
-2.11.0
-
diff --git a/package/xen/0008-arm-fix-build-with-gcc-7.patch b/package/xen/0008-arm-fix-build-with-gcc-7.patch
deleted file mode 100644
index e709f5c4e..000000000
--- a/package/xen/0008-arm-fix-build-with-gcc-7.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 9d3011bd1cd29f8f3841bf1b64d5ead9ed1434e8 Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Fri, 19 May 2017 10:12:08 +0200
-Subject: [PATCH] arm: fix build with gcc 7
-
-The compiler dislikes duplicate "const", and the ones it complains
-about look like they we in fact meant to be placed differently.
-
-Also fix array_access_okay() (just like on x86), despite the construct
-being unused on ARM: -Wint-in-bool-context, enabled by default in
-gcc 7, doesn't like multiplication in conditional operators. "Hide" it,
-at the risk of the next compiler version becoming smarter and
-recognizing even that. (The hope is that added smartness then would
-also better deal with legitimate cases like the one here.) The change
-could have been done in access_ok(), but I think we better keep it at
-the place the compiler is actually unhappy about.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Reviewed-by: Julien Grall <julien.grall@arm.com>
-Release-acked-by: Julien Grall <julien.grall@arm.com>
----
- xen/arch/arm/platforms/brcm.c      | 2 +-
- xen/arch/arm/platforms/rcar2.c     | 2 +-
- xen/include/asm-arm/guest_access.h | 3 ++-
- 3 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
-index 6d8b5b9175..d481b2c60f 100644
---- a/xen/arch/arm/platforms/brcm.c
-+++ b/xen/arch/arm/platforms/brcm.c
-@@ -271,7 +271,7 @@ static __init int brcm_init(void)
-     return brcm_populate_plat_regs();
- }
- 
--static const char const *brcm_dt_compat[] __initconst =
-+static const char *const brcm_dt_compat[] __initconst =
- {
-     "brcm,bcm7445d0",
-     NULL
-diff --git a/xen/arch/arm/platforms/rcar2.c b/xen/arch/arm/platforms/rcar2.c
-index bb25751109..df0ac84709 100644
---- a/xen/arch/arm/platforms/rcar2.c
-+++ b/xen/arch/arm/platforms/rcar2.c
-@@ -46,7 +46,7 @@ static int __init rcar2_smp_init(void)
-     return 0;
- }
- 
--static const char const *rcar2_dt_compat[] __initdata =
-+static const char *const rcar2_dt_compat[] __initconst =
- {
-     "renesas,lager",
-     NULL
-diff --git a/xen/include/asm-arm/guest_access.h b/xen/include/asm-arm/guest_access.h
-index 5876988b23..421bca5f36 100644
---- a/xen/include/asm-arm/guest_access.h
-+++ b/xen/include/asm-arm/guest_access.h
-@@ -8,7 +8,8 @@
- #define access_ok(addr,size) (1)
- 
- #define array_access_ok(addr,count,size) \
--    (likely(count < (~0UL/size)) && access_ok(addr,count*size))
-+    (likely((count) < (~0UL / (size))) && \
-+     access_ok(addr, 0 + (count) * (size)))
- 
- unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
- unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
--- 
-2.11.0
-
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 813040b46..bcce39bd8 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1d69153b94561429293015f66463ee17c26404d1c014e646ecbcca6078581395 xen-4.8.1.tar.gz
+sha256 cade643fe3310d4d6f97d0c215c6fa323bc1130d7e64d7e2043ffaa73a96f33b xen-4.9.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 821ab2191..cebb15dc7 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.8.1
-XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
+XEN_VERSION = 4.9.0
+XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python
-- 
2.11.0
