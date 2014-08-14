From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 14 Aug 2014 13:16:12 +0100
Subject: [Buildroot] [PATCH] gnupg2: Needs a suitable iconv implementation
Message-ID: <1408018572-57330-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnupg2 needs a toolchain with locale support or a package which provides
a suitable iconv implementation (libiconv). Otherwise it will fail at
the configure phase with an error like this one:

*** It is now required to build with support for iconv
*** Please install a suitable iconv implementation.

Fixes:
  http://autobuild.buildroot.net/results/8c9/8c93c28533dfebffa8b2e34b1421d3fa3cdeb278/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/gnupg2/Config.in |    1 +
 package/gnupg2/gnupg2.mk |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
index be97a20..d24eaae 100644
--- a/package/gnupg2/Config.in
+++ b/package/gnupg2/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GNUPG2
 	select BR2_PACKAGE_LIBKSBA
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBPTHSEM_COMPAT
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_MMU # libassuan
 	help
 	  GnuPG is the GNU project's complete and free implementation
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 9502a82..5e108d9 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -9,7 +9,8 @@ GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
 GNUPG2_LICENSE_FILES = COPYING
-GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libpthsem
+GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libpthsem \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG2_CONF_OPT = \
 	--disable-rpath --disable-regex --disable-doc \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
-- 
1.7.1
