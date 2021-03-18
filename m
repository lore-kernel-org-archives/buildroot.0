From: Husted, Nathaniel CIV USN NSWC CD CRANE IN (USA) <nathaniel.husted@navy.mil>
Date: Thu, 18 Mar 2021 18:55:30 +0000
Subject: [Buildroot] [PATCH 1/1] package/rustc: add musl as an available
 Rust libc
In-Reply-To: <BN1P111MB0914433AA54196ABAEB91D63F5699@BN1P111MB0914.NAMP111.PROD.OUTLOOK.COM>
References: <BN1P111MB0914433AA54196ABAEB91D63F5699@BN1P111MB0914.NAMP111.PROD.OUTLOOK.COM>
Message-ID: <BN1P111MB0914D910EDE814D643995A08F5699@BN1P111MB0914.NAMP111.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current rustc package only supports gnu libc and hardcodes this requirement. This patch adds musl to the available libc options for Rust packages.

Musl is now a Tier 2 supported environment for Rust. Tier 2 means the platforms are "guaranteed to build" and official binary releases are available. The changes in rustc.mk will also support adding uclibc when that environment reaches Tier 2 support but does not allow for uclibc as it is still a Tier 3 supported libc.

Signed-off-by: Nathaniel Husted <nathaniel.husted@navy.mil>
---
 package/rustc/Config.in.host | 2 +-
 package/rustc/rustc.mk       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host index 1df25ae326..4ab9086446 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -17,7 +17,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
        default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
        default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
                && BR2_MIPS_NABI64
-       depends on BR2_TOOLCHAIN_USES_GLIBC
+       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
        depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS

 config BR2_PACKAGE_HOST_RUSTC_ARCH
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk index 35ffc36106..181e19ac9d 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -6,9 +6,10 @@

 RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
 RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
+RUSTC_TARGET_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))

 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+RUSTC_TARGET_NAME =
+$(RUSTC_ARCH)-unknown-linux-$(RUSTC_TARGET_LIBC)$(RUSTC_ABI)
 endif

 ifeq ($(HOSTARCH),x86)
--
2.25.1
