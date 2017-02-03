From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri,  3 Feb 2017 10:26:41 +0300
Subject: [Buildroot] [PATCH] toolchain-external: Update Synopsys prebuilt
	toolchain for ARC cores
Message-ID: <1486106801-19293-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sync external prebuilt toolchain with the one we now build in Buildroot,
i.e. arc-2016.09. Since that prebuilt toolchain finally has IPv6 enabled
it works pretty fine for building packages in Buildroot.

Still note:
 1) There might be subtle differences between uClibc configuration
    compared to Buildroot's one.
 2) A couple of patches we apply on top of Builroot-built toolchain
    are obviously missing in the prebuilt version - they will be
    available in the next release.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Vlad Zakharov <vzakhar@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external-synopsys-arc/Config.in                | 12 +++++-------
 .../toolchain-external-synopsys-arc.hash                     |  8 ++++----
 .../toolchain-external-synopsys-arc.mk                       |  6 +++---
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index 641eca848422..f438ea765de5 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,20 +1,18 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2014.12 toolchain"
+	bool "Synopsys ARC 2016.09 toolchain"
 	depends on BR2_arc
 	depends on BR2_HOSTARCH = "x86_64"
-	# does not provide IPv6, and lacks many uClibc features
-	# expected by Buildroot. The next Synopsys toolchain version
-	# should fix those problems.
-	depends on BROKEN
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_ENABLE_LOCALE
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	help
 	  Toolchain for the ARC cores, from
 	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
index b684cced9a87..c96f53b1f68c 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 1fa4ea2c8616623205f1c7beca02ea31b019099528a7433e5b020b0876b93bf3  arc_gnu_2014.12_prebuilt_uclibc_le_arc700_linux_install.tar.gz
-sha256 1080f07fcae2bfc176a3ea8d30b9ed8eaecab70fb786639d6ec70cae8322df10  arc_gnu_2014.12_prebuilt_uclibc_be_arc700_linux_install.tar.gz
-sha256 aaaf6facd1f60a3cd2a537154ea39cd7d70501c175e30e01a97e8df6cb8226c7  arc_gnu_2014.12_prebuilt_uclibc_le_archs_linux_install.tar.gz
-sha256 30711c5f15762764d4cd5ec1e6ced5b1fddd03aac41c424b0c4ec8a45d5d79cd  arc_gnu_2014.12_prebuilt_uclibc_be_archs_linux_install.tar.gz
+sha256 9123e35510cc9105e5f9468d5154e0093770d7c11ed771c1a595ecf813692baf  arc_gnu_2016.09_prebuilt_uclibc_le_arc700_linux_install.tar.gz
+sha256 3140066cdbda2df7ed0fb60424bbd9db740fb25393928e733234b0bf65508df2  arc_gnu_2016.09_prebuilt_uclibc_be_arc700_linux_install.tar.gz
+sha256 aa6edb2101b13df3ac59f8d8ccbcfba37a6f7882f0e03baa9d9883480dbed4e7  arc_gnu_2016.09_prebuilt_uclibc_le_archs_linux_install.tar.gz
+sha256 4de227bf73536a87784d88e5f10085b91ede62c76ef8fedf53b4bf2e215054cf  arc_gnu_2016.09_prebuilt_uclibc_be_archs_linux_install.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
index 14ea5e350c72..f4cb7b73a13d 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2014.12
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2016.09
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
 
 ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
@@ -19,6 +19,6 @@ else
 TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
 endif
 
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_CORE)_linux_install.tar.gz
+TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_uclibc_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.gz
 
 $(eval $(toolchain-external-package))
-- 
2.7.4
