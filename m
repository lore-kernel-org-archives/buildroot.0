From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 22:30:48 +0200
Subject: [Buildroot] [PATCHv3 2/4] toolchain: check ARM EABI vs. EABIhf for
	external toolchains
In-Reply-To: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1374093050-30344-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the introduction of the support of EABIhf as a second ARM
ABI, it is important to check whether the external toolchain provided
by the user actually uses the ABI that has been selected in the
Buildroot configuration. This commit introduces such a check by
looking at the 'Tag_ABI_VFP_args' tag of the architecture-specific
section of the ELF headers. This assumes that ELF is the binary format
used on ARM, which may not be the case on ARM noMMU systems (they use
the FLAT binary format), but Buildroot doesn't have support for such
systems at the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                     | 15 +++++++++++++++
 toolchain/toolchain-external/ext-tool.mk |  5 ++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 764c795..4c988a5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -279,10 +279,25 @@ check_uclibc = \
 #
 check_arm_abi = \
 	__CROSS_CC=$(strip $1) ; \
+	__CROSS_READELF=$(strip $2) ; \
 	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
 	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
+	fi ; \
+	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
+	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
+		EXT_TOOLCHAIN_ABI="eabihf" ; \
+	else \
+		EXT_TOOLCHAIN_ABI="eabi" ; \
+	fi ; \
+	if [ "$(BR2_ARM_EABI)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabihf" ] ; then \
+		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
+		exit 1 ; \
+	fi ; \
+	if [ "$(BR2_ARM_EABIHF)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabi" ] ; then \
+		echo "Incorrect ABI setting: EABIhf selected, but toolchain uses EABI" ; \
+		exit 1 ; \
 	fi
 
 #
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index b9ae68f..80e03b9 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -125,6 +125,7 @@ endif
 TOOLCHAIN_EXTERNAL_CROSS=$(TOOLCHAIN_EXTERNAL_BIN)/$(TOOLCHAIN_EXTERNAL_PREFIX)-
 TOOLCHAIN_EXTERNAL_CC=$(TOOLCHAIN_EXTERNAL_CROSS)gcc
 TOOLCHAIN_EXTERNAL_CXX=$(TOOLCHAIN_EXTERNAL_CROSS)g++
+TOOLCHAIN_EXTERNAL_READELF=$(TOOLCHAIN_EXTERNAL_CROSS)readelf
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS = -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 ifeq ($(filter $(HOST_DIR)/%,$(TOOLCHAIN_EXTERNAL_BIN)),)
@@ -368,7 +369,9 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 		exit 1 ; \
 	fi ; \
 	if test x$(BR2_arm) == x"y" ; then \
-		$(call check_arm_abi,$(TOOLCHAIN_EXTERNAL_CC)) ; \
+		$(call check_arm_abi,\
+			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+			$(TOOLCHAIN_EXTERNAL_READELF)) ; \
 	fi ; \
 	if test x$(BR2_INSTALL_LIBSTDCPP) == x"y" ; then \
 		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
-- 
1.8.1.2
