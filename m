From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 11:20:47 +0200
Subject: [Buildroot] [git commit] toolchain: Add config option for atomic
	intrinsics
Message-ID: <20140803093227.6D18B9D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbffd50561f7ce595296bddaf108031e501b2063
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC has several builtin functions that implement atomic operations. Those
functions are architecture specific and may not be implemented by the
specific toolchain. In case of GCC for ARC those functions rely on
LLOCK/SCOND instructions which are optional in ARC CPU's. If ARC CPU doesn't
support those instructions but software tries to use them, then application
will be aborted with Illegal instruction exception. To avoid confusion user
should first specify that their CPU supports atomic extension, which will
allow selection of packages that use builtin atomic functions.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arc            |    5 +++++
 package/Makefile.in           |    4 ++++
 toolchain/toolchain-common.in |    4 ++++
 3 files changed, 13 insertions(+), 0 deletions(-)

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
index 2df8ddb..48ba840 100644
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
