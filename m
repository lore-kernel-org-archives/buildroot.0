From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Aug 2016 23:20:05 +0200
Subject: [Buildroot] [PATCH 1/2] support/apply-patches: use options rather
	than positional arguments
Message-ID: <1471209606-17689-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to improve the apply-patches script in a follow up patch and
ease it maintenance, use options provided by bash getopts rather than
positional arguments.

Update Buildroot infra and packages but this will break existing
packages from BR2_EXTERNAL using APPLY_PATCHES.

While at it, rename builddir to sourcedir since it is really the
package source directory.

Ref:
http://lists.busybox.net/pipermail/buildroot/2016-August/169760.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/at91bootstrap.mk      |   3 +-
 boot/at91bootstrap3/at91bootstrap3.mk    |   3 +-
 boot/barebox/barebox.mk                  |   4 +-
 boot/uboot/uboot.mk                      |   4 +-
 linux/linux-ext-rtai.mk                  |   6 +-
 linux/linux.mk                           |   6 +-
 package/android-tools/android-tools.mk   |   2 +-
 package/cvs/cvs.mk                       |   2 +-
 package/gcc/gcc.mk                       |   4 +-
 package/input-tools/input-tools.mk       |   2 +-
 package/linux-headers/linux-headers.mk   |   4 +-
 package/mii-diag/mii-diag.mk             |   2 +-
 package/netcat-openbsd/netcat-openbsd.mk |   2 +-
 package/pkg-autotools.mk                 |   8 +-
 package/pkg-generic.mk                   |   6 +-
 package/setserial/setserial.mk           |   2 +-
 package/sysvinit/sysvinit.mk             |   2 +-
 package/thttpd/thttpd.mk                 |   2 +-
 support/scripts/apply-patches.sh         | 138 ++++++++++++++++++++-----------
 19 files changed, 122 insertions(+), 80 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index f655058..180c4b8 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -24,7 +24,8 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
 define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \*.patch
+	$(APPLY_PATCHES) -d $(@D) \
+		-D $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) -p \*.patch
 endef
 
 AT91BOOTSTRAP_POST_PATCH_HOOKS += AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 32732f4..7fd37a6 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -26,7 +26,8 @@ AT91BOOTSTRAP3_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
 
 ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
 define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \*.patch
+	$(APPLY_PATCHES) -d $(@D) \
+		-D $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) -p \*.patch
 endef
 
 AT91BOOTSTRAP3_POST_PATCH_HOOKS += AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 832297e..b58ca19 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -43,8 +43,8 @@ $(1)_CUSTOM_EMBEDDED_ENV_PATH = $$(call qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDE
 
 ifneq ($$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define $(1)_APPLY_CUSTOM_PATCHES
-	$$(APPLY_PATCHES) $$(@D) \
-		$$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \*.patch
+	$$(APPLY_PATCHES) -d $$(@D) \
+		-D $$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) -p \*.patch
 endef
 
 $(1)_POST_PATCH_HOOKS += $(1)_APPLY_CUSTOM_PATCHES
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7c3512a..f79a67b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -121,9 +121,9 @@ UBOOT_PATCH = $(filter ftp://% http://% https://%,$(UBOOT_PATCHES))
 define UBOOT_APPLY_LOCAL_PATCHES
 	for p in $(filter-out ftp://% http://% https://%,$(UBOOT_PATCHES)) ; do \
 		if test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+			$(APPLY_PATCHES) -d $(@D) -D $$p -p \*.patch || exit 1 ; \
 		else \
-			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+			$(APPLY_PATCHES) -d $(@D) -D `dirname -p $$p` `basename $$p` || exit 1; \
 		fi \
 	done
 endef
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index 0cc1232..751c9e0 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -20,9 +20,9 @@ endif
 define RTAI_PREPARE_KERNEL
 	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		$(APPLY_PATCHES) $(LINUX_DIR)		 		\
-			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
-			hal-linux-$${kver}-*patch ; \
+		$(APPLY_PATCHES) -d $(LINUX_DIR)		 	\
+			-D $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
+			-p hal-linux-$${kver}-*patch ; \
 	else \
 		echo "No RTAI patch for your kernel version" ; \
 		exit 1 ; \
diff --git a/linux/linux.mk b/linux/linux.mk
index fb844ef..42ed735 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -185,9 +185,9 @@ endif # BR2_LINUX_KERNEL_VMLINUX
 define LINUX_APPLY_LOCAL_PATCHES
 	for p in $(filter-out ftp://% http://% https://%,$(LINUX_PATCHES)) ; do \
 		if test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+			$(APPLY_PATCHES) -d $(@D) -D $$p -p \*.patch || exit 1 ; \
 		else \
-			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+			$(APPLY_PATCHES) -d $(@D) -D `dirname $$p` -p `basename $$p` || exit 1; \
 		fi \
 	done
 endef
@@ -199,7 +199,7 @@ LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 # Try a dry-run patch to see if this applies, if it does go ahead
 define LINUX_TRY_PATCH_TIMECONST
 	@if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional >/dev/null ; then \
-		$(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional ; \
+		$(APPLY_PATCHES) -d $(@D) -D $(LINUX_PKGDIR) -p 0001-timeconst.pl-Eliminate-Perl-warning.patch.conditional ; \
 	fi
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 4510392..753ff32 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -24,7 +24,7 @@ ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
 
 # Apply the Debian patches before applying the Buildroot patches
 define ANDROID_TOOLS_DEBIAN_PATCH
-	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*
+	$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p \*
 endef
 
 HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 6f28b4d..a4eb06a 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -38,7 +38,7 @@ define CVS_DEBIAN_PATCHES
 		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
 		 done; \
 		); \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p \*; \
 	fi
 endef
 endif
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 032015c..7a96257 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -36,7 +36,7 @@ endef
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
-	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) 1000-powerpc-link-with-math-lib.patch.conditional
+	$(APPLY_PATCHES) -d $(@D) -D package/gcc/$(GCC_VERSION) -p 1000-powerpc-link-with-math-lib.patch.conditional
 endef
 endif
 endif
@@ -50,7 +50,7 @@ define HOST_GCC_APPLY_PATCHES
 	    $(addsuffix /gcc/$(GCC_VERSION),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) \
 	    $(addsuffix /gcc,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))) ; do \
 		if test -d $${patchdir}; then \
-			$(APPLY_PATCHES) $(@D) $${patchdir} \*.patch || exit 1; \
+			$(APPLY_PATCHES) -d $(@D) -D $${patchdir} -p \*.patch || exit 1; \
 		fi; \
 	done
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 81e913d..6c3cfab 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -17,7 +17,7 @@ INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
 
 define INPUT_TOOLS_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p \*.patch; \
 	fi
 endef
 
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 0900778..98e44ed 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -62,9 +62,9 @@ LINUX_HEADERS_PATCH = $(filter ftp://% http://% https://%,$(LINUX_HEADERS_PATCHE
 define LINUX_HEADERS_APPLY_LOCAL_PATCHES
 	for p in $(filter-out ftp://% http://% https://%,$(LINUX_HEADERS_PATCHES)) ; do \
 		if test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
+			$(APPLY_PATCHES) -d $(@D) -D $$p -p \*.patch || exit 1 ; \
 		else \
-			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
+			$(APPLY_PATCHES) -d $(@D) -D `dirname $$p` -p `basename $$p` || exit 1; \
 		fi \
 	done
 endef
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index ae8defd..51e5860 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -15,7 +15,7 @@ MII_DIAG_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p \*.patch; \
 	fi
 endef
 
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 5abfc7e..3a7323b 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -18,7 +18,7 @@ endif
 
 define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p *.dpatch; \
 	fi
 endef
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 75e2df0..f64d435 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -65,14 +65,14 @@ define LIBTOOL_PATCH_HOOK
 		ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[ \t]*VERSION=//;p;q;}' $$i | \
 		sed -e 's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; \
 		if test $${ltmain_version} = '1.5'; then \
-			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+			$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v1.5.patch; \
 		elif test $${ltmain_version} = "2.2"; then\
-			$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+			$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.2.patch; \
 		elif test $${ltmain_version} = "2.4"; then\
 			if test $${ltmain_patchlevel:-0} -gt 2; then\
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.4.patch; \
+				$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.4.4.patch; \
 			else \
-				$(APPLY_PATCHES) $${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+				$(APPLY_PATCHES) -d $${i%/*} -D support/libtool -p buildroot-libtool-v2.4.patch; \
 			fi \
 		fi \
 	done
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68ead3d..014a901 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -165,14 +165,14 @@ $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
+	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) -d $(@D) -D $(DL_DIR) -p $(notdir $(p))$(sep))
 	$(Q)( \
 	for D in $(PATCH_BASE_DIRS); do \
 	  if test -d $${D}; then \
 	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) -d $(@D) -D $${D}/$($(PKG)_VERSION) -p \*.patch \*.patch.$(ARCH) || exit 1; \
 	    else \
-	      $(APPLY_PATCHES) $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) -d $(@D) -D $${D} -p \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	done; \
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 561fbe9..7604f29 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -18,7 +18,7 @@ define SETSERIAL_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
 		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p *.dpatch; \
 	fi
 endef
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index faefd5c..635f200 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -25,7 +25,7 @@ endif
 
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p \*.patch; \
 	fi
 endef
 
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 5b4b0c4..0b5fd2f 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -14,7 +14,7 @@ THTTPD_LICENSE_FILES = thttpd.c
 ifneq ($(THTTPD_PATCH),)
 define THTTPD_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) -d $(@D) -D $(@D)/debian/patches -p \*.patch; \
 	fi
 endef
 endif
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 7ccb39d..90b5806 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -5,16 +5,6 @@
 #
 # (c) 2002 Erik Andersen <andersen@codepoet.org>
 #
-# Parameters:
-# - "-s", optional. Silent operation, don't print anything if there
-# isn't any error.
-# - the build directory, optional, default value is '.'. The place where are
-# the package sources.
-# - the patch directory, optional, default '../kernel-patches'. The place
-# where are the scripts you want to apply.
-# - other parameters are the patch name patterns, optional, default value is
-# '*'. Pattern(s) describing the patch names you want to apply.
-#
 # The script will look recursively for patches from the patch directory. If a
 # file named 'series' exists then the patches mentioned in it will be applied
 # as plain patches, regardless of their file name. If no 'series' file exists,
@@ -31,38 +21,60 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
+# We want to catch any unexpected failure, and exit immediately.
 set -e
 
-silent=
-if [ "$1" = "-s" ] ; then
-    # add option to be used by the patch tool
-    silent=-s
-    shift
-fi
+# use a well defined sorting order
+export LC_COLLATE=C
 
 # Set directories from arguments, or use defaults.
-builddir=${1-.}
-patchdir=${2-../kernel-patches}
-shift 2
-patchpattern=${@-*}
+sourcedir="."
+patchdir="../kernel-patches"
+patchpattern="*"
 
-# use a well defined sorting order
-export LC_COLLATE=C
+main() {
+    local OPT OPTARG
+
+    # Parse our options; anything after '--' is for the backend
+    while getopts :hd:D:p:s OPT; do
+        case "${OPT}" in
+        h)  help; exit 0;;
+        d)  sourcedir="${OPTARG}";;
+        D)  patchdir="${OPTARG}";;
+        p)  patchpattern="${OPTARG}";;
+        s)  silent="-s";; # Option to be used by the patch tool.
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+    done
+
+    if [ ! -d "${sourcedir}" ] ; then
+        echo "Aborting.  '${sourcedir}' is not a directory."
+        exit 1
+    fi
+    if [ ! -d "${patchdir}" ] ; then
+        echo "Aborting.  '${patchdir}' is not a directory."
+        exit 1
+    fi
+
+    # Remove any rejects present BEFORE patching - Because if there are
+    # any, even if patches are well applied, at the end it will complain
+    # about rejects in sourcedir.
+    find ${sourcedir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
+        xargs -0 -r rm -f
+
+    touch ${sourcedir}/.applied_patches_list
+    scan_patchdir "$patchdir" "$patchpattern"
 
-if [ ! -d "${builddir}" ] ; then
-    echo "Aborting.  '${builddir}' is not a directory."
-    exit 1
-fi
-if [ ! -d "${patchdir}" ] ; then
-    echo "Aborting.  '${patchdir}' is not a directory."
-    exit 1
-fi
-
-# Remove any rejects present BEFORE patching - Because if there are
-# any, even if patches are well applied, at the end it will complain
-# about rejects in builddir.
-find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
-    xargs -0 -r rm -f
+    # Check for rejects...
+    if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
+        echo "Aborting.  Reject files found."
+        exit 1
+    fi
+
+    # Remove backup files
+    find $sourcedir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
+}
 
 function apply_patch {
     path="${1%%/}"
@@ -105,7 +117,7 @@ function apply_patch {
         echo "Error: missing patch file ${path}/$patch"
         exit 1
     fi
-    existing="$(grep -E "/${patch}\$" ${builddir}/.applied_patches_list || true)"
+    existing="$(grep -E "/${patch}\$" ${sourcedir}/.applied_patches_list || true)"
     if [ -n "${existing}" ]; then
         echo "Error: duplicate filename '${patch}'"
         echo "Conflicting files are:"
@@ -113,8 +125,8 @@ function apply_patch {
         echo "  to be applied  : ${path}/${patch}"
         exit 1
     fi
-    echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
+    echo "${path}/${patch}" >> ${sourcedir}/.applied_patches_list
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${sourcedir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
@@ -143,7 +155,7 @@ function scan_patchdir {
             if [ -d "${path}/$i" ] ; then
                 scan_patchdir "${path}/$i"
             elif echo "$i" | grep -q -E "\.tar(\..*)?$|\.tbz2?$|\.tgz$" ; then
-                unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
+                unpackedarchivedir="$sourcedir/.patches-$(basename $i)-unpacked"
                 rm -rf "$unpackedarchivedir" 2> /dev/null
                 mkdir "$unpackedarchivedir"
                 tar -C "$unpackedarchivedir" -xaf "${path}/$i"
@@ -155,14 +167,42 @@ function scan_patchdir {
     fi
 }
 
-touch ${builddir}/.applied_patches_list
-scan_patchdir "$patchdir" "$patchpattern"
+help() {
+    cat <<_EOF_
+NAME
+    ${my_name} - apply-patches wrapper for Buildroot
+
+SYNOPSIS
+    ${my_name} [OPTION]... -- [BACKEND OPTION]...
+
+DESCRIPTION
+    Wrapper script to make it easy to patch source trees and have sane
+    error handling.
+
+    -h This help text.
 
-# Check for rejects...
-if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
-    echo "Aborting.  Reject files found."
-    exit 1
-fi
+    -d The package build directory, optional, default value is '.'.
+        The place where are the package sources.
+
+    -D The patch directory, optional, default '../kernel-patches'.
+        The place where are the scripts you want to apply.
+
+    -p Patch name patterns, optional, default value is '*'.
+        Pattern(s) describing the patch names you want to apply.
+        (*.patch, *.dpatch, *.conditional...)
+
+    -s silent.
+        Optional. Silent operation, don't print anything if there isn't
+        any error.
+
+  Exit status:
+    0   if OK
+    !0  in case of error
+
+ENVIRONMENT
+
+_EOF_
+}
 
-# Remove backup files
-find $builddir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
+my_name="${0##*/}"
+main "${@}"
-- 
2.5.5
