From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 11 Aug 2014 13:32:05 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/arc: use gcc/binutils with tls
 support for uclibc-ng
Message-ID: <20140811113205.GA19529@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc-ng includes support for NPTL for arc from:
https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc

Special branches for gcc and binutils are required to
provide the needed TLS support in the toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/binutils/Config.in.host |    1 +
 package/gcc/Config.in.host      |    7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index de8b780..e6b6535 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -29,6 +29,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
+	default "d743e6ef7aeb99ccf75c9b533b2c401f20e4fc2c"	if BR2_arc && BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
 	default "arc-4.8-R3"	if BR2_arc
 	default "2.22"		if BR2_BINUTILS_VERSION_2_22
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2585bef..bb19b5f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -11,6 +11,7 @@ choice
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_7_X if BR2_sparc
+	default BR2_GCC_VERSION_4_8_ARC_TLS if BR2_arc && BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
@@ -57,6 +58,11 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8-arc"
 
+	config BR2_GCC_VERSION_4_8_ARC_TLS
+		depends on BR2_arc
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.8-arc-tls"
+
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
@@ -100,6 +106,7 @@ config BR2_GCC_VERSION
 	default "4.8.3"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.1"     if BR2_GCC_VERSION_4_9_X
 	default "arc-4.8-R3" if BR2_GCC_VERSION_4_8_ARC
+	default "e9dbcfdba0f42639b3aa9e3b06fe781599eb98fe" if BR2_GCC_VERSION_4_8_ARC_TLS
 	default BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
-- 
1.7.10.4
