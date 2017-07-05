From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 12:20:06 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: simplify ld.so fixup
	in copy_toolchain_sysroot
Message-ID: <20170705101717.42C247FBDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb22fe82313b24763f29483bb3ebfdd7aabbe1a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In copy_toolchain_sysroot, if no ld.so has been found in the
STAGING_DIR after the sysroot copy, we look at ARCH_SYSROOT_DIR if a
ld.so is available there. We do this for both ld*.so and ld*.so.*.

However, when copying thing from staging to target (as listed in
TOOLCHAIN_EXTERNAL_LIBS), we only match on ld*.so.*. This would mean
that even if a dynamic linker matching ld*.so but not ld*.so.* was
copied into staging by copy_toolchain_sysroot, it would anyway not be
copied to the target filesystem, making the system unusable.

Therefore, we can remove the special case on ld*.so, and keep only
ld*.so.*.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index fe2b4b9..6136aef 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -127,10 +127,7 @@ copy_toolchain_sysroot = \
 			$(call simplify_symlink,$$i,$(STAGING_DIR)) ; \
 		done ; \
 	fi ; \
-	if [ ! -e $(STAGING_DIR)/lib/ld*.so ] && [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
-		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so ]; then \
-			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so $(STAGING_DIR)/lib/ ; \
-		fi ; \
+	if [ ! -e $(STAGING_DIR)/lib/ld*.so.* ]; then \
 		if [ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]; then \
 			cp -a $${ARCH_SYSROOT_DIR}/lib/ld*.so.* $(STAGING_DIR)/lib/ ; \
 		fi ; \
