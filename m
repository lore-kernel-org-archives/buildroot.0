From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 28 Dec 2017 16:51:39 +0100
Subject: [Buildroot] [PATCH v9 1/8] rustc: new virtual package
In-Reply-To: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
References: <20171228155146.18193-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171228155146.18193-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The compiler for the Rust programming language is called rustc.

There is only one reference implementation for it, based on LLVM, from
the Rust project [1]. It can generate code for various architectures so
it can be labeled as a cross-compiler. But, as for GCC, building it
from source takes time.

So it would be sensible to have at least one package which provides it
as a pre-built version, fetched from the upstream project. Later another
package can be added, to build it from source code.

In addition to the compiler, the standard library for the host and/or
the target should also be fetched/built.

So, add a virtual package named rustc to enable support for multiple
providers.

Currently, only the host variant will be available to allow the user to
cross-compile Rust programs for the target.

[1] http://rust-lang.org

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in.host       |  1 +
 package/rustc/Config.in.host | 17 +++++++++++++++++
 package/rustc/rustc.mk       | 31 +++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/rustc/Config.in.host
 create mode 100644 package/rustc/rustc.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index dd6415bba5..2f20dd0e48 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -46,6 +46,7 @@ menu "Host utilities"
 	source "package/qemu/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
+	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
new file mode 100644
index 0000000000..16c95fa0b4
--- /dev/null
+++ b/package/rustc/Config.in.host
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_i386 || BR2_x86_64 \
+		|| BR2_arm  || BR2_aarch64 \
+		|| BR2_powerpc  || BR2_powerpc64 \
+		|| BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	depends on !BR2_MIPS_NABI32
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_HAS_HOST_RUSTC
+	bool
+
+config BR2_PACKAGE_PROVIDES_HOST_RUSTC
+	string
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
new file mode 100644
index 0000000000..4163a44bc1
--- /dev/null
+++ b/package/rustc/rustc.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# rustc
+#
+################################################################################
+
+RUST_ARCH := $(call qstrip,$(BR2_ARCH))
+
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+RUST_ARCH := armv7
+endif
+
+ifeq ($(BR2_ARM_EABI),y)
+RUST_ABI := eabi
+else ifeq ($(BR2_ARM_EABIHF),y)
+RUST_ABI := eabihf
+else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
+RUST_ABI := abi64
+endif
+
+RUST_TARGET_NAME := $(RUST_ARCH)-unknown-linux-gnu$(RUST_ABI)
+
+ifeq ($(HOSTARCH),x86)
+RUST_HOST_ARCH = i686
+else
+RUST_HOST_ARCH = $(HOSTARCH)
+endif
+
+RUST_HOST_NAME = $(RUST_HOST_ARCH)-unknown-linux-gnu
+
+$(eval $(host-virtual-package))
-- 
2.14.3
