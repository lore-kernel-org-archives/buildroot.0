From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 23 Jan 2007 09:18:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20070123171856.5C87148585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-23 09:18:54 -0800 (Tue, 23 Jan 2007)
New Revision: 17489

Log:
- fix breakage that got introduced by a malformed context diff. Sorry..


Modified:
   trunk/buildroot/package/python/python-002-cross-compile.patch
   trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python-002-cross-compile.patch
===================================================================
--- trunk/buildroot/package/python/python-002-cross-compile.patch	2007-01-23 11:47:05 UTC (rev 17488)
+++ trunk/buildroot/package/python/python-002-cross-compile.patch	2007-01-23 17:18:54 UTC (rev 17489)
@@ -1,26 +1,18 @@
-diff -rduNp Python-2.4.2-001/setup.py Python-2.4.2/setup.py
---- Python-2.4.2-001/setup.py	2007-01-22 19:37:08.000000000 +0100
-+++ Python-2.4.2/setup.py	2007-01-22 19:41:47.000000000 +0100
-@@ -20,6 +20,14 @@ disabled_module_list = []
- def add_dir_to_list(dirlist, dir):
-     """Add the directory 'dir' to the list 'dirlist' (at the front) if
-     1) 'dir' is not already in 'dirlist'
-+	modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
-+except KeyError:
-+	modules_include_dirs = ['/usr/include']
-+try:
-+	modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
-+except KeyError:
-+	modules_lib_dirs = ['/usr/lib']
-+try:
-     2) 'dir' actually exists, and is a directory."""
-     if dir is not None and os.path.isdir(dir) and dir not in dirlist:
-         dirlist.insert(0, dir)
-@@ -239,7 +247,10 @@ class PyBuildExt(build_ext):
+--- Python-2.4.2-001/setup.py	2007-01-23 16:18:37.000000000 +0100
++++ Python-2.4.2/setup.py	2007-01-23 16:26:43.000000000 +0100
+@@ -239,7 +239,18 @@
          return sys.platform
  
      def detect_modules(self):
 -        # Ensure that /usr/local is always used
++        try:
++            modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
++        except KeyError:
++            modules_include_dirs = ['/usr/include']
++        try:
++            modules_lib_dirs = os.environ["PYTHON_MODULES_LIB"].split()
++        except KeyError:
++            modules_lib_dirs = ['/usr/lib']
 +        for dir in modules_include_dirs:
 +                add_dir_to_list(self.compiler.include_dirs, dir)
 +        for dir in modules_lib_dirs:
@@ -28,7 +20,7 @@
  
          # Add paths to popular package managers on OS X/darwin
          if sys.platform == "darwin":
-@@ -258,11 +269,8 @@ class PyBuildExt(build_ext):
+@@ -258,11 +269,8 @@
          # lib_dirs and inc_dirs are used to search for files;
          # if a file is found in one of those directories, it can
          # be assumed that no additional -I,-L directives are needed.

Modified: trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch
===================================================================
--- trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch	2007-01-23 11:47:05 UTC (rev 17488)
+++ trunk/buildroot/package/python/python-010-disable_modules_and_ssl.patch	2007-01-23 17:18:54 UTC (rev 17489)
@@ -22,9 +22,9 @@
  
      def detect_modules(self):
 +        global disable_ssl
-         for dir in modules_include_dirs:
-                 add_dir_to_list(self.compiler.include_dirs, dir)
-         for dir in modules_lib_dirs:
+         try:
+             modules_include_dirs = os.environ["PYTHON_MODULES_INCLUDE"].split()
+         except KeyError:
 @@ -468,7 +476,8 @@ class PyBuildExt(build_ext):
                                       ] )
  

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2007-01-23 11:47:05 UTC (rev 17488)
+++ trunk/buildroot/package/python/python.mk	2007-01-23 17:18:54 UTC (rev 17489)
@@ -11,6 +11,16 @@
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
 
+#ifndef BR2_SUPPORT_IPv6
+#PYTHON_DISABLE_IPv6=--disable-ipv6
+#else
+#PYTHON_DISABLE_IPv6=--enable-ipv6
+#endif
+
+# these could use checks for some BR2_PACKAGE_foo,y
+BR2_PYTHON_DISABLED_MODULES=readline pyexpat dbm gdbm bsddb \
+	_curses _curses_panel _tkinter nis zipfile
+
 $(DL_DIR)/$(PYTHON_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(PYTHON_SITE)/$(PYTHON_SOURCE)
 
@@ -18,29 +28,29 @@
 
 $(PYTHON_DIR)/.unpacked: $(DL_DIR)/$(PYTHON_SOURCE)
 	$(PYTHON_CAT) $(DL_DIR)/$(PYTHON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(PYTHON_DIR)/.unpacked
+	touch $@
 
 $(PYTHON_DIR)/.patched: $(PYTHON_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python\*.patch
-	touch $(PYTHON_DIR)/.patched
+	touch $@
 
 $(PYTHON_DIR)/.hostpython: $(PYTHON_DIR)/.patched
 	(cd $(PYTHON_DIR); rm -rf config.cache; \
-		OPT="-O1" \
+		CC="$(HOSTCC)" OPT="-O2" \
 		./configure \
 		--with-cxx=no \
-		$(DISABLE_NLS); \
-		$(MAKE) python Parser/pygen; \
-		mv python hostpython; \
-		mv Parser/pgen Parser/hostpgen; \
+		$(DISABLE_NLS) && \
+		$(MAKE) python Parser/pgen && \
+		mv python hostpython && \
+		mv Parser/pgen Parser/hostpgen && \
 		$(MAKE) distclean \
-	);
-	touch $(PYTHON_DIR)/.hostpython
+	) && \
+	touch $@
 
 $(PYTHON_DIR)/.configured: $(PYTHON_DIR)/.hostpython
 	(cd $(PYTHON_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
-		OPT="$(TARGET_OPTIMIZATION)" \
+		OPT="$(TARGET_CFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -48,16 +58,17 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		--with-cxx=no \
+		$(PYTHON_DISABLE_IPv6) \
 		$(DISABLE_NLS) \
 	);
-	touch $(PYTHON_DIR)/.configured
+	touch $@
 
 $(PYTHON_DIR)/$(PYTHON_BINARY): $(PYTHON_DIR)/.configured
 	export PYTHON_DISABLE_SSL=1
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
-		PYTHON_DISABLE_MODULES="readline pyexpat dbm gdbm bsddb _curses _curses_panel _tkinter" \
+		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
 
 $(TARGET_DIR)/$(PYTHON_TARGET_BINARY): $(PYTHON_DIR)/$(PYTHON_BINARY)
@@ -67,13 +78,13 @@
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
-		PYTHON_DISABLE_MODULES="readline pyexpat dbm gdbm bsddb _curses _curses_panel _tkinter" \
-		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
-	rm $(TARGET_DIR)/usr/bin/python?.?
-	rm $(TARGET_DIR)/usr/bin/idle
-	rm $(TARGET_DIR)/usr/bin/pydoc
-	-find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
-	-find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \;
+		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
+		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \
+	rm $(TARGET_DIR)/usr/bin/python?.? && \
+	rm $(TARGET_DIR)/usr/bin/idle && \
+	rm $(TARGET_DIR)/usr/bin/pydoc && \
+	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \; && \
+	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
 		$(TARGET_DIR)/usr/lib/python*/test
@@ -82,7 +93,7 @@
 
 python-clean:
 	-$(MAKE) -C $(PYTHON_DIR) distclean
-	rm $(PYTHON_DIR)/.configured
+	rm $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 
 python-dirclean:
 	rm -rf $(PYTHON_DIR)
