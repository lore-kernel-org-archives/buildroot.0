From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 15 Jan 2009 06:28:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20090115062806.91B6E76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-15 06:28:05 +0000 (Thu, 15 Jan 2009)
New Revision: 24852

Log:
Always create shared python library, if python is created, needed by multiple packages

Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2009-01-14 23:54:02 UTC (rev 24851)
+++ trunk/buildroot/package/python/python.mk	2009-01-15 06:28:05 UTC (rev 24852)
@@ -106,6 +106,7 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		--with-cxx=no \
+		--enable-shared \
 		$(DISABLE_IPV6) \
 		$(DISABLE_NLS) \
 	)
@@ -166,8 +167,18 @@
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/lib-tk
 endif
 
-python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+		cp -dpr $(PYTHON_DIR)/libpython*.so.* $(STAGING_DIR)/usr/lib
+		(\
+		cd $(STAGING_DIR)/usr/lib ; \
+		rm -f libpython$(PYTHON_VERSION_MAJOR).so ; \
+		ln -s `basename  \`ls libpython*.so.*\`` libpython$(PYTHON_VERSION_MAJOR).so \
+		)
 
+libpython:	$(STAGING_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR).so
+
+python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY) libpython
+
 python-clean:
 	-$(MAKE) -C $(PYTHON_DIR) distclean
 	rm -f $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
