From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20080804190741.DDA103C8AA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:41 -0700 (Mon, 04 Aug 2008)
New Revision: 23025

Log:
strace: convert to makefile.autotools.in format

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-08-04 19:07:38 UTC (rev 23024)
+++ trunk/buildroot/package/strace/strace.mk	2008-08-04 19:07:41 UTC (rev 23025)
@@ -6,77 +6,24 @@
 STRACE_VERSION:=4.5.15
 STRACE_SOURCE:=strace-$(STRACE_VERSION).tar.bz2
 STRACE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
-STRACE_CAT:=$(BZCAT)
-STRACE_DIR:=$(BUILD_DIR)/strace-$(STRACE_VERSION)
+STRACE_AUTORECONF:=no
+STRACE_INSTALL_STAGING:=NO
+STRACE_INSTALL_TARGET:=YES
 
-$(DL_DIR)/$(STRACE_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(STRACE_SITE)/$(STRACE_SOURCE)
+STRACE_DEPENDENCIES:=uclibc
 
-strace-source: $(DL_DIR)/$(STRACE_SOURCE)
+STRACE_CONF_ENV:= ac_cv_header_linux_if_packet_h=yes \
+		  ac_cv_header_linux_netlink_h=yes \
+	          $(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
-$(STRACE_DIR)/.unpacked: $(DL_DIR)/$(STRACE_SOURCE)
-	$(STRACE_CAT) $(DL_DIR)/$(STRACE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(STRACE_DIR) package/strace \
-		strace\*.patch strace\*.patch.$(ARCH)
-	$(CONFIG_UPDATE) $(STRACE_DIR)
-	touch $(STRACE_DIR)/.unpacked
+$(eval $(call AUTOTARGETS,package,strace))
 
-$(STRACE_DIR)/.configured: $(STRACE_DIR)/.unpacked
-	(cd $(STRACE_DIR); rm -rf config.cache; \
-		$(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		ac_cv_header_linux_if_packet_h=yes \
-		ac_cv_header_linux_netlink_h=yes \
-		./configure \
-		--target=$(REAL_GNU_TARGET_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $(STRACE_DIR)/.configured
-
-$(STRACE_DIR)/strace: $(STRACE_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(STRACE_DIR)
-
-$(TARGET_DIR)/usr/bin/strace: $(STRACE_DIR)/strace
-	install -c $(STRACE_DIR)/strace $(TARGET_DIR)/usr/bin/strace
-	$(STRIPCMD) $(TARGET_DIR)/usr/bin/strace > /dev/null 2>&1
+$(STRACE_HOOK_POST_INSTALL): $(STRACE_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/strace
+	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 ifeq ($(strip $(BR2_CROSS_TOOLCHAIN_TARGET_UTILS)),y)
 	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(TARGET_DIR)/usr/bin/strace \
 		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/strace
 endif
-
-strace: uclibc $(TARGET_DIR)/usr/bin/strace
-
-strace-clean:
-	rm -f $(TARGET_DIR)/usr/bin/strace \
-	      $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/strace
-	-$(MAKE) -C $(STRACE_DIR) clean
-
-strace-dirclean:
-	rm -rf $(STRACE_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_STRACE)),y)
-TARGETS+=strace
-endif
+	touch $@
