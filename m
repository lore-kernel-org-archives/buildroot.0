From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:47 +0100
Subject: [Buildroot] [git commit] rustc: new virtual package
Message-ID: <20180205140232.EA1A388422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40e6e08d0b1a241ae4175952d4b2a22fdde5a48d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host       |  1 +
 package/rustc/Config.in.host | 31 +++++++++++++++++++++++++++++++
 package/rustc/rustc.mk       | 20 ++++++++++++++++++++
 3 files changed, 52 insertions(+)

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
index 0000000000..a49f635d65
--- /dev/null
+++ b/package/rustc/Config.in.host
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	bool
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	# The pre-built Rust standard library is only available for the
+	# following architectures/ABIs, and is built against glibc.
+	default y if BR2_i386
+	default y if BR2_x86_64
+	default y if BR2_aarch64
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_powerpc || BR2_powerpc64
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
+	default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
+		&& BR2_MIPS_NABI64
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_HOST_RUSTC_ARCH
+	string
+	default "armv7"  if BR2_ARM_CPU_ARMV7A
+	default BR2_ARCH if !BR2_ARM_CPU_ARMV7A
+
+config BR2_PACKAGE_HOST_RUSTC_ABI
+	string
+	default "eabi"   if BR2_ARM_EABI
+	default "eabihf" if BR2_ARM_EABIHF
+	default "abi64"  if BR2_MIPS_NABI64
+
+config BR2_PACKAGE_HAS_HOST_RUSTC
+	bool
+
+config BR2_PACKAGE_PROVIDES_HOST_RUSTC
+	string
diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk
new file mode 100644
index 0000000000..7a951c0cfd
--- /dev/null
+++ b/package/rustc/rustc.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# rustc
+#
+################################################################################
+
+RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
+RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
+
+RUST_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
+
+ifeq ($(HOSTARCH),x86)
+RUSTC_HOST_ARCH = i686
+else
+RUSTC_HOST_ARCH = $(HOSTARCH)
+endif
+
+RUST_HOST_NAME = $(RUSTC_HOST_ARCH)-unknown-linux-gnu
+
+$(eval $(host-virtual-package))
