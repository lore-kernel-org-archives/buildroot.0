From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Oct 2016 23:06:52 +0300
Subject: [Buildroot] [PATCH] lirc-tools: bump to version 0.9.4b
Message-ID: <8f574ce24ce7b5734f2768037205593bbaec58f3.1476821212.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches. Renumber the rest.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
This patch depends on http://patchwork.ozlabs.org/patch/683840/.
---
 ...per-linking-method-to-avoid-parallel-buil.patch | 46 ------------------
 ...make_rel_symlink.py-can-also-use-python2.patch} |  0
 ...nfigure-check-for-clock_gettime-in-librt.patch} |  0
 ...-build-commandir-unless-we-have-usb.h-191.patch | 54 ----------------------
 ...-use-of-functions-killed-in-kernel-4.8.0.patch} |  0
 package/lirc-tools/lirc-tools.hash                 |  6 +--
 package/lirc-tools/lirc-tools.mk                   |  6 +--
 7 files changed, 5 insertions(+), 107 deletions(-)
 delete mode 100644 package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
 rename package/lirc-tools/{0002-tools-make_rel_symlink.py-can-also-use-python2.patch => 0001-tools-make_rel_symlink.py-can-also-use-python2.patch} (100%)
 rename package/lirc-tools/{0004-configure-check-for-clock_gettime-in-librt.patch => 0002-configure-check-for-clock_gettime-in-librt.patch} (100%)
 delete mode 100644 package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
 rename package/lirc-tools/{0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch => 0003-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch} (100%)

diff --git a/package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch b/package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
deleted file mode 100644
index 58631285518b..000000000000
--- a/package/lirc-tools/0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f2fc8c48e5e55a91b309225f377b6cb3783fc6f6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 25 May 2016 15:21:57 +0200
-Subject: [PATCH] lib: use proper linking method to avoid parallel build issue
-
-Using <foo>_LDFLAGS = -l<library> is correct when <library> is an
-external library. However, when it is built by the same package, and
-especially in the same directory, this is wrong and can cause parallel
-build issues. In lib/Makefile.am, there was:
-
-libirrecord_la_LDFLAGS      = -llirc
-
-But the liblirc library is built in the same directory. Or, due to the
-using of <foo>_LDFLAGS, make is not aware of the build dependency
-between libirrecord and liblirc.
-
-To solve this, <foo>_LIBADD should be used instead, as follows:
-
-libirrecord_la_LIBADD       = liblirc.la
-
-This fixes parallel build issues seen by automated build tests
-conducted by the Buildroot project, such as:
-
-  http://autobuild.buildroot.org/results/eb4/eb47d57de8182d25b1dacbf0ac3726ed20063d04/build-end.log
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- lib/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index ce5c94c..8780f88 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -29,7 +29,7 @@ liblirc_la_SOURCES          = config_file.c \
-                               transmit.c \
-                               util.c
- 
--libirrecord_la_LDFLAGS      = -llirc
-+libirrecord_la_LIBADD       = liblirc.la
- libirrecord_la_SOURCES      = irrecord.c
- 
- liblirc_client_la_LDFLAGS   = -version-info 4:0:4
--- 
-2.7.4
-
diff --git a/package/lirc-tools/0002-tools-make_rel_symlink.py-can-also-use-python2.patch b/package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch
similarity index 100%
rename from package/lirc-tools/0002-tools-make_rel_symlink.py-can-also-use-python2.patch
rename to package/lirc-tools/0001-tools-make_rel_symlink.py-can-also-use-python2.patch
diff --git a/package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch b/package/lirc-tools/0002-configure-check-for-clock_gettime-in-librt.patch
similarity index 100%
rename from package/lirc-tools/0004-configure-check-for-clock_gettime-in-librt.patch
rename to package/lirc-tools/0002-configure-check-for-clock_gettime-in-librt.patch
diff --git a/package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch b/package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
deleted file mode 100644
index a3f2f3ba86d5..000000000000
--- a/package/lirc-tools/0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f346045e0f63289909322a3264e69b967a911636 Mon Sep 17 00:00:00 2001
-From: Alec Leamas <leamas.alec@gmail.com>
-Date: Tue, 24 May 2016 19:56:09 +0200
-Subject: [PATCH] Don't build commandir unless we have usb.h (#191).
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(backported from git master:
- https://sourceforge.net/p/lirc/git/ci/f346045e0f63289909322a3264e69b967a911636/tree/plugins/Makefile.am?diff=4b26eb383291576b3f56820c6cec5f6a75814807)
----
- plugins/Makefile.am | 14 +++++++++-----
- 1 file changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index 3bd89ed..2116658 100644
---- a/plugins/Makefile.am
-+++ b/plugins/Makefile.am
-@@ -14,6 +14,7 @@ EXTRA_DIST                  = pluginlist.am make-pluginlist.sh
- plugin_LTLIBRARIES          =
- 
- if BUILD_USB
-+
- plugin_LTLIBRARIES          += atilibusb.la
- atilibusb_la_SOURCES        = atilibusb.c
- atilibusb_la_LDFLAGS        = $(AM_LDFLAGS) @usb_libs@
-@@ -33,6 +34,14 @@ plugin_LTLIBRARIES          += srm7500libusb.la
- srm7500libusb_la_SOURCES    = srm7500libusb.c
- srm7500libusb_la_LDFLAGS    = $(AM_LDFLAGS) @usb_libs@
- srm7500libusb_la_CFLAGS     = $(AM_CFLAGS) $(LIBUSB_CFLAGS)
-+
-+if !BSD
-+plugin_LTLIBRARIES          += commandir.la
-+commandir_la_SOURCES        = commandir.c
-+commandir_la_LDFLAGS        = $(AM_LDFLAGS) @usb_libs@
-+commandir_la_CFLAGS         = $(AM_CFLAGS) $(LIBUSB_CFLAGS)
-+endif
-+
- endif
- 
- if BUILD_FTDI
-@@ -99,11 +108,6 @@ if !BSD
- plugin_LTLIBRARIES          += default.la
- default_la_SOURCES          = default.c
- 
--plugin_LTLIBRARIES          += commandir.la
--commandir_la_SOURCES        = commandir.c
--commandir_la_LDFLAGS        = $(AM_LDFLAGS) @usb_libs@
--commandir_la_CFLAGS         = $(AM_CFLAGS) $(LIBUSB_CFLAGS)
--
- plugin_LTLIBRARIES          += hiddev.la
- hiddev_la_SOURCES           = hiddev.c
- 
--- 
-2.8.1
-
diff --git a/package/lirc-tools/0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch b/package/lirc-tools/0003-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
similarity index 100%
rename from package/lirc-tools/0005-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
rename to package/lirc-tools/0003-lircd-Remove-use-of-functions-killed-in-kernel-4.8.0.patch
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index afbca6e19d36..239c7664d358 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -1,3 +1,3 @@
-# hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.4/
-sha1 79d2300b4864ed85d6468d554ac777f39b6740ac lirc-0.9.4.tar.bz2
-md5 da6aca942154256bff696d1ffa3ef646 lirc-0.9.4.tar.bz2
+# hash from http://sourceforge.net/projects/lirc/files/LIRC/0.9.4b/
+sha1 7cb2867de1b486708781413aa33568e0612fb912 lirc-0.9.4b.tar.bz2
+md5 9e3f2869a47bbd7c973dd63f30c13fc2 lirc-0.9.4b.tar.bz2
diff --git a/package/lirc-tools/lirc-tools.mk b/package/lirc-tools/lirc-tools.mk
index 547df46e6437..bd0f96f337a9 100644
--- a/package/lirc-tools/lirc-tools.mk
+++ b/package/lirc-tools/lirc-tools.mk
@@ -4,16 +4,14 @@
 #
 ################################################################################
 
-LIRC_TOOLS_VERSION = 0.9.4
+LIRC_TOOLS_VERSION = 0.9.4b
 LIRC_TOOLS_SOURCE = lirc-$(LIRC_TOOLS_VERSION).tar.bz2
 LIRC_TOOLS_SITE = http://downloads.sourceforge.net/project/lirc/LIRC/$(LIRC_TOOLS_VERSION)
 LIRC_TOOLS_LICENSE = GPLv2+
 LIRC_TOOLS_LICENSE_FILES = COPYING
 LIRC_TOOLS_DEPENDENCIES = host-libxslt host-pkgconf host-python3
 LIRC_TOOLS_INSTALL_STAGING = YES
-# 0001-lib-use-proper-linking-method-to-avoid-parallel-buil.patch
-# 0003-Don-t-build-commandir-unless-we-have-usb.h-191.patch
-# 0004-configure-check-for-clock_gettime-in-librt.patch
+# 0002-configure-check-for-clock_gettime-in-librt.patch
 LIRC_TOOLS_AUTORECONF = YES
 
 LIRC_TOOLS_CONF_ENV = XSLTPROC=yes
-- 
2.9.3
