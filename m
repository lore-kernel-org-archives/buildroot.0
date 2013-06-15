From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jun 2013 22:14:18 +0200
Subject: [Buildroot] [git commit] New package: libqrencode
Message-ID: <20130615201636.D70899ADAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5eb71790ad69460df8496e808ff12ab505b5c89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move to libraries, fix Config.in, install into STAGING_DIR]
Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/libqrencode/Config.in      |   20 ++++++++++++++++++++
 package/libqrencode/libqrencode.mk |   21 +++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ce82e99..b23da75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ source "package/libglade/Config.in"
 source "package/gdk-pixbuf/Config.in"
 source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
+source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
 source "package/libsvgtiny/Config.in"
diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
new file mode 100644
index 0000000..e8fc1d4
--- /dev/null
+++ b/package/libqrencode/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBQRENCODE
+	bool "libqrencode"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  libqrencode is a C library for encoding data in a QR Code
+	  symbol, a kind of 2D symbology that can be scanned by handy
+	  terminals such as a mobile phone with CCD. The capacity of
+	  QR Code is up to 7000 digits or 4000 characters, and is
+	  highly robust.
+
+	  http://fukuchi.org/works/qrencode/index.html
+
+if BR2_PACKAGE_LIBQRENCODE
+
+config BR2_PACKAGE_LIBQRENCODE_TOOLS
+	bool "libqrencode tools"
+	help
+	  Build command-line tools
+
+endif #BR2_PACKAGE_LIBQRENCODE
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
new file mode 100644
index 0000000..e1f2362
--- /dev/null
+++ b/package/libqrencode/libqrencode.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# libqrencode
+#
+################################################################################
+
+LIBQRENCODE_VERSION = 3.4.2
+LIBQRENCODE_SOURCE = qrencode-$(LIBQRENCODE_VERSION).tar.gz
+LIBQRENCODE_SITE = http://fukuchi.org/works/qrencode
+LIBQRENCODE_DEPENDENCIES = libpng
+LIBQRENCODE_INSTALL_STAGING = YES
+LIBQRENCODE_LICENSE = LGPLv2.1+
+LIBQRENCODE_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
+        LIBQRENCODE_CONF_OPT += --with-tools=yes
+else
+        LIBQRENCODE_CONF_OPT += --with-tools=no
+endif
+
+$(eval $(autotools-package))
