From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Apr 2018 14:13:39 +0200
Subject: [Buildroot] [PATCH] libnss: add upstream patch fixing build on
 aarch64
Message-ID: <20180403121339.31699-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/037/037c772a36762df8febd529b329743d18ffbf66a/

Build system forgets to compile a file on aarch64, breaking the build.

For details, see the upstream bugreport:
https://bugzilla.mozilla.org/show_bug.cgi?id=1432455

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch

diff --git a/package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch b/package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch
new file mode 100644
index 0000000000..94f1a65273
--- /dev/null
+++ b/package/libnss/0003-Build-Hacl_Poly1305_64_o_on_Aarch64.patch
@@ -0,0 +1,38 @@
+# HG changeset patch
+# User Daiki Ueno <dueno@redhat.com>
+# Date 1516710574 -3600
+# Node ID 1668fafc1db4f739d5d15fbc94283858f842deb5
+# Parent  c3702e37a048e386f88e7c50a228d27669332725
+Bug 1432455, Build Hacl_Poly1305_64.o on AArch64 even with make, r=fkiefer
+
+[Upstream: https://hg.mozilla.org/projects/nss/rev/1668fafc1db4
+ Peter: adjust paths for tarball]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -522,17 +522,22 @@ ifndef NSS_DISABLE_CHACHAPOLY
+ 
+         ifneq (1,$(CC_IS_GCC))
+             EXTRA_SRCS += chacha20.c
+             VERIFIED_SRCS += Hacl_Chacha20.c
+         else
+             EXTRA_SRCS += chacha20_vec.c
+         endif
+     else
+-        EXTRA_SRCS += poly1305.c
++        ifeq ($(CPU_ARCH),aarch64)
++            EXTRA_SRCS += Hacl_Poly1305_64.c
++        else
++            EXTRA_SRCS += poly1305.c
++        endif
++
+         EXTRA_SRCS += chacha20.c
+         VERIFIED_SRCS += Hacl_Chacha20.c
+     endif # x86_64
+ endif # NSS_DISABLE_CHACHAPOLY
+ 
+ ifeq (,$(filter-out i386 x386 x86 x86_64 aarch64,$(CPU_ARCH)))
+     # All intel architectures get the 64 bit version
+     # With custom uint128 if necessary (faster than generic 32 bit version).
+
-- 
2.11.0
