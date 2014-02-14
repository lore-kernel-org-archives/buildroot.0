From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Date: Fri, 14 Feb 2014 14:43:35 +0100
Subject: [Buildroot] [PATCH 1/1] Use libm.so when testing external compiler
	ABI
Message-ID: <1392385415-19367-1-git-send-email-syntheticpp@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

crt1.o could not be used to test for eabihf because
it does not list the tag Tag_ABI_VFP_args.

Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
---
 toolchain/helpers.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index faa9d90..c41d757 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -284,8 +284,8 @@ check_arm_abi = \
 		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi ; \
-	EXT_TOOLCHAIN_CRT1=`LANG=C $${__CROSS_CC} -print-file-name=crt1.o` ; \
-	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_CRT1} | grep -q "Tag_ABI_VFP_args:" ; then \
+	EXT_TOOLCHAIN_LIBM=`LANG=C $${__CROSS_CC} -print-file-name=libm.so` ; \
+	if $${__CROSS_READELF} -A $${EXT_TOOLCHAIN_LIBM} | grep -q "Tag_ABI_VFP_args:" ; then \
 		EXT_TOOLCHAIN_ABI="eabihf" ; \
 	else \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
-- 
1.8.3.2
