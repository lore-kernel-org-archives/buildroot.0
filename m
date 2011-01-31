From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Jan 2011 20:23:42 +0100
Subject: [Buildroot] [git commit master 1/1] package: add libhid
Message-ID: <20110131192513.7B8B18E5F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=343eb8b58389ef2335e79238a088c543f1c602ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Johan Sagaert, but with some additional tweaks.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/libhid/Config.in                           |    8 ++++++
 .../libhid/libhid-0.2.16-fix-configure-typo.patch  |   24 ++++++++++++++++++++
 package/libhid/libhid.mk                           |   17 ++++++++++++++
 4 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/libhid/Config.in
 create mode 100644 package/libhid/libhid-0.2.16-fix-configure-typo.patch
 create mode 100644 package/libhid/libhid.mk

diff --git a/package/Config.in b/package/Config.in
index 8154907..16a9e8f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -292,6 +292,7 @@ menu "Hardware handling"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
+source "package/libhid/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/python-serial/Config.in"
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
new file mode 100644
index 0000000..73ff4b7
--- /dev/null
+++ b/package/libhid/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBHID
+	bool "libhid"
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
+	help
+	  Userspace library for accessing USB HID devices
+
+	  http://libhid.alioth.debian.org
diff --git a/package/libhid/libhid-0.2.16-fix-configure-typo.patch b/package/libhid/libhid-0.2.16-fix-configure-typo.patch
new file mode 100644
index 0000000..870ecf2
--- /dev/null
+++ b/package/libhid/libhid-0.2.16-fix-configure-typo.patch
@@ -0,0 +1,24 @@
+[PATCH] fix typo in configure
+
+Somehow a newline character has gotten inserted in the middle of the
+LDFLAGS assignment, breaking the build.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+Index: libhid-0.2.16/configure
+===================================================================
+--- libhid-0.2.16.orig/configure
++++ libhid-0.2.16/configure
+@@ -23050,8 +23050,7 @@ echo "$as_me: doxygen disabled by config
+     CPPFLAGS=$(echo  $CPPFLAGS)
+     CFLAGS=$(echo $OS_CFLAGS $LIBUSB_CFLAGS $CFLAGS)
+     CXXFLAGS=$(echo  $CXXFLAGS)
+-    LDFLAGS=$(echo $OS_LDFLAGS $LIBUSB_LIBS
+- $LDFLAGS)
++    LDFLAGS=$(echo $OS_LDFLAGS $LIBUSB_LIBS $LDFLAGS)
+ 
+ 
+ 
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
new file mode 100644
index 0000000..ec6e5bb
--- /dev/null
+++ b/package/libhid/libhid.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libhid
+#
+#############################################################
+
+LIBHID_VERSION = 0.2.16
+LIBHID_SOURCE = libhid-$(LIBHID_VERSION).tar.gz
+LIBHID_SITE = http://alioth.debian.org/frs/download.php/1958
+LIBHID_DEPENDENCIES = libusb-compat libusb
+LIBHID_INSTALL_STAGING = YES
+# configure runs libusb-config for cflags/ldflags. Ensure it picks up
+# the target version
+LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
+LIBHID_CONF_OPT = --disable-swig --without-doxygen --disable-package-config
+
+$(eval $(call AUTOTARGETS,package,libhid))
-- 
1.7.3.4
