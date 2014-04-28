From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Apr 2014 21:00:32 +0200
Subject: [Buildroot] [PATCH 4/4] evemu: enable python3 bindings
In-Reply-To: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
References: <1398711632-5831-1-git-send-email-ps.report@gmx.net>
Message-ID: <1398711632-5831-5-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add evemu/python3 related patches:
- fix python/evemu/base.py for python3 (add patch from [1])
- fix python3 binding runtime failure

[1] http://ftp.de.debian.org/debian/pool/main/e/evemu/evemu_1.2.0-2.debian.tar.xz

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-fixes-the-syntax-for-raising-exceptions-.patch | 39 ++++++++++++++++++++++
 ...u-0008-python-fix-device-open-for-python3.patch | 35 +++++++++++++++++++
 package/evemu/evemu.mk                             |  7 ++--
 3 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 package/evemu/evemu-0007-Description-fixes-the-syntax-for-raising-exceptions-.patch
 create mode 100644 package/evemu/evemu-0008-python-fix-device-open-for-python3.patch

diff --git a/package/evemu/evemu-0007-Description-fixes-the-syntax-for-raising-exceptions-.patch b/package/evemu/evemu-0007-Description-fixes-the-syntax-for-raising-exceptions-.patch
new file mode 100644
index 0000000..ea9dfaf
--- /dev/null
+++ b/package/evemu/evemu-0007-Description-fixes-the-syntax-for-raising-exceptions-.patch
@@ -0,0 +1,39 @@
+From 1730ff58181b872a752b9f5428061b59874f063c Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 27 Apr 2014 00:18:40 +0200
+Subject: [PATCH 7/8] Description: fixes the syntax for raising exceptions to
+ be Python2 and Python3 acceptable.
+
+Author: Stephen M. Webb
+Bug-Debian: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=706155
+---
+ python/evemu/base.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/python/evemu/base.py b/python/evemu/base.py
+index 84e0306..f972182 100644
+--- a/python/evemu/base.py
++++ b/python/evemu/base.py
+@@ -19,15 +19,15 @@ class EvEmuBase(object):
+     def _call0(self, api_call, *parameters):
+         result = api_call(*parameters)
+         if result == 0 and self.get_c_errno() != 0:
+-            raise exception.ExecutionError, "%s: %s" % (
+-                api_call.__name__, self.get_c_error())
++            raise exception.ExecutionError("%s: %s" % (
++                api_call.__name__, self.get_c_error()))
+         return result
+ 
+     def _call(self, api_call, *parameters):
+         result = api_call(*parameters)
+         if result < 0 and self.get_c_errno() != 0:
+-            raise exception.ExecutionError, "%s: %s" % (
+-                api_call.__name__, self.get_c_error())
++            raise exception.ExecutionError("%s: %s" % (
++                api_call.__name__, self.get_c_error()))
+         return result
+ 
+     def get_c_errno(self):
+-- 
+1.8.1.4
+
diff --git a/package/evemu/evemu-0008-python-fix-device-open-for-python3.patch b/package/evemu/evemu-0008-python-fix-device-open-for-python3.patch
new file mode 100644
index 0000000..da5a73c
--- /dev/null
+++ b/package/evemu/evemu-0008-python-fix-device-open-for-python3.patch
@@ -0,0 +1,35 @@
+From 1ff2dc1f7603588e73090d27437c56dbd4b7e8e1 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 27 Apr 2014 01:16:16 +0200
+Subject: [PATCH 8/8] python: fix device open for python3
+
+- use 'rb' instead of 'r+b', fixes:
+
+>>> import evemu
+>>> evemu.Device('/dev/input/event0')
+Traceback (most recent call last):
+  File "<stdin>", line 1, in <module>
+  File "/usr/lib/python3.4/site-packages/evemu/__init__.py", line 50, in __init__
+io.UnsupportedOperation: File or stream is not seekable.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ python/evemu/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/evemu/__init__.py b/python/evemu/__init__.py
+index abdbf7e..aa73871 100644
+--- a/python/evemu/__init__.py
++++ b/python/evemu/__init__.py
+@@ -47,7 +47,7 @@ class Device(object):
+         """
+ 
+         if type(f).__name__ == 'str':
+-            self._file = open(f, 'r+b')
++            self._file = open(f, 'rb')
+         elif type(f).__name__ == 'file':
+             self._file = f
+         else:
+-- 
+1.8.1.4
+
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 44b8b89..0cf4c76 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -27,10 +27,9 @@ EVEMU_DEPENDENCIES = host-pkgconf libevdev
 # Needs Python for header file generation
 EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 
-# Check for target python (python3 binding disabled because
-# of build/byte-compile problems)
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-	EVEMU_DEPENDENCIES += python
+# Check for target python
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+	EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 else
 	EVEMU_CONF_OPT += --disable-python-binding
 endif
-- 
1.8.1.4
