From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu,  5 Dec 2019 14:25:54 -0600
Subject: [Buildroot] [PATCH 1/1] check-kernel-headers: allow safe version
 mismatches
Message-ID: <20191205202554.18273-1-vfazio@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously, if toolchain headers were versioned ahead of the latest
selectable Buildroot toolchain header version, packages could not be
built because of an explicit equality check. This forced the user to
either advance the Buildroot repository or to rebuild their toolchain
with a selectable, but older, version of headers.

Now, we allow a toolchain's headers to outpace the latest selectable
Buildroot toolchain header version. The header version dependencies in
package configurations use "at least" version semantics, so newer
toolchains still meet the requirement.

Suggested-by: Aaron Sierra <asierra@xes-inc.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 support/scripts/check-kernel-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index 9d23c00feb..093df46510 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -33,7 +33,7 @@ int main(int argc __attribute__((unused)),
          char** argv __attribute__((unused)))
 {
     if((LINUX_VERSION_CODE & ~0xFF)
-        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
+        < KERNEL_VERSION(${HDR_M},${HDR_m},0))
     {
         printf("Incorrect selection of kernel headers: ");
         printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
-- 
2.24.0
