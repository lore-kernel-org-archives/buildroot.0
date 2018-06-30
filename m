From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 22:00:21 +0200
Subject: [Buildroot] [git commit] package/xorriso: fix to use the system
 xattr header
Message-ID: <20180630200135.3EDC3835D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=798d1ec30936cc31e784d40af126f509e69d7b0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't carry a git-formatted patch, because upstream is in fact a
collection of git trees, while the release tarball is an aggregate
of those repositories. Thus, the layout is different between the
tarball and the SCM...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Steve Kenton <skenton@ou.edu>
[Thomas:
 - add host-pkgconf as a dependency of host-xorriso, since it's needed
   for autoreconf to work
 - drop HOST_XORRISO_AUTORECONF = YES, since it's implied by
   XORRISO_AUTORECONF = YES.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xorriso/0001-use-sys-xattr.h.patch | 33 ++++++++++++++++++++++++++++++
 package/xorriso/xorriso.mk                 | 13 ++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/package/xorriso/0001-use-sys-xattr.h.patch b/package/xorriso/0001-use-sys-xattr.h.patch
new file mode 100644
index 0000000000..5ae1aae72e
--- /dev/null
+++ b/package/xorriso/0001-use-sys-xattr.h.patch
@@ -0,0 +1,33 @@
+Use system <sys/xattr.h>
+
+The one from attr is no longer installed with latest version.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status: alternate, more complex patch pending...
+
+diff -durN xorriso-1.4.6.orig/configure.ac xorriso-1.4.6/configure.ac
+--- xorriso-1.4.6.orig/configure.ac	2016-09-16 15:51:33.000000000 +0200
++++ xorriso-1.4.6/configure.ac	2018-05-06 23:45:38.377153069 +0200
+@@ -264,7 +264,7 @@
+ dnl Check whether there is the header for Linux xattr.
+ dnl If not, erase this macro which would enable use of listxattr and others
+         XATTR_DEF="-DLibisofs_with_aaip_xattR"
+-        AC_CHECK_HEADER(attr/xattr.h, AC_CHECK_LIB(c, listxattr, X= ,
++        AC_CHECK_HEADER(sys/xattr.h, AC_CHECK_LIB(c, listxattr, X= ,
+                                                    XATTR_DEF= ), XATTR_DEF= )
+     fi
+ elif test x"$LIBBURNIA_SUPP_FATTR" = xextattr
+diff -durN xorriso-1.4.6.orig/libisofs/aaip-os-linux.c xorriso-1.4.6/libisofs/aaip-os-linux.c
+--- xorriso-1.4.6.orig/libisofs/aaip-os-linux.c	2016-09-16 15:51:34.000000000 +0200
++++ xorriso-1.4.6/libisofs/aaip-os-linux.c	2018-05-06 23:47:25.764941583 +0200
+@@ -30,7 +30,7 @@
+ #endif
+ 
+ #ifdef Libisofs_with_aaip_xattR
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
+ #endif
+ 
+ 
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 1f095911f8..de431c3ab6 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -8,6 +8,19 @@ XORRISO_VERSION = 1.4.6
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
+
+# 0001-use-sys-xattr.h.patch
+XORRISO_DEPENDENCIES = host-pkgconf
+HOST_XORRISO_DEPENDENCIES = host-pkgconf
+XORRISO_AUTORECONF = YES
+
+# Make autoreconf happy
+define XORRISO_NEWS
+	touch $(@D)/NEWS
+endef
+XORRISO_POST_PATCH_HOOKS += XORRISO_NEWS
+HOST_XORRISO_POST_PATCH_HOOKS += XORRISO_NEWS
+
 # Disable everything until we actually need those features, and add the correct
 # host libraries
 HOST_XORRISO_CONF_OPTS = \
