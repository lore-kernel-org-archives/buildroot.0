From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:57:08 +0100
Subject: [Buildroot] [PATCH v3 19/24] toolchain-external-codesourcery-x86:
	new package
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-20-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the x86 architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-x86/Config.in  | 29 ++++++++++++++++++++++
 .../Config.in.options                              |  6 +++++
 .../toolchain-external-codesourcery-x86.hash       |  3 +++
 .../toolchain-external-codesourcery-x86.mk         | 13 ++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
new file mode 100644
index 0000000..bcbdd26
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
@@ -0,0 +1,29 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
+	bool "Sourcery CodeBench x86/x86_64 2012.09"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_x86_jaguar
+	depends on !BR2_x86_steamroller
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	help
+	  Sourcery CodeBench toolchain for the x86/x86_64
+	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
+	  binutils 2.23.51, glibc 2.16, gdb 7.4.50 and kernel headers
+	  3.5.4. It has support for the following variants:
+	    - Intel Pentium 4, glibc, 32 bits
+	      Default for x86, nothing special to do.
+	    - Intel Atom, glibc, 32 bits
+	      Select an Atom core
+	    - Intel Xeon, glibc, 64 bits
+	      Default for x86_64, nothing special to do.
+	    - Intel Core 2, glibc, 64 bits
+	      Select a Core 2 core
+	  Other architecture variants (beyond Pentium-4/Xeon) are
+	  supported as well, but glibc is not optimised for it.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
new file mode 100644
index 0000000..97bebf9
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-x86"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
new file mode 100644
index 0000000..a003f7a
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
+sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
new file mode 100644
index 0000000..146b70c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# toolchain-external-codesourcery-x86
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION = 2012.09-62
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_SOURCE = ia32-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_PREFIX)-i386-linux.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_ACTUAL_SOURCE_TARBALL = ia32-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_PREFIX = i686-pc-linux-gnu
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
