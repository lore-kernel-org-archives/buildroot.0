From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 09:59:16 +0100
Subject: [Buildroot] [git commit] mmc-utils: Fix 64-bit values redefinition
Message-ID: <20140204091933.C0A7E9C77E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=abe55df74d588d3b4401ff89dae47c3b67a1908a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some toolchains include asm-generic/int-l64.h from their asm/types.h
file for certain 64-bit architectures. This causes a conflict between
types like this one:

asm-generic/int-l64.h:28:25: error: conflicting types for '__s64'
 typedef __signed__ long __s64;
             ^
In file included from mmc.h:17:0,
         from mmc_cmds.c:30:
asm-generic/int-ll64.h:29:44: note: previous declaration of '__s64' was
here
 __extension__ typedef __signed__ long long __s64;

This patch has been submitted upstream.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-mmc-utils-Fix-64-bit-values-redefinition.patch |   40 ++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/mmc-utils/0001-mmc-utils-Fix-64-bit-values-redefinition.patch b/package/mmc-utils/0001-mmc-utils-Fix-64-bit-values-redefinition.patch
new file mode 100644
index 0000000..07dc742
--- /dev/null
+++ b/package/mmc-utils/0001-mmc-utils-Fix-64-bit-values-redefinition.patch
@@ -0,0 +1,40 @@
+mmc-utils: Fix 64-bit values redefinition
+
+Some toolchains include asm-generic/int-l64.h from their asm/types.h
+file for certain 64-bit architectures. This causes a conflict between
+types like this one:
+
+asm-generic/int-l64.h:28:25: error: conflicting types for '__s64'
+ typedef __signed__ long __s64;
+	     ^
+In file included from mmc.h:17:0,
+	 from mmc_cmds.c:30:
+asm-generic/int-ll64.h:29:44: note: previous declaration of '__s64' was
+here
+ __extension__ typedef __signed__ long long __s64;
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ mmc.h |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/mmc.h b/mmc.h
+index 9871d62..2d54ec5 100644
+--- a/mmc.h
++++ b/mmc.h
+@@ -14,9 +14,11 @@
+  * Boston, MA 021110-1307, USA.
+  */
+ 
+-#include <asm-generic/int-ll64.h>
+ #include <linux/mmc/ioctl.h>
+ #include <stdio.h>
++#ifndef _ASM_GENERIC_INT_L64_H
++#include <asm-generic/int-ll64.h>
++#endif
+ 
+ #define CHECK(expr, msg, err_stmt) { if (expr) { fprintf(stderr, msg); err_stmt; } }
+ 
+-- 
+1.7.1
+
