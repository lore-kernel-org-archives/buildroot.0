From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Aug 2014 10:56:35 +0200
Subject: [Buildroot] [git commit] arch: add an option to specify if the arch
	has atomic ops
Message-ID: <20140818090639.DA2E29D4A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b5f0fc8dfdad74649d4e12737c83e727e116535
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fact that atomic operations are available is not really a
specificity of the toolchain, but rather of the architecture.

So, add a new option that architectures that have atomic operations
can select. This in turn selects the current toolchain atomic option,
until all packages have been converted, at which point the old
toolchain option can be removed.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in                |    6 ++++++
 arch/Config.in.arc            |    2 +-
 toolchain/toolchain-common.in |    1 -
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 9cd85a5..5cee0d7 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -250,6 +250,12 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_GCC_TARGET_MODE
 	string
 
+# If the architecture has atomic operations, select this:
+config BR2_ARCH_HAS_ATOMICS
+	bool
+	default y if !BR2_arc
+	select BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 836cfef..8a7f290 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -1,7 +1,7 @@
 # Choise of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	select BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
+	select BR2_ARCH_HAS_ATOMICS
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 6d43700..2fa4f61 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -46,7 +46,6 @@ config BR2_TOOLCHAIN_HAS_SSP
 
 config BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
 	bool
-	default y if !BR2_arc
 
 config BR2_ENABLE_LOCALE_PURGE
 	bool "Purge unwanted locales"
