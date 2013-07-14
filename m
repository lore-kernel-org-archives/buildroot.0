From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:18:13 +0200
Subject: [Buildroot] [git commit] toolchain/helpers: only check for an EABI
	toolchain
Message-ID: <20130714204246.AD6F09A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95bfc99fb1b1c2b50b2b4bb8e6bbf6fa22c8abe7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... since we only support EABI now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

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
 
