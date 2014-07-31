From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Thu, 31 Jul 2014 17:24:42 +0400
Subject: [Buildroot] [PATCH v2 1/9] toolchain: Add config option for atomic
	intrinsics
In-Reply-To: <20140730084548.05bd6dec@free-electrons.com>
References: <20140730084548.05bd6dec@free-electrons.com>
Message-ID: <1406813090-32472-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC has several builtin functions that implement atomic operations. Those
functions are architecture specific and may not be implemented by the
specific toolchain. In case of GCC for ARC those functions rely on
LLOCK/SCOND instructions which are optional in ARC CPU's. If ARC CPU doesn't
support those instructions but software tries to use them, then application
will be aborted with Illegal instruction exception. To avoid confusion user
should first specify that their CPU supports atomic extension, which will
allow selection of packages that use builtin atomic functions.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.arc            | 5 +++++
 package/Makefile.in           | 4 ++++
 toolchain/toolchain-common.in | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 60b59f0..836cfef 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,3 +1,8 @@
+# Choise of atomic instructions presence
+config BR2_ARC_ATOMIC_EXT
+	bool "Atomic extension (LLOCK/SCOND instructions)"
+	select BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 config BR2_ARCH
 	default "arc"	if BR2_arcle
 	default "arceb"	if BR2_arceb
diff --git a/package/Makefile.in b/package/Makefile.in
index 02f6e3d..106a04c 100644
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
 
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 13de9e5..f9cb7cf 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -44,6 +44,10 @@ config BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 config BR2_TOOLCHAIN_HAS_SSP
 	bool
 
+config BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	bool
+	default y if !BR2_arc
+
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
 	help
-- 
1.8.4.1
