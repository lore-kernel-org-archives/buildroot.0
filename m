From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Dec 2018 18:21:24 +0100
Subject: [Buildroot] [PATCH 1/1] ccid: fix build with pkgconf 1.5.3
Message-ID: <20181211172124.30082-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not add DESTDIR before usbdropdir to install pcsc drivers in
src/Makefile.am.

Indeed, usbdropdir is retrieved from libpcsc.pc and can be prefixed by
sysroot, so it can can be set for example to:
usbdropdir='/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/pcsc/drivers'

If DESTDIR is added before usbdropdir, files will be installed in a
wrong directory and build will fail

Fixes:
 - http://autobuild.buildroot.org/results/4d4c1ba7f5d00d1b927ac01ef9851468abfbdff2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...file.am-don-t-use-DESTDIR-with-usbdropdir.patch | 52 ++++++++++++++++++++++
 package/ccid/ccid.mk                               |  2 +
 2 files changed, 54 insertions(+)
 create mode 100644 package/ccid/0001-src-Makefile.am-don-t-use-DESTDIR-with-usbdropdir.patch

diff --git a/package/ccid/0001-src-Makefile.am-don-t-use-DESTDIR-with-usbdropdir.patch b/package/ccid/0001-src-Makefile.am-don-t-use-DESTDIR-with-usbdropdir.patch
new file mode 100644
index 0000000000..c47543fb2d
--- /dev/null
+++ b/package/ccid/0001-src-Makefile.am-don-t-use-DESTDIR-with-usbdropdir.patch
@@ -0,0 +1,52 @@
+From c4ac2f91c2d078ec0d31295ed81bd350e8e2d5bd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 10 Dec 2018 19:57:07 +0100
+Subject: [PATCH] src/Makefile.am: don't use DESTDIR with usbdropdir
+
+Do not add DESTDIR before usbdropdir to install pcsc drivers in
+src/Makefile.am.
+
+Indeed, usbdropdir is retrieved from libpcsc.pc and can be prefixed by
+sysroot, so it can can be set for example to:
+usbdropdir='/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-3/output/host/bin/../microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/pcsc/drivers'
+
+If DESTDIR is added before usbdropdir, files will be installed in a
+wrong directory and build will fail
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4d4c1ba7f5d00d1b927ac01ef9851468abfbdff2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 99f3567..d987b33 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -86,9 +86,9 @@ Info.plist: Info.plist.src $(srcdir)/../readers/supported_readers.txt
+ DISTCLEANFILES = tokenparser.c Info.plist
+ 
+ install_ccid: libccid.la Info.plist
+-	$(mkinstalldirs) "$(DESTDIR)$(usbdropdir)/$(CCID_BUNDLE)/Contents/$(BUNDLE_HOST)/"
+-	cp Info.plist "$(DESTDIR)$(usbdropdir)/$(CCID_BUNDLE)/Contents/"
+-	cp .libs/$(CCID_LIB) "$(DESTDIR)$(usbdropdir)/$(CCID_BUNDLE)/Contents/$(BUNDLE_HOST)/$(CCID_LIB)"
++	$(mkinstalldirs) "$(usbdropdir)/$(CCID_BUNDLE)/Contents/$(BUNDLE_HOST)/"
++	cp Info.plist "$(usbdropdir)/$(CCID_BUNDLE)/Contents/"
++	cp .libs/$(CCID_LIB) "$(usbdropdir)/$(CCID_BUNDLE)/Contents/$(BUNDLE_HOST)/$(CCID_LIB)"
+ 	$(INSTALL_UDEV_RULE_FILE)
+ 
+ install_ccidtwin: libccidtwin.la
+@@ -102,7 +102,7 @@ install_ccidtwin: libccidtwin.la
+ uninstall: $(LIBS_TO_UNINSTALL)
+ 
+ uninstall_ccid:
+-	rm -rf "$(DESTDIR)$(usbdropdir)/$(CCID_BUNDLE)"
++	rm -rf "$(usbdropdir)/$(CCID_BUNDLE)"
+ 
+ uninstall_ccidtwin:
+ 	rm -f "$(DESTDIR)$(ccidtwindir)/$(CCIDTWIN_LIB)"
+-- 
+2.14.1
+
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index c9b95a6234..7da62e5130 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -11,6 +11,8 @@ CCID_LICENSE = LGPL-2.1+
 CCID_LICENSE_FILES = COPYING
 CCID_INSTALL_STAGING = YES
 CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
+# We're patching src/Makefile.am
+CCID_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 define CCID_INSTALL_UDEV_RULES
-- 
2.14.1
