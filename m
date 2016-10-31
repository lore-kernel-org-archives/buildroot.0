From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:57:01 +0100
Subject: [Buildroot] [PATCH v3 12/24] toolchain-external-linaro-armeb: new
	package
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-13-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new package for the Linaro external toolchain for
the ARM big endian architecture. As of this commit, the code is currently
not used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-linaro-armeb/Config.in      | 26 ++++++++++++++++++++++
 .../Config.in.options                              |  6 +++++
 .../toolchain-external-linaro-armeb.hash           |  3 +++
 .../toolchain-external-linaro-armeb.mk             | 17 ++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
new file mode 100644
index 0000000..ed84c47
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -0,0 +1,26 @@
+comment "Linaro toolchains available for Cortex-A + EABIhf"
+	depends on BR2_armeb
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+	bool "Linaro armeb 2016.05"
+	depends on BR2_armeb
+	depends on BR2_ARM_CPU_ARMV7A
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_ARM_EABIHF
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Linaro toolchain for the ARM big endian architecture. It
+	  uses Linaro GCC 2016.05 (based on gcc 5.3.1), Linaro GDB
+	  2016.05 (based on GDB 7.11.1), glibc 2.21, Binutils 2016.05
+	  (based on 2.25). It generates code that runs on all Cortex-A
+	  profile devices, but tuned for the Cortex-A9. The code
+	  generated is Thumb 2, with the hard floating point calling
+	  convention, and uses the VFPv3-D16 FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
new file mode 100644
index 0000000..0fa7619
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-linaro-armeb"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
new file mode 100644
index 0000000..7952b50
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 f6e9c0d3320760fe8f89e9ec3acdd7b4da7eff889c094b4a2acc286fd46f334f  gcc-linaro-5.3.1-2016.05-i686_armeb-linux-gnueabihf.tar.xz
+sha256 6cf41c8944be56279cc14992aa075174b7a4c5938502536266eaaeef048f9440  gcc-linaro-5.3.1-2016.05-x86_64_armeb-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
new file mode 100644
index 0000000..9d4d843
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# toolchain-external-linaro-armeb
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION = 2016.05
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)/armeb-linux-gnueabihf
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_PREFIX = armeb-linux-gnueabihf
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-i686_armeb-linux-gnueabihf.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_ARMEB_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_ARMEB_VERSION)-x86_64_armeb-linux-gnueabihf.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
