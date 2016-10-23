From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 23 Oct 2016 22:48:21 +0200
Subject: [Buildroot] [PATCH 20/30] toolchain-external-synopsys-arc: new
	package
In-Reply-To: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477255711-28603-21-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Synopsys external toolchain for
the ARC architecture. As of this commit, the code is currently not
used, but it will be used as soon as the external toolchain
infrastructure gets introduced in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-synopsys-arc/Config.in      | 20 +++++++++++++++++
 .../Config.in.options                              |  6 +++++
 .../toolchain-external-synopsys-arc.hash           |  5 +++++
 .../toolchain-external-synopsys-arc.mk             | 26 ++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
new file mode 100644
index 0000000..641eca8
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -0,0 +1,20 @@
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+	bool "Synopsys ARC 2014.12 toolchain"
+	depends on BR2_arc
+	depends on BR2_HOSTARCH = "x86_64"
+	# does not provide IPv6, and lacks many uClibc features
+	# expected by Buildroot. The next Synopsys toolchain version
+	# should fix those problems.
+	depends on BROKEN
+	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_ENABLE_LOCALE
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  Toolchain for the ARC cores, from
+	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
new file mode 100644
index 0000000..dfa9d84
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
@@ -0,0 +1,6 @@
+if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-synopsys-arc"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
new file mode 100644
index 0000000..b684cce
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
new file mode 100644
index 0000000..bc3a43c
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# toolchain-external-synopsys-arc
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2014.12
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)
+
+ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
+else
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
+endif
+
+ifeq ($(BR2_arcle),y)
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = le
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_PREFIX = arc-linux
+else
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_PREFIX = arceb-linux
+endif
+
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
+
+$(eval $(toolchain-external-package))
-- 
2.5.5
