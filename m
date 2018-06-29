From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Date: Fri, 29 Jun 2018 13:33:39 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: Fix ld.so copying for multilib
 toolchains.
Message-ID: <20180629113339.59102-1-christoph.muellner@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Multilib toolchains can have more than one ld.so files in lib/.
Typically one for each lib* directory.
However the current copy_toolchain_sysroot implemenation does
not support more than one ld.so.

This patch addresses this by iterating over all ld.so files
in the lib/ directory and choose the one, which has a symlink
into $ARCH_LIB_DIR/.

An example is a multilib toolchain for aarch64 (LP64 and ILP32),
which includes the following entries in lib/:

$ ls -l lib/
lrwxrwxrwx 1 user group ld-linux-aarch64_ilp32.so.1 -> ../libilp32/ld-2.27.so
lrwxrwxrwx 1 user group ld-linux-aarch64.so.1 -> ../lib64/ld-2.27.so

$ARCH_LIB_DIR/ will be detected as lib64.
Without the patch no ld.so will be copied.
With the patch the second ld.so (the one for LP64) will be copied.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
---
 toolchain/helpers.mk | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1792286add..62c0454be5 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -136,9 +136,14 @@ copy_toolchain_sysroot = \
 		done ; \
 	fi ; \
 	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
-		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
-			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
-		fi ; \
+		find $${ARCH_SYSROOT_DIR}/lib/ -name ld*.so.* -print0 | while IFS= read -r -d '' LD_SO; do \
+			LINKTARGET=`realpath $${LD_SO}` ; \
+			LINKTARGETDIR=`dirname $${LINKTARGET}` ; \
+			LINKTARGETBASE=`basename $${LINKTARGETDIR}` ; \
+			if [ "$${LINKTARGETBASE}" = "$${ARCH_LIB_DIR}" ]; then \
+				cp -a $${LD_SO} $(STAGING_DIR)/lib/ ; \
+			fi ; \
+		done ; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
2.11.0
