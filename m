From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 May 2014 16:08:36 +0200
Subject: [Buildroot] [git commit] gdb: replace xtensa patches with proper
	backports from binutils-gdb
Message-ID: <20140516141217.92B839CBB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c275998daa3c9127789f70c5ba5ddaa99203817
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The functionality is unchanged.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch |   60 ++++++++++++++++++++
 .../7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch |   42 ++++++++++++++
 package/gdb/7.4.1/xtensa-asm-ptrace-h.patch        |   22 -------
 package/gdb/7.4.1/xtensa-gdb-regsize.patch         |   19 ------
 4 files changed, 102 insertions(+), 41 deletions(-)

diff --git a/package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch b/package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
new file mode 100644
index 0000000..3b391d0
--- /dev/null
+++ b/package/gdb/7.4.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
@@ -0,0 +1,60 @@
+From e671835b7afc90b3ff201b79f07a6fb67797bc5c Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Mon, 20 Jan 2014 09:53:12 +0200
+Subject: [PATCH] gdb: xtensa: fix linux ptrace includes
+
+Currently, xtensa code using the Linux ptrace interface only include
+sys/ptrace.h.  This file comes from the C library (glibc and uClibc,
+at least), and includes a declaration of the ptrace() functions, along
+with some cross architecture constants that are mostly copied from the
+file located at include/uapi/linux/ptrace.h in recent Linux kernels.
+
+For xtensa specific constants like PTRACE_GETXTREGS and
+PTRACE_SETXTREGS the asm/ptrace.h include from the Linux kernel UAPI
+is needed.  The code in gdbserver xtensa specific part doesn't call
+ptrace() directly, so we can remove the unneeded sys/ptrace.h include.
+The gdb xtensa specific code needs both headers, since it calls
+ptrace().
+
+gdb/
+	* xtensa-linux-nat.c: Include asm/ptrace.h.
+
+gdb/gdbserver/
+	* linux-xtensa-low.c: Include asm/ptrace.h instead of
+	sys/ptrace.h.
+---
+Backported from: e671835b7afc90b3ff201b79f07a6fb67797bc5c
+Changes to Changelog files are dropped.
+
+ gdb/gdbserver/linux-xtensa-low.c | 2 +-
+ gdb/xtensa-linux-nat.c           | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/gdbserver/linux-xtensa-low.c b/gdb/gdbserver/linux-xtensa-low.c
+index 7db97a9..479b65b 100644
+--- a/gdb/gdbserver/linux-xtensa-low.c
++++ b/gdb/gdbserver/linux-xtensa-low.c
+@@ -24,7 +24,7 @@
+ void init_registers_xtensa (void);
+ extern const struct target_desc *tdesc_xtensa;
+ 
+-#include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ #include <xtensa-config.h>
+ 
+ #include "xtensa-xtregs.c"
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index 2372e79..9340c62 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -36,6 +36,7 @@
+ #include <fcntl.h>
+ #include <sys/procfs.h>
+ #include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
+-- 
+1.8.1.4
+
diff --git a/package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch b/package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
new file mode 100644
index 0000000..b5f5bdf
--- /dev/null
+++ b/package/gdb/7.4.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
@@ -0,0 +1,42 @@
+From 54bff650843cacd3c17a0afdb0fe32e15e1b65b0 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 22 Jan 2014 15:02:29 +0200
+Subject: [PATCH] gdb: xtensa: fix on 64-bit hosts
+
+On 64-bit hosts unsigned long is 64 bit.  Use uint32_t instead.
+
+gdb/
+2014-01-22  Baruch Siach  <baruch@tkos.co.il>
+
+	* xtensa-tdep.h (xtensa_elf_greg_t): Change type to uint32_t.
+---
+Backported from: 54bff650843cacd3c17a0afdb0fe32e15e1b65b0
+Changes to Changelog files are dropped and #include <stdint.h> is added.
+
+ gdb/xtensa-tdep.h | 3 +-
+ 1 file changed, 2 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/xtensa-tdep.h b/gdb/xtensa-tdep.h
+index 968b9d2..d7ba562 100644
+--- a/gdb/xtensa-tdep.h
++++ b/gdb/xtensa-tdep.h
+@@ -17,6 +17,7 @@
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
++#include <stdint.h>
+ 
+ /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
+    whenever the "tdep" structure changes in an incompatible way.  */
+@@ -84,7 +84,7 @@ typedef enum
+ /* Xtensa ELF core file register set representation ('.reg' section).
+    Copied from target-side ELF header <xtensa/elf.h>.  */
+ 
+-typedef unsigned long xtensa_elf_greg_t;
++typedef uint32_t xtensa_elf_greg_t;
+ 
+ typedef struct
+ {
+-- 
+1.8.1.4
+
diff --git a/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch b/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
deleted file mode 100644
index 3d1b07c..0000000
--- a/package/gdb/7.4.1/xtensa-asm-ptrace-h.patch
+++ /dev/null
@@ -1,22 +0,0 @@
---- gdb-7.4.1/gdb/xtensa-linux-nat.c.orig	2012-10-19 16:23:06.908165323 -0700
-+++ gdb-7.4.1/gdb/xtensa-linux-nat.c	2012-10-19 16:35:30.792134876 -0700
-@@ -36,7 +36,7 @@
- #include "gdb_wait.h"
- #include <fcntl.h>
- #include <sys/procfs.h>
--#include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- 
- #include "gregset.h"
- #include "xtensa-tdep.h"
---- gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c.orig	2012-10-19 16:24:06.260162894 -0700
-+++ gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c	2012-10-19 16:36:07.920133357 -0700
-@@ -23,7 +23,7 @@
- /* Defined in auto-generated file reg-xtensa.c.  */
- void init_registers_xtensa (void);
- 
--#include <sys/ptrace.h>
-+#include <asm/ptrace.h>
- #include <xtensa-config.h>
- 
- #include "xtensa-xtregs.c"
diff --git a/package/gdb/7.4.1/xtensa-gdb-regsize.patch b/package/gdb/7.4.1/xtensa-gdb-regsize.patch
deleted file mode 100644
index e10bb8f..0000000
--- a/package/gdb/7.4.1/xtensa-gdb-regsize.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- gdb-7.4.1/gdb/xtensa-tdep.h.orig	2012-10-30 11:40:23.546448594 -0700
-+++ gdb-7.4.1/gdb/xtensa-tdep.h	2012-10-30 11:41:43.078445337 -0700
-@@ -17,6 +17,7 @@
-    You should have received a copy of the GNU General Public License
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
-+#include <stdint.h>
- 
- /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
-    whenever the "tdep" structure changes in an incompatible way.  */
-@@ -84,7 +85,7 @@
- /* Xtensa ELF core file register set representation ('.reg' section).
-    Copied from target-side ELF header <xtensa/elf.h>.  */
- 
--typedef unsigned long xtensa_elf_greg_t;
-+typedef uint32_t xtensa_elf_greg_t;
- 
- typedef struct
- {
