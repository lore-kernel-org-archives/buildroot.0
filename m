From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Sep 2012 15:49:44 +0200
Subject: [Buildroot] [PATCH 2/2] Move BR2_SPARC_TYPE to an uClibc specific
	place
In-Reply-To: <cover.1346766545.git.thomas.petazzoni@free-electrons.com>
References: <cover.1346766545.git.thomas.petazzoni@free-electrons.com>
Message-ID: <10451abfa0e2d9ad6d322ec73a726bf520c4c46e.1346766545.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_SPARC_TYPE is a hidden configuration option that is only used for
the configuration of uClibc, therefore, we move it from
target/Config.arch.in to toolchain/uClibc/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch      |    5 -----
 toolchain/uClibc/Config.in |    6 ++++++
 toolchain/uClibc/uclibc.mk |    2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 482da6e..d0b1c02 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -488,11 +488,6 @@ config BR2_sparc_tsc701
 	bool "tsc701"
 endchoice
 
-config BR2_SPARC_TYPE
-	string
-	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
-	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
-
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_xtensa
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index fbe617a..f46a415 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -98,3 +98,9 @@ config BR2_UCLIBC_ARM_TYPE
 	default ARM_IWMMXT	if BR2_iwmmxt
 	default ARM_CORTEXA8	if BR2_cortex_a8
 	default ARM_CORTEXA9	if BR2_cortex_a9
+
+config BR2_UCLIBC_SPARC_TYPE
+	string
+	depends on BR2_sparc
+	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index da4719a..2cf9945 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -64,7 +64,7 @@ UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif
 
 UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_UCLIBC_ARM_TYPE))
-UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
+UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_SPARC_TYPE))
 
 ifeq ($(GENERATE_LOCALE),)
 # We need at least one locale
-- 
1.7.9.5
