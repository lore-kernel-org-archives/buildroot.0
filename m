From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 22 Oct 2014 18:20:10 +0200
Subject: [Buildroot] [PATCH 1/2] apply-patches.sh: Use the "APPLY_PATCHES"
	variable to call the script
In-Reply-To: <1413994811-19452-1-git-send-email-fabio.porcedda@gmail.com>
References: <1413994811-19452-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1413994811-19452-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To easy up adding optional parameters when calling the
"apply-patches.sh" add and use the "APPLY_PATCHES" variable to execute
the script.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/at91bootstrap/at91bootstrap.mk      |  2 +-
 boot/at91bootstrap3/at91bootstrap3.mk    |  2 +-
 boot/barebox/barebox.mk                  |  2 +-
 boot/uboot/uboot.mk                      |  2 +-
 linux/linux-ext-rtai.mk                  |  4 ++--
 linux/linux.mk                           |  6 +++---
 package/Makefile.in                      |  2 ++
 package/cvs/cvs.mk                       |  2 +-
 package/gcc/gcc.mk                       |  4 ++--
 package/input-tools/input-tools.mk       |  2 +-
 package/mii-diag/mii-diag.mk             |  2 +-
 package/netcat-openbsd/netcat-openbsd.mk |  2 +-
 package/pkg-autotools.mk                 | 12 ++++++------
 package/pkg-generic.mk                   |  6 +++---
 package/setserial/setserial.mk           |  2 +-
 package/sysvinit/sysvinit.mk             |  2 +-
 package/thttpd/thttpd.mk                 |  2 +-
 17 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index d379580..e3f9dc0 100644
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
index 91b6684..bc8d912 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -21,7 +21,7 @@ AT91BOOTSTRAP3_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS) DESTDIR=$(BINARIES_DIR)
 
 ifneq ($(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR),)
 define AT91BOOTSTRAP3_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
+	$(APPLY_PATCHES) $(@D) $(AT91BOOTSTRAP3_CUSTOM_PATCH_DIR) \
 		at91bootstrap3-\*.patch
 endef
 
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 2cf4d15..0fb7cec 100644
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
index 0c6c96c..1f8818c 100644
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
index 2b862ec..bce2853 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -154,11 +154,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
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
index 02ddaa7..4a434ab 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -222,6 +222,8 @@ FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
 SED := $(shell which sed || type -p sed) -i -e
 
+APPLY_PATCHES = support/scripts/apply-patches.sh
+
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index f1a63c8..dfc935f 100644
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
index 7bed159..1352bdf 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -37,14 +37,14 @@ endef
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
index e7b1561..9fb94bf 100644
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
index af2d8776..aec13be 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -15,7 +15,7 @@ MII_DIAG_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 64fb7f0..bf5c4b7 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -18,7 +18,7 @@ endif
 
 define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
 	fi
 endef
 
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 80adc8b..3c6bb0d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -204,11 +204,11 @@ define LIBTOOL_PATCH_HOOK
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = '1.5'; then \
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
@@ -238,11 +238,11 @@ define AUTORECONF_HOOK
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = "1.5"; then \
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+				$$(APPLY_PATCHES) $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 259ee02..7a6d5e6 100644
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
index 55be4c1..ffdf129 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -18,7 +18,7 @@ define SETSERIAL_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
 		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.dpatch; \
 	fi
 endef
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index d588122..bdba38f 100644
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
index a621ae0..781043c 100644
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
-- 
2.1.1
