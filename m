From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 26 Feb 2018 21:04:21 +0100
Subject: [Buildroot] [PATCH 1/1] rustc: disable for ARMV7A with EABI
Message-ID: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Rust project does not support armv7a EABI, only EABIHF [1]. So
disable rustc for this ARM variant.

Fixes:

- http://autobuild.buildroot.net/results/51c98ca5486e7e83725ababa437cbb8204ceb66b/

[1] https://forge.rust-lang.org/platform-support.html

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rustc/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index bdbe488f48..1c79eededc 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -5,7 +5,8 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	default y if BR2_i386
 	default y if BR2_x86_64
 	default y if BR2_aarch64
-	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5 \
+	        && !(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABI)
 	default y if BR2_powerpc || BR2_powerpc64
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
-- 
2.14.3
