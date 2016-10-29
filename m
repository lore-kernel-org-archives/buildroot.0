From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:09:02 +0200
Subject: [Buildroot] [PATCH v2 17/23] toolchain-external-codesourcery-sh:
	new package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-18-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the SuperH architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-sh/Config.in   | 25 ++++++++++++++++++++++
 .../Config.in.options                              |  6 ++++++
 .../toolchain-external-codesourcery-sh.hash        |  3 +++
 .../toolchain-external-codesourcery-sh.mk          | 14 ++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
new file mode 100644
index 0000000..a47dab7
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
@@ -0,0 +1,25 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+	bool "Sourcery CodeBench SH 2012.09"
+	depends on BR2_sh4a || BR2_sh4aeb
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	help
+	  Sourcery CodeBench toolchain for the SuperH architecture,
+	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
+	  glibc 2.16, uClibc 0.9.30, gdb 7.4.50 and kernel headers
+	  3.5.4. It has support for the following variants:
+	    - SH4A, glibc, little endian
+	      Default.
+	    - SH4A, glibc, big endian
+	      Add -mb to BR2_TARGET_OPTIMIZATION
+	    - SH4A, uClibc, little endian
+	      Not usable in Buildroot yet.
+	    - SH4A, uClibc, big endian
+	      Not usable in Buildroot yet.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
new file mode 100644
index 0000000..3ae5f85
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-sh"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
new file mode 100644
index 0000000..ff2ba5f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
new file mode 100644
index 0000000..44ee02c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# toolchain-external-sourcery-sh
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION = 2012.09-61
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_SOURCE = renesas-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_ACTUAL_SOURCE_TARBALL = renesas-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_PREFIX = sh-linux-gnu
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
