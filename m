From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 30 Sep 2010 23:09:39 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain: fix helpers for
	POSIX compliance
Message-ID: <20100930211203.C551D8B6ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d12bc6294a37d52150fe14292d4e84d7a70e4861
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using two '=' for string comparison is a bashism.
Revert to using one, as stated in POSIX 1003.1-2008.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 5c87d2b..05d43e7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -170,11 +170,11 @@ check_glibc = \
 #
 check_uclibc_feature = \
 	IS_IN_LIBC=`grep -q "\#define $(1) 1" $(3) && echo y` ; \
-	if [ x$($(2)) != x"y" -a x$${IS_IN_LIBC} == x"y" ] ; then \
+	if [ x$($(2)) != x"y" -a x$${IS_IN_LIBC} = x"y" ] ; then \
 		echo "$(4) available in C library, please enable $(2)" ; \
 		exit 1 ; \
 	fi ; \
-	if [ x$($(2)) == x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \
+	if [ x$($(2)) = x"y" -a x$${IS_IN_LIBC} != x"y" ] ; then \
 		echo "$(4) not available in C library, please disable $(2)" ; \
 		exit 1 ; \
 	fi
@@ -214,11 +214,11 @@ check_arm_abi = \
 	else \
 		EXT_TOOLCHAIN_ABI="oabi" ; \
 	fi ; \
-	if [ x$(BR2_ARM_OABI) == x"y" -a $${EXT_TOOLCHAIN_ABI} == "eabi" ] ; then \
+	if [ x$(BR2_ARM_OABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "eabi" ] ; then \
 		echo "Incorrect ABI setting" ; \
 		exit 1 ; \
 	fi ; \
-	if [ x$(BR2_ARM_EABI) == x"y" -a $${EXT_TOOLCHAIN_ABI} == "oabi" ] ; then \
+	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "oabi" ] ; then \
 		echo "Incorrect ABI setting" ; \
 		exit 1 ; \
 	fi ; \
-- 
1.7.1
