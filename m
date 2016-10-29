From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:09:04 +0200
Subject: [Buildroot] [PATCH v2 19/23] toolchain-external-codesourcery-amd64:
	new package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-20-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new package for the Sourcery CodeBench external
toolchain for the x86_64 architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../Config.in                                      | 24 ++++++++++++++++++++++
 .../Config.in.options                              |  6 ++++++
 .../toolchain-external-codesourcery-amd64.hash     |  3 +++
 .../toolchain-external-codesourcery-amd64.mk       | 13 ++++++++++++
 4 files changed, 46 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
new file mode 100644
index 0000000..86486c8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -0,0 +1,24 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
+	bool "Sourcery CodeBench AMD64 2015.11"
+	depends on BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_x86_jaguar || BR2_x86_steamroller
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	help
+	  Sourcery CodeBench toolchain for the amd64 (x86_64)
+	  architectures, from Mentor Graphics. It uses gcc 5.2,
+	  binutils 2.25.51, glibc 2.22, gdb 7.10.50 and kernel headers
+	  4.2. It has support for the following variants:
+	    - AMD Puma/Jaguar (family 16h), glibc
+	    Default for x86_64, nothing special to do.
+	    - AMD Steamroller (family 15h), glibc
+	    Select a steamroller core.
+	  No other architecture variants are supported since glibc
+	  is optimized for one of these two baselines.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
new file mode 100644
index 0000000..9ba67f8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-amd64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
new file mode 100644
index 0000000..ea5f300
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
new file mode 100644
index 0000000..e82b35f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# toolchain-external-codesourcery-amd64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION = 2015.11-139
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SOURCE = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_ACTUAL_SOURCE_TARBALL = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_PREFIX = x86_64-amd-linux-gnu
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
