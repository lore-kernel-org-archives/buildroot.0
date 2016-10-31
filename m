From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:57:06 +0100
Subject: [Buildroot] [PATCH v3 17/24]
	toolchain-external-codesourcery-niosII: new package
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-18-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the NIOS2 architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-codesourcery-niosII/Config.in    | 17 +++++++++++++++++
 .../Config.in.options                                   |  6 ++++++
 .../toolchain-external-codesourcery-niosII.hash         |  3 +++
 .../toolchain-external-codesourcery-niosII.mk           | 14 ++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
new file mode 100644
index 0000000..54eed8c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -0,0 +1,17 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+	bool "Sourcery CodeBench Nios-II 2016.05"
+	depends on BR2_nios2
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # based-on binutils-2.25.1
+	help
+	  Sourcery CodeBench toolchain for the Nios-II architecture,
+	  from Mentor Graphics. It uses gcc 5.3, binutils 2.25.51,
+	  glibc 2.23, gdb 7.10.50 and kernel headers 4.4.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
new file mode 100644
index 0000000..9d41db8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-niosII"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
new file mode 100644
index 0000000..a60c49f
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 750639290744adda931c81fa2cd2ffc2bde972488047824dcfaa53c42562191d  sourceryg++-2016.05-10-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 3dc1c2685c0472059547dd7becb5dc991541b8176af39fa7aa5f601d38b9879a  sourceryg++-2016.05-10-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
new file mode 100644
index 0000000..be86e99
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# toolchain-external-codesourcery-niosII
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2016.05-10
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_ACTUAL_SOURCE_TARBALL = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_PREFIX = nios2-linux-gnu
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
