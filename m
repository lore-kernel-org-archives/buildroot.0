From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  3 Nov 2015 00:34:37 +0100
Subject: [Buildroot] [PATCH] arch/arm: VFP and Thumb1 are not compatible
Message-ID: <1446507277-26679-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc will refuse to build with both --with-mode=thumb and --with-fpu=vfp,
with error messages during ./configure, like:

    checking for suffix of object files... configure: error: in `/home/ymor
    in/dev/buildroot/O/build/host-gcc-initial-4.9.3/build/arm-buildroot-lin
    ux-uclibcgnueabihf/libgcc':
    configure: error: cannot compute suffix of object files: cannot compile
    See `config.log' for more details.

And config.log informatively contains:

    sorry, unimplemented: Thumb-1 hard-float VFP ABI

This is an error message that comes deep from gcc source files.

If gcc says it does not support VFP with Thumb1, then let's disable that
combination in our menuconfig.

Prefer VFP over Thumb1, i.e. hide Thumb1 when we're not soft-float.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index db7b8f2..67ff384 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -377,12 +377,18 @@ config BR2_ARM_INSTRUCTIONS_ARM
 config BR2_ARM_INSTRUCTIONS_THUMB
 	bool "Thumb"
 	depends on BR2_ARM_CPU_HAS_THUMB
+	# Thumb-1 and VFP are not compatible
+	depends on BR2_ARM_SOFT_FLOAT
 	help
 	  This option instructions the compiler to generate Thumb
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
 
+comment "Thumb1 is not compatible with VFP"
+	depends on BR2_ARM_CPU_HAS_THUMB
+	depends on !BR2_ARM_SOFT_FLOAT
+
 config BR2_ARM_INSTRUCTIONS_THUMB2
 	bool "Thumb2"
 	depends on BR2_ARM_CPU_HAS_THUMB2
-- 
1.9.1
