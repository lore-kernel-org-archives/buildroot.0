From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:48:53 +0200
Subject: [Buildroot] [PATCH 01/24 v4] arch: add an option to specify if the
	arch has atomic ops
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <7d72fe60f396407b4fbc68ba8f9910cda0fe24a8.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 arch/Config.in                | 6 ++++++
 arch/Config.in.arc            | 2 +-
 toolchain/toolchain-common.in | 1 -
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
-- 
1.9.1
