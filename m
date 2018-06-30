From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 16:21:25 +0200
Subject: [Buildroot] [PATCH 3/5 v2] package/xorriso: fix to use the system
 xattr header
In-Reply-To: <cover.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <6c7d039a9b5c4bcd728e3061be1bab895bd29ad5.1530368468.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't carry a git-formatted patch, because upstream is in fact a
collection of git trees, while the release tarball is an aggregate
of those repositories. Thus, the layout is different between the
tarball and the SCM...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Steve Kenton <skenton@ou.edu>
---
 package/xorriso/0001-use-sys-xattr.h.patch | 33 ++++++++++++++++++++++++++++++
 package/xorriso/xorriso.mk                 | 13 ++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 package/xorriso/0001-use-sys-xattr.h.patch

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
index 1f095911f8..af4e1bdace 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -8,6 +8,19 @@ XORRISO_VERSION = 1.4.6
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPL-3.0+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
+
+# 0001-use-sys-xattr.h.patch
+XORRISO_DEPENDENCIES = host-pkgconf
+XORRISO_AUTORECONF = YES
+HOST_XORRISO_AUTORECONF = YES
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
-- 
2.14.1
