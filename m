From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:11:44 +0200
Subject: [Buildroot] [git commit] gcc: take into account ARM floating point
	capabilities
Message-ID: <20130716140822.E43439A5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92cc924f2ebdfc9bc3d107400d7b3540801d90f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARM EABIhf support was introduced in gcc 4.6.x, so versions
earlier than this one should not be used when EABIhf is selected.

The ARM VFPv4 support was introduced in gcc 4.5.x, so versions earlier
than this one should not be used when VFPv4 is used.

[Peter: drop OABI dependencies]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a529d14..972f81f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -22,15 +22,22 @@ choice
 
 	config BR2_GCC_VERSION_4_3_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
+		# ARM EABIhf support appeared in gcc 4.6
+		depends on !BR2_ARM_EABIHF
+		# VFPv4 support appeared in gcc 4.5
+		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
 
 	config BR2_GCC_VERSION_4_5_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
+		# ARM EABIhf support appeared in gcc 4.6
+		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
