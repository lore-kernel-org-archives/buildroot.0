From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 6 May 2016 14:56:56 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "toolchain: allow side by side
	sysroot directories"
In-Reply-To: <1462543017-42054-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1462543017-42054-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1462543017-42054-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 9a1e9efe2618ebbf12ed2567bcd6e8cca5619547.
---
 toolchain/helpers.mk | 59 ++++++++++++++++------------------------------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d28a2ca..f61f084 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -50,22 +50,10 @@ copy_toolchain_lib_root = \
 # corresponding architecture variants), and we don't want to import
 # them.
 #
-# Then, we need to support two types of multilib toolchains:
+# Then, if the selected architecture variant is not the default one
+# (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR), then we :
 #
-#  - The toolchains that have nested sysroots: a main sysroot, and
-#    then additional sysroots available as subdirectories of the main
-#    one. This is for example used by Sourcery CodeBench toolchains.
-#
-#  - The toolchains that have side-by-side sysroots. Each sysroot is a
-#    complete one, they simply leave one next to each other. This is
-#    for example used by MIPS Codescape toolchains.
-#
-# So, we first detect if the selected architecture variant is not the
-# default one (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR).
-#
-# If we are in the situation of a nested sysroot, we:
-#
-#  * If needed, import the header files from the default architecture
+#  * Import the header files from the default architecture
 #    variant. Header files are typically shared between the sysroots
 #    for the different architecture variants. If we use the
 #    non-default one, header files were not copied by the previous
@@ -79,14 +67,10 @@ copy_toolchain_lib_root = \
 #    non-default architecture variant is used. Without this, the
 #    compiler fails to find libraries and headers.
 #
-# If we are in the situation of a side-by-side sysroot, we:
-#
-# * Create a symbolic link
-#
-# Finally, some toolchains (i.e Linaro binary toolchains) store
-# support libraries (libstdc++, libgcc_s) outside of the sysroot, so
-# we simply copy all the libraries from the "support lib directory"
-# into our sysroot.
+# Some toolchains (i.e Linaro binary toolchains) store support
+# libraries (libstdc++, libgcc_s) outside of the sysroot, so we simply
+# copy all the libraries from the "support lib directory" into our
+# sysroot.
 #
 # Note that the 'locale' directories are not copied. They are huge
 # (400+MB) in CodeSourcery toolchains, and they are not really useful.
@@ -111,25 +95,18 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
-	SYSROOT_DIR_CANON=`readlink -f $${SYSROOT_DIR}` ; \
-	ARCH_SYSROOT_DIR_CANON=`readlink -f $${ARCH_SYSROOT_DIR}` ; \
-	if [ $${SYSROOT_DIR_CANON} != $${ARCH_SYSROOT_DIR_CANON} ] ; then \
-		relpath="./" ; \
-		if [ $${ARCH_SYSROOT_DIR_CANON:0:$${\#SYSROOT_DIR_CANON}} == $${SYSROOT_DIR_CANON} ] ; then \
-			if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
-				cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
-			fi ; \
-			mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
-			nbslashs=`printf $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
-			for slash in `seq 1 $${nbslashs}` ; do \
-				relpath=$${relpath}"../" ; \
-			done ; \
-			ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
-			echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
-		elif [ `dirname $${ARCH_SYSROOT_DIR_CANON}` == `dirname $${SYSROOT_DIR_CANON}` ] ; then \
-			ln -snf $${relpath} $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` ; \
-			echo "Symlinking $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` -> $${relpath}" ; \
+	if [ `readlink -f $${SYSROOT_DIR}` != `readlink -f $${ARCH_SYSROOT_DIR}` ] ; then \
+		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
+			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
+		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
+		relpath="./" ; \
+		nbslashs=`printf $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
+		for slash in `seq 1 $${nbslashs}` ; do \
+			relpath=$${relpath}"../" ; \
+		done ; \
+		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
+		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
 	fi ; \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
-- 
2.7.3
