From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 27 Jul 2007 00:48:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/imagemagick
Message-ID: <20070727074856.AD1A0A4944@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-27 00:48:56 -0700 (Fri, 27 Jul 2007)
New Revision: 19270

Log:
Ensure each target is copied, run libtool --finish

Modified:
   trunk/buildroot/package/imagemagick/imagemagick.mk


Changeset:
Modified: trunk/buildroot/package/imagemagick/imagemagick.mk
===================================================================
--- trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-27 07:38:48 UTC (rev 19269)
+++ trunk/buildroot/package/imagemagick/imagemagick.mk	2007-07-27 07:48:56 UTC (rev 19270)
@@ -8,9 +8,21 @@
 IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
 IMAGEMAGICK_CAT:=$(BZCAT)
-IMAGEMAGICK_BINARY:=convert
-IMAGEMAGICK_TARGET_BINARY:=usr/bin/$(IMAGEMAGICK_BINARY)
+#IMAGEMAGICK_BINARY:=convert
+#IMAGEMAGICK_TARGET_BINARY:=usr/bin/$(IMAGEMAGICK_BINARY)
+IMAGEMAGICK_LIB:=$(TARGET_DIR)/usr/lib/libMagick.so
 
+IMAGEMAGICK_TARGET_BINARIES:=$(TARGET_DIR)/usr/bin/animate
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/compare
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/composite
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/conjure
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/display
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/import
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/mogrify
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/montage
+IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/convert
+
+IMAGEMAGICK_COPY:=cp -df --preserve=mode,ownership
 $(DL_DIR)/$(IMAGEMAGICK_SOURCE):
 	$(WGET) -P $(DL_DIR) $(IMAGEMAGICK_SITE)/$(IMAGEMAGICK_SOURCE)
 
@@ -55,38 +67,70 @@
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(IMAGEMAGICK_DIR) install
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libMagick.so: $(STAGING_DIR)/usr/lib/libMagick.a
-	cp -dpf $(STAGING_DIR)/usr/lib/libMagick.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libMagick.so*
-	cp -dpf $(STAGING_DIR)/usr/lib/libWand.so* $(TARGET_DIR)/usr/lib/
+$(IMAGEMAGICK_LIB): $(STAGING_DIR)/usr/lib/libMagick.a
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libWand.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libWand.so*
+	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
+	$(IMAGEMAGICK_COPY) -r $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION) $(TARGET_DIR)/usr/lib
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libMagick.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(IMAGEMAGICK_LIB)*
 	touch -c $@
 
-$(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY): $(TARGET_DIR)/usr/lib/libMagick.so
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
+$(IMAGEMAGICK_DIR)/.libinstall:	$(IMAGEMAGICK_LIB)
+	libtool	--finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/coders
+	libtool	--finish $(TARGET_DIR)/usr/lib/ImageMagick-6.3.5/modules-Q16/filters
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/animate: $(IMAGEMAGICK_LIB)
+	ls -l $(IMAGEMAGICK_LIB) >> datefile
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/animate
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-compare $(TARGET_DIR)/usr/bin/compare
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/compare: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-compare $(TARGET_DIR)/usr/bin/compare
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/compare
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-composite $(TARGET_DIR)/usr/bin/composite
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/composite: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-composite $(TARGET_DIR)/usr/bin/composite
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/composite
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-conjure $(TARGET_DIR)/usr/bin/conjure
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/conjure: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-conjure $(TARGET_DIR)/usr/bin/conjure
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/conjure
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-convert $(TARGET_DIR)/usr/bin/convert
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/convert
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-display $(TARGET_DIR)/usr/bin/display
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/display: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-display $(TARGET_DIR)/usr/bin/display
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/display
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-import $(TARGET_DIR)/usr/bin/import
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/import: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-import $(TARGET_DIR)/usr/bin/import
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/import
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-mogrify $(TARGET_DIR)/usr/bin/mogrify
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/mogrify: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-mogrify $(TARGET_DIR)/usr/bin/mogrify
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/mogrify
-	cp -dpf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-montage $(TARGET_DIR)/usr/bin/montage
+	touch	$@
+
+$(TARGET_DIR)/usr/bin/montage: $(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-montage $(TARGET_DIR)/usr/bin/montage
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/montage
-	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION)
-	cp -dpfr $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_VERSION) $(TARGET_DIR)/usr/lib
-	touch -c $@
+	touch	$@
 
-imagemagick: uclibc jpeg tiff $(TARGET_DIR)/usr/lib/libMagick.so $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
+$(TARGET_DIR)/usr/bin/convert:	$(IMAGEMAGICK_LIB)
+	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-convert $(TARGET_DIR)/usr/bin/convert
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/convert
+	touch	$@
 
+imagemagick: uclibc jpeg tiff $(IMAGEMAGICK_LIB) \
+		$(IMAGEMAGICK_DIR)/.libinstall	\
+		$(IMAGEMAGICK_TARGET_BINARIES)
+
 imagemagick-clean:
 	rm -f $(TARGET_DIR)/$(IMAGEMAGICK_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/usr/bin/animate
