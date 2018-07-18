From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jul 2018 23:32:00 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/gdb: fix
 gdbserver build for m68k
Message-ID: <20180718212802.EDBE080415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=343514aa9a5f7c5d28252898b66836db6c149d67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
the build fails on m68k with the following diagnostics:

In file included from ./../nat/linux-ptrace.h:28:0,
                 from linux-low.h:27,
                 from linux-m68k-low.c:20:
[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
   PT_D1 = 0,
   ^
[...]usr/include/sys/reg.h:26:3: error: expected ????}???? before numeric constant
[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
In file included from linux-m68k-low.c:27:0:
[...]usr/include/sys/reg.h:99:1: error: expected declaration before ????}???? token
 };
 ^

Fix this by moving <sys/reg.h> on top of "linux-low.h".

Fixes:
https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006385

[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8646a7fae998132cf468454be8b762211713d5ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../7.12.1/0007-gdbserver-fix-build-for-m68k.patch | 62 ++++++++++++++++++++++
 .../8.0.1/0005-gdbserver-fix-build-for-m68k.patch  | 62 ++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/package/gdb/7.12.1/0007-gdbserver-fix-build-for-m68k.patch b/package/gdb/7.12.1/0007-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..451bed312c
--- /dev/null
+++ b/package/gdb/7.12.1/0007-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,62 @@
+From 80c60ea9fb3634272a98ec526eabff25f5255bae Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 22 Jun 2018 22:40:26 +0200
+Subject: [PATCH] gdbserver: fix build for m68k
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
+the build fails on m68k with the following diagnostics:
+
+In file included from ./../nat/linux-ptrace.h:28:0,
+                 from linux-low.h:27,
+                 from linux-m68k-low.c:20:
+[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
+   PT_D1 = 0,
+   ^
+[...]usr/include/sys/reg.h:26:3: error: expected ????}???? before numeric constant
+[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
+In file included from linux-m68k-low.c:27:0:
+[...]usr/include/sys/reg.h:99:1: error: expected declaration before ????}???? token
+ };
+ ^
+
+Fix this by moving <sys/reg.h> on top of "linux-low.h".
+
+[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-m68k-low.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
+index 5594f10f927..19b4ef7b259 100644
+--- a/gdb/gdbserver/linux-m68k-low.c
++++ b/gdb/gdbserver/linux-m68k-low.c
+@@ -17,16 +17,17 @@
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include "server.h"
++
++#ifdef HAVE_SYS_REG_H
++#include <sys/reg.h>
++#endif
++
+ #include "linux-low.h"
+ 
+ /* Defined in auto-generated file reg-m68k.c.  */
+ void init_registers_m68k (void);
+ extern const struct target_desc *tdesc_m68k;
+ 
+-#ifdef HAVE_SYS_REG_H
+-#include <sys/reg.h>
+-#endif
+-
+ #define m68k_num_regs 29
+ #define m68k_num_gregs 18
+ 
+-- 
+2.14.4
+
diff --git a/package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..451bed312c
--- /dev/null
+++ b/package/gdb/8.0.1/0005-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,62 @@
+From 80c60ea9fb3634272a98ec526eabff25f5255bae Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 22 Jun 2018 22:40:26 +0200
+Subject: [PATCH] gdbserver: fix build for m68k
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
+the build fails on m68k with the following diagnostics:
+
+In file included from ./../nat/linux-ptrace.h:28:0,
+                 from linux-low.h:27,
+                 from linux-m68k-low.c:20:
+[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
+   PT_D1 = 0,
+   ^
+[...]usr/include/sys/reg.h:26:3: error: expected ????}???? before numeric constant
+[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
+In file included from linux-m68k-low.c:27:0:
+[...]usr/include/sys/reg.h:99:1: error: expected declaration before ????}???? token
+ };
+ ^
+
+Fix this by moving <sys/reg.h> on top of "linux-low.h".
+
+[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-m68k-low.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
+index 5594f10f927..19b4ef7b259 100644
+--- a/gdb/gdbserver/linux-m68k-low.c
++++ b/gdb/gdbserver/linux-m68k-low.c
+@@ -17,16 +17,17 @@
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include "server.h"
++
++#ifdef HAVE_SYS_REG_H
++#include <sys/reg.h>
++#endif
++
+ #include "linux-low.h"
+ 
+ /* Defined in auto-generated file reg-m68k.c.  */
+ void init_registers_m68k (void);
+ extern const struct target_desc *tdesc_m68k;
+ 
+-#ifdef HAVE_SYS_REG_H
+-#include <sys/reg.h>
+-#endif
+-
+ #define m68k_num_regs 29
+ #define m68k_num_gregs 18
+ 
+-- 
+2.14.4
+
