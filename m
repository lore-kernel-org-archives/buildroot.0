From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 17 Jan 2008 04:42:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20080117124254.A35021200FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-01-17 04:42:53 -0800 (Thu, 17 Jan 2008)
New Revision: 20862

Log:
enhancements for the python package, patch by Hamish Moffatt

Modified:
   trunk/buildroot/package/python/Config.in
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/Config.in
===================================================================
--- trunk/buildroot/package/python/Config.in	2008-01-17 11:09:45 UTC (rev 20861)
+++ trunk/buildroot/package/python/Config.in	2008-01-17 12:42:53 UTC (rev 20862)
@@ -5,3 +5,96 @@
 	  The python language interpreter.
 
 	  http://www.python.org/
+
+choice
+	prompt "Module format to install"
+	depends on BR2_PACKAGE_PYTHON
+	default BR2_PACKAGE_PYTHON_PY_ONLY
+	help
+	  Select Python module format to install on target (py, pyc or both)
+
+config BR2_PACKAGE_PYTHON_PY_ONLY
+	bool ".py sources only"
+
+config BR2_PACKAGE_PYTHON_PYC_ONLY
+	bool ".pyc compiled sources only"
+
+config BR2_PACKAGE_PYTHON_PY_PYC
+	bool ".py sources and .pyc compiled"
+
+endchoice
+
+comment "The following modules are unusual or require extra libraries"
+	depends on BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_PYTHON_BSDDB
+	depends on BR2_PACKAGE_PYTHON
+	bool "bsddb module"
+	default n
+	help
+	  bsddb module for Python.
+
+config BR2_PACKAGE_PYTHON_CODECSCJK
+	depends on BR2_PACKAGE_PYTHON
+	bool "codecscjk module"
+	default y
+	help
+	  Chinese/Japanese/Korean codecs module for Python (large).
+
+config BR2_PACKAGE_PYTHON_CURSES
+	depends on BR2_PACKAGE_PYTHON
+	bool "curses module"
+	default n
+	help
+	  curses module for Python.
+
+config BR2_PACKAGE_PYTHON_GDBM
+	depends on BR2_PACKAGE_PYTHON
+	bool "gdbm module"
+	default n
+	help
+	  gdbm module for Python.
+
+config BR2_PACKAGE_PYTHON_NIS
+	depends on BR2_PACKAGE_PYTHON
+	bool "nis module"
+	default n
+	help
+	  nis module for Python.
+
+config BR2_PACKAGE_PYTHON_PYEXPAT
+	depends on BR2_PACKAGE_PYTHON
+	bool "pyexpat"
+	default n
+	help
+	  pyexpat module for Python.
+
+config BR2_PACKAGE_PYTHON_READLINE
+	depends on BR2_PACKAGE_PYTHON
+	bool "readline"
+	default n
+	help
+	  readline module for Python (required for command-line 
+	  editing in the Python shell).
+
+config BR2_PACKAGE_PYTHON_SSL
+	depends on BR2_PACKAGE_PYTHON
+	bool "ssl"
+	default n
+	help
+	  _ssl module for Python (required for https in urllib etc).
+
+config BR2_PACKAGE_PYTHON_TKINTER
+	depends on BR2_PACKAGE_PYTHON
+	bool "tkinter module"
+	default n
+	help
+	  tkinter module for Python.
+
+config BR2_PACKAGE_PYTHON_UNICODEDATA
+	depends on BR2_PACKAGE_PYTHON
+	bool "unicodedata module"
+	default y
+	help
+	  Unicode character database (used by stringprep module) (large).
+

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-01-17 11:09:45 UTC (rev 20861)
+++ trunk/buildroot/package/python/python.mk	2008-01-17 12:42:53 UTC (rev 20862)
@@ -10,11 +10,62 @@
 PYTHON_CAT:=$(BZCAT)
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
+PYTHON_DEPS:=
 
-# these could use checks for some BR2_PACKAGE_foo,y
-BR2_PYTHON_DISABLED_MODULES=readline pyexpat dbm gdbm bsddb \
-	_curses _curses_panel _tkinter nis zipfile
+BR2_PYTHON_DISABLED_MODULES=dbm zipfile
 
+ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
+PYTHON_DEPS += readline-target
+else
+BR2_PYTHON_DISABLED_MODULES += readline
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_CURSES),y)
+PYTHON_DEPS += ncurses
+else
+BR2_PYTHON_DISABLED_MODULES += _curses _curses_panel
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_PYEXPAT),y)
+PYTHON_DEPS += expat
+else
+BR2_PYTHON_DISABLED_MODULES += pyexpat
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_GDBM),y)
+PYTHON_DEPS += gdbm
+else
+BR2_PYTHON_DISABLED_MODULES += gdbm
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
+PYTHON_DEPS += berkeleydb
+else
+BR2_PYTHON_DISABLED_MODULES += bsddb
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
+PYTHON_DEPS += tcl
+else
+BR2_PYTHON_DISABLED_MODULES += _tkinter
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON_SSL),y)
+PYTHON_DEPS += openssl
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON_NIS),y)
+BR2_PYTHON_DISABLED_MODULES += nis
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON_CODECSCJK),y)
+BR2_PYTHON_DISABLED_MODULES += _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk
+endif
+
+ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
+BR2_PYTHON_DISABLED_MODULES += unicodedata
+endif
+
 $(DL_DIR)/$(PYTHON_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(PYTHON_SITE)/$(PYTHON_SOURCE)
 
@@ -59,7 +110,9 @@
 	touch $@
 
 $(PYTHON_DIR)/$(PYTHON_BINARY): $(PYTHON_DIR)/.configured
+ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 	export PYTHON_DISABLE_SSL=1
+endif
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) DESTDIR=$(TARGET_DIR) \
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
@@ -67,7 +120,9 @@
 		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
 
 $(TARGET_DIR)/$(PYTHON_TARGET_BINARY): $(PYTHON_DIR)/$(PYTHON_BINARY)
+ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
 	export PYTHON_DISABLE_SSL=1
+endif
 	LD_LIBRARY_PATH=$(STAGING_DIR)/lib
 	$(MAKE) CC=$(TARGET_CC) -C $(PYTHON_DIR) install \
 		DESTDIR=$(TARGET_DIR) CROSS_COMPILE=yes \
@@ -78,13 +133,18 @@
 	rm $(TARGET_DIR)/usr/bin/python?.? && \
 	rm $(TARGET_DIR)/usr/bin/idle && \
 	rm $(TARGET_DIR)/usr/bin/pydoc && \
-	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \; && \
 	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
 		$(TARGET_DIR)/usr/lib/python*/test
+ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
+	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
+endif
+ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
+endif
 
-python: uclibc $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
 
 python-clean:
 	-$(MAKE) -C $(PYTHON_DIR) distclean
