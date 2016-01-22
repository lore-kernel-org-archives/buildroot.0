From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 22 Jan 2016 12:14:22 +0000
Subject: [Buildroot] [PATCH] toolchain: add a harmless link when sysroot
	detection is not accurate
Message-ID: <1453464862-33174-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes is not possible to detect if the sysroots are nested or side
by side. For instance this happens for MIPS big endian, where the
sysroot and the arch-sysroot directories are the same.

For those cases where the sysroot detection is not accurate we add a
harmless symlink necessary for certain toolchains.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 toolchain/helpers.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 70695ee..1f8a60c 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -163,6 +163,7 @@ copy_toolchain_sysroot = \
 	if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} ] ; then \
 		relpath="./" ; \
 		if [ $${ARCH_SYSROOT_DIR_CANON:0:$${\#SYSROOT_DIR_CANON}} == $${SYSROOT_DIR_CANON} ] ; then \
+			echo "Nested sysroots detected." ; \
 			if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 				cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 			fi ; \
@@ -174,9 +175,16 @@ copy_toolchain_sysroot = \
 			ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
 			echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
 		elif [ `dirname $${ARCH_SYSROOT_DIR_CANON}` == `dirname $${SYSROOT_DIR_CANON}` ] ; then \
+			echo "Side by side sysroots detected." ; \
 			ln -snf $${relpath} $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` ; \
 			echo "Symlinking $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` -> $${relpath}" ; \
 		fi ; \
+	else \
+		relpath="./" ; \
+		echo "Unable to detect if sysroots are nested or side by side." ; \
+		echo "Creating a harmless symlink necessary for certain toolchains." ; \
+		ln -snf $${relpath} $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` ; \
+		echo "Symlinking $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` -> $${relpath}" ; \
 	fi ; \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
-- 
2.4.10
