From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Tue, 14 Jan 2014 09:21:34 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: Fix EABIhf check
Message-ID: <1389687696-4824-1-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the check for EABI/EABIhf toolchains looks for the
Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds
in a EABIhw toolchain. The crt1.o is however often not compiled
from c but assembler, and will then always failt he EABIhf check.

Fix by compiling a temporary .c file and checking for the
attribute.

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 toolchain/helpers.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index faa9d90..0accb7b 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -284,12 +284,15 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
-	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
+	TEMP_C_FILE=`mktemp --tmpdir --suffix=.c`; \
+	touch $${TEMP_C_FILE}; \
+	$${__CROSS_CC} -c -o $${TEMP_C_FILE}.o $${TEMP_C_FILE}; \
+	if $${__CROSS_READELF} -A $${TEMP_C_FILE}.o | grep -q "Tag_ABI_VFP_args:" ; then \
 		EXT_TOOLCHAIN_ABI="eabihf" ; \
 	else \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
 	fi ; \
+	rm -f $${TEMP_C_FILE} $${TEMP_C_FILE}.o; \
 	if [ "$(BR2_ARM_EABI)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabihf" ] ; then \
 		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
 		exit 1 ; \
-- 
1.8.4.2
