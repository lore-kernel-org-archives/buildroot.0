From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Dec 2015 16:21:23 +0000
Subject: [Buildroot] [PATCH v4 1/3] toolchain: allow side by side sysroot
	directories
Message-ID: <1450196485-19214-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently our toolchain infrastructure assumes that every toolchain has
nested sysroot directories. However that's not true for all of them. The
Codescape toolchains from Imagination Technologies use a side by side
sysroot structure, for instance.

This patch allows our toolchain infrastructure to detect what kind of
sysroot structure we have (nested or side by side) and performs the
appropriate actions.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v4:
 - This patch didn't exist before. It has been introduced in v4.

 toolchain/helpers.mk | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..1b9d12f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -142,18 +142,24 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
-	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
-		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
-		fi ; \
-		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
+	SYSROOT_DIR_CANON=`readlink -f $${SYSROOT_DIR}` ; \
+	ARCH_SYSROOT_DIR_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
+	if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} ] ; then \
 		relpath="./" ; \
-		nbslashs=`printf $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
-		for slash in `seq 1 $${nbslashs}` ; do \
-			relpath=$${relpath}"../" ; \
-		done ; \
-		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
-		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
+		if [ $${ARCH_SYSROOT_DIR_CANON:0:$${\#SYSROOT_DIR_CANON}} == $${SYSROOT_DIR_CANON} ] ; then \
+			if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
+				cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
+			fi ; \
+			mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
+			nbslashs=`printf $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
+			for slash in `seq 1 $${nbslashs}` ; do \
+				relpath=$${relpath}"../" ; \
+			done ; \
+			ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
+			echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
+		elif [ `dirname $${ARCH_SYSROOT_DIR_CANON}` == `dirname $${SYSROOT_DIR_CANON}` ] ; then \
+			ln -snf $${relpath} $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` ; \
+		fi ; \
 	fi ; \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
-- 
2.4.10
