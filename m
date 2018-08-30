From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 30 Aug 2018 21:21:23 +0200
Subject: [Buildroot] socket.AF_BLUETOOTH in python3 and circular dependencies
Message-ID: <e1bda375-e70b-94aa-5e90-c96a48217e87@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need support for socket.AF_BLUETOOTH in python3. Python3 is compiled 
with bluetooth support when bluez5_utils is installed on target, so I 
created a simple patch:

--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -256,6 +256,11 @@ endif
  # Provided to other packages
  PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/

+# Support for socket.AF_BLUETOOTH
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+    PYTHON3_DEPENDENCIES += bluez5_utils
+endif
+

But unfortunately this patch makes a circular dependencies:

$ make python3-graph-depends
Recursion detected for  : bluez5_utils
which is a dependency of: python3
which is a dependency of: util-linux
which is a dependency of: libglib2
which is a dependency of: bluez5_utils

To temporary solve this problem I must python support in util-linux package:

--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -203,9 +203,9 @@ HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
  endif

  # Install libmount Python bindings
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON),y)
  UTIL_LINUX_CONF_OPTS += --with-python
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+UTIL_LINUX_DEPENDENCIES += python
  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
  UTIL_LINUX_CONF_OPTS += --enable-pylibmount
  else


Can someone point me how to fix circular dependencies without disabling 
python support in util-linux?
