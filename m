From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:25 +0200
Subject: [Buildroot] [git commit branch/next] toolchain-external: adjust
	logic to support Linaro 2012.05
Message-ID: <20120802195258.35B3A8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68973cca23bbbaff1d763a434114021e5a695515
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The check_glibc function verifies that the C library of the external
toolchain is glibc. To do so, it verified that a file matching
ld-linux*.so.* or ld.so.* was found in the lib/ directory of the
toolchain's sysroot. However, with the Linaro 2012.05 toolchain, the
lib/ directory contains two links named ld-linux-armhf.so.3 and
ld-linux.so.3, which means that the first ld-linux*.so.* wildcard
expression expands to two files, which generates a syntax error for
the "test" program. We replace that with a more elaborate find+wc
combination to determine whether at least one matching file is
present.

The check_arm_abi function verifies the ABI of an ARM toolchain. For
EABI, it tested that the target name ends with eabi. However, with
Linaro 2012.05, the tuple is now arm-linux-gnueabihf (for hard float),
so we have to adjust the logic to accept this additional "hf"
specification in the tuple.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 649b91b..49a9044 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -196,7 +196,7 @@ check_glibc_feature = \
 #
 check_glibc = \
 	SYSROOT_DIR="$(strip $1)"; \
-	if ! test -f $${SYSROOT_DIR}/lib/ld-linux*.so.* -o -f $${SYSROOT_DIR}/lib/ld.so.* ; then \
+	if test `find $${SYSDROOT_DIR}/lib/ -maxdepth 1 -name 'ld-linux*.so.*' -o -name 'ld.so.*' | wc -l` -eq 0 ; then \
 		echo "Incorrect selection of the C library"; \
 		exit -1; \
 	fi; \
@@ -263,7 +263,7 @@ check_uclibc = \
 check_arm_abi = \
 	__CROSS_CC=$(strip $1) ; \
 	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
-	if echo $${EXT_TOOLCHAIN_TARGET} | grep -q 'eabi$$' ; then \
+	if echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
 		EXT_TOOLCHAIN_ABI="eabi" ; \
 	else \
 		EXT_TOOLCHAIN_ABI="oabi" ; \
