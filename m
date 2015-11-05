From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu,  5 Nov 2015 12:03:12 -0500
Subject: [Buildroot] [PATCH] libconfuse: bump to version 2.8
Message-ID: <1446742992-7041-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since libconfuse now has a proper release tar ball, this also adds a
hash, removes autogen, and removes a patch that is no longer needed.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/libconfuse/0001-fix-configure-ac.patch | 27 --------------------------
 package/libconfuse/libconfuse.hash             |  2 ++
 package/libconfuse/libconfuse.mk               |  9 +++------
 3 files changed, 5 insertions(+), 33 deletions(-)
 delete mode 100644 package/libconfuse/0001-fix-configure-ac.patch
 create mode 100644 package/libconfuse/libconfuse.hash

diff --git a/package/libconfuse/0001-fix-configure-ac.patch b/package/libconfuse/0001-fix-configure-ac.patch
deleted file mode 100644
index 6d61b48..0000000
--- a/package/libconfuse/0001-fix-configure-ac.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-configure: remove po/Makefile.in from AC_CONFIG_FILES
-
-Since we are gettextizing the package, gettextize updates configure.ac
-to add po/Makefile.in to AC_CONFIG_FILES>
-
-Unfortunately, it's already present, and gettextize does not detect it,
-and insists on adding its own. Later on, autoreconf barfs on the double
-occurences.
-
-As suggested by Arnout, just patch configure.ac to remove the
-po/Makefile.in occurence, so gettextize can safely add its own
-
-Reported-by: Arnout Vandecappelle <arnout@mind.be>
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
-
-diff -durN libconfuse-V2_7.orig/configure.ac libconfuse-V2_7/configure.ac
---- libconfuse-V2_7.orig/configure.ac	2010-02-20 10:14:10.000000000 +0100
-+++ libconfuse-V2_7/configure.ac	2014-07-17 00:19:18.816785340 +0200
-@@ -49,7 +49,6 @@
- AC_CONFIG_FILES([Makefile \
- 		 src/Makefile \
- 		 examples/Makefile \
--                 po/Makefile.in \
- 		 m4/Makefile \
- 		 tests/Makefile \
- 		 doc/Makefile \
diff --git a/package/libconfuse/libconfuse.hash b/package/libconfuse/libconfuse.hash
new file mode 100644
index 0000000..3e221d2
--- /dev/null
+++ b/package/libconfuse/libconfuse.hash
@@ -0,0 +1,2 @@
+# From https://github.com/martinh/libconfuse/releases/download/v2.8/confuse-2.8.tar.xz.md5
+md5  cb552c5737a72ef164733f0118971eb0  confuse-2.8.tar.xz
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index b3dcceb..1a01896 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,17 +4,14 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = 9413a82f9cb56a94f71fa420f146e841c5372ed8
-LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
+LIBCONFUSE_VERSION = 2.8
+LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
+LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
 
-# Fresh from the repository, no configure et al.
-LIBCONFUSE_AUTORECONF = YES
-LIBCONFUSE_GETTEXTIZE = YES
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.4
