From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:39:56 +0100
Subject: [Buildroot] [git commit] arch/mips: inverse the NaN logic
Message-ID: <20171201205336.B17D57FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31b134a64537b1f6f38cd9378f4ddf0f43b22b43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the possibility to choose the NaN encoding is conditional to
having a sufficiently recent gcc version.

Which means that the architecture selection depends on the gcc version.

But that's opposite to what we've always done in Buildroot: the software
versions are conditional to the architecture options. There is nothing
we can do about the hardware: it is there, we can't change it, while we
can restrict ourselves to using software that is working on said
hardware.

Thus, we inverse the logic, to move the condition onto the software
side: whenever NaN-2008 are selected, we restrict the toolchain
selection to at least a gcc-4.9.

But now, the option with the NaN type is always set, so we must enclose
the code in gcc.mk inside a HAS_NAN_OPTION condition, as is already done
for the external toolchain case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.mips | 2 +-
 package/gcc/gcc.mk  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index c08b2a2..13d1a47 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -176,10 +176,10 @@ config BR2_MIPS_NAN_LEGACY
 
 config BR2_MIPS_NAN_2008
 	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 
 choice
 	prompt "Target NaN"
-	depends on BR2_TOOLCHAIN_HAS_MNAN_OPTION
 	depends on BR2_mips_32r5 || BR2_mips_64r5
 	default BR2_MIPS_ENABLE_NAN_2008
 	help
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6bdd6c8..1112003 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -207,9 +207,11 @@ endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
+ifeq ($(BR2_TOOLCHAIN_HAS_MNAN_OPTION),y)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_NAN)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-nan=$(BR2_GCC_TARGET_NAN)
 endif
+endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_FP32_MODE)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fp-32=$(BR2_GCC_TARGET_FP32_MODE)
 endif
