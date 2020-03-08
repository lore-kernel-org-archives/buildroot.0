From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 00:45:16 -0700
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: bump to version 0.23.20
Message-ID: <20200308074516.25306-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert build system to meson.

We need host-libtasn1 as it provides asn1Parser which is needed for
generating headers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libtasn1/libtasn1.mk |  1 +
 package/p11-kit/p11-kit.hash |  4 ++--
 package/p11-kit/p11-kit.mk   | 15 ++++++---------
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 50afc4cdf9..bde1aaaf36 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -14,3 +14,4 @@ LIBTASN1_INSTALL_STAGING = YES
 LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 45f0f1d64e..f558f6e68f 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 4b34e92ae36fa493e0d94366c767f06d5f9951e3d8581d10fd935d738db1574d  p11-kit-0.23.16.1.tar.gz
+sha256  14d86024c3dfd6b967d9bc0b4ec7b2973014fe7423481f4d230a1a63b8aa6104  p11-kit-0.23.20.tar.xz
 # Locally computed
-sha256 2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
+sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 1f72e0515b..334c856108 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,20 +4,17 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.23.16.1
+P11_KIT_VERSION = 0.23.20
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
-P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
+P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
+P11_KIT_DEPENDENCIES = host-pkgconf host-libtasn1 libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
-P11_KIT_CONF_OPTS = --disable-static
-P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
-	ac_cv_have_decl___progname=no
+P11_KIT_CONF_OPTS = -Dlibffi=enabled -Dtrust_module=enabled -Dsystemd=disabled
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
-P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
-else
-P11_KIT_CONF_OPTS += --without-trust-paths
+P11_KIT_CONF_OPTS += -Dtrust_paths=/etc/ssl/certs/ca-certificates.crt
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.20.1
