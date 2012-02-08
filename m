From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 00:40:45 +0100
Subject: [Buildroot] [git commit] iptables: fix build with 3.2 kernel headers
Message-ID: <20120208234316.A661B90A39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3da83717450bc512343dc46c5121721edb85e205
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on upstream post-1.14.12.2 change.

linux/if_packet.h changed to use the newly introduced __aligned_u64
type in 3.2, which iptables' embedded linux/types.h doesn't provide.
Fix it by updating linux/types.h.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables-3.2-headers-fix.patch |   34 +++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/iptables/iptables-3.2-headers-fix.patch b/package/iptables/iptables-3.2-headers-fix.patch
new file mode 100644
index 0000000..5ef6539
--- /dev/null
+++ b/package/iptables/iptables-3.2-headers-fix.patch
@@ -0,0 +1,34 @@
+From dbe77cc974cee656eae37e75039dd1a410a4535b Mon Sep 17 00:00:00 2001
+From: Jan Engelhardt <jengelh@medozas.de>
+Date: Sun, 28 Aug 2011 14:19:43 +0200
+Subject: [PATCH] include: refresh include files from kernel 3.1-rc3
+
+[Peter: trimmed to bare essentials for buildroot]
+Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
+---
+diff --git a/include/linux/types.h b/include/linux/types.h
+index 8b483c8..630cd3b 100644
+--- a/include/linux/types.h
++++ b/include/linux/types.h
+@@ -34,5 +34,18 @@ typedef __u64 __bitwise __be64;
+ typedef __u16 __bitwise __sum16;
+ typedef __u32 __bitwise __wsum;
+ 
++/*
++ * aligned_u64 should be used in defining kernel<->userspace ABIs to avoid
++ * common 32/64-bit compat problems.
++ * 64-bit values align to 4-byte boundaries on x86_32 (and possibly other
++ * architectures) and to 8-byte boundaries on 64-bit architetures.  The new
++ * aligned_64 type enforces 8-byte alignment so that structs containing
++ * aligned_64 values have the same alignment on 32-bit and 64-bit architectures.
++ * No conversions are necessary between 32-bit user-space and a 64-bit kernel.
++ */
++#define __aligned_u64 __u64 __attribute__((aligned(8)))
++#define __aligned_be64 __be64 __attribute__((aligned(8)))
++#define __aligned_le64 __le64 __attribute__((aligned(8)))
++
+ #endif /*  __ASSEMBLY__ */
+ #endif /* _LINUX_TYPES_H */
+-- 
+1.7.8.3
+
