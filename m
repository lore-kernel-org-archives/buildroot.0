From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 14 Nov 2014 00:03:25 +0100
Subject: [Buildroot] [PATCH v3 2/3] toolchain-helpers: factorise the arch
	sysroot symlink creation
In-Reply-To: <1415919806-13005-1-git-send-email-romain.naour@openwide.fr>
References: <1415919806-13005-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1415919806-13005-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The part of copy_toolchain_sysroot function that create the symlink in the
staging directory will be used in two different place in the following patch.
So factorize this part in a new function called
toolchain_create_arch_sysroot_symlink.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>

---
v3: no change
v2: new	patch
---
 toolchain/helpers.mk | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..7d7af5f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -83,6 +83,20 @@ copy_toolchain_lib_root = \
 \
 	echo -n
 
+# Calculate the symlink's depth by counting the number of slashs.
+# Then create the symlink to arch sysroot.
+# $1: arch specific subdirectory in the sysroot
+toolchain_create_arch_sysroot_symlink = \
+	ARCH_SUBDIR="$(strip $1)"; \
+	mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
+	relpath="./" ; \
+	nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
+	for slash in `seq 1 $${nbslashs}` ; do \
+		relpath=$${relpath}"../" ; \
+	done ; \
+	ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
+	echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}"
+
 #
 # Copy the full external toolchain sysroot directory to the staging
 # dir. The operation of this function is rendered a little bit
@@ -148,14 +162,7 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
-		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
-		relpath="./" ; \
-		nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
-		for slash in `seq 1 $${nbslashs}` ; do \
-			relpath=$${relpath}"../" ; \
-		done ; \
-		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
-		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
+		$(call toolchain_create_arch_sysroot_symlink,$${ARCH_SUBDIR}) ; \
 	fi ; \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
-- 
1.9.3
