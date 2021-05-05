From: Nathaniel Husted <nathaniel.husted@outlook.com>
Date: Wed,  5 May 2021 11:53:46 -0400
Subject: [Buildroot] [PATCHv2 1/1] package/rustc: add musl as an available
 Rust libc
Message-ID: <SJ0PR18MB3898AC687557A2CD4FA0340995599@SJ0PR18MB3898.namprd18.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current rustc package only supports gnu libc and hardcodes this
requirement. This patch adds musl to the available libc options for
Rust packages. Musl is now a Tier 2 supported environment for Rust.
Tier 2 means the platforms are "guaranteed to build" and official
binary releases are available. The changes in rustc.mk will also
support adding uclibc when that environment reaches Tier 2 support
but does not allow for uclibc currently as it is still a Tier 3
supported environment.

This patch includes corrections from the prior version submitted
in March, 2021.

Signed-off-by: Nathaniel Husted <nathaniel.husted@outlook.com>
---
 package/rustc/Config.in.host | 2 +-
 package/rustc/rustc.mk       | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 1df25ae326..4ab9086446 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -17,7 +17,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
 		&& BR2_MIPS_NABI64
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 35ffc36106..c5a42f0c1d 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
+
+
 RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
 RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
 
 ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
-RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)
 endif
 
 ifeq ($(HOSTARCH),x86)
-- 
2.27.0
