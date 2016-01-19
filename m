From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 23:06:58 +0100
Subject: [Buildroot] [git commit] toolchain: allow side by side sysroot
	directories
Message-ID: <20160119220849.52080827F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a1e9efe2618ebbf12ed2567bcd6e8cca5619547
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently our toolchain infrastructure assumes that every toolchain has
nested sysroot directories. However that's not true for all of them. The
Codescape toolchains from Imagination Technologies use a side by side
sysroot structure, for instance.

This patch allows our toolchain infrastructure to detect what kind of
sysroot structure we have (nested or side by side) and performs the
appropriate actions.

[Thomas: update the comment above the function, to explain what's
going on with nested sysroots and side-by-side sysroots.]

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 59 ++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..70695ee 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -97,10 +97,22 @@ copy_toolchain_lib_root = \
 # corresponding architecture variants), and we don't want to import
 # them.
 #
-# Then, if the selected architecture variant is not the default one
-# (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR), then we :
+# Then, we need to support two types of multilib toolchains:
 #
-#  * Import the header files from the default architecture
+#  - The toolchains that have nested sysroots: a main sysroot, and
+#    then additional sysroots available as subdirectories of the main
+#    one. This is for example used by Sourcery CodeBench toolchains.
+#
+#  - The toolchains that have side-by-side sysroots. Each sysroot is a
+#    complete one, they simply leave one next to each other. This is
+#    for example used by MIPS Codescape toolchains.
+#
+# So, we first detect if the selected architecture variant is not the
+# default one (i.e, if SYSROOT_DIR != ARCH_SYSROOT_DIR).
+#
+# If we are in the situation of a nested sysroot, we:
+#
+#  * If needed, import the header files from the default architecture
 #    variant. Header files are typically shared between the sysroots
 #    for the different architecture variants. If we use the
 #    non-default one, header files were not copied by the previous
@@ -114,10 +126,14 @@ copy_toolchain_lib_root = \
 #    non-default architecture variant is used. Without this, the
 #    compiler fails to find libraries and headers.
 #
-# Some toolchains (i.e Linaro binary toolchains) store support
-# libraries (libstdc++, libgcc_s) outside of the sysroot, so we simply
-# copy all the libraries from the "support lib directory" into our
-# sysroot.
+# If we are in the situation of a side-by-side sysroot, we:
+#
+# * Create a symbolic link
+#
+# Finally, some toolchains (i.e Linaro binary toolchains) store
+# support libraries (libstdc++, libgcc_s) outside of the sysroot, so
+# we simply copy all the libraries from the "support lib directory"
+# into our sysroot.
 #
 # Note that the 'locale' directories are not copied. They are huge
 # (400+MB) in CodeSourcery toolchains, and they are not really useful.
@@ -142,18 +158,25 @@ copy_toolchain_sysroot = \
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
+			echo "Symlinking $(STAGING_DIR)/`basename $${ARCH_SYSROOT_DIR_CANON}` -> $${relpath}" ; \
+		fi ; \
 	fi ; \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
