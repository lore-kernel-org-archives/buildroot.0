From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 00:05:47 +0100
Subject: [Buildroot] [git commit] package/hplip: remove includedir hack
Message-ID: <20160121230642.20DC9800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffca78cbcdab370a3916be51db3ca54ea03fba24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0001-fix-make.patch which was added to the hplip package to remove
hardcoded paths to the libusb header introduced a solution that isn't
correct. When cross-compiling, $(includedir) is ${prefix}/include (i.e
/usr/include), so it is not the location where headers can be
found. Due to this, hplip.mk was overriding the includedir value with
--includedir which is not correct.

To replace this mechanism, this commit changes the patch to instead
use pkg-config (which is already used in other places in hplip
configure.in) to detect libusb. This way, we can get rid of the hack
and get a proper detection of libusb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1-build-use-pkg-config-to-discover-libusb.patch | 45 ++++++++++++++++++++++
 package/hplip/0001-fix-make.patch                  | 35 -----------------
 package/hplip/hplip.mk                             |  6 +--
 3 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch b/package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch
new file mode 100644
index 0000000..59b89a4
--- /dev/null
+++ b/package/hplip/0001-build-use-pkg-config-to-discover-libusb.patch
@@ -0,0 +1,45 @@
+From 1eed2b65eff4c66b80eab0ec46c6705de19bdb9d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 21 Jan 2016 23:54:03 +0100
+Subject: [PATCH] build: use pkg-config to discover libusb
+
+This allows to remove hardcoded paths to libusb headers.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.am  | 4 ++--
+ configure.in | 3 +--
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 73fed2e..3a4e899 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -92,8 +92,8 @@ libhpmud_la_SOURCES += io/hpmud/musb_libusb01.c
+ libhpmud_la_LDFLAGS += -lusb
+ else
+ libhpmud_la_SOURCES += io/hpmud/musb.c 
+-libhpmud_la_CFLAGS  += -I/usr/include/libusb-1.0
+-libhpmud_la_LDFLAGS += -lusb-1.0
++libhpmud_la_CFLAGS  += $(LIBUSB_CFLAGS)
++libhpmud_la_LDFLAGS += $(LIBUSB_LIBS)
+ endif
+ 
+ if NETWORK_BUILD
+diff --git a/configure.in b/configure.in
+index 3706645..8b06428 100755
+--- a/configure.in
++++ b/configure.in
+@@ -542,8 +542,7 @@ if test "$hpijs_only_build" = "no" && test "$hpcups_only_build" = "no"; then
+       AC_CHECK_LIB([usb], [usb_init], [LIBS="$LIBS"], [AC_MSG_ERROR([cannot find libusb support], 2)])
+       AC_CHECK_HEADERS(usb.h, ,[AC_MSG_ERROR([cannot find libusb-devel support], 11)])
+    else
+-      AC_CHECK_LIB([usb-1.0], [libusb_init], [LIBS="$LIBS"], [AC_MSG_ERROR([cannot find libusb 1.0 support], 2)])
+-      AC_CHECK_HEADERS(libusb-1.0/libusb.h, ,[AC_MSG_ERROR([cannot find libusb-1.0-devel support], 11)])
++      PKG_CHECK_MODULES([LIBUSB], [libusb-1.0])
+    fi
+ fi
+ 
+-- 
+2.6.4
+
diff --git a/package/hplip/0001-fix-make.patch b/package/hplip/0001-fix-make.patch
deleted file mode 100644
index 9105d6f..0000000
--- a/package/hplip/0001-fix-make.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c1822a19e75bae8e044cd46a257a234cd9649896 Mon Sep 17 00:00:00 2001
-From: Olivier Schonken <olivier.schonken@gmail.com>
-Date: Wed, 20 Jan 2016 23:46:50 +0200
-Subject: [PATCH] Changed Makefile.am to allow cross-compilation of HPLIP
-
-Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
----
- Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 73fed2e..23aa0ec 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -92,7 +92,7 @@ libhpmud_la_SOURCES += io/hpmud/musb_libusb01.c
- libhpmud_la_LDFLAGS += -lusb
- else
- libhpmud_la_SOURCES += io/hpmud/musb.c 
--libhpmud_la_CFLAGS  += -I/usr/include/libusb-1.0
-+libhpmud_la_CFLAGS  += -I$(includedir)/libusb-1.0
- libhpmud_la_LDFLAGS += -lusb-1.0
- endif
- 
-@@ -314,7 +314,7 @@ hpmudext_la_LIBADD = libhpmud.la libhpdiscovery.la
- hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR) -Iprotocol/discovery
- 
- if !LIBUSB01_BUILD
--hpmudext_la_CFLAGS +=-I/usr/include/libusb-1.0 
-+hpmudext_la_CFLAGS +=-I$(includedir)/libusb-1.0 
- endif
- 
- # ui (qt3)
--- 
-2.5.0
-
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index aea1f0c..62cf9c0 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -7,7 +7,7 @@
 HPLIP_VERSION = 3.15.11
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
-HPLIP_DEPENDENCIES = cups libusb jpeg
+HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
 HPLIP_LICENSE = GPLv2 BSD-3c MIT
 HPLIP_LICENSE_FILES = COPYING
 
@@ -25,9 +25,7 @@ HPLIP_CONF_OPTS = \
 	--disable-foomatic-drv-install \
 	--disable-foomatic-rip-hplip-install \
 	--enable-new-hpcups \
-	--enable-lite-build \
-	--with-sysroot=$(STAGING_DIR) \
-	--includedir=$(STAGING_DIR)/usr/include
+	--enable-lite-build
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 HPLIP_CONF_OPTS += --enable-dbus-build
