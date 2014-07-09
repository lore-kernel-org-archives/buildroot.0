From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  9 Jul 2014 13:46:53 +0200
Subject: [Buildroot] [PATCH 1/2] apply-patches.sh: don't print anything when
	"-s" option is used
Message-ID: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The make "-s" option is used to enable the "Silent operation" so if
that option is used don't print anything as far as there isn't any
error.
Add the "-s" option to "apply-patches.sh" to enable silent operation.
Because "apply-patches.sh" is called in many places add a
"APPLY_PATCHES" variable to permit adding the "-s" easily.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/at91bootstrap/at91bootstrap.mk   |  2 +-
 boot/at91bootstrap3/at91bootstrap3.mk |  2 +-
 boot/barebox/barebox.mk               |  2 +-
 boot/uboot/uboot.mk                   |  2 +-
 linux/linux-ext-rtai.mk               |  4 ++--
 linux/linux.mk                        |  6 +++---
 package/Makefile.in                   |  6 ++++++
 package/cvs/cvs.mk                    |  2 +-
 package/gcc/gcc.mk                    |  4 ++--
 package/input-tools/input-tools.mk    |  2 +-
 package/mii-diag/mii-diag.mk          |  2 +-
 package/pkg-autotools.mk              | 12 ++++++------
 package/pkg-generic.mk                |  6 +++---
 package/setserial/setserial.mk        |  2 +-
 package/sysklogd/sysklogd.mk          |  2 +-
 package/sysvinit/sysvinit.mk          |  2 +-
 package/thttpd/thttpd.mk              |  2 +-
 support/scripts/apply-patches.sh      | 17 ++++++++++++++---
 18 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index c5fd099..896804e 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -24,7 +24,7 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR)),)
 define AT91BOOTSTRAP_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \
+	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR) \
 		at91bootstrap-$(AT91BOOTSTRAP_VERSION)-\*.patch
 endef
 
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 07df75d..be63252 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -21,7 +21,7 @@ AT91BOOTSTRAP3_MAKE_OPT = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
 
 ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
 define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
+	$(APPLY_PATCHES) $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
 		at91bootstrap3-\*.patch
 endef
 
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index f57d297..d970fbc 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -26,7 +26,7 @@ BAREBOX_LICENSE_FILES = COPYING
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) \
+	$(APPLY_PATCHES) $(@D) \
 		$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
 		barebox-$(BAREBOX_VERSION)-\*.patch
 endef
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 532ac8b..522b531 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -87,7 +87,7 @@ UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 define UBOOT_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
+	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
 		uboot-\*.patch
 endef
 
diff --git a/linux/linux-ext-rtai.mk b/linux/linux-ext-rtai.mk
index dcfab49..bf998d5 100644
--- a/linux/linux-ext-rtai.mk
+++ b/linux/linux-ext-rtai.mk
@@ -25,7 +25,7 @@ ifeq ($(RTAI_PATCH),)
 define RTAI_PREPARE_KERNEL
 	kver=`$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelversion` ; \
 	if test -f $(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/hal-linux-$${kver}-*patch ; then \
-		support/scripts/apply-patches.sh $(LINUX_DIR) 		\
+		$(APPLY_PATCHES) $(LINUX_DIR)		 		\
 			$(RTAI_DIR)/base/arch/$(RTAI_ARCH)/patches/ 	\
 			hal-linux-$${kver}-*patch ; \
 	else \
@@ -35,7 +35,7 @@ define RTAI_PREPARE_KERNEL
 endef
 else
 define RTAI_PREPARE_KERNEL
-	support/scripts/apply-patches.sh 	\
+	$(APPLY_PATCHES) 			\
 		$(LINUX_DIR)			\
 		$(dir $(RTAI_PATCH))		\
 		$(notdir $(RTAI_PATCH))
diff --git a/linux/linux.mk b/linux/linux.mk
index bd3f2ac..30ee740 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -148,11 +148,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 define LINUX_APPLY_PATCHES
 	for p in $(LINUX_PATCHES) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
-			support/scripts/apply-patches.sh $(@D) $(DL_DIR) `basename $$p` ; \
+			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
-			support/scripts/apply-patches.sh $(@D) $$p linux-\*.patch ; \
+			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch ; \
 		else \
-			support/scripts/apply-patches.sh $(@D) `dirname $$p` `basename $$p` ; \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ; \
 		fi \
 	done
 endef
diff --git a/package/Makefile.in b/package/Makefile.in
index 97053ba..e1fdb4d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -218,6 +218,12 @@ FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 SED:=$(shell which sed || type -p sed) -i -e
 
+ifeq (,$(findstring s,$(MAKEFLAGS)))
+APPLY_PATCHES = support/scripts/apply-patches.sh
+else
+APPLY_PATCHES = support/scripts/apply-patches.sh -s
+endif
+
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 596eabf..3229e83 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -38,7 +38,7 @@ define CVS_DEBIAN_PATCHES
 		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
 		 done; \
 		); \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*; \
 	fi
 endef
 endif
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5b60bc3..8be0233 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -44,14 +44,14 @@ endef
 ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
-	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
+	$(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
 endef
 endif
 endif
 
 define HOST_GCC_APPLY_PATCHES
 	if test -d package/gcc/$(GCC_VERSION); then \
-	  support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
+	  $(APPLY_PATCHES) $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
 	fi;
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index ae3f7d2..b1d0149 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -17,7 +17,7 @@ INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
 
 define INPUT_TOOLS_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 7a7bc7f..d2b3b9f 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -15,7 +15,7 @@ MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
 
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index ddff9bf..ba44660 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -184,11 +184,11 @@ define LIBTOOL_PATCH_HOOK
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = '1.5'; then \
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
@@ -210,11 +210,11 @@ define AUTORECONF_HOOK
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = "1.5"; then \
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+				$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 395e593..4e323e7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -146,14 +146,14 @@ $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
 	@$(call MESSAGE,"Patching")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
-	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
+	$(foreach p,$($(PKG)_PATCH),$(APPLY_PATCHES) $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
 	for D in $(PATCH_BASE_DIRS); do \
 	  if test -d $${D}; then \
 	    if test -d $${D}/$($(PKG)_VERSION); then \
-	      support/scripts/apply-patches.sh $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    else \
-	      support/scripts/apply-patches.sh $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
+	      $(APPLY_PATCHES) $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	done; \
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9f28216..6900197 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -16,7 +16,7 @@ define SETSERIAL_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
 		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
 	fi
 endef
 
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 37293da..9c4895d 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -18,7 +18,7 @@ endif
 
 define SYSKLOGD_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 3a7eac2..ff1ba24 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -18,7 +18,7 @@ endif
 
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 7be264a..7d663b9 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -14,7 +14,7 @@ THTTPD_LICENSE_FILES = thttpd.c
 ifneq ($(THTTPD_PATCH),)
 define THTTPD_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 endif
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 37f2d81..8d4ba6d 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -6,6 +6,8 @@
 # (c) 2002 Erik Andersen <andersen@codepoet.org>
 #
 # Parameters:
+# - "-s",optional. Silent operation, don't print anything if there
+# isn't any error.
 # - the build directory, optional, default value is '.'. The place where are
 # the package sources.
 # - the patch directory, optional, default '../kernel-patches'. The place
@@ -28,6 +30,13 @@
 # applied. The list of the patches applied is stored in '.applied_patches_list'
 # file in the build directory.
 
+silent=
+if [[ $1 == "-s" ]] ; then
+    # add option to be used by the patch tool
+    silent=-s
+    shift
+fi
+
 # Set directories from arguments, or use defaults.
 builddir=${1-.}
 patchdir=${2-../kernel-patches}
@@ -77,14 +86,16 @@ function apply_patch {
 	return 0
 	;;
     esac
-    echo ""
-    echo "Applying $patch using ${type}: "
+    if [[ ! $silent ]] ; then
+	echo ""
+	echo "Applying $patch using ${type}: "
+    fi
     if [ ! -e "${path}/$patch" ] ; then
 	echo "Error: missing patch file ${path}/$patch"
 	exit 1
     fi
     echo $patch >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N
+    ${uncomp} "${path}/$patch" | patch $silent -g0 -p1 -E -d "${builddir}" -t -N
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
 	exit 1
-- 
2.0.1
