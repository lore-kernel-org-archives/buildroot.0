From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Apr 2017 18:44:01 +0200
Subject: [Buildroot] [PATCH] package/libunwind: simplify architectutre
	dependencies
Message-ID: <20170417164401.24236-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_ARM_CPU_HAS_ARM already embeddeds the fact that this is an ARM chip,
so (BR2_arm || BR2_armeb) is forcibly true when BR2_ARM_CPU_HAS_ARM is.

In other words, BR2_ARM_CPU_HAS_ARM can't be true unless either BR2_arm
or BR2_armeb itslef is true.

Simplify the logic accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/libunwind/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 9007ce51c2..2003e96518 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -10,16 +10,13 @@
 config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	bool
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
-		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
-		 BR2_mips || BR2_mipsel || BR2_mips64 || \
+		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || BR2_mips64 || \
 		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_i386 || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
-		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
-		 BR2_mips || BR2_mipsel || \
+		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
-		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
-		 BR2_i386 || BR2_x86_64)
+		(BR2_ARM_CPU_HAS_ARM || BR2_i386 || BR2_x86_64)
 
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
-- 
2.11.0
