From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 22:24:13 +0200
Subject: [Buildroot] [git commit] Move BR2_ARM_TYPE to an uClibc specific
	place
Message-ID: <20120920205953.D166399670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff67685ed9f11c885a4fa5ded08e44d5fcfb32a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_ARM_TYPE is a hidden configuration option that is only used for
the configuration of uClibc, therefore, we move it from
target/Config.arch.in to toolchain/uClibc/Config.in.

We also add a comment that explains that this stuff is only useful for
uClibc <= 0.9.32. Starting from 0.9.33, uClibc build process simply
uses the compiler flags to find the ARM processor that should be
used. So, someday, we'll be able to remove this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch      |   21 ---------------------
 toolchain/uClibc/Config.in |   24 ++++++++++++++++++++++++
 toolchain/uClibc/uclibc.mk |    2 +-
 3 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 860bf43..548691d 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -202,27 +202,6 @@ config BR2_iwmmxt
 	bool "iwmmxt"
 endchoice
 
-config BR2_ARM_TYPE
-	string
-	default GENERIC_ARM	if BR2_generic_arm
-	default ARM610		if BR2_arm610
-	default ARM710		if BR2_arm710
-	default ARM7TDMI	if BR2_arm7tdmi
-	default ARM720T		if BR2_arm720t
-	default ARM920T		if BR2_arm920t
-	default ARM922T		if BR2_arm922t
-	default ARM926T		if BR2_arm926t
-	default ARM10T		if BR2_arm10t
-	default ARM1136JF_S	if BR2_arm1136jf_s
-	default ARM1176JZ_S	if BR2_arm1176jz_s
-	default ARM1176JZF_S	if BR2_arm1176jzf_s
-	default ARM_SA110	if BR2_sa110
-	default ARM_SA1100	if BR2_sa1100
-	default ARM_XSCALE	if BR2_xscale
-	default ARM_IWMMXT	if BR2_iwmmxt
-	default ARM_CORTEXA8	if BR2_cortex_a8
-	default ARM_CORTEXA9	if BR2_cortex_a9
-
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index d8b8a2a..fbe617a 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -74,3 +74,27 @@ config BR2_UCLIBC_INSTALL_TEST_SUITE
 
 	  This is not needed at all for normal builds, so you can safely say no
 	  if you do not plan to dig into your C library.
+
+# This is only useful for uClibc <= 0.9.32. It can be removed once
+# Buildroot will support only uClibc >= 0.9.33 on ARM.
+config BR2_UCLIBC_ARM_TYPE
+	string
+	depends on BR2_arm || BR2_armeb
+	default GENERIC_ARM	if BR2_generic_arm
+	default ARM610		if BR2_arm610
+	default ARM710		if BR2_arm710
+	default ARM7TDMI	if BR2_arm7tdmi
+	default ARM720T		if BR2_arm720t
+	default ARM920T		if BR2_arm920t
+	default ARM922T		if BR2_arm922t
+	default ARM926T		if BR2_arm926t
+	default ARM10T		if BR2_arm10t
+	default ARM1136JF_S	if BR2_arm1136jf_s
+	default ARM1176JZ_S	if BR2_arm1176jz_s
+	default ARM1176JZF_S	if BR2_arm1176jzf_s
+	default ARM_SA110	if BR2_sa110
+	default ARM_SA1100	if BR2_sa1100
+	default ARM_XSCALE	if BR2_xscale
+	default ARM_IWMMXT	if BR2_iwmmxt
+	default ARM_CORTEXA8	if BR2_cortex_a8
+	default ARM_CORTEXA9	if BR2_cortex_a9
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 534550a..7b312d3 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -49,7 +49,7 @@ else
 UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
 endif
 
-UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_ARM_TYPE))
+UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_UCLIBC_ARM_TYPE))
 UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_SPARC_TYPE))
 
 ifeq ($(GENERATE_LOCALE),)
