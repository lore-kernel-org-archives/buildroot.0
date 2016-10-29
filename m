From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:54 +0200
Subject: [Buildroot] [PATCH v2 09/23] toolchain-external-linaro-aarch64: new
	package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-10-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Linaro external toolchain for
the AArch64 architecture. As of this commit, the code is currently not
used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-linaro-aarch64/Config.in         | 15 +++++++++++++++
 .../toolchain-external-linaro-aarch64/Config.in.options |  6 ++++++
 .../toolchain-external-linaro-aarch64.hash              |  3 +++
 .../toolchain-external-linaro-aarch64.mk                | 17 +++++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
new file mode 100644
index 0000000..662f7d7
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -0,0 +1,15 @@
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+	bool "Linaro AArch64 2016.05"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
new file mode 100644
index 0000000..627f10b
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-linaro-aarch64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
new file mode 100644
index 0000000..7a2c038
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d43227248f282a652da42322fcf4abfd3021f2a2f62e0cf6e242d82f55966ba9  gcc-linaro-5.3.1-2016.05-i686_aarch64-linux-gnu.tar.xz
+sha256 1941dcf6229d6706bcb89b7976d5d43d170efdd17c27d5fe1738e7ecf22adc37  gcc-linaro-5.3.1-2016.05-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
new file mode 100644
index 0000000..abf2630
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# toolchain-external-linaro-aarch64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2016.05
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/5.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_PREFIX = aarch64-linux-gnu
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-5.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
