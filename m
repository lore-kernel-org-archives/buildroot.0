From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Mar 2008 16:01:23 +0100
Subject: [Buildroot] Add giflib package
In-Reply-To: <33858.69.65.92.49.1205197164.squirrel@webmail.learningsoft.net>
	(Sunil Gupta's message of "Mon\,
	10 Mar 2008 20\:59\:24 -0400 \(EDT\)")
References: <33858.69.65.92.49.1205197164.squirrel@webmail.learningsoft.net>
Message-ID: <87skyu7jng.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sunil" == Sunil Gupta <sg@monsoon.com> writes:

Did you manually edit the patch? It was slightly corrupted (missing
newline at end)

Is this a replacement for libungif? Should we remove libungif?

Index: package/Config.in
===================================================================
--- package/Config.in	(revision 21284)
+++ package/Config.in	(working copy)
@@ -308,6 +308,7 @@
 comment "graphic libraries"
 source "package/directfb/Config.in"
 source "package/fusion/Config.in"
+source "package/giflib/Config.in"
 source "package/imagemagick/Config.in"
 source "package/jpeg/Config.in"
 source "package/libpng/Config.in"
Index: package/giflib/giflib.mk
===================================================================
--- package/giflib/giflib.mk	(revision 0)
+++ package/giflib/giflib.mk	(revision 0)
@@ -0,0 +1,60 @@
+#############################################################
+#
+# giflib
+#
+#############################################################
+GIFLIB_VERSION:=4.1.6
+GIFLIB_SOURCE:=giflib-$(GIFLIB_VERSION).tar.gz
+GIFLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/giflib
+GIFLIB_DIR:=$(BUILD_DIR)/giflib-$(GIFLIB_VERSION)
+GIFLIB_BINARY:=lib/.libs/libgif.so
+GIFLIB_TARGET_BINARY:=usr/lib/libgif.so
+GIFLIB_INSTALL_DIR:=$(STAGING_DIR)
+
+$(DL_DIR)/$(GIFLIB_SOURCE):
+	$(WGET) -P $(DL_DIR) $(GIFLIB_SITE)/$(GIFLIB_SOURCE)
+
+$(GIFLIB_DIR)/.source: $(DL_DIR)/$(GIFLIB_SOURCE)
+	zcat $(DL_DIR)/$(GIFLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(GIFLIB_DIR)/.source

please use touch $@ instead.

+
+$(GIFLIB_DIR)/.configured: $(GIFLIB_DIR)/.source
+	(cd $(GIFLIB_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--prefix=$(GIFLIB_INSTALL_DIR) \
+		--disable-static \
+		--without-x \
+	);
+	touch $(GIFLIB_DIR)/.configured;

please use touch $@ instead.
+
+$(GIFLIB_DIR)/$(GIFLIB_BINARY): $(GIFLIB_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(GIFLIB_DIR)
+
+$(TARGET_DIR)/$(GIFLIB_TARGET_BINARY): $(GIFLIB_DIR)/$(GIFLIB_BINARY)
+	$(MAKE) prefix=$(GIFLIB_INSTALL_DIR) -C $(GIFLIB_DIR) install
+	$(MAKE) prefix=$(GIFLIB_INSTALL_DIR) libdir=$(TARGET_DIR)/usr/lib -C $(GIFLIB_DIR) install

I think it would be clearer to split these two. With the above it
isn't clear that it does a full install into the staging dir and only
the libs into target.

+	rm -f $(TARGET_DIR)/usr/lib/libgif.la

There recently were some discussion about that - But lets leave it for
now ..

+
+giflib: uclibc $(TARGET_DIR)/$(GIFLIB_TARGET_BINARY)
+
+giflib-source: $(DL_DIR)/$(GIFLIB_SOURCE)
+
+giflib-clean:
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(GIFLIB_DIR) uninstall

This fails if giflib hasn't been unpacked yet.

+	-$(MAKE) -C $(GIFLIB_DIR) clean
+
+giflib-dirclean:
+	rm -rf $(GIFLIB_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_GIFLIB)),y)
+TARGETS+=giflib
+endif
Index: package/giflib/Config.in
===================================================================
--- package/giflib/Config.in	(revision 0)
+++ package/giflib/Config.in	(revision 0)
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GIFLIB
+	bool "giflib"
+	default n
+	help
+	  The giflib package contains libraries for reading
+	  and writing GIFs.
+
+	  http://sourceforge.net/projects/giflib
+
+config BR2_PACKAGE_GIFLIB_PROGRAMS

This isn't handled in the make file?

+	bool "giflib programs"
+	default n
+	depends on BR2_PACKAGE_GIFLIB
+	help
+	  The giflib programs are useful for conversion
+	  purposes as well as cleaning up images.
+
 Sunil> _______________________________________________
 Sunil> buildroot mailing list
 Sunil> buildroot at uclibc.org
 Sunil> http://busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
