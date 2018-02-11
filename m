From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 11 Feb 2018 17:58:19 +0100
Subject: [Buildroot] [PATCH 1/6] rustc: use RUSTC_{HOST,TARGET}_NAME
In-Reply-To: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
References: <20180211165824.20213-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180211165824.20213-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

utils/check-package complains as follows:

  package/rustc/rustc.mk:10: possible typo: RUST_TARGET_NAME -> *RUSTC*
  package/rustc/rustc.mk:18: possible typo: RUST_HOST_NAME -> *RUSTC*

As RUST_{HOST,TARGET}_NAME are related to the Rust compiler, it sounds
sensible to rename them to RUSTC_{HOST,TARGET}_NAME.

To make it even more happy, clean up Config.in.host too.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/rustc/Config.in.host | 3 +--
 package/rustc/rustc.mk       | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index d93ff05209..bdbe488f48 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	bool
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	# The pre-built Rust standard library is only available for the
 	# following architectures/ABIs, and is built against glibc.
 	default y if BR2_i386
@@ -12,6 +11,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
 		&& BR2_MIPS_NABI64
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
@@ -76,4 +76,3 @@ config BR2_PACKAGE_PROVIDES_HOST_RUSTC
 	default "host-rust-bin" if BR2_PACKAGE_HOST_RUST_BIN
 
 endif
-
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
index 7a951c0cfd..bed74f3c2c 100644
--- a/package/rustc/rustc.mk
+++ b/package/rustc/rustc.mk
@@ -7,7 +7,7 @@
 RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
 RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
 
-RUST_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
 
 ifeq ($(HOSTARCH),x86)
 RUSTC_HOST_ARCH = i686
@@ -15,6 +15,6 @@ else
 RUSTC_HOST_ARCH = $(HOSTARCH)
 endif
 
-RUST_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
+RUSTC_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
 
 $(eval $(host-virtual-package))
-- 
2.14.3
