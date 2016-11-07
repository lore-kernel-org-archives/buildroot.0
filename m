From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:20:16 +0100
Subject: [Buildroot] [PATCH v4 21/22] toolchain-external-arc: new package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-22-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit adds a new package for the Synopsys external toolchain for
the ARC architecture.

The legacy implementation is removed.

Note that this toolchain is marked as BROKEN, but 2016.09 seems about
to be released so maybe it will be unbroken soon.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v4: add PREFIX definition, remove legacy implementation.
---
 toolchain/toolchain-external/Config.in             | 29 +++++-----------------
 .../toolchain-external-synopsys-arc/Config.in      | 20 +++++++++++++++
 .../Config.in.options                              | 10 ++++++++
 .../toolchain-external-synopsys-arc.hash           |  5 ++++
 .../toolchain-external-synopsys-arc.mk             | 24 ++++++++++++++++++
 .../toolchain-external/toolchain-external.hash     |  6 -----
 toolchain/toolchain-external/toolchain-external.mk | 13 ----------
 7 files changed, 65 insertions(+), 42 deletions(-)
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
 create mode 100644 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e592ec2..fb33703 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -15,6 +15,9 @@ comment "glibc toolchains only available with shared lib support"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
+# ARC
+source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
+
 # ARM (use Linaro toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in"
@@ -93,27 +96,6 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
 	  This toolchain uses software-floating point.
 
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2014.12 toolchain"
-	depends on BR2_arc
-	depends on BR2_HOSTARCH = "x86_64"
-	# does not provide IPv6, and lacks many uClibc features
-	# expected by Buildroot. The next Synopsys toolchain version
-	# should fix those problems.
-	depends on BROKEN
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	help
-	  Toolchain for the ARC cores, from
-	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
-
 endchoice
 
 choice
@@ -147,8 +129,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PATH
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string
-	default "arc-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arcle
-	default "arceb-linux"		 if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC && BR2_arceb
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
 
@@ -182,6 +162,9 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
+# ARC
+source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
+
 # ARM
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in.options"
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
index 0000000..ceb7dd0
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
@@ -0,0 +1,10 @@
+if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "arc-linux"		 if BR2_arcle
+	default "arceb-linux"		 if BR2_arceb
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
index 0000000..14ea5e3
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -0,0 +1,24 @@
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
+else
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
+endif
+
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
+
+$(eval $(toolchain-external-package))
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index a286ef2..cc93998 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -6,9 +6,3 @@
 sha256 f2febf3b3c565536461ad4405f1bcb835d75a6afb2a8bec958a1248cb4b81fc7  arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 sha256 25fbf0513ad7322b15cbaae964cafadcbb4c939f2708f57f40b8f9f2d601122b  arago-toolchain-2011.09-sources.tar.bz2
-
-# Synopsys DesignWare ARC toolchains
-sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index e13d240..53f5583 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -56,19 +56,6 @@ define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	rm -rf $(@D)/arago-2011.09/
 endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_FIXUP_CMDS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC),y)
-TOOLCHAIN_EXTERNAL_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2014.12
-ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = arc700
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE = archs
-endif
-ifeq ($(BR2_arcle),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = le
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS = be
-endif
-TOOLCHAIN_EXTERNAL_SOURCE = arc_gnu_2014.12_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
 endif
 
 # Some toolchain vendors have a regular file naming pattern.
-- 
2.10.2
