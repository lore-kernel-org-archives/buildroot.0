From: Phil Eichinger <phil@zankapfel.net>
Date: Fri, 14 Jun 2013 10:06:37 +0200
Subject: [Buildroot] [PATCH 1/1] New package: libqrencode
Message-ID: <1371197197-16323-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 package/Config.in                  |    1 +
 package/libqrencode/Config.in      |   20 ++++++++++++++++++++
 package/libqrencode/libqrencode.mk |   20 ++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/libqrencode/Config.in
 create mode 100644 package/libqrencode/libqrencode.mk

diff --git a/package/Config.in b/package/Config.in
index ce82e99..3f4cbca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,6 +138,7 @@ source "package/sdl_sound/Config.in"
 source "package/sdl_net/Config.in"
 source "package/sdl_ttf/Config.in"
 source "package/sdl_gfx/Config.in"
+source "package/libqrencode/Config.in"
 
 comment "other GUIs"
 source "package/efl/Config.in"
diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
new file mode 100644
index 0000000..285dba0
--- /dev/null
+++ b/package/libqrencode/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBQRENCODE
+        bool "libqrencode"
+        select BR2_PACKAGE_LIBPNG
+        help
+          libqrencode is a C library for encoding data in a QR Code 
+          symbol, a kind of 2D symbology that can be scanned by handy 
+          terminals such as a mobile phone with CCD. The capacity of 
+          QR Code is up to 7000 digits or 4000 characters, and is 
+          highly robust.
+
+          http://fukuchi.org/works/qrencode/index.html
+
+if BR2_PACKAGE_LIBQRENCODE
+
+config BR2_PACKAGE_LIBQRENCODE_TOOLS
+        bool "Command-line tools"
+        help
+          Build command-line tools
+
+endif #BR2_PACKAGE_LIBQRENCODE
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
new file mode 100644
index 0000000..121fd86
--- /dev/null
+++ b/package/libqrencode/libqrencode.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# libqrencode
+#
+#############################################################
+
+LIBQRENCODE_VERSION = 3.4.2
+LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
+LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
+LIBQRENCODE_DEPENDENCIES = libpng
+LIBQRENCODE_LICENSE = GPLv2+
+LIBQRENCODE_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
+        LIBQRENCODE_CONF_OPT += --with-tools=yes
+else
+        LIBQRENCODE_CONF_OPT += --with-tools=no
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
