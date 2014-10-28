From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 28 Oct 2014 22:28:19 +0100
Subject: [Buildroot] [PATCH v2 3/3] toolchain-external: calculation of the
	symlink to the arch sysroot
In-Reply-To: <1414531699-6789-1-git-send-email-romain.naour@openwide.fr>
References: <1414531699-6789-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1414531699-6789-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When copying external toolchain sysroot to staging, we need to
create the symbolic link that matches the name of the subdirectory
for the architecture variant in the original sysroot.
(ex: sgxx-glibc for CodeSourcery Standard edition)
To do that, SYSROOT_DIR must be different than ARCH_SYSROOT_DIR.

In the case where ARCH_SYSROOT_DIR is used as SYSROOT_DIR  we need
to check again the path to the main sysroot directory.
if SYSROOT_DIR returned by toolchain_find_sysroot without
TOOLCHAIN_EXTERNAL_CFLAGS is empty/invalid, then compute the common
part between SYSROOT_DIR and ARCH_SYSROOT_DIR returned by
toolchain_print_sysroot in order to get the "base sysroot".
This "base sysroot" is used as SYSROOT_DIR to create the symlink
in the staging directory.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 toolchain/helpers.mk | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 7d7af5f..a4a3661 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -97,6 +97,32 @@ toolchain_create_arch_sysroot_symlink = \
 	ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
 	echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}"
 
+# Returns the location of the sysroot for the given compiler + flags using
+# -print-sysroot gcc option (gcc > 4.3 is needed)
+define toolchain_print_sysroot
+$$(readlink -f $$(LANG=C $(1) -print-sysroot))
+endef
+
+# Returns the common path between the main sysroot and arch sysroot returned by
+# toolchain_print_sysroot. This is required to calculate the depth of the symlink
+# in the staging directory when the main sysroot directory is empty/bogus.
+define toolchain_calculate_base_sysroot
+$$(index=0 ; \
+common_sysroot_path="" ; \
+main_sysroot_path=$(call toolchain_print_sysroot,$(TOOLCHAIN_EXTERNAL_CC)); \
+arch_sysroot_path=$(call toolchain_print_sysroot,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS)); \
+while [ "$${main_sysroot_path:$${index}:1}" = "$${arch_sysroot_path:$${index}:1}" ] ; do \
+	if [ "$${main_sysroot_path:$${index}:1}" = "/" ]; then \
+		common_sysroot_path="$${main_sysroot_path:0:$${index}+1}"; \
+	fi ; \
+	if [ "$${main_sysroot_path:$${index}:1}" = "" ] || [ "$${arch_sysroot_path:$${index}:1}" = "" ]; then \
+		break; \
+	fi ; \
+	: $$((index++)) ; \
+done ; \
+echo -n $${common_sysroot_path})
+endef
+
 #
 # Copy the full external toolchain sysroot directory to the staging
 # dir. The operation of this function is rendered a little bit
@@ -130,6 +156,17 @@ toolchain_create_arch_sysroot_symlink = \
 #    non-default architecture variant is used. Without this, the
 #    compiler fails to find libraries and headers.
 #
+# Some toolchain (i.e CodeSourcery Standard edition) doesn't have
+# a main sysroot directory and use the arch sysroot as fallback.
+# In this case we need to check again the path to the main sysroot
+# directory when SYSROOT_DIR == ARCH_SYSROOT_DIR.
+# if SYSROOT_DIR returned by toolchain_find_sysroot without
+# TOOLCHAIN_EXTERNAL_CFLAGS point to valid directory.
+# If SYSROOT_DIR is empty/invalid, compute the common part between
+# SYSROOT_DIR and ARCH_SYSROOT_DIR returned by toolchain_print_sysroot
+# in order to get the "base sysroot". This "base sysroot" is used
+# to create the symlink in the staging directory.
+#
 # Some toolchains (i.e Linaro binary toolchains) store support
 # libraries (libstdc++, libgcc_s) outside of the sysroot, so we simply
 # copy all the libraries from the "support lib directory" into our
@@ -163,6 +200,16 @@ copy_toolchain_sysroot = \
 			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
 		fi ; \
 		$(call toolchain_create_arch_sysroot_symlink,$${ARCH_SUBDIR}) ; \
+	else \
+		if ! test -d "$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC))" ; then \
+			SYSROOT_DIR="$(call toolchain_calculate_base_sysroot)"; \
+			if ! test -d $${SYSROOT_DIR} ; then \
+				echo "ERROR: Unable to find the main sysroot directory." ; \
+				exit 1; \
+			fi ; \
+			ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+			$(call toolchain_create_arch_sysroot_symlink,$${ARCH_SUBDIR}) ; \
+		fi ; \
 	fi ; \
 	if test -n "$${SUPPORT_LIB_DIR}" ; then \
 		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
-- 
1.9.3
