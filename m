From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 21:27:33 +0200
Subject: [Buildroot] [git commit] toolchain helpers: introduce function
	relpath_prefix
Message-ID: <20170405195202.35514826FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2596422d762eeb7902b62821d4c7a26fa1f958b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The helper function copy_toolchain_sysroot has some logic to transform a
path into a number of '../' components based on the depth of that path.

As this same logic will be needed in another place in a subsequent patch,
extract it into a separate helper relpath_prefix.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 719c420..21db9d7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -122,11 +122,7 @@ copy_toolchain_sysroot = \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
 		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
-		relpath="./" ; \
-		nbslashs=`printf $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
-		for slash in `seq 1 $${nbslashs}` ; do \
-			relpath=$${relpath}"../" ; \
-		done ; \
+		relpath="$(call relpath_prefix,$${ARCH_SUBDIR})./" ; \
 		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
 		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
 	fi ; \
@@ -419,3 +415,22 @@ check_toolchain_ssp = \
 gen_gdbinit_file = \
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
 	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
+
+# Given a path, determine the relative prefix (../) needed to return to the
+# root level. Note that the last component is treated as a file component; use a
+# trailing slash to force treating it as a directory. Examples:
+#     relpath_prefix(lib32) = ""
+#     relpath_prefix(lib32/octeon2) = "../"
+#     relpath_prefix(lib32/octeon2/) = "../../"
+#
+# $1: input path
+define relpath_prefix
+$$( \
+	prefix="" ; \
+	nbslashs=`printf $1 | sed 's%[^/]%%g' | wc -c` ; \
+	for slash in `seq 1 $${nbslashs}` ; do \
+		prefix=$${prefix}"../" ; \
+	done ; \
+	printf "$$prefix" ; \
+)
+endef
