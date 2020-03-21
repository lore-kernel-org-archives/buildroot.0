From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 15:47:03 +0100
Subject: [Buildroot] [git commit] support/scripts/check-kernel-headers.sh:
 do not print error for loose checks
Message-ID: <20200321143400.D6670836CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3c4b3dfa8e0ef4f69583e9f705106feb8fbac07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The C program inside check-kernel-headers.sh has two checking mode: a
strict and a loose one.

In strict mode, we want the kernel headers version declared by the
user to match exactly the one of the toolchain.

In loose mode, we want the kernel headers version of the toolchain to
be greater than or equal to the one declared by the user: this is used
when we have a toolchain that has newer headers than the latest
version known by Buildroot.

However, in loose mode, we continue to show the "Incorrect kernel
headers version" message, even though we then return a zero error
code. This is very confusing: you see an error displayed on the
terminal, but the build goes on.

We fix that by first doing the loose check first, and returning 0 if
it succeeds. And then we move on with the strict check where we want
the version to be identical.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-kernel-headers.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index 841df98b64..4e6dce5487 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -49,18 +49,20 @@ ${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
 int main(int argc __attribute__((unused)),
          char** argv __attribute__((unused)))
 {
-    int ret = 0;
     int l = LINUX_VERSION_CODE & ~0xFF;
     int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
 
+    if ((l >= h) && !strcmp("${CHECK}", "loose"))
+        return 0;
+
     if (l != h) {
         printf("Incorrect selection of kernel headers: ");
         printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
                ((LINUX_VERSION_CODE>>16) & 0xFF),
                ((LINUX_VERSION_CODE>>8) & 0xFF));
-        ret = ((l >= h) && !strcmp("${CHECK}", "loose")) ? 0 : 1;
+        return 1;
     }
-    return ret;
+    return 0;
 }
 _EOF_
 
