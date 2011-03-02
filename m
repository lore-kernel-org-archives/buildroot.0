From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Mar 2011 11:56:03 +0100
Subject: [Buildroot] [git commit master 1/1] xerces: bump version,
	convert to autotargets
Message-ID: <20110302105645.640178E0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0eafc69b0aadba53a3784365532be530e28d2757
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xerces/Config.in |    1 -
 package/xerces/xerces.mk |  125 +++++----------------------------------------
 2 files changed, 14 insertions(+), 112 deletions(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index b77794d..374729a 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
 	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 6e84e64..9a22499 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -3,116 +3,19 @@
 # xerces
 #
 #############################################################
-XERCES_VERSION:=3.0.1
-XERCES_SOURCE:=xerces-c-$(XERCES_VERSION).tar.gz
-XERCES_SITE:=http://archive.apache.org/dist/xerces/c/3/sources/
-XERCES_CAT:=$(ZCAT)
-XERCES_DIR:=$(BUILD_DIR)/xerces-c-$(XERCES_VERSION)
-LIBXERCES_BINARY:=libxerces-c-3.0.so
-
-# XERCES-C will install a number of applications
-# in $(STAGING_DIR)/usr/bin
-# We may want to copy these to the target
-
-XERCES_APPS:= \
-	CreateDOMDocument	\
-	DOMCount		\
-	DOMPrint		\
-	EnumVal			\
-	MemParse		\
-	PParse			\
-	PSVIWriter		\
-	Redirect		\
-	SAX2Count		\
-	SAX2Print		\
-	SAXCount		\
-	SAXPrint		\
-	SCMPrint		\
-	SEnumVal		\
-	StdInParse
-
-# XERCES-C installs a 4.2MB worth of "*.hpp" files
-# in the
-#	"dom", "framework", "internal", "parsers",
-#	"sax", "sax2", "util", "validators", "xinclude"
-# directories
-
-XERCES_INCLUDES:=/usr/include/xercesc
-
-ifneq ($(BR2_ENABLE_LOCALE),y)
-XERCES_MAKE_OPT=LIBS="-liconv"
+XERCES_VERSION = 3.1.1
+XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
+XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
+XERCES_MAKE = $(MAKE1)
+XERCES_INSTALL_STAGING = YES
+XERCES_CONF_OPT = --enable-shared \
+		  --disable-threads \
+		  --disable-network \
+		  --with-gnu-ld
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+XERCES_CONF_ENV += LIBS=-liconv
+XERCES_DEPENDENCIES += libiconv
 endif
 
-$(DL_DIR)/$(XERCES_SOURCE):
-	 $(call DOWNLOAD,$(XERCES_SITE),$(XERCES_SOURCE))
-
-xerces-source: $(DL_DIR)/$(XERCES_SOURCE)
-
-$(XERCES_DIR)/.unpacked: $(DL_DIR)/$(XERCES_SOURCE)
-	$(XERCES_CAT) $(DL_DIR)/$(XERCES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-# toolchain/patch-kernel.sh $(XERCES_DIR) package/xerces/ \*.patch*
-	touch $(XERCES_DIR)/.unpacked
-
-#	Support for the following should be added later
-#		--with-curl=
-#		--with-icu=
-#		--with-pkgconfigdir=
-
-$(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
-	(cd $(XERCES_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		./configure		\
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr		\
-		--libdir=/usr/lib	\
-		--libexecdir=/usr/lib	\
-		--sysconfdir=/etc	\
-		--localstatedir=/var	\
-		--enable-shared		\
-		--disable-threads	\
-		--disable-network	\
-		--with-gnu-ld		\
-	)
-	touch $@
-
-$(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY): $(XERCES_DIR)/.configured
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) $(XERCES_MAKE_OPT) -C $(XERCES_DIR)
-
-$(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY): $(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
-		-C $(XERCES_DIR) install
-	$(INSTALL) -c $(XERCES_DIR)/src/.libs/libxerces-c.lai	\
-		$(STAGING_DIR)/usr/lib/libxerces-c.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libxerces-c.la
-
-$(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY): $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)
-	cp -a $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
-
-xerces: $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
-
-xerces-bin: $(XERCES_DIR)/usr/lib/$(LIBXERCES_BINARY)
-
-xerces-tbin: $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)
-
-xerces-unpacked: $(XERCES_DIR)/.unpacked
-
-xerces-clean:
-	rm -rf $(STAGING_DIR)/usr/include/xercesc
-	rm -f $(STAGING_DIR)/lib/libxerces*
-	rm -f $(TARGET_DIR)/usr/lib/libxerces*
-	-$(MAKE) -C $(XERCES_DIR) clean
-
-xerces-dirclean:
-	rm -rf $(XERCES_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_XERCES),y)
-TARGETS+=xerces
-endif
+$(eval $(call AUTOTARGETS,package,xerces))
-- 
1.7.3.4
