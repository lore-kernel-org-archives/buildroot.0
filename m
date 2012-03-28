From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 27 Mar 2012 21:44:54 -0300
Subject: [Buildroot] [PATCH] iptables: bump to version 1.4.13
Message-ID: <1332895494-18765-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iptables/iptables-3.2-headers-fix.patch |   34 -----------------------
 package/iptables/iptables.mk                    |    2 +-
 2 files changed, 1 insertions(+), 35 deletions(-)
 delete mode 100644 package/iptables/iptables-3.2-headers-fix.patch

diff --git a/package/iptables/iptables-3.2-headers-fix.patch b/package/iptables/iptables-3.2-headers-fix.patch
deleted file mode 100644
index 5ef6539..0000000
--- a/package/iptables/iptables-3.2-headers-fix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From dbe77cc974cee656eae37e75039dd1a410a4535b Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@medozas.de>
-Date: Sun, 28 Aug 2011 14:19:43 +0200
-Subject: [PATCH] include: refresh include files from kernel 3.1-rc3
-
-[Peter: trimmed to bare essentials for buildroot]
-Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
----
-diff --git a/include/linux/types.h b/include/linux/types.h
-index 8b483c8..630cd3b 100644
---- a/include/linux/types.h
-+++ b/include/linux/types.h
-@@ -34,5 +34,18 @@ typedef __u64 __bitwise __be64;
- typedef __u16 __bitwise __sum16;
- typedef __u32 __bitwise __wsum;
- 
-+/*
-+ * aligned_u64 should be used in defining kernel<->userspace ABIs to avoid
-+ * common 32/64-bit compat problems.
-+ * 64-bit values align to 4-byte boundaries on x86_32 (and possibly other
-+ * architectures) and to 8-byte boundaries on 64-bit architetures.  The new
-+ * aligned_64 type enforces 8-byte alignment so that structs containing
-+ * aligned_64 values have the same alignment on 32-bit and 64-bit architectures.
-+ * No conversions are necessary between 32-bit user-space and a 64-bit kernel.
-+ */
-+#define __aligned_u64 __u64 __attribute__((aligned(8)))
-+#define __aligned_be64 __be64 __attribute__((aligned(8)))
-+#define __aligned_le64 __le64 __attribute__((aligned(8)))
-+
- #endif /*  __ASSEMBLY__ */
- #endif /* _LINUX_TYPES_H */
--- 
-1.7.8.3
-
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 95134e3..87578d5 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPTABLES_VERSION = 1.4.12.2
+IPTABLES_VERSION = 1.4.13
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-- 
1.7.3.4
