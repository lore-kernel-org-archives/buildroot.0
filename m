From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:35:04 +0200
Subject: [Buildroot] [PATCH 5/7] support: move patch-kernel.sh and rename it
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6fb92a6f315b6fc4803f976f5b16ed6ac98eaaad.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The name "patch-kernel.sh" is a bit stupid, since this script is used
to patch everything in Buildroot, not only kernel trees.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk                                |    2 +-
 linux/linux.mk                                     |    6 +++---
 package/Makefile.autotools.in                      |   12 ++++++------
 package/Makefile.package.in                        |    8 ++++----
 package/argus/argus.mk                             |    2 +-
 package/cups/cups.mk                               |    2 +-
 package/cvs/cvs.mk                                 |    2 +-
 package/fis/fis.mk                                 |    2 +-
 package/gettext/gettext.mk                         |    2 +-
 package/input-tools/input-tools.mk                 |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libgtk2/libgtk2.mk                         |    2 +-
 package/libosip2/libosip2.mk                       |    2 +-
 package/mii-diag/mii-diag.mk                       |    2 +-
 package/mutt/mutt.mk                               |    2 +-
 package/netkitbase/netkitbase.mk                   |    2 +-
 package/netkittelnet/netkittelnet.mk               |    2 +-
 package/setserial/setserial.mk                     |    2 +-
 package/sfdisk/sfdisk.mk                           |    2 +-
 package/sysklogd/sysklogd.mk                       |    2 +-
 package/sysvinit/sysvinit.mk                       |    2 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/tinyhttpd/tinyhttpd.mk                     |    2 +-
 package/ttcp/ttcp.mk                               |    2 +-
 package/uemacs/uemacs.mk                           |    2 +-
 package/vpnc/vpnc.mk                               |    2 +-
 package/xfsprogs/xfsprogs.mk                       |    2 +-
 .../scripts/apply-patches.sh                       |    0
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    4 ++--
 toolchain/gdb/gdb.mk                               |    2 +-
 toolchain/kernel-headers/kernel-headers.mk         |    4 ++--
 toolchain/uClibc/uclibc.mk                         |    4 ++--
 32 files changed, 44 insertions(+), 44 deletions(-)
 rename toolchain/patch-kernel.sh => support/scripts/apply-patches.sh (100%)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 776bdef..202995a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -52,7 +52,7 @@ endef
 
 ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
 define UBOOT_APPLY_CUSTOM_PATCHES
-	toolchain/patch-kernel.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
 		uboot-$(UBOOT_VERSION)-\*.patch
 endef
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 6662f7b..d289b28 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -100,11 +100,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 define LINUX_APPLY_PATCHES
 	for p in $(LINUX_PATCHES) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
-			toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
+			support/scripts/apply-patches.sh $(@D) $(DL_DIR) `basename $$p` ; \
 		elif test -d $$p ; then \
-			toolchain/patch-kernel.sh $(@D) $$p linux-\*.patch ; \
+			support/scripts/apply-patches.sh $(@D) $$p linux-\*.patch ; \
 		else \
-			toolchain/patch-kernel.sh $(@D) `dirname $$p` `basename $$p` ; \
+			support/scripts/apply-patches.sh $(@D) `dirname $$p` `basename $$p` ; \
 		fi \
 	done
 endef
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d502d21..95e38ef 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -151,11 +151,11 @@ define LIBTOOL_PATCH_HOOK
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
 			sed -e 's/\([0-9].[0-9]*\).*/\1/' -e 's/\"//'`; \
 			if test $$$${ltmain_version} = '1.5'; then \
-				toolchain/patch-kernel.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				toolchain/patch-kernel.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				toolchain/patch-kernel.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} support/libtool buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
@@ -176,11 +176,11 @@ define AUTORECONF_HOOK
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | sed 's/\([0-9].[0-9]*\).*/\1/'`; \
 			if test $$$${ltmain_version} = "1.5"; then \
-				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
-				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
 			elif test $$$${ltmain_version} = "2.4"; then\
-				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.4.patch; \
+				support/scripts/apply-patches.sh $$$${i%/*} package buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 868bf28..0751144 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -259,15 +259,15 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
-	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
+	$(if $($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
 	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
+	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
+	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
 	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
-	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
+	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	fi; \
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index 2705bac..1a90b10 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -11,7 +11,7 @@ ARGUS_DEPENDENCIES=libpcap
 
 define ARGUS_DEBIAN_PATCH_APPLY
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 169cdb3..3b9f2e0 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -69,7 +69,7 @@ $(DL_DIR)/$(CUPS_SOURCE):
 
 $(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
 	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(CUPS_DIR) package/cups/ \*.patch
+	support/scripts/apply-patches.sh $(CUPS_DIR) package/cups/ \*.patch
 	$(CONFIG_UPDATE) $(CUPS_DIR)
 	touch $@
 
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 023e93b..8d56a21 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -37,7 +37,7 @@ define CVS_DEBIAN_PATCHES
 		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
 		 done; \
 		); \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*; \
 	fi
 endef
 endif
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index e532aff..2942449 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -18,7 +18,7 @@ fis-source: $(DL_DIR)/$(FIS_SOURCE)
 $(FIS_DIR)/.unpacked: $(DL_DIR)/$(FIS_SOURCE)
 	mkdir -p $(FIS_DIR)
 	cp -f $(DL_DIR)/$(FIS_SOURCE) $(FIS_DIR)
-	toolchain/patch-kernel.sh $(FIS_DIR) package/fis \*.patch
+	support/scripts/apply-patches.sh $(FIS_DIR) package/fis \*.patch
 	touch $@
 
 $(FIS_DIR)/$(FIS_BINARY): $(FIS_DIR)/.unpacked
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 2b308c8..332a2ca 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -24,7 +24,7 @@ gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
 
 $(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
 	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
+	support/scripts/apply-patches.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
 	$(CONFIG_UPDATE) $(@D)
 	$(CONFIG_UPDATE) $(GETTEXT_DIR)/build-aux
 	touch $@
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index daf0755..0c5b523 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -15,7 +15,7 @@ INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSTEST)      += jstest
 
 define INPUT_TOOLS_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 415745b..565a259 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -18,7 +18,7 @@ define LIBEXOSIP2_DEBIAN_PATCHES
 		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBEXOSIP2_VERSION)/,+++ cvs-$(LIBEXOSIP2_VERSION)/,' $$i; \
 		 done; \
 		); \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*; \
 	fi
 endef
 endif
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index be4531e..f9872b6 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -139,7 +139,7 @@ HOST_LIBGTK2_CONF_OPT = \
 		--disable-debug
 
 define HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
- toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) host-*.patch
+ support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) host-*.patch
 endef
 
 HOST_LIBGTK2_POST_PATCH_HOOKS += HOST_LIBGTK2_PATCH_REDUCE_DEPENDENCIES_HOOK
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index aa15332..da3f9a2 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -16,7 +16,7 @@ define LIBOSIP2_DEBIAN_PATCHES
 		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBOSIP2_VERSION)/,+++ cvs-$(LIBOSIP2_VERSION)/,' $$i; \
 		 done; \
 		); \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*; \
 	fi
 endef
 endif
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 01a8b5f..6d3743a 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -10,7 +10,7 @@ MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index d021aef..886768c 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -16,7 +16,7 @@ MUTT_AUTORECONF=YES
 
 define MUTT_APPLY_DEBIAN_PATCHES
         if [ -d $(@D)/debian/patches ]; then \
-                toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+                support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
         fi
 endef
 
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
index 311c8b2..dde8f9f 100644
--- a/package/netkitbase/netkitbase.mk
+++ b/package/netkitbase/netkitbase.mk
@@ -22,7 +22,7 @@ $(NETKITBASE_DIR)/.unpacked: $(DL_DIR)/$(NETKITBASE_SOURCE)
 	$(SED) "s/main()/main(void)/;" $(NETKITBASE_DIR)/configure
 	# don't try to run cross compiled binaries while configuring things
 	$(SED) "s~./__conftest~#./__conftest~;" $(NETKITBASE_DIR)/configure
-	toolchain/patch-kernel.sh $(NETKITBASE_DIR) package/netkitbase/ netkitbase\*.patch
+	support/scripts/apply-patches.sh $(NETKITBASE_DIR) package/netkitbase/ netkitbase\*.patch
 	touch $(NETKITBASE_DIR)/.unpacked
 
 $(NETKITBASE_DIR)/.configured: $(NETKITBASE_DIR)/.unpacked
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index afa3bc4..e9f40ca 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -23,7 +23,7 @@ $(NETKITTELNET_DIR)/.unpacked: $(DL_DIR)/$(NETKITTELNET_SOURCE)
 	# Disable termcap support
 	$(SED) "s~\(.*termcap\.h.*\)~/* \1 */~;" $(NETKITTELNET_DIR)/telnetd/telnetd.c
 	# don't try to run cross compiled binaries while configuring things
-	toolchain/patch-kernel.sh $(NETKITTELNET_DIR) package/netkittelnet/ netkittelnet\*.patch
+	support/scripts/apply-patches.sh $(NETKITTELNET_DIR) package/netkittelnet/ netkittelnet\*.patch
 	touch $(NETKITTELNET_DIR)/.unpacked
 
 $(NETKITTELNET_DIR)/.configured: $(NETKITTELNET_DIR)/.unpacked
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index f24af73..33c8478 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -13,7 +13,7 @@ define SETSERIAL_APPLY_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		touch $(@D)/gorhack.h; \
 		rm $(@D)/debian/patches/01_makefile.dpatch; \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches *.dpatch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches *.dpatch; \
 	fi
 endef
 
diff --git a/package/sfdisk/sfdisk.mk b/package/sfdisk/sfdisk.mk
index 81c4943..22ebeaa 100644
--- a/package/sfdisk/sfdisk.mk
+++ b/package/sfdisk/sfdisk.mk
@@ -14,7 +14,7 @@ $(DL_DIR)/$(SFDISK_SOURCE):
 
 $(SFDISK_DIR)/.patched: $(DL_DIR)/$(SFDISK_SOURCE)
 	$(SFDISK_CAT) $(DL_DIR)/$(SFDISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SFDISK_DIR) package/sfdisk/ sfdisk.\*.patch
+	support/scripts/apply-patches.sh $(SFDISK_DIR) package/sfdisk/ sfdisk.\*.patch
 	touch $@
 
 
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 11aee2a..e08f048 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -15,7 +15,7 @@ endif
 
 define SYSKLOGD_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index adcc1ad..af5ec42 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -15,7 +15,7 @@ endif
 
 define SYSVINIT_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index c67aa49..46c87a1 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -11,7 +11,7 @@ THTTPD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/t/thttpd/
 ifneq ($(THTTPD_PATCH),)
 define THTTPD_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
 endef
 endif
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index eac416b..739849f 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -23,7 +23,7 @@ tinyhttpd-source: $(DL_DIR)/$(TINYHTTPD_SOURCE)
 #############################################################
 $(TINYHTTPD_DIR)/.unpacked: $(DL_DIR)/$(TINYHTTPD_SOURCE)
 	$(TINYHTTPD_CAT) $(DL_DIR)/$(TINYHTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TINYHTTPD_DIR) package/tinyhttpd/ tinyhttpd\*.patch
+	support/scripts/apply-patches.sh $(TINYHTTPD_DIR) package/tinyhttpd/ tinyhttpd\*.patch
 	touch $(TINYHTTPD_DIR)/.unpacked
 
 $(TINYHTTPD_DIR)/$(TINYHTTPD_BINARY): $(TINYHTTPD_DIR)/.unpacked
diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
index 1c4fe6f..006b74c 100644
--- a/package/ttcp/ttcp.mk
+++ b/package/ttcp/ttcp.mk
@@ -15,7 +15,7 @@ $(DL_DIR)/$(TTCP_SOURCE):
 $(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
 	-mkdir $(TTCP_DIR)
 	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_DIR)
-	toolchain/patch-kernel.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
+	support/scripts/apply-patches.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
 	touch $(TTCP_DIR)/.unpacked
 
 $(TTCP_DIR)/.configured: $(TTCP_DIR)/.unpacked
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index 539ad51..8355a7f 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -18,7 +18,7 @@ uemacs-source: $(DL_DIR)/$(UEMACS_SOURCE)
 
 $(UEMACS_DIR)/.unpacked: $(DL_DIR)/$(UEMACS_SOURCE)
 	$(UEMACS_CAT) $(DL_DIR)/$(UEMACS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UEMACS_DIR) package/uemacs/ uemacs\*.patch
+	support/scripts/apply-patches.sh $(UEMACS_DIR) package/uemacs/ uemacs\*.patch
 	touch $(UEMACS_DIR)/.unpacked
 
 $(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
diff --git a/package/vpnc/vpnc.mk b/package/vpnc/vpnc.mk
index c4f23fa..5a8c700 100644
--- a/package/vpnc/vpnc.mk
+++ b/package/vpnc/vpnc.mk
@@ -19,7 +19,7 @@ $(DL_DIR)/$(VPNC_SOURCE):
 
 $(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
 	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc vpnc-$(VPNC_VERSION)\*.patch
+	support/scripts/apply-patches.sh $(VPNC_DIR) package/vpnc vpnc-$(VPNC_VERSION)\*.patch
 	touch $@
 
 $(VPNC_BINARY): $(VPNC_DIR)/.unpacked
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 204b3cb..68db2f7 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -24,7 +24,7 @@ xfsprogs-source: $(DL_DIR)/$(XFSPROGS_SOURCE)
 
 $(XFSPROGS_DIR)/.unpacked: $(DL_DIR)/$(XFSPROGS_SOURCE)
 	$(XFSPROGS_CAT) $(DL_DIR)/$(XFSPROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(XFSPROGS_DIR) package/xfsprogs/ xfsprogs\*.patch
+	support/scripts/apply-patches.sh $(XFSPROGS_DIR) package/xfsprogs/ xfsprogs\*.patch
 	touch $(XFSPROGS_DIR)/.unpacked
 
 #XFSPROGS_CONFIG_SHARED:=--disable-shared
diff --git a/toolchain/patch-kernel.sh b/support/scripts/apply-patches.sh
similarity index 100%
rename from toolchain/patch-kernel.sh
rename to support/scripts/apply-patches.sh
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 94613fa..9232290 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -207,12 +207,12 @@ gcc-patched: $(GCC_DIR)/.patched
 $(GCC_DIR)/.patched: $(GCC_DIR)/.unpacked
 	# Apply any files named gcc-*.patch from the source directory to gcc
 ifneq ($(wildcard $(GCC_PATCH_DIR)),)
-	toolchain/patch-kernel.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch $(GCC_PATCH_EXTRA)
+	support/scripts/apply-patches.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch $(GCC_PATCH_EXTRA)
 endif
 
 ifeq ($(ARCH)-$(BR2_GCC_SHARED_LIBGCC),powerpc-y)
 ifneq ($(BR2_SOFT_FLOAT),)
-	toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
+	support/scripts/apply-patches.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
 endif
 endif
 	touch $@
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index caf3e36..db46b12 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -36,7 +36,7 @@ ifeq ($(GDB_VERSION),snapshot)
 	ln -sf $(TOOLCHAIN_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
 endif
 ifneq ($(wildcard $(GDB_PATCH_DIR)),)
-	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
+	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
 endif
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index ce70cab..044fcf9 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -55,10 +55,10 @@ $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	touch $@
 
 $(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
+	support/scripts/apply-patches.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 ifneq ($(KERNEL_HEADERS_PATCH_DIR),)
-	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
+	support/scripts/apply-patches.sh $(LINUX_HEADERS_UNPACK_DIR) $(KERNEL_HEADERS_PATCH_DIR) \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 endif
 	touch $@
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index e74012f..0fc5a81 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -79,11 +79,11 @@ $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
 uclibc-patched: $(UCLIBC_DIR)/.patched
 $(UCLIBC_DIR)/.patched: $(UCLIBC_DIR)/.unpacked
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
-	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
+	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc-$(UCLIBC_VERSION)-\*.patch \
 		uClibc-$(UCLIBC_VERSION)-\*.patch.$(ARCH)
 else
-	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
+	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
 endif
 	touch $@
-- 
1.7.4.1
