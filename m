From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 21:09:39 +0200
Subject: [Buildroot] [git commit] toolchain-external: clarify rsync excludes
	in copy_toolchain_sysroot
Message-ID: <20170405195202.12BAE826FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=367f4abcf9f56787b57cdd231e57fa7ac718cd2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The copy_toolchain_sysroot helper features a complex rsync loop that copies
various directories from the extracted toolchain to the staging directory.
The complexity mainly stems from the fact that we support multilib toolchain
tarballs but only copy one of the multilib variants into staging.

Increase understandability of this logic by explicitly restricting the
rsync excludes to the iteration of the for loop they are relevant for.
Additionally, update the function comment.

Note: all attempts to reduce duplication between both rsync while keeping
things nice and readable failed. One has to be extremely careful regarding
line continuation, indentation, and single vs double quoting. In the end, a
split up rsync seemed most clean.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 30880e5..761b90e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -39,11 +39,16 @@ copy_toolchain_lib_root = \
 # dir. The operation of this function is rendered a little bit
 # complicated by the support for multilib toolchains.
 #
-# We start by copying etc, lib, sbin and usr from the sysroot of the
-# selected architecture variant (as pointed by ARCH_SYSROOT_DIR). This
-# allows to import into the staging directory the C library and
-# companion libraries for the correct architecture variant. We
-# explictly only copy etc, lib, sbin and usr since other directories
+# We start by copying etc, 'lib', sbin, usr and usr/'lib' from the
+# sysroot of the selected architecture variant (as pointed to by
+# ARCH_SYSROOT_DIR). This allows to import into the staging directory
+# the C library and companion libraries for the correct architecture
+# variant. 'lib' may not be literally 'lib' but could be something else,
+# e.g. lib32-fp (as determined by ARCH_LIB_DIR) and we only want to copy
+# that lib directory and no other. When copying usr, we therefore need
+# to be extra careful not to include usr/lib* but we _do_ want to
+# include usr/libexec.
+# We are selective in the directories we copy since other directories
 # might exist for other architecture variants (on Codesourcery
 # toolchain, the sysroot for the default architecture variant contains
 # the armv4t and thumb2 subdirectories, which are the sysroot for the
@@ -92,9 +97,14 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			continue ; \
 		fi ; \
-		rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
-			--include '/libexec*/' --exclude '/lib*/' \
-			$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+		if [ "$$i" = "usr" ]; then \
+			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
+				--include '/libexec*/' --exclude '/lib*/' \
+				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+		else \
+			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
+				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+		fi ; \
 	done ; \
 	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
