From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 11:58:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070708185849.C673030054@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 11:58:48 -0700 (Sun, 08 Jul 2007)
New Revision: 19043

Log:
- make it compile.


Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-07-08 18:16:12 UTC (rev 19042)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-07-08 18:58:48 UTC (rev 19043)
@@ -9,7 +9,7 @@
 GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VER)
 GETTEXT_CAT:=$(ZCAT)
 GETTEXT_BINARY:=gettext-runtime/src/gettext
-GETTEXT_TARGET_BINARY:=bin/gettext
+GETTEXT_TARGET_BINARY:=usr/bin/gettext
 
 $(DL_DIR)/$(GETTEXT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GETTEXT_SITE)/$(GETTEXT_SOURCE)
@@ -19,6 +19,7 @@
 $(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
 	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 ifeq ($(strip $(BR2_TOOLCHAIN_EXTERNAL)),y)
@@ -82,22 +83,13 @@
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
 		gl_cv_c_restrict=no \
+		LD=$(TARGET_CROSS)gcc \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		--disable-libasprintf \
 		$(IGNORE_EXTERNAL_GETTEXT) \
 		$(OPENMP) \
@@ -105,21 +97,21 @@
 	touch $@
 
 $(GETTEXT_DIR)/$(GETTEXT_BINARY): $(GETTEXT_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GETTEXT_DIR)
+	$(MAKE) -C $(GETTEXT_DIR)
 	touch -c $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 
 $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(GETTEXT_DIR) install
-	$(SED) 's,/lib/,$(STAGING_DIR)/lib/,g' $(STAGING_DIR)/lib/libgettextlib.la
-	$(SED) 's,/lib/,$(STAGING_DIR)/lib/,g' $(STAGING_DIR)/lib/libgettextpo.la
-	$(SED) 's,/lib/,$(STAGING_DIR)/lib/,g' $(STAGING_DIR)/lib/libgettextsrc.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgettextlib.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgettextpo.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libgettextsrc.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libintl.la
-	rm -f $(STAGING_DIR)/bin/autopoint $(STAGING_DIR)/bin/envsubst
-	rm -f $(STAGING_DIR)/bin/gettext.sh $(STAGING_DIR)/bin/gettextize
-	rm -f $(STAGING_DIR)/bin/msg* $(STAGING_DIR)/bin/?gettext
+	$(SED) 's,/lib/,$(STAGING_DIR)/usr/lib/,g' $(STAGING_DIR)/usr/lib/libgettextlib.la
+	$(SED) 's,/lib/,$(STAGING_DIR)/usr/lib/,g' $(STAGING_DIR)/usr/lib/libgettextpo.la
+	$(SED) 's,/lib/,$(STAGING_DIR)/usr/lib/,g' $(STAGING_DIR)/usr/lib/libgettextsrc.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgettextlib.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgettextpo.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgettextsrc.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libintl.la
+	rm -f $(STAGING_DIR)/usr/bin/autopoint $(STAGING_DIR)/usr/bin/envsubst \
+	 $(STAGING_DIR)/usr/bin/gettext.sh $(STAGING_DIR)/usr/bin/gettextize \
+	 $(STAGING_DIR)/usr/bin/msg* $(STAGING_DIR)/usr/bin/?gettext
 	touch -c $@
 
 gettext: uclibc pkgconfig $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
@@ -138,21 +130,21 @@
 #############################################################
 
 gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GETTEXT_DIR) install
-	chmod +x $(TARGET_DIR)/lib/libintl.so.3.4.3 # identify as needing to be stripped
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GETTEXT_DIR) install
+	chmod +x $(TARGET_DIR)/usr/lib/libintl.so* # identify as needing to be stripped
 	rm -rf  $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
 		$(TARGET_DIR)/usr/doc $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/include/libintl.h
 	-rmdir $(TARGET_DIR)/usr/include
 
-$(TARGET_DIR)/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -a $(STAGING_DIR)/lib/libgettext*.so* $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libintl*.so* $(TARGET_DIR)/lib/
-	rm -f $(TARGET_DIR)/lib/libgettext*.so*.la $(TARGET_DIR)/lib/libintl*.so*.la
-	touch $@
+$(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
+	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.so* \
+		$(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
+	rm -f $(TARGET_DIR)/usr/lib/libgettext*.so*.la $(TARGET_DIR)/usr/lib/libintl*.so*.la
+	touch -c $@
 
-libintl: $(TARGET_DIR)/lib/libintl.so
+libintl: $(TARGET_DIR)/usr/lib/libintl.so
 
 #############################################################
 #
