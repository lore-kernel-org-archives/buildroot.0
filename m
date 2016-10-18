From: Johan Derycke <johanderycke@gmail.com>
Date: Tue, 18 Oct 2016 12:30:31 +0000
Subject: [Buildroot] [buildroot][PATCH 1/1] Fix: qt5webkit overwrites target
	python.
In-Reply-To: <CAKHhJn3pztmCS+bHrcMMnwXOm=qdRoBZMDQFLQazGBhWLtJFHg@mail.gmail.com>
References: <CAKHhJn3pztmCS+bHrcMMnwXOm=qdRoBZMDQFLQazGBhWLtJFHg@mail.gmail.com>
Message-ID: <CAKHhJn2_0viKJtaPk52rues5GBCN7pC=6AcpxgvZ0njmUNt7Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes issue with
https://git.buildroot.net/buildroot/commit/?id=ac16793eaaabfced0312420759e3a66cdaa1ea8e

We make a link in $(@D)/bin/python:

define QT5WEBKIT_PYTHON2_SYMLINK
  echo  $(@D)
  mkdir -p $(@D)/bin
  ln -sf $(HOST_DIR)/usr/bin/python2 $(@D)/bin/python
endef

But QT5WEBKIT_INSTALL_TARGET_CMDS copies $(@D)/bin/python to the target dir:

define QT5WEBKIT_INSTALL_TARGET_CMDS
  cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
  cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
  $(QT5WEBKIT_INSTALL_TARGET_QMLS)
endef

This overwrites the target python link with a bogus one.
The bin folder only contains 'jsc' which is now optional.


Signed-off-by: Johan Derycke <johan.derycke@barco.com>
---
 package/qt5/qt5webkit/Config.in    | 13 +++++++++++++
 package/qt5/qt5webkit/qt5webkit.mk |  8 +++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/Config.in
b/package/qt5/qt5webkit/Config.in
index 48aaf94..240a75e 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -22,6 +22,19 @@ config BR2_PACKAGE_QT5WEBKIT

   http://qt.io

+if BR2_PACKAGE_QT5WEBKIT
+
+config BR2_PACKAGE_QT5WEBKIT_JSC
+ bool "qt5webkit jsc"
+ depends on BR2_PACKAGE_QT5WEBKIT
+ help
+  Install jsc. jsc is a command-line utility that allows you to run
+  JavaScript programs outside of the context of a web browser.
+
+  https://trac.webkit.org/wiki/JSC
+
+endif
+
 comment "qt5webkit needs a toolchain w/ dynamic library"
  depends on BR2_STATIC_LIBS
  depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/
qt5webkit.mk
index a47a235..600a660 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -69,9 +69,15 @@ define QT5WEBKIT_INSTALL_TARGET_QMLS
 endef
 endif

+ifeq ($(BR2_PACKAGE_QT5WEBKIT_JSC),y)
+define QT5WEBKIT_INSTALL_TARGET_JSC
+ cp -dpf $(@D)/bin/jsc $(TARGET_DIR)/usr/bin/
+endef
+endif
+
 define QT5WEBKIT_INSTALL_TARGET_CMDS
  cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
- cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
+ $(QT5WEBKIT_INSTALL_TARGET_JSC)
  $(QT5WEBKIT_INSTALL_TARGET_QMLS)
 endef

--
2.4.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161018/530ff614/attachment.html>
