From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 May 2014 19:37:20 +0400
Subject: [Buildroot] [PATCH v2 2/2] gdb: add xtensa fixes for 7.5.1
In-Reply-To: <1400168240-12105-1-git-send-email-jcmvbkbc@gmail.com>
References: <1400168240-12105-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1400168240-12105-3-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two fixes for xtensa are still applicable to gdb-7.5.1, which is now the
default; copy them from 7.4.1. This fixes native gdb build for xtensa.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1 -> v2:
- add #include <stdint.h> to fix build error due to missing uint32_t
  definition.

 .../gdb-100-xtensa-fix-linux-ptrace-includes.patch | 60 ++++++++++++++++++++++
 .../7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch | 42 +++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
 create mode 100644 package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch

diff --git a/package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch b/package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
new file mode 100644
index 0000000..3b391d0
--- /dev/null
+++ b/package/gdb/7.5.1/gdb-100-xtensa-fix-linux-ptrace-includes.patch
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
diff --git a/package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch b/package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
new file mode 100644
index 0000000..b5f5bdf
--- /dev/null
+++ b/package/gdb/7.5.1/gdb-101-xtensa-fix-on-64-bit-hosts.patch
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
-- 
1.8.1.4
