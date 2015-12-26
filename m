From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2015 17:05:42 +0100
Subject: [Buildroot] [PATCH 2/5 v2] arch/arm: add option to enable an
	optional VFP unit
In-Reply-To: <cover.1451145472.git.yann.morin.1998@free.fr>
References: <cover.1451145472.git.yann.morin.1998@free.fr>
Message-ID: <1c0398c75bfad861237b0ba006ac5aecf01fb5da.1451145472.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the VFP selection for ARM is a little bit muddy:
  - some CPUs definitely do not have a VFP or NEON,
  - some CPUs definitely do have a VFP or NEON,
  - some CPUs may have a VFP or NEON.

However, we currently conflate the availability of the VFP/NEON with the
possibility to use them. Even is the user chooses a floating point
strategy with a 'lower' solution (i.e. VFPv2 when a VFPv3 exists, or not
using NEON when the CPU has it), some packages are still using the
CPU-defined HW availaibility rather thean the usr's selection.

Furthermore, for CPU that may have a VFP/NEON, there is no way for the
user to actually specify that the HW is indeed available; the user can
only specify the floating point strategy. This means that some packages
or some package versions, like nodejs for example, can not be properly
selected on some CPU cores, like Cortex-A9 which only may have a VFP.

Like we have an option to enable an optional NEON unit, add a similar
option to enable an optional VFP unit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index feac16d..f2c5a58 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -194,6 +194,13 @@ config BR2_ARM_ENABLE_NEON
 	  Select this option if you are certain your particular
 	  implementation has NEON support and you want to use it.
 
+config BR2_ARM_ENABLE_VFP
+	bool "Enable VFP extension support"
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	select BR2_ARM_CPU_HAS_VFPV2 if BR2_ARM_CPU_MAYBE_HAS_VFPV2
+
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
-- 
1.9.1
