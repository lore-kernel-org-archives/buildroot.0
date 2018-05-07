From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 May 2018 20:25:20 +0200
Subject: [Buildroot] [PATCH 5/5] package/attr: bump version
In-Reply-To: <cover.1525717511.git.yann.morin.1998@free.fr>
References: <cover.1525717511.git.yann.morin.1998@free.fr>
Message-ID: <6e7e5621022a8e788dc3cc8e04f123959e6de050.1525717511.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current version of attr uses a canned custom buildsystem, that
is borked in quite a few ways (no support for static, overwrites
destination files without unlinking...)

There has been a release recently-ish, with a complete overhaul of
the buildsystem. We can now drop all our patches.

There is a new tag in the git tree, but there is no release tarball.
So, we need to autoreconf. Also, there is a hard dependency on gettext,
so we need to gettextize as well... :-/

Fixes: #10986

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../attr/0001-support-static-installation.patch    | 29 ---------------
 .../0002-avoid-glibc-specific-decls-defines.patch  | 37 -------------------
 package/attr/0003-portability-fixes.patch          | 37 -------------------
 package/attr/attr.hash                             |  2 +-
 package/attr/attr.mk                               | 43 ++++++----------------
 5 files changed, 13 insertions(+), 135 deletions(-)
 delete mode 100644 package/attr/0001-support-static-installation.patch
 delete mode 100644 package/attr/0002-avoid-glibc-specific-decls-defines.patch
 delete mode 100644 package/attr/0003-portability-fixes.patch

diff --git a/package/attr/0001-support-static-installation.patch b/package/attr/0001-support-static-installation.patch
deleted file mode 100644
index 87858ac75e..0000000000
--- a/package/attr/0001-support-static-installation.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Support installation of .a file when doing static linking
-
-When doing static linking (i.e ENABLE_SHARED != yes), the attr build
-logic wasn't installing any library at all, not even the .a file which
-is needed for static linking. This patch fixes that.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/include/buildmacros
-===================================================================
---- a/include/buildmacros
-+++ b/include/buildmacros
-@@ -97,7 +97,15 @@
- 
- INSTALL_LTLIB_STATIC = \
- 	cd $(TOPDIR)/$(LIBNAME)/.libs; \
--	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR);
-+	../$(INSTALL) -m 755 -d $(PKG_DEVLIB_DIR); \
-+	../$(INSTALL) -m 644 -T old_lib $(LIBNAME).la $(PKG_DEVLIB_DIR); \
-+	../$(INSTALL) -m 644 $(LIBNAME).la $(PKG_DEVLIB_DIR)/$(LIBNAME).la ; \
-+	../$(INSTALL) -m 755 -d $(PKG_LIB_DIR); \
-+	../$(INSTALL) -T so_base $(LIBNAME).la $(PKG_LIB_DIR); \
-+	if test "x$(PKG_DEVLIB_DIR)" != "x$(PKG_LIB_DIR)" ; then \
-+	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).a $(PKG_LIB_DIR)/$(LIBNAME).a; \
-+	../$(INSTALL) -S $(PKG_DEVLIB_DIR)/$(LIBNAME).la $(PKG_LIB_DIR)/$(LIBNAME).la; \
-+	fi
- 
- INSTALL_MAN = \
- 	@for d in $(MAN_PAGES); do \
diff --git a/package/attr/0002-avoid-glibc-specific-decls-defines.patch b/package/attr/0002-avoid-glibc-specific-decls-defines.patch
deleted file mode 100644
index 8c71678cf4..0000000000
--- a/package/attr/0002-avoid-glibc-specific-decls-defines.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 667137acaffb8d0cc62b47821a67a52ba0637d5c Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Fri, 10 Jan 2014 13:56:37 +0000
-Subject: avoid glibc-specific DECLS defines
-
-This matches what we do in all the other headers.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-diff --git a/include/xattr.h b/include/xattr.h
-index 70a84be..070d7c5 100644
---- a/include/xattr.h
-+++ b/include/xattr.h
-@@ -30,8 +30,9 @@
- #define XATTR_CREATE  0x1       /* set value, fail if attr already exists */
- #define XATTR_REPLACE 0x2       /* set value, fail if attr does not exist */
- 
--
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- extern int setxattr (const char *__path, const char *__name,
- 		      const void *__value, size_t __size, int __flags) __THROW;
-@@ -58,6 +59,8 @@ extern int removexattr (const char *__path, const char *__name) __THROW;
- extern int lremovexattr (const char *__path, const char *__name) __THROW;
- extern int fremovexattr (int __filedes,   const char *__name) __THROW;
- 
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif	/* __XATTR_H__ */
---
-cgit v0.9.0.2
diff --git a/package/attr/0003-portability-fixes.patch b/package/attr/0003-portability-fixes.patch
deleted file mode 100644
index c5dc8c865b..0000000000
--- a/package/attr/0003-portability-fixes.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 92247401984dd9a80d9d0c8c030692323f980678 Mon Sep 17 00:00:00 2001
-From: Emmanuel Dreyfus <manu@netbsd.org>
-Date: Mon, 30 Jun 2014 13:06:05 +0000
-Subject: Portability fixes
-
-- <features.h>  is Linux specific
-- Define __THROW for non glibc based systems
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-(limited to 'include/xattr.h')
-
-diff --git a/include/xattr.h b/include/xattr.h
-index 070d7c5..fd1f268 100644
---- a/include/xattr.h
-+++ b/include/xattr.h
-@@ -20,7 +20,18 @@
- #ifndef __XATTR_H__
- #define __XATTR_H__
- 
-+#if defined(linux)
- #include <features.h>
-+#endif
-+
-+/* Portability non glibc c++ build systems */
-+#ifndef __THROW
-+# if defined __cplusplus
-+#  define __THROW       throw ()
-+# else
-+#  define __THROW
-+# endif
-+#endif
- 
- #include <errno.h>
- #ifndef ENOATTR
---
-cgit v0.9.0.2
diff --git a/package/attr/attr.hash b/package/attr/attr.hash
index d2d1c2ed50..b0b23374e9 100644
--- a/package/attr/attr.hash
+++ b/package/attr/attr.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859	attr-2.4.47.src.tar.gz
+sha256  2a1a3795c6c344597683ddfd62e81fdeebd74204f6b4bcd41cb541b4d08c381f  attr-v2.4.48.tar.gz
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 8d250608b7..77adda9c9b 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -4,43 +4,24 @@
 #
 ################################################################################
 
-ATTR_VERSION = 2.4.47
-ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
-ATTR_SITE = http://download.savannah.gnu.org/releases/attr
-ATTR_INSTALL_STAGING = YES
-ATTR_CONF_OPTS = --enable-gettext=no
-HOST_ATTR_CONF_OPTS = --enable-gettext=no
+ATTR_VERSION = v2.4.48
+ATTR_SITE = https://git.savannah.nongnu.org/git/attr.git
+ATTR_SITE_METHOD = git
 ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
-# While the configuration system uses autoconf, the Makefiles are
-# hand-written and do not use automake. Therefore, we have to hack
-# around their deficiencies by passing installation paths.
-ATTR_INSTALL_STAGING_OPTS = \
-	prefix=$(STAGING_DIR)/usr \
-	exec_prefix=$(STAGING_DIR)/usr \
-	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
-	install-dev install-lib
+ATTR_INSTALL_STAGING = YES
 
-ATTR_INSTALL_TARGET_OPTS = \
-	prefix=$(TARGET_DIR)/usr \
-	exec_prefix=$(TARGET_DIR)/usr \
-	install install-lib
+# Straight out of the git tree
+ATTR_AUTORECONF = YES
+ATTR_GETTEXTIZE = YES
 
-HOST_ATTR_INSTALL_OPTS = \
-	prefix=$(HOST_DIR) \
-	exec_prefix=$(HOST_DIR) \
-	install-dev install-lib
-
-# The libdir variable in libattr.la is empty, so let's fix it. This is
-# probably due to attr not using automake, and not doing fully the
-# right thing with libtool.
-define ATTR_FIX_LIBTOOL_LA_LIBDIR
-	$(SED) "s,libdir=.*,libdir='$(STAGING_DIR)'," \
-		$(STAGING_DIR)/usr/lib/libattr.la
+define ATTR_GETTEXT
+	cd $(@D) && ./po/update-potfiles
+	cd $(@D) && $(HOST_DIR)/bin/autopoint --force
 endef
-
-ATTR_POST_INSTALL_STAGING_HOOKS += ATTR_FIX_LIBTOOL_LA_LIBDIR
+ATTR_PRE_CONFIGURE_HOOKS += ATTR_GETTEXT
+HOST_ATTR_PRE_CONFIGURE_HOOKS += ATTR_GETTEXT
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
