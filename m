From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 17 Jan 2009 00:19:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	multimedia/alsa-lib python
Message-ID: <20090117001907.6679477587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-17 00:19:06 +0000 (Sat, 17 Jan 2009)
New Revision: 24893

Log:
Make alsa-lib depend on libpython, if new BR2_PACKAGE_ALSA_LIB_PYTHON is selected

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/Config.in
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/Config.in	2009-01-16 22:45:31 UTC (rev 24892)
+++ trunk/buildroot/package/multimedia/alsa-lib/Config.in	2009-01-17 00:19:06 UTC (rev 24893)
@@ -5,3 +5,14 @@
 	  functionality to the Linux operating system.
 
 	  http://www.alsa-project.org/
+
+config BR2_PACKAGE_ALSA_LIB_PYTHON
+	bool "Python support for alsa-lib"
+	depends on BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_PYTHON
+	help
+	  Add python support for alsa-lib.
+	  Python will be built and libpython will be installed
+	  in the target directory
+	  http://www.alsa-project.org/
+

Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-16 22:45:31 UTC (rev 24892)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-17 00:19:06 UTC (rev 24893)
@@ -17,8 +17,9 @@
 ALSA_LIB_ABI:=
 endif
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONFIGURE_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+ALSA_LIB_DEPS = libpython
 else
 ALSA_LIB_CONFIGURE_OPTS += --disable-python
 endif
@@ -74,7 +75,7 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/alsa-lib/smixer/*.so
 	touch -c $@
 
-alsa-lib: uclibc $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
+alsa-lib: uclibc $(ALSA_LIB_DEPS) $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
 
 alsa-lib-source: $(DL_DIR)/$(ALSA-LIB_SOURCE)
 

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2009-01-16 22:45:31 UTC (rev 24892)
+++ trunk/buildroot/package/python/python.mk	2009-01-17 00:19:06 UTC (rev 24893)
@@ -167,25 +167,41 @@
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/lib-tk
 endif
 
-$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
-		cp -dpr $(PYTHON_DIR)/libpython*.so.* $(STAGING_DIR)/usr/lib
-		(\
-		cd $(STAGING_DIR)/usr/lib ; \
-		rm -f libpython$(PYTHON_VERSION_MAJOR).so ; \
-		ln -s `basename  \`ls libpython*.so.*\`` libpython$(PYTHON_VERSION_MAJOR).so \
-		)
+python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 
-libpython:	$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so
-
-python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY) libpython
-
 python-clean:
 	-$(MAKE) -C $(PYTHON_DIR) distclean
 	rm -f $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 	-rm -rf $(TARGET_DIR)/usr/lib/python* $(TARGET_DIR)/usr/include/python*
+	-rm -f $(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so
 
 python-dirclean:
 	rm -rf $(PYTHON_DIR)
+
+####  LIBPYTHON
+
+
+LIBPYTHON_BINARY:=libpython$(PYTHON_VERSION_MAJOR).so
+
+libpython:	python $(TARGET_DIR)/usr/lib/$(LIBPYTHON_BINARY)
+
+
+$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+		cp -dpr $(PYTHON_DIR)/$(LIBPYTHON_BINARY).* $(STAGING_DIR)/usr/lib
+		(\
+		cd $(STAGING_DIR)/usr/lib ; \
+		rm -f $(LIBPYTHON_BINARY) ; \
+		ln -s `basename  \`ls libpython*.so.*\`` $(LIBPYTHON_BINARY) \
+		)
+
+$(TARGET_DIR)/usr/lib/$(LIBPYTHON_BINARY): $(STAGING_DIR)/usr/lib/$(LIBPYTHON_BINARY)
+		cp -dpr $(STAGING_DIR)/usr/lib/$(LIBPYTHON_BINARY).* $(TARGET_DIR)/usr/lib
+		(\
+		cd $(TARGET_DIR)/usr/lib ; \
+		rm -f $(LIBPYTHON_BINARY) ; \
+		ln -s `basename  \`ls libpython*.so.*\`` $(LIBPYTHON_BINARY) \
+		)
+
 #############################################################
 #
 # Toplevel Makefile options
