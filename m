From: Dan Nicolaescu <dann@ics.uci.edu>
Date: Fri, 04 Jan 2008 09:53:03 -0800
Subject: [Buildroot] [patch] CONFIG_UPDATE for a few packages
Message-ID: <200801041753.m04Hr3Pi011109@oogie-boogie.ics.uci.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On a platform that needs very recent config.sub and config.guess files,
a few more packages need to run CONFIG_UPDATE.

Can someone please apply the patch below? 

Thanks!


--- netcat/netcat.mk~
+++ netcat/netcat.mk
@@ -19,6 +19,7 @@
 
 $(NETCAT_DIR)/.unpacked: $(DL_DIR)/$(NETCAT_SOURCE)
 	$(NETCAT_CAT) $(DL_DIR)/$(NETCAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(NETCAT_DIR)
 	touch $@
 
 $(NETCAT_DIR)/.configured: $(NETCAT_DIR)/.unpacked
--- which/which.mk~
+++ which/which.mk
@@ -18,6 +18,7 @@
 
 $(WHICH_DIR)/.unpacked: $(DL_DIR)/$(WHICH_SOURCE)
 	$(WHICH_CAT) $(DL_DIR)/$(WHICH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(WHICH_DIR)
 	touch $(WHICH_DIR)/.unpacked
 
 $(WHICH_DIR)/.configured: $(WHICH_DIR)/.unpacked
--- rsync/rsync.mk~
+++ rsync/rsync.mk
@@ -19,6 +19,7 @@
 $(RSYNC_DIR)/.unpacked: $(DL_DIR)/$(RSYNC_SOURCE)
 	$(RSYNC_CAT) $(DL_DIR)/$(RSYNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(RSYNC_DIR) package/rsync/ rsync\*.patch
+	$(CONFIG_UPDATE) $(RSYNC_DIR)
 	touch $(RSYNC_DIR)/.unpacked
 
 $(RSYNC_DIR)/.configured: $(RSYNC_DIR)/.unpacked
--- rxvt/rxvt.mk~
+++ rxvt/rxvt.mk
@@ -35,6 +35,7 @@
 $(RXVT_DIR)/.unpacked: $(DL_DIR)/$(RXVT_SOURCE)
 	$(RXVT_CAT) $(DL_DIR)/$(RXVT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(RXVT_DIR) package/rxvt/ \*.patch
+	$(CONFIG_UPDATE) $(RXVT_DIR)/autoconf
 	touch $(RXVT_DIR)/.unpacked
 
 $(RXVT_DIR)/.configured: $(RXVT_DIR)/.unpacked
--- coreutils/coreutils.mk~
+++ coreutils/coreutils.mk
@@ -22,6 +22,7 @@
 $(COREUTILS_DIR)/.unpacked: $(DL_DIR)/$(COREUTILS_SOURCE)
 	$(COREUTILS_CAT) $(DL_DIR)/$(COREUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(COREUTILS_DIR) package/coreutils/ coreutils\*.patch
+	$(CONFIG_UPDATE) $(COREUTILS_DIR)/build-aux
 	touch $@
 
 $(COREUTILS_DIR)/.configured: $(COREUTILS_DIR)/.unpacked
--- tar/tar.mk~
+++ tar/tar.mk
@@ -19,6 +19,8 @@
 $(GNUTAR_DIR)/.unpacked: $(DL_DIR)/$(GNUTAR_SOURCE)
 	$(GNUTAR_CAT) $(DL_DIR)/$(GNUTAR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GNUTAR_DIR) package/tar/ tar\*.patch
+	$(CONFIG_UPDATE) $(GNUTAR_DIR)
+	$(CONFIG_UPDATE) $(GNUTAR_DIR)/build-aux
 	touch $@
 
 $(GNUTAR_DIR)/.configured: $(GNUTAR_DIR)/.unpacked
--- grep/grep.mk~
+++ grep/grep.mk
@@ -22,6 +22,7 @@
 	mv $(GNUGREP_DIR) $(GNUGREP_DIR).xxx
 	$(GNUGREP_CAT) $(GNUGREP_DIR).xxx/grep_$(GNUGREP_VERSION).tar.gz | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -rf $(GNUGREP_DIR).xxx
+	$(CONFIG_UPDATE) $(GNUGREP_DIR)
 	touch $(GNUGREP_DIR)/.unpacked
 
 $(GNUGREP_DIR)/.configured: $(GNUGREP_DIR)/.unpacked
--- libdrm/libdrm.mk~
+++ libdrm/libdrm.mk
@@ -16,6 +16,7 @@
 
 $(LIBDRM_DIR)/.unpacked: $(DL_DIR)/$(LIBDRM_SOURCE)
 	$(LIBDRM_CAT) $(DL_DIR)/$(LIBDRM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(LIBDRM_DIR)
 	touch $@
 
 $(LIBDRM_DIR)/.configured: $(LIBDRM_DIR)/.unpacked
--- freetype/freetype.mk~
+++ freetype/freetype.mk
@@ -17,6 +17,7 @@
 $(FREETYPE_DIR)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
 	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(FREETYPE_DIR)
+	$(CONFIG_UPDATE) $(FREETYPE_DIR)/builds/unix
 	touch $(FREETYPE_DIR)/.unpacked
 
 # freetype for the target
--- sudo/sudo.mk~
+++ sudo/sudo.mk
@@ -18,6 +18,7 @@
 $(SUDO_DIR)/.unpacked: $(DL_DIR)/$(SUDO_SOURCE)
 	$(SUDO_UNZIP) $(DL_DIR)/$(SUDO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SUDO_DIR) package/sudo sudo\*.patch
+	$(CONFIG_UPDATE) $(SUDO_DIR)
 	touch $(SUDO_DIR)/.unpacked
 
 $(SUDO_DIR)/.configured: $(SUDO_DIR)/.unpacked $(SUDO_CONFIG_FILE)
--- sed/sed.mk~
+++ sed/sed.mk
@@ -37,6 +37,7 @@
 	mkdir -p $(HOST_SED_DIR)/bin
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(SED_DIR1) package/sed/ configure.patch
+	$(CONFIG_UPDATE) $(SED_DIR1)/config
 	touch $@
 
 $(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
@@ -97,6 +98,7 @@
 #############################################################
 $(SED_DIR2)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
 	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(SED_DIR2)/config
 	touch $(SED_DIR2)/.unpacked
 
 $(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
--- autoconf/autoconf.mk
+++ autoconf/autoconf.mk
@@ -24,6 +24,7 @@
 
 $(AUTOCONF_SRC_DIR)/.unpacked: $(DL_DIR)/$(AUTOCONF_SOURCE)
 	$(AUTOCONF_CAT) $(DL_DIR)/$(AUTOCONF_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(AUTOCONF_SRC_DIR)
 	touch $@
 
 #############################################################
--- dialog/dialog.mk
+++ dialog/dialog.mk
@@ -15,6 +15,7 @@
 
 $(DIALOG_DIR)/.source: $(DL_DIR)/$(DIALOG_SOURCE) $(DL_DIR)/$(DIALOG_PATCH1)
 	$(ZCAT) $(DL_DIR)/$(DIALOG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(DIALOG_DIR)
 	touch $@
 
 $(DIALOG_DIR)/.configured: $(DIALOG_DIR)/.source
--- libtool/libtool.mk
+++ libtool/libtool.mk
@@ -20,6 +20,8 @@
 
 $(LIBTOOL_SRC_DIR)/.unpacked: $(DL_DIR)/$(LIBTOOL_SOURCE)
 	$(LIBTOOL_CAT) $(DL_DIR)/$(LIBTOOL_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(LIBTOOL_SRC_DIR)
+	$(CONFIG_UPDATE) $(LIBTOOL_SRC_DIR)/libltdl
 	touch $@
 
 #############################################################
--- wget/wget.mk
+++ wget/wget.mk
@@ -18,6 +18,7 @@
 
 $(WGET_DIR)/.unpacked: $(DL_DIR)/$(WGET_SOURCE)
 	$(WGET_CAT) $(DL_DIR)/$(WGET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(WGET_DIR)
 	touch $(WGET_DIR)/.unpacked
 
 $(WGET_DIR)/.configured: $(WGET_DIR)/.unpacked
--- expat/expat.mk
+++ expat/expat.mk
@@ -22,6 +22,7 @@
 	$(EXPAT_CAT) $(DL_DIR)/$(EXPAT_SOURCE) | \
 		tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(EXPAT_DIR)
+	$(CONFIG_UPDATE) $(EXPAT_DIR)/conftools
 	touch $@
 
 $(EXPAT_DIR)/.configured: $(EXPAT_DIR)/.unpacked
--- cvs/cvs.mk
+++ cvs/cvs.mk
@@ -38,6 +38,7 @@
 	$(BZCAT) $(CVS_DIR)/cvs-$(CVS_VERSION)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -rf $(CVS_DIR)/cvs-$(CVS_VERSION)
 	$(CONFIG_UPDATE) $(CVS_DIR)
+	$(CONFIG_UPDATE) $(CVS_DIR)/build-aux
 	toolchain/patch-kernel.sh $(CVS_DIR) package/cvs \*$(CVS_VERSION)\*.patch
 ifneq ($(CVS_PATCH),)
 	toolchain/patch-kernel.sh $(CVS_DIR) $(DL_DIR) $(CVS_PATCH)
--- nano/nano.mk
+++ nano/nano.mk
@@ -18,6 +18,7 @@
 
 $(NANO_DIR)/.unpacked: $(DL_DIR)/$(NANO_SOURCE)
 	$(NANO_CAT) $(DL_DIR)/$(NANO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(NANO_DIR)
 	touch $(NANO_DIR)/.unpacked
 
 $(NANO_DIR)/.configured: $(NANO_DIR)/.unpacked
--- mplayer/mplayer.mk
+++ mplayer/mplayer.mk
@@ -23,6 +23,7 @@
 $(MPLAYER_DIR)/.unpacked: $(DL_DIR)/$(MPLAYER_SOURCE)
 	$(MPLAYER_CAT) $(DL_DIR)/$(MPLAYER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/ mplayer-$(MPLAYER_VERSION)\*.patch\*
+	$(CONFIG_UPDATE) $(MPLAYER_DIR)
 	touch $@
 
 $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
