From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Dec 2020 13:20:03 +0100
Subject: [Buildroot] [PATCH 1/3] package/p11-kit: libffi is optional,
 not mandatory
Message-ID: <20201221122005.343120-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/p11-kit/Config.in  | 1 -
 package/p11-kit/p11-kit.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
index a6b7261886..5690418756 100644
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_P11_KIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_LIBTASN1
 	help
 	  Provides a way to load and enumerate PKCS#11 modules.
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 1f72e0515b..f67e57102b 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -6,7 +6,7 @@
 
 P11_KIT_VERSION = 0.23.16.1
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
-P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
+P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPTS = --disable-static
 P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
@@ -20,4 +20,11 @@ else
 P11_KIT_CONF_OPTS += --without-trust-paths
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+P11_KIT_DEPENDENCIES = host-pkgconf libffi
+P11_KIT_CONF_OPTS += --with-libffi
+else
+P11_KIT_CONF_OPTS += --without-libffi
+endif
+
 $(eval $(autotools-package))
-- 
2.29.2
