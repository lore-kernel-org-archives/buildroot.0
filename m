From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 27 Jun 2007 02:48:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  argus libpcap
Message-ID: <20070627094824.8C829A4595@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-27 02:48:23 -0700 (Wed, 27 Jun 2007)
New Revision: 18951

Log:
- introduce TARGET_CONFIGURE_ARGS to hold presets for configure for target packages


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/libpcap/libpcap.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-06-27 09:40:25 UTC (rev 18950)
+++ trunk/buildroot/package/Makefile.in	2007-06-27 09:48:23 UTC (rev 18951)
@@ -186,8 +186,33 @@
 		STRIP_FOR_TARGET=$(TARGET_CROSS)strip \
 		OBJCOPY_FOR_TARGET=$(TARGET_CROSS)objcopy
 
+#######################################################################
+# settings we need to pass to configure
 
+# does unaligned access trap?
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=yes
+ifeq ($(BR2_i386),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+endif
+ifeq ($(BR2_x86_64),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+endif
+ifeq ($(BR2_m68k),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+endif
+ifeq ($(BR2_s390),y)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+endif
+ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
+BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
+endif
 
+TARGET_CONFIGURE_ARGS= \
+	$(BR2_AC_CV_TRAP_CHECK) \
+
+
+#######################################################################
+
 ifeq ($(BR2_ENABLE_LOCALE),y)
 DISABLE_NLS:=
 else
@@ -207,6 +232,7 @@
 endif
 
 
+
 # X Windowing system
 
 XSERVER:=

Modified: trunk/buildroot/package/argus/argus.mk
===================================================================
--- trunk/buildroot/package/argus/argus.mk	2007-06-27 09:40:25 UTC (rev 18950)
+++ trunk/buildroot/package/argus/argus.mk	2007-06-27 09:48:23 UTC (rev 18951)
@@ -12,23 +12,6 @@
 ARGUS_BINARY:=bin/argus
 ARGUS_TARGET_BINARY:=usr/sbin/argus
 
-ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=yes
-ifeq ($(BR2_i386),y)
-ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_x86_64),y)
-ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_m68k),y)
-ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_s390),y)
-ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
-ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
-endif
-
 $(DL_DIR)/$(ARGUS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ARGUS_SITE)/$(ARGUS_SOURCE)
 
@@ -46,14 +29,14 @@
 		toolchain/patch-kernel.sh $(ARGUS_DIR) $(ARGUS_DIR)/debian/patches \*.patch ; \
 	fi
 endif
-	touch $(ARGUS_DIR)/.unpacked
+	touch $@
 
 $(ARGUS_DIR)/.configured: $(ARGUS_DIR)/.unpacked
 	(cd $(ARGUS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
-		$(ARGUS_TRAP_CHECK) \
+		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -61,7 +44,7 @@
 		--prefix=/usr \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(ARGUS_DIR)/.configured
+	touch $@
 
 $(ARGUS_DIR)/$(ARGUS_BINARY): $(ARGUS_DIR)/.configured
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(ARGUS_DIR)

Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2007-06-27 09:40:25 UTC (rev 18950)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2007-06-27 09:48:23 UTC (rev 18951)
@@ -37,13 +37,12 @@
 	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ \*.patch
 	touch $@
 
-# XXX: FIXME: put the argus ac_cv_lbl_unaligned_fail setting to som commonly
-# seen place and introduce TARGET_CONFIGURE_HINTS or the like!
 $(LIBPCAP_DIR)/.configured: $(LIBPCAP_DIR)/.unpacked
 	(cd $(LIBPCAP_DIR) ; rm -rf config.cache ; \
 		ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
 		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
