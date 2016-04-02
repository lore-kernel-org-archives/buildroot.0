From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 2 Apr 2016 20:47:33 +0200
Subject: [Buildroot] [PATCH] gutenprint: fix host build when libusb found
Message-ID: <20160402184733.GA8155@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to disable USB support, otherwise host build breaks when
libusb is found as installation tries to install to /usr.
Fixes following autobuild error:
http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .../0004-build-usb-backends-conditional.patch      | 23 ++++++++++++++++++++++
 package/gutenprint/gutenprint.mk                   |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 package/gutenprint/0004-build-usb-backends-conditional.patch

diff --git a/package/gutenprint/0004-build-usb-backends-conditional.patch b/package/gutenprint/0004-build-usb-backends-conditional.patch
new file mode 100644
index 0000000..db44a12
--- /dev/null
+++ b/package/gutenprint/0004-build-usb-backends-conditional.patch
@@ -0,0 +1,23 @@
+Allow to disable USB backend
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gutenprint-5.2.11.orig/configure.ac gutenprint-5.2.11/configure.ac
+--- gutenprint-5.2.11.orig/configure.ac	2016-01-14 04:02:49.000000000 +0100
++++ gutenprint-5.2.11/configure.ac	2016-04-02 20:07:54.649589473 +0200
+@@ -442,12 +442,15 @@
+ dnl   [EXTRA_LIBREADLINE_DEPS]=""
+ dnl fi
+ 
++AC_ARG_WITH([libusb], AS_HELP_STRING([--with-libusb], [Build with USB backend support]))
+ # libusb-1.0 (For CUPS backends)
++AS_IF([test "x$with_libusb" = "xyes"], [
+ PKG_CHECK_MODULES([LIBUSB], [libusb-1.0],
+                   [HAVE_LIBUSB=yes
+                    BUILD_LIBUSB_BACKENDS=yes],
+                   [HAVE_LIBUSB=no
+ 	           BUILD_LIBUSB_BACKENDS=no])
++])
+ 
+ AC_PATH_PROGS([GIMPTOOL2_CHECK], [gimptool-2.0 gimptool])
+ if test -z "${GIMPTOOL2_CHECK}" ; then
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 7e3024d..2a5fc95 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -67,6 +67,7 @@ HOST_GUTENPRINT_CONF_OPTS = \
 	--disable-escputil \
 	--disable-test \
 	--disable-testpattern \
+	--without-libusb \
 	--without-cups
 
 # Needed by autoreconf
-- 
2.1.4
