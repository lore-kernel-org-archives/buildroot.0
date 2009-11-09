From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 9 Nov 2009 14:53:04 +0100
Subject: [Buildroot] [git commit master] toolchain: select sensible floating
	point mode by default
Message-ID: <20091109162145.5DF667776D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13e753b414b4530a610873d44927b320223dc6ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce BR2_PREFER_SOFT_FLOAT and enable it for arm, avr32 and mips,
and use it to enable soft float support by default for those archs.

This way people automatically get the correct floating point mode when
running make menuconfig for the first time (E.G. without a .config) and
changing the arch from i386 to arm/avr32/mips.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in.2 |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 2da5670..2f7de75 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -74,17 +74,20 @@ config BR2_USE_WCHAR
 	  If you have an external binary toolchain that has been built 
 	  with WCHAR support then enable this option.
 
+config BR2_PREFER_SOFT_FLOAT
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_nios2
+
 config BR2_SOFT_FLOAT
 	bool "Use software floating point by default"
 	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_nios2
+	default $(BR2_PREFER_SOFT_FLOAT)
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU) or a
 	  kernel FPU emulator, but you still wish to support floating point
 	  functions, then everything will need to be compiled with soft
 	  floating point support (-msoft-float).
 
-	  Most people will answer N.
-
 config BR2_USE_SSP
 	bool "Enable stack protection support"
 	help
-- 
1.6.3.3
