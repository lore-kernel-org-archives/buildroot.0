From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:27:07 +0200
Subject: [Buildroot] [git commit] package/lirc-tools: bump version to 0.9.4
Message-ID: <20160626203108.8B09B81785@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cc126f1bb71810ff634fb9740f144d15efd2dd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: update comment in the .mk file about autoreconf.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-build-commandir-unless-we-have-usb.h-191.patch | 54 ++++++++++++++++++++++
 package/lirc-tools/lirc-tools.hash                 |  5 +-
 package/lirc-tools/lirc-tools.mk                   |  3 +-
 3 files changed, 59 insertions(+), 3 deletions(-)

diff --git a/package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch b/package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
new file mode 100644
index 0000000..a3f2f3b
--- /dev/null
+++ b/package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
@@ -0,0 +1,54 @@
+From f346045e0f63289909322a3264e69b967a911636 Mon Sep 17 00:00:00 2001
+From: Alec Leamas <leamas.alec@gmail.com>
+Date: Tue, 24 May 2016 19:56:09 +0200
+Subject: [PATCH] Don't build commandir unless we have usb.h (#191).
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(backported from git master:
+ https://sourceforge.net/p/lirc/git/ci/f346045e0f63289909322a3264e69b967a911636/tree/plugins/Makefile.am?diff=4b26eb383291576b3f56820c6cec5f6a75814807)
+---
+ plugins/Makefile.am | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/plugins/Makefile.am b/plugins/Makefile.am
+index 3bd89ed..2116658 100644
+--- a/plugins/Makefile.am
++++ b/plugins/Makefile.am
+@@ -14,6 +14,7 @@ EXTRA_DIST                  = pluginlist.am make-pluginlist.sh
+ plugin_LTLIBRARIES          =
+ 
+ if BUILD_USB
++
+ plugin_LTLIBRARIES          += atilibusb.la
+ atilibusb_la_SOURCES        = atilibusb.c
+ atilibusb_la_LDFLAGS        = $(AM_LDFLAGS) @usb_libs@
+@@ -33,6 +34,14 @@ plugin_LTLIBRARIES          += srm7500libusb.la
+ srm7500libusb_la_SOURCES    = srm7500libusb.c
+ srm7500libusb_la_LDFLAGS    = $(AM_LDFLAGS) @usb_libs@
+ srm7500libusb_la_CFLAGS     = $(AM_CFLAGS) $(LIBUSB_CFLAGS)
++
++if !BSD
++plugin_LTLIBRARIES          += commandir.la
++commandir_la_SOURCES        = commandir.c
++commandir_la_LDFLAGS        = $(AM_LDFLAGS) @usb_libs@
++commandir_la_CFLAGS         = $(AM_CFLAGS) $(LIBUSB_CFLAGS)
++endif
++
+ endif
+ 
+ if BUILD_FTDI
+@@ -99,11 +108,6 @@ if !BSD
+ plugin_LTLIBRARIES          += default.la
+ default_la_SOURCES          = default.c
+ 
+-plugin_LTLIBRARIES          += commandir.la
+-commandir_la_SOURCES        = commandir.c
+-commandir_la_LDFLAGS        = $(AM_LDFLAGS) @usb_libs@
+-commandir_la_CFLAGS         = $(AM_CFLAGS) $(LIBUSB_CFLAGS)
+-
+ plugin_LTLIBRARIES          += hiddev.la
+ hiddev_la_SOURCES           = hiddev.c
+ 
+-- 
+2.8.1
+
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index 1acd93d..afbca6e 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,2 +1,3 @@
-#hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.3a/
-sha1 a6cadb916e09de068c967055b48c96d79d38f736 lirc-0.9.3a.tar.bz2
+# hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.4/
+sha1 79d2300b4864ed85d6468d554ac777f39b6740ac lirc-0.9.4.tar.bz2
+md5 da6aca942154256bff696d1ffa3ef646 lirc-0.9.4.tar.bz2
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 289b9ed..d7f2353 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.9.3a
+LIRC_TOOLS_VERSION = 0.9.4
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
@@ -12,6 +12,7 @@ LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
 # 0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
+# 0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
 LIRC_TOOLS_AUTORECONF = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
