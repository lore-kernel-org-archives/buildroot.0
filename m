From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 21:55:48 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.1.5
Message-ID: <20121228213150.E50759A4DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8293a376574c439041de48e6571a4b82f7d2c3b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add comment when tools not available]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/Config.in                           |   12 ++++-
 ...001-gets-no-longer-exists-in-e-glibc-2.16.patch |   56 --------------------
 package/gnutls/gnutls.mk                           |   26 +++++++---
 3 files changed, 30 insertions(+), 64 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index cedf120..2739088 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,8 +1,18 @@
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
-	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_NETTLE
 	help
 	  GnuTLS is a secure communications library implementing the SSL
 	  and TLS protocols and technologies around them.
 
 	  http://www.gnu.org/software/gnutls/gnutls.html
+
+config BR2_PACKAGE_GNUTLS_TOOLS
+	bool "install tools"
+	depends on BR2_PACKAGE_GNUTLS
+	depends on BR2_USE_WCHAR
+	help
+	  Install GnuTLS command line tools for various cryptographic tasks.
+
+comment "gnutls tools requires a toolchain with WCHAR support"
+	depends on BR2_PACKAGE_GNUTLS && !BR2_USE_WCHAR
diff --git a/package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch b/package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch
deleted file mode 100644
index 802e7ac..0000000
--- a/package/gnutls/gnutls-0001-gets-no-longer-exists-in-e-glibc-2.16.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 855f72c4fe7f4bbf2137ab60357ae3b27bb65185 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 17 Nov 2012 17:45:41 +0100
-Subject: [PATCH] gets() no longer exists in (e)glibc >= 2.16
-
-gnutls has already updated gnulib upstream in more recent versions
-(3.x) but apparently not in the 2.x branch that we are using.
-
-This patch comes from OpenEmbedded, and has originally been written by
-Khem Raj <raj.khem@gmail.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- gl/stdio.in.h     |    2 ++
- lib/gl/stdio.in.h |    2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/gl/stdio.in.h b/gl/stdio.in.h
-index 9dc7c4a..8cb19d7 100644
---- a/gl/stdio.in.h
-+++ b/gl/stdio.in.h
-@@ -710,11 +710,13 @@ _GL_CXXALIAS_RPL (gets, char *, (char *s));
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
-diff --git a/lib/gl/stdio.in.h b/lib/gl/stdio.in.h
-index 03bea2a..cb6483b 100644
---- a/lib/gl/stdio.in.h
-+++ b/lib/gl/stdio.in.h
-@@ -710,11 +710,13 @@ _GL_CXXALIAS_RPL (gets, char *, (char *s));
- _GL_CXXALIAS_SYS (gets, char *, (char *s));
- #  undef gets
- # endif
-+# if defined gets
- _GL_CXXALIASWARN (gets);
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+# endif
- #endif
- 
- 
--- 
-1.7.9.5
-
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 506d7f5..e27c1a3 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,18 +4,30 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.12.20
-GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
+GNUTLS_VERSION = 3.1.5
+GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
-GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
+GNUTLS_LICENSE = GPLv3+ LGPLv3
 GNUTLS_LICENSE_FILES = COPYING lib/COPYING
-GNUTLS_DEPENDENCIES = host-pkgconf libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
-GNUTLS_CONF_ENV = acl_cv_rpath=no \
+GNUTLS_DEPENDENCIES = host-pkgconf nettle $(if $(BR2_PACKAGE_ZLIB),zlib)
+GNUTLS_CONF_OPT = --with-libnettle-prefix=$(STAGING_DIR)/usr --disable-rpath
+GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wint_t=$(if $(BR2_USE_WCHAR),yes,no)
-GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
-		--without-p11-kit --disable-rpath
 GNUTLS_INSTALL_STAGING = YES
 
+# Some examples in doc/examples use wchar
+define GNUTLS_DISABLE_DOCS
+	$(SED) 's/ doc / /' $(@D)/Makefile.in
+endef
+
+define GNUTLS_DISABLE_TOOLS
+	$(SED) 's/\$$(PROGRAMS)//' $(@D)/src/Makefile.in
+	$(SED) 's/) install-exec-am/)/' $(@D)/src/Makefile.in
+endef
+
+GNUTLS_POST_PATCH_HOOKS += GNUTLS_DISABLE_DOCS
+GNUTLS_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_GNUTLS_TOOLS),,GNUTLS_DISABLE_TOOLS)
+
 $(eval $(autotools-package))
