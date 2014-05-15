From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 15 May 2014 04:26:01 +0400
Subject: [Buildroot] [PATCH] gdb: add xtensa fixes for 7.5.1
Message-ID: <1400113561-851-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two fixes for xtensa are still applicable to gdb-7.5.1, which is now the
default; copy them from 7.4.1 and rename accordingly.
This fixes native and cross-gdb build for xtensa.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 .../gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch    | 22 ++++++++++++++++++++++
 package/gdb/7.5.1/gdb-101-xtensa-regsize.patch     | 19 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 package/gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch
 create mode 100644 package/gdb/7.5.1/gdb-101-xtensa-regsize.patch

diff --git a/package/gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch b/package/gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch
new file mode 100644
index 0000000..3d1b07c
--- /dev/null
+++ b/package/gdb/7.5.1/gdb-100-xtensa-asm-ptrace-h.patch
@@ -0,0 +1,22 @@
+--- gdb-7.4.1/gdb/xtensa-linux-nat.c.orig	2012-10-19 16:23:06.908165323 -0700
++++ gdb-7.4.1/gdb/xtensa-linux-nat.c	2012-10-19 16:35:30.792134876 -0700
+@@ -36,7 +36,7 @@
+ #include "gdb_wait.h"
+ #include <fcntl.h>
+ #include <sys/procfs.h>
+-#include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
+--- gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c.orig	2012-10-19 16:24:06.260162894 -0700
++++ gdb-7.4.1/gdb/gdbserver/linux-xtensa-low.c	2012-10-19 16:36:07.920133357 -0700
+@@ -23,7 +23,7 @@
+ /* Defined in auto-generated file reg-xtensa.c.  */
+ void init_registers_xtensa (void);
+ 
+-#include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ #include <xtensa-config.h>
+ 
+ #include "xtensa-xtregs.c"
diff --git a/package/gdb/7.5.1/gdb-101-xtensa-regsize.patch b/package/gdb/7.5.1/gdb-101-xtensa-regsize.patch
new file mode 100644
index 0000000..e10bb8f
--- /dev/null
+++ b/package/gdb/7.5.1/gdb-101-xtensa-regsize.patch
@@ -0,0 +1,19 @@
+--- gdb-7.4.1/gdb/xtensa-tdep.h.orig	2012-10-30 11:40:23.546448594 -0700
++++ gdb-7.4.1/gdb/xtensa-tdep.h	2012-10-30 11:41:43.078445337 -0700
+@@ -17,6 +17,7 @@
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
++#include <stdint.h>
+ 
+ /* XTENSA_TDEP_VERSION can/should be changed along with XTENSA_CONFIG_VERSION
+    whenever the "tdep" structure changes in an incompatible way.  */
+@@ -84,7 +85,7 @@
+ /* Xtensa ELF core file register set representation ('.reg' section).
+    Copied from target-side ELF header <xtensa/elf.h>.  */
+ 
+-typedef unsigned long xtensa_elf_greg_t;
++typedef uint32_t xtensa_elf_greg_t;
+ 
+ typedef struct
+ {
-- 
1.8.1.4
