From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu,  6 Apr 2017 22:25:05 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: fix handling of ld.so
Message-ID: <20170406202505.17605-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Commit ba6bac138331cea449592f877e558f84176a70bf made a change in copying of
the dynamic loader, with the goal of reducing toolchain-specific fixups.
Any ld*.so file found in the toolchain's lib directory would be copied to
the staging/lib directory.

For the toolchains that previously needed fixup, this new behavior is fine.
The reason they needed fixup was that the normal copy action did not include
any dynamic loader.

However, for certain other toolchains this new behavior actually breaks
things: regardless of ARCH_LIB_DIR, which may be lib64 instead of lib, the
dynamic loader from lib is copied _over_ any previously correct dynamic
loader.

This has been witnessed with the CodeSourcery x86_64 and
CodeSourcery MIPS64 toolchains. In both cases, a 32-bit dynamic loader was
copied to staging/lib, while a 64-bit version was expected.

Fix the problem by only performing this explicit dynamic loader copy if no
dynamic loader is found in staging/lib.

Fixes http://autobuild.buildroot.net/results/8bf/8bffe54032aad9cc710a22411ef3bff4a2c93e55/

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 toolchain/helpers.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 5af38c6..90834f4 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -127,11 +127,13 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so ]; then \
-		cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so $(STAGING_DIR)/lib/ ; \
-	fi ; \
-	if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
-		cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
+	if [ ! -e $(STAGING_DIR)/lib/ld*.so ] && [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
+		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so ]; then \
+			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so $(STAGING_DIR)/lib/ ; \
+		fi ; \
+		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
+			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
+		fi ; \
 	fi ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-- 
2.10.2
