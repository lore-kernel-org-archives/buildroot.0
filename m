From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Oct 2016 14:08:58 +0200
Subject: [Buildroot] [PATCH v2 13/23]
	toolchain-external-codesourcery-aarch64: new package
In-Reply-To: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477742948-11490-14-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Sourcery CodeBench external
toolchain for the AArch64 architecture. As of this commit, the code is
currently not used, but it will be used as soon as the external
toolchain infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../Config.in                                      | 17 ++++++++++++++++
 .../Config.in.options                              |  6 ++++++
 .../toolchain-external-codesourcery-aarch64.hash   |  3 +++
 .../toolchain-external-codesourcery-aarch64.mk     | 23 ++++++++++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
new file mode 100644
index 0000000..2fbb218
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
@@ -0,0 +1,17 @@
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+	bool "CodeSourcery AArch64 2014.11"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	help
+	  Sourcery CodeBench toolchain for the AArch64 architecture,
+	  from Mentor Graphics. It uses gcc 4.9.1, binutils
+	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
+	  3.16.2.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
new file mode 100644
index 0000000..706c35d
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-codesourcery-aarch64"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
new file mode 100644
index 0000000..f7d3f29
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
+sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
new file mode 100644
index 0000000..198e9e0
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# toolchain-external-codesourcery-aarch64
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_PREFIX)
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION = 2014.11-95
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SOURCE = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_PREFIX)-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_ACTUAL_SOURCE_TARBALL = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_PREFIX).src.tar.bz2
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_PREFIX = aarch64-amd-linux-gnu
+
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
+	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
+endef
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
+
+define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
+	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
+endef
+TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
