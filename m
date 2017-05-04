From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:21:04 +0200
Subject: [Buildroot] [git commit] package/libunwind: simplify architecture
	dependencies
Message-ID: <20170504212140.A6CDB7F8B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a84acbb4a7d7cf5feb43147839f04485e714b1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ARM_CPU_HAS_ARM already embeddeds the fact that this is an ARM chip,
so (BR2_arm || BR2_armeb) is forcibly true when BR2_ARM_CPU_HAS_ARM is.

In other words, BR2_ARM_CPU_HAS_ARM can't be true unless either BR2_arm
or BR2_armeb itslef is true.

Simplify the logic accordingly.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunwind/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 9007ce5..2003e96 100644
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
