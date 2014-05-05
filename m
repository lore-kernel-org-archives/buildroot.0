From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 05 May 2014 14:10:27 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: Fix EABIhf check
Message-ID: <ddb1629069cddb3d19fb.1399291827@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan S?rensen <stefan.sorensen@spectralink.com>

Currently the check for EABI/EABIhf toolchains looks for the
Tag_ABI_VFP_args attribute in the crt1.o file which gcc adds in an
EABIhf toolchain.
In uClibc, however, crt1.o is not compiled from c but assembly, so the
Tag_ABI_VFP_args attribute is not added in the object file.  This causes
the EABIhf check in the external toolchain logic to fail for
uClibc-based toolchains.

Fix by compiling a temporary .c file and checking for the attribute.

Fixes bug #6842: https://bugs.busybox.net/show_bug.cgi?id=6842

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
[ThomasDS: use /dev/null as input, update commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: (ThomasDS)
  - avoid creating a temporary source file
  - update commit message

 toolchain/helpers.mk |  6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -297,12 +297,14 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
-	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
+	TEMP_OBJ_FILE=`mktemp --tmpdir --suffix=.o`; \
+	$${__CROSS_CC} -x c -c -o $${TEMP_OBJ_FILE} /dev/null; \
+	if $${__CROSS_READELF} -A $${TEMP_OBJ_FILE} | grep -q "Tag_ABI_VFP_args:" ; then \
 		EXT_TOOLCHAIN_ABI="eabihf" ; \
 	else \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
 	fi ; \
+	rm -f $${TEMP_OBJ_FILE}; \
 	if [ "$(BR2_ARM_EABI)" = "y" -a "$${EXT_TOOLCHAIN_ABI}" = "eabihf" ] ; then \
 		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
 		exit 1 ; \
