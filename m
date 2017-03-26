From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 15:25:52 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: remove unused
	argument of check_arm_abi
Message-ID: <20170326132636.A5F5D821F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9e5b04230f9ec5b40e1b1d1c4a5f94b8d3497ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check_arm_abi function takes as second argument the path to the
cross-readelf, but does not use it. Therefore, this commit gets rid of
this unnecessary argument.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                                   | 1 -
 toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 77303a8..30880e5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -277,7 +277,6 @@ check_uclibc = \
 #
 check_arm_abi = \
 	__CROSS_CC=$(strip $1) ; \
-	__CROSS_READELF=$(strip $2) ; \
 	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
 	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
 		echo "External toolchain uses the unsuported OABI" ; \
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8bb7b40..1777368 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -553,8 +553,7 @@ define $(2)_CONFIGURE_CMDS
 		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
 	if test "$$(BR2_arm)" = "y" ; then \
 		$$(call check_arm_abi,\
-			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)",\
-			$$(TOOLCHAIN_EXTERNAL_READELF)) ; \
+			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
 	fi ; \
 	if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
