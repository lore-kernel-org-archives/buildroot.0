From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 00:06:06 +0200
Subject: [Buildroot] [PATCH] toolchain: check ARM EABI vs. EABIhf for
	external toolchains
Message-ID: <1374012366-27612-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the introduction of the support of EABIhf as a second ARM
ABI, it is important to check whether the external toolchain provided
by the user actually uses the ABI that has been selected in the
Buildroot configuration. This commit introduces such a check, using a
similar solution to the one that was used to check OABI vs. EABI in
the past.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 95217e7..dc21f8a 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -280,8 +280,20 @@ check_uclibc = \
 check_arm_abi = \
 	__CROSS_CC=$(strip $1) ; \
 	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
-	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
-		echo "External toolchain uses the unsuported OABI" ; \
+	if echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi$$' ; then \
+		EXT_TOOLCHAIN_ABI="eabi" ; \
+	elif echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabihf$$' ; then \
+		EXT_TOOLCHAIN_ABI="eabihf" ; \
+	else \
+		echo "Unsupported ABI of the external toolchain" ; \
+		exit 1 ; \
+	fi ; \
+	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabihf" ] ; then \
+		echo "Incorrect ABI setting: EABI selected, but toolchain uses EABIhf" ; \
+		exit 1 ; \
+	fi ; \
+	if [ x$(BR2_ARM_EABIHF) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabi" ] ; then \
+		echo "Incorrect ABI setting: EABIhf selected, but toolchain uses EABI" ; \
 		exit 1 ; \
 	fi
 
-- 
1.8.1.2
