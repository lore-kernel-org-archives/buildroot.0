From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 11:51:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20070116195104.830C64856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 11:51:03 -0800 (Tue, 16 Jan 2007)
New Revision: 17329

Log:
- prepare a host-freetype target that could be used to build the build-utils
  for fontconfig (note that CCexe isn't cached in configure, so just passing it to make later on is enough).


Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-01-16 19:48:46 UTC (rev 17328)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-01-16 19:51:03 UTC (rev 17329)
@@ -8,6 +8,8 @@
 FREETYPE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_CAT:=$(BZCAT)
 FREETYPE_DIR:=$(BUILD_DIR)/freetype-$(FREETYPE_VERSION)
+FREETYPE_DIR1:=$(TOOL_BUILD_DIR)/freetype-$(FREETYPE_VERSION)
+FREETYPE_HOST_DIR:=$(TOOL_BUILD_DIR)/freetype-$(FREETYPE_VERSION)-host
 
 $(DL_DIR)/$(FREETYPE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(FREETYPE_SITE)/$(FREETYPE_SOURCE)
@@ -18,11 +20,11 @@
 	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(FREETYPE_DIR)/.unpacked
 
+# freetype for the target
 $(FREETYPE_DIR)/.configured: $(FREETYPE_DIR)/.unpacked
 	(cd $(FREETYPE_DIR); \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
-	CCexe="$(HOSTCC)" \
 	./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -60,6 +62,31 @@
 	cp -dpf $(STAGING_DIR)/lib/libfreetype.so* $(TARGET_DIR)/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libfreetype.so
 
+# freetype for the host, needed for build-tools of fontconfig
+
+# great, it can't be built out of tree reliably
+$(FREETYPE_DIR1)/.unpacked: $(DL_DIR)/$(FREETYPE_SOURCE)
+	$(FREETYPE_CAT) $(DL_DIR)/$(FREETYPE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(FREETYPE_DIR1)/.unpacked
+
+$(FREETYPE_DIR1)/.configured: $(FREETYPE_DIR1)/.unpacked
+	(cd $(FREETYPE_DIR1); \
+	./configure \
+		CC="$(HOSTCC)" \
+		--prefix="$(FREETYPE_HOST_DIR)" \
+	);
+	touch $(FREETYPE_DIR1)/.configured
+
+$(FREETYPE_DIR1)/.compiled: $(FREETYPE_DIR1)/.configured
+	$(MAKE) CCexe="$(HOSTCC)" -C $(FREETYPE_DIR1)
+	touch $(FREETYPE_DIR1)/.compiled
+
+$(FREETYPE_HOST_DIR)/lib/libfreetype.so: $(FREETYPE_DIR1)/.configured
+	$(MAKE) -C $(FREETYPE_DIR1) install
+	touch -c $@
+
+host-freetype: $(FREETYPE_HOST_DIR)/lib/libfreetype.so
+
 freetype: uclibc pkgconfig $(TARGET_DIR)/lib/libfreetype.so
 
 freetype-clean:
