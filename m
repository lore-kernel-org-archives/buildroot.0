From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:48 +0200
Subject: [Buildroot] [PATCH 09/12] toolchain/helpers: only check for an EABI
	toolchain
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <3b6cf971d7a39efdd850193671308292d8716594.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... since we only support EABI now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0398b63..95217e7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -280,13 +280,8 @@ check_uclibc = \
 check_arm_abi = \
 	__CROSS_CC=$(strip $1) ; \
 	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
-	if echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
-		EXT_TOOLCHAIN_ABI="eabi" ; \
-	else \
-		EXT_TOOLCHAIN_ABI="oabi" ; \
-	fi ; \
-	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "oabi" ] ; then \
-		echo "Incorrect ABI setting" ; \
+	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
+		echo "External toolchain uses the unsuported OABI" ; \
 		exit 1 ; \
 	fi
 
-- 
1.8.1.2
