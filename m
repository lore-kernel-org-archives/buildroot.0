From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 22:02:00 +0400
Subject: [Buildroot] [PATCH 1/9] arc: Support option of atomic extension
Message-ID: <1406570528-31516-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC has several builtin functions that implement atomic operations. In GCC
for ARC those functions rely on LLOCK/SCOND instructions which are optional
in ARC CPU's. If software uses those functions and as a result those
instructions, it will be abort with Illegal instruction exception. To avoid
confusion user should first specify that their CPU supports atomic
extension, which will allow selection of packages that use builtin atomic
functions.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.arc  | 4 ++++
 package/Makefile.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 60b59f0..9edcbd4 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,3 +1,7 @@
+# Choise of atomic instructions presence
+config BR2_ARC_ATOMIC_EXT
+	bool "Atomic extension (LLOCK/SCOND instructions)"
+
 config BR2_ARCH
 	default "arc"	if BR2_arcle
 	default "arceb"	if BR2_arceb
diff --git a/package/Makefile.in b/package/Makefile.in
index fc55850..3d25d2a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -102,6 +102,10 @@ ifeq ($(BR2_xtensa),y)
 TARGET_ABI += -mlongcalls -mtext-section-literals
 endif
 
+ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
+TARGET_ABI += -matomic
+endif
+
 STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot
 STAGING_DIR    = $(HOST_DIR)/$(STAGING_SUBDIR)
 
-- 
1.8.4.1
