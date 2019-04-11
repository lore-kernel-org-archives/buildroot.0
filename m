From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Apr 2019 23:49:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/ngircd: fix static build with
 openssl and atomic
Message-ID: <20190411214927.30188-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/72345ebd144bed824329618e66721a98eba3be22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-pkg-config-to-find-openssl-dependen.patch | 35 +++++++++++++++++++
 package/ngircd/ngircd.mk                      | 13 +++++--
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 package/ngircd/0001-configure.ng-use-pkg-config-to-find-openssl-dependen.patch

diff --git a/package/ngircd/0001-configure.ng-use-pkg-config-to-find-openssl-dependen.patch b/package/ngircd/0001-configure.ng-use-pkg-config-to-find-openssl-dependen.patch
new file mode 100644
index 0000000000..bf05f99dc4
--- /dev/null
+++ b/package/ngircd/0001-configure.ng-use-pkg-config-to-find-openssl-dependen.patch
@@ -0,0 +1,35 @@
+From 75f669b9a00a76f0abf35cce8b9f80711aff7600 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Apr 2019 23:24:36 +0200
+Subject: [PATCH] configure.ng: use pkg-config to find openssl dependencies
+
+openssl can depends on lz or latomic so use pkg-config to find those
+dependencies and fallback to existing mechanism
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ngircd/ngircd/pull/256]
+---
+ configure.ng | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ng b/configure.ng
+index 57ae8bb8..899d00f7 100644
+--- a/configure.ng
++++ b/configure.ng
+@@ -464,8 +464,11 @@ AC_ARG_WITH(openssl,
+ 				CPPFLAGS="-I$withval/include $CPPFLAGS"
+ 				LDFLAGS="-L$withval/lib $LDFLAGS"
+ 			fi
+-			AC_CHECK_LIB(crypto, BIO_s_mem)
+-			AC_CHECK_LIB(ssl, SSL_new)
++			PKG_CHECK_MODULES([OPENSSL], [libssl libcrypto],
++				[LIBS="$LIBS $OPENSSL_LIBS" CFLAGS="$CFLAGS $OPENSSL_CFLAGS"],
++				[AC_CHECK_LIB(crypto, BIO_s_mem)
++				AC_CHECK_LIB(ssl, SSL_new)]
++			)
+ 			AC_CHECK_FUNCS(SSL_new, x_ssl_openssl=yes,
+ 				AC_MSG_ERROR([Can't enable openssl])
+ 			)
+-- 
+2.20.1
+
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 5fa86afdd5..bd8ac9dad4 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -10,6 +10,15 @@ NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
+# We're patching configure.ng, but package cannot autoreconf with our version of
+# autotools, so we have to do it manually instead of setting
+# NGIRCD_AUTORECONF = YES
+define NGIRCD_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+
+NGIRCD_PRE_CONFIGURE_HOOKS += NGIRCD_RUN_AUTOGEN
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
 NGIRCD_DEPENDENCIES += linux-pam
@@ -18,8 +27,8 @@ NGIRCD_CONF_OPTS += --without-pam
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
-NGIRCD_DEPENDENCIES += openssl
+NGIRCD_CONF_OPTS += --with-openssl
+NGIRCD_DEPENDENCIES += host-pkgconf openssl
 else
 NGIRCD_CONF_OPTS += --without-openssl
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.20.1
