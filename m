From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Mar 2014 14:59:30 +0200
Subject: [Buildroot] [[RFC]] toolchain: print actual version of kernel
	headers when checking
Message-ID: <1396184370-4204-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reported-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-kernel-headers.sh | 39 ++++++++++++++++++++++++++++-----
 toolchain/helpers.mk                    |  3 +--
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index d7fe7d4..2b4ee36 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -8,14 +8,43 @@ HDR_M="${HDR_VER%%.*}"
 HDR_V="${HDR_VER#*.}"
 HDR_m="${HDR_V%%.*}"
 
+EXEC="/tmp/br.check-headers.$(uuidgen)"
+
+# By the time we get here, we do not always have the staging-dir
+# already populated (think external toolchain), so we can not use
+# it.
+# So we just ask the cross compiler what its default sysroot is.
+# For multilib-aware toolchains where we should use a non-default
+# sysroot, it's not really a problem since the version of the kernel
+# headers is the same for all sysroots.
+SYSROOT=$( ${CC} -print-sysroot )
+
 # We do not want to account for the patch-level, since headers are
 # not supposed to change for different patchlevels, so we mask it out.
 # This only applies to kernels >= 3.0, but those are the only one
 # we actually care about; we treat all 2.6.x kernels equally.
+${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
+          -x c -o "${EXEC}" - <<_EOF_
+#include <stdio.h>
+#include <stdlib.h>
 
-exec ${CC} -E -x c -o - - >/dev/null 2>&1 <<_EOF_
-#include <linux/version.h>
-#if (LINUX_VERSION_CODE & ~0xFF) != KERNEL_VERSION(${HDR_M},${HDR_m},0)
-#error Incorrect kernel header version.
-#endif
+int main( int argc __attribute__((unused)),
+          char** argv __attribute__((unused)) )
+{
+    if(    (LINUX_VERSION_CODE & ~0xFF)
+        != KERNEL_VERSION(${HDR_M},${HDR_m},0) )
+    {
+        printf( "Incorrect selection of kernel headers:\n" );
+        printf( "Expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
+                ((LINUX_VERSION_CODE>>16) & 0xFF),
+                ((LINUX_VERSION_CODE>>8) & 0xFF) );
+        return 1;
+    }
+    return 0;
+}
 _EOF_
+
+"${EXEC}"
+ret=${?}
+rm -f "${EXEC}"
+exit ${ret}
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 64d5095..6875916 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -171,8 +171,7 @@ copy_toolchain_sysroot = \
 #
 check_kernel_headers_version = \
 	if ! support/scripts/check-kernel-headers.sh $(1) $(2); then \
-		echo "Incorrect selection of kernel headers"; \
-	    exit 1; \
+		exit 1; \
 	fi
 
 #
-- 
1.8.3.2
