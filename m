From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 20:57:46 +0100
Subject: [Buildroot] [git commit] package/p11-kit: libtasn1 is optional,
 not mandatory
Message-ID: <20201229194017.AB17081675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d82da39d55ea16c3c8aa3c5a8ea91fd6c2ceafbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p11-kit/Config.in  | 1 -
 package/p11-kit/p11-kit.mk | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
index 5690418756..9be76c2f41 100644
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_P11_KIT
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBTASN1
 	help
 	  Provides a way to load and enumerate PKCS#11 modules.
 	  Provides a standard configuration setup for installing PKCS#11
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index fef4791831..c2a7b23e9d 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -6,7 +6,6 @@
 
 P11_KIT_VERSION = 0.23.16.1
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
-P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPTS = --disable-static
 P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
@@ -27,4 +26,11 @@ else
 P11_KIT_CONF_OPTS += --without-libffi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBTASN1),y)
+P11_KIT_DEPENDENCIES += host-pkgconf libtasn1
+P11_KIT_CONF_OPTS += --with-libtasn1
+else
+P11_KIT_CONF_OPTS += --without-libtasn1
+endif
+
 $(eval $(autotools-package))
