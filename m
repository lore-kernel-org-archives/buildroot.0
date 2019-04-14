From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Apr 2019 17:51:53 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/ngircd: fix static build with openssl and atomic
Message-ID: <20190414155153.4317-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/72345ebd144bed824329618e66721a98eba3be22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Do not call autogen.sh, use AUTORECONF and apply the same tweaks
   than autogen.sh to remove de-ANSI-fication

 ...-pkg-config-to-find-openssl-dependen.patch | 35 +++++++++++++++++++
 package/ngircd/ngircd.mk                      | 23 ++++++++++--
 2 files changed, 56 insertions(+), 2 deletions(-)
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
index 5fa86afdd5..582da563ac 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -9,6 +9,25 @@ NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
+# We're patching configure.ac
+NGIRCD_AUTORECONF = YES
+
+# We're patching configure.ng, but package cannot autoreconf with
+# automake >= 1.12 because de-ANSI-fication has been removed so apply the same
+# tweaks that are done by upstream in autogen.sh
+define NGIRCD_REMOVE_DE_ANSI_FICATION
+	sed -e "s|^__ng_PROTOTYPES__|AC_C_PROTOTYPES|g" \
+		$(@D)/configure.ng > $(@D)/configure.ac
+
+	sed -e "s|^__ng_Makefile_am_template__|AUTOMAKE_OPTIONS = ${SERIAL_TESTS} #ansi2knr|g" \
+		$(@D)/src/portab/Makefile.ng > $(@D)/src/portab/Makefile.am
+	for i in ipaddr/Makefile ngircd/Makefile testsuite/Makefile tool/Makefile; do \
+		sed -e "s|^__ng_Makefile_am_template__|AUTOMAKE_OPTIONS = ${SERIAL_TESTS} #../portab/ansi2knr|g" \
+			$(@D)/src/$$i.ng > $(@D)/src/$$i.am ; \
+	done
+endef
+
+NGIRCD_PRE_CONFIGURE_HOOKS += NGIRCD_REMOVE_DE_ANSI_FICATION
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
@@ -18,8 +37,8 @@ NGIRCD_CONF_OPTS += --without-pam
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
