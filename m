From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 19 Dec 2016 13:01:58 -0800
Subject: [Buildroot] [PATCH] package/xen: Update to version 4.8.0
Message-ID: <1482181318-7697-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Xen to version 4.8.0 and update the patches to allow Xen
hypervisor and Xen tools to build.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...1-Remove-hardcoded-strict-Werror-checking.patch |  6 +-
 ...l-Remove-hardcoded-strict-Werror-checking.patch | 26 ++++++++
 ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 -----------
 ...ools-libxl-Disable-strict-Werror-checking.patch | 26 --------
 ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 +++++++++++
 .../0004-tools-Update-sys-poll.h-to-poll.h.patch   | 74 ++++++++++++++++++++++
 ...s-blktap2-Update-sys-signal.h-to-signal.h.patch | 32 ++++++++++
 ...ktap2-vhd-Remove-unused-struct-stat-stats.patch | 28 ++++++++
 ...007-tools-blktap2-Fix-missing-header-file.patch | 29 +++++++++
 ...p2-drivers-Remove-non-existent-sys-sysctl.patch | 29 +++++++++
 package/xen/xen.hash                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 12 files changed, 259 insertions(+), 67 deletions(-)
 create mode 100644 package/xen/0002-tools-libxl-Remove-hardcoded-strict-Werror-checking.patch
 delete mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
 delete mode 100644 package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
 create mode 100644 package/xen/0003-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
 create mode 100644 package/xen/0004-tools-Update-sys-poll.h-to-poll.h.patch
 create mode 100644 package/xen/0005-tools-blktap2-Update-sys-signal.h-to-signal.h.patch
 create mode 100644 package/xen/0006-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
 create mode 100644 package/xen/0007-tools-blktap2-Fix-missing-header-file.patch
 create mode 100644 package/xen/0008-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch

diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
index ca772dd..9e5e48f 100644
--- a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
+++ b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
@@ -1,4 +1,4 @@
-From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
+From 044e2a4f721fc0127bb8c0f6b8252685ed3b554c Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Tue, 13 Sep 2016 10:48:31 -0700
 Subject: [PATCH] Remove hardcoded strict -Werror checking
@@ -9,10 +9,10 @@ Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Config.mk b/Config.mk
-index bd991c6..e7ac662 100644
+index 73e2ba9..3b7a4bd 100644
 --- a/Config.mk
 +++ b/Config.mk
-@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
+@@ -34,7 +34,7 @@ CONFIG_$(XEN_OS) := y
  SHELL     ?= /bin/sh
  
  # Tools to run on system hosting the build
diff --git a/package/xen/0002-tools-libxl-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0002-tools-libxl-Remove-hardcoded-strict-Werror-checking.patch
new file mode 100644
index 0000000..d36badd
--- /dev/null
+++ b/package/xen/0002-tools-libxl-Remove-hardcoded-strict-Werror-checking.patch
@@ -0,0 +1,26 @@
+From b082e7be69285f80cdc6363160b47159566791f9 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 14:31:04 -0800
+Subject: [PATCH] tools/libxl: Remove hardcoded strict -Werror checking
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/libxl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
+index ef01785..a4c31f8 100644
+--- a/tools/libxl/Makefile
++++ b/tools/libxl/Makefile
+@@ -11,7 +11,7 @@ MINOR = 0
+ XLUMAJOR = 4.8
+ XLUMINOR = 0
+ 
+-CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
++CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
+ 	-Wno-declaration-after-statement -Wformat-nonliteral
+ CFLAGS += -I. -fPIC
+ 
+-- 
+2.7.4
+
diff --git a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
deleted file mode 100644
index 0d4e581..0000000
--- a/package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2a310549aaeaba05f640ade43488bb893101ce4a Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 29 Oct 2016 16:35:26 +0200
-Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
-
-When CFLAGS are passed from the environment, the first-level make
-invocation will append -D__OBJECT_FILE__ to it, then call a second
-make invocation, that will have those new CFLAGS in its environment,
-but will also append -D__OBJECT_FILE__ to those.
-
-Then, the compiler fails because __OBEJECT_FILE__ is defined twice.
-
-Just undefine it before defining it again, as a *workaround* to this
-issue.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- xen/Rules.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xen/Rules.mk b/xen/Rules.mk
-index a9fda71..09ccbfa 100644
---- a/xen/Rules.mk
-+++ b/xen/Rules.mk
-@@ -49,7 +49,7 @@ ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
- CFLAGS += -nostdinc -fno-builtin -fno-common
- CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
- CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h
--CFLAGS += '-D__OBJECT_FILE__="$@"'
-+CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
- 
- ifneq ($(clang),y)
- # Clang doesn't understand this command line argument, and doesn't appear to
--- 
-2.7.4
-
diff --git a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch b/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
deleted file mode 100644
index 80c0b32..0000000
--- a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 19f1e70041044fde1542109a0525424cc6d5d053 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Wed, 7 Dec 2016 11:35:10 -0800
-Subject: [PATCH] tools/libxl: Disable strict Werror checking
-
-Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
----
- tools/libxl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
-index defeb40..239faf3 100644
---- a/tools/libxl/Makefile
-+++ b/tools/libxl/Makefile
-@@ -11,7 +11,7 @@ MINOR = 0
- XLUMAJOR = 4.7
- XLUMINOR = 0
- 
--CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
-+CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
- 	-Wno-declaration-after-statement -Wformat-nonliteral
- CFLAGS += -I. -fPIC
- 
--- 
-2.7.4
-
diff --git a/package/xen/0003-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch b/package/xen/0003-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
new file mode 100644
index 0000000..df91808
--- /dev/null
+++ b/package/xen/0003-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch
@@ -0,0 +1,36 @@
+From 0388b7b8e2623fa5afa68e1284dd18d9956a8f6d Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 29 Oct 2016 16:35:26 +0200
+Subject: [PATCH] xen/Rules.mk: fix build with CFLAGS from environment
+
+When CFLAGS are passed from the environment, the first-level make
+invocation will append -D__OBJECT_FILE__ to it, then call a second
+make invocation, that will have those new CFLAGS in its environment,
+but will also append -D__OBJECT_FILE__ to those.
+
+Then, the compiler fails because __OBEJECT_FILE__ is defined twice.
+
+Just undefine it before defining it again, as a *workaround* to this
+issue.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ xen/Rules.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xen/Rules.mk b/xen/Rules.mk
+index 08cc776..68a4360 100644
+--- a/xen/Rules.mk
++++ b/xen/Rules.mk
+@@ -55,7 +55,7 @@ endif
+ CFLAGS += -nostdinc -fno-builtin -fno-common
+ CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
+ CFLAGS += -pipe -g -D__XEN__ -include $(BASEDIR)/include/xen/config.h
+-CFLAGS += '-D__OBJECT_FILE__="$@"'
++CFLAGS += -U__OBJECT_FILE__ '-D__OBJECT_FILE__="$@"'
+ 
+ ifneq ($(clang),y)
+ # Clang doesn't understand this command line argument, and doesn't appear to
+-- 
+2.7.4
+
diff --git a/package/xen/0004-tools-Update-sys-poll.h-to-poll.h.patch b/package/xen/0004-tools-Update-sys-poll.h-to-poll.h.patch
new file mode 100644
index 0000000..abbebfb
--- /dev/null
+++ b/package/xen/0004-tools-Update-sys-poll.h-to-poll.h.patch
@@ -0,0 +1,74 @@
+From 62c68e4a55ec1b01d44d073528dff7f8021339cc Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 13:23:58 -0800
+Subject: [PATCH] tools: Update sys/poll.h to poll.h
+
+To avoid this build error with newer build systems:
+  error: #warning redirecting incorrect #include <sys/poll.h> to
+         <poll.h> [-Werror=cpp]
+
+Rename sys/poll.h to poll.h
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/libxl/libxl_internal.h               | 2 +-
+ tools/tests/xen-access/xen-access.c        | 2 +-
+ tools/xenstat/libxenstat/src/xenstat_qmp.c | 2 +-
+ tools/xentrace/xentrace.c                  | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
+index 8366fee..6314ae2 100644
+--- a/tools/libxl/libxl_internal.h
++++ b/tools/libxl/libxl_internal.h
+@@ -38,7 +38,7 @@
+ #include <ctype.h>
+ 
+ #include <sys/mman.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/select.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+diff --git a/tools/tests/xen-access/xen-access.c b/tools/tests/xen-access/xen-access.c
+index 9d4f957..887bcd9 100644
+--- a/tools/tests/xen-access/xen-access.c
++++ b/tools/tests/xen-access/xen-access.c
+@@ -36,7 +36,7 @@
+ #include <signal.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include <xenctrl.h>
+ #include <xenevtchn.h>
+diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/xenstat/libxenstat/src/xenstat_qmp.c
+index a87c937..3fda487 100644
+--- a/tools/xenstat/libxenstat/src/xenstat_qmp.c
++++ b/tools/xenstat/libxenstat/src/xenstat_qmp.c
+@@ -14,7 +14,7 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/un.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
+index f09fe6c..364a6fd 100644
+--- a/tools/xentrace/xentrace.c
++++ b/tools/xentrace/xentrace.c
+@@ -24,7 +24,7 @@
+ #include <getopt.h>
+ #include <assert.h>
+ #include <ctype.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/statvfs.h>
+ 
+ #include <xen/xen.h>
+-- 
+2.7.4
+
diff --git a/package/xen/0005-tools-blktap2-Update-sys-signal.h-to-signal.h.patch b/package/xen/0005-tools-blktap2-Update-sys-signal.h-to-signal.h.patch
new file mode 100644
index 0000000..d4b06d3
--- /dev/null
+++ b/package/xen/0005-tools-blktap2-Update-sys-signal.h-to-signal.h.patch
@@ -0,0 +1,32 @@
+From 8383c3cbc3a229a285c3d58ca8ca5d4a66047a2e Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 14:13:55 -0800
+Subject: [PATCH] tools/blktap2: Update sys/signal.h to signal.h
+
+To avoid this build error with newer build systems:
+    error: #warning redirecting incorrect #include <sys/signal.h> to
+           <signal.h> [-Werror=cpp]
+
+Rename sys/signal.h to signal.h
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/blktap2/drivers/tapdisk-server.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/blktap2/drivers/tapdisk-server.c b/tools/blktap2/drivers/tapdisk-server.c
+index eecde3d..71315bb 100644
+--- a/tools/blktap2/drivers/tapdisk-server.c
++++ b/tools/blktap2/drivers/tapdisk-server.c
+@@ -30,7 +30,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <sys/ioctl.h>
+-#include <sys/signal.h>
++#include <signal.h>
+ 
+ #include "tapdisk-utils.h"
+ #include "tapdisk-server.h"
+-- 
+2.7.4
+
diff --git a/package/xen/0006-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch b/package/xen/0006-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
new file mode 100644
index 0000000..9abf951
--- /dev/null
+++ b/package/xen/0006-tools-blktap2-vhd-Remove-unused-struct-stat-stats.patch
@@ -0,0 +1,28 @@
+From 68b4fcf797930d8b24d544c78d7e3e0ef1444125 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 13:28:47 -0800
+Subject: [PATCH] tools/blktap2/vhd: Remove unused struct stat stats
+
+The unsued variable 'struct stat stats' causes build errors in some
+situations. As it isn't used just remove it.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/blktap2/vhd/lib/libvhd-journal.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/blktap2/vhd/lib/libvhd-journal.c b/tools/blktap2/vhd/lib/libvhd-journal.c
+index 26e26e7..862890f 100644
+--- a/tools/blktap2/vhd/lib/libvhd-journal.c
++++ b/tools/blktap2/vhd/lib/libvhd-journal.c
+@@ -1260,7 +1260,6 @@ vhd_journal_create(vhd_journal_t *j, const char *file, const char *jfile)
+ 	int i, err;
+ 	size_t size;
+ 	off_t off;
+-	struct stat stats;
+ 
+ 	memset(j, 0, sizeof(vhd_journal_t));
+ 	j->jfd = -1;
+-- 
+2.7.4
+
diff --git a/package/xen/0007-tools-blktap2-Fix-missing-header-file.patch b/package/xen/0007-tools-blktap2-Fix-missing-header-file.patch
new file mode 100644
index 0000000..e4d55d2
--- /dev/null
+++ b/package/xen/0007-tools-blktap2-Fix-missing-header-file.patch
@@ -0,0 +1,29 @@
+From b502f3b351d1966020a27c70842cfaa2ce5f9e09 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Fri, 16 Dec 2016 14:16:39 -0800
+Subject: [PATCH] tools/blktap2: Fix missing header file
+
+To avoid build errors relating to missing delcarations of ssize_t add
+the appripriote header file to atomic.h.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/blktap2/include/atomicio.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/blktap2/include/atomicio.h b/tools/blktap2/include/atomicio.h
+index 7eccf20..5a1120e 100644
+--- a/tools/blktap2/include/atomicio.h
++++ b/tools/blktap2/include/atomicio.h
+@@ -25,6 +25,8 @@
+  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#include <sys/types.h>
++
+ /*
+  * Ensure all of data on socket comes through. f==read || f==vwrite
+  */
+-- 
+2.7.4
+
diff --git a/package/xen/0008-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch b/package/xen/0008-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
new file mode 100644
index 0000000..7311429
--- /dev/null
+++ b/package/xen/0008-tools-blktap2-drivers-Remove-non-existent-sys-sysctl.patch
@@ -0,0 +1,29 @@
+From db130b4096aaeb4a64213a31bc3d6e5f1fd33990 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Mon, 19 Dec 2016 10:42:01 -0800
+Subject: [PATCH] tools/blktap2/drivers: Remove non-existent sys/sysctl.h
+ include
+
+To avoid build errors related to missing file 'sys/sysctl.h' by removing
+the #include statement.
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/blktap2/drivers/block-remus.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/blktap2/drivers/block-remus.c b/tools/blktap2/drivers/block-remus.c
+index 079588d..7401800 100644
+--- a/tools/blktap2/drivers/block-remus.c
++++ b/tools/blktap2/drivers/block-remus.c
+@@ -54,7 +54,6 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <sys/param.h>
+-#include <sys/sysctl.h>
+ #include <unistd.h>
+ #include <sys/stat.h>
+ 
+-- 
+2.7.4
+
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c3df243..ac04a87 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 e87f4b0575e78657ee23d31470a15ecf1ce8c3a92a771cda46bbcd4d0d671ffe xen-4.7.1.tar.gz
+sha256 1e15c713ab7ba3bfda8b4a285ed973529364fd1100e6dd5a61f29583dc667b04 xen-4.8.0.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 7d32e52..a3f312a 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.7.1
+XEN_VERSION = 4.8.0
 XEN_SITE = http://bits.xensource.com/oss-xen/release/$(XEN_VERSION)
 XEN_LICENSE = GPLv2
 XEN_LICENSE_FILES = COPYING
-- 
2.7.4
