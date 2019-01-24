From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 19:51:39 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libgpg-error:
 bump to version 1.33
Message-ID: <20190124190126.362228E62F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f8d885b62c55967b426667cbe7330d763fb2b2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The syscfg header name is now based on the target triplet, with the
vendor part set to "unknown". The symlink approach no longer works since
we use "buildroot" for the vendor part. Override the target host
configure parameter to match the build system expectation.

The x86 header vendor part has been renamed to "unknown" as well.
Account for that in BR2_PACKAGE_LIBGPG_ERROR_SYSCFG.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e58b5b1b93d93dbc0fcc288364adcab3b4f61450)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/Config.in         |  2 +-
 package/libgpg-error/libgpg-error.hash |  4 ++--
 package/libgpg-error/libgpg-error.mk   | 13 +++----------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 40424e41cf..2f1608d88e 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -45,5 +45,5 @@ config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 		if BR2_sparc
 	default "sparc64-unknown-linux-gnu" \
 		if BR2_sparc64
-	default "x86_64-pc-linux-gnu" \
+	default "x86_64-unknown-linux-gnu" \
 		if BR2_x86_64
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 93593b1411..b18ab7e6b6 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.32.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.33.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca  libgpg-error-1.32.tar.bz2
+sha256 5d38826656e746c936e7742d9cde072b50baa3c4c49daa168a56813612bf03ff  libgpg-error-1.33.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index ef817c7cc6..d26d92fb05 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.32
+LIBGPG_ERROR_VERSION = 1.33
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -12,14 +12,7 @@ LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
-
-define LIBGPG_ERROR_FIX_CROSS_COMPILATION
-	cd $(@D)/src/syscfg && \
-	ln -s lock-obj-pub.$(call qstrip, $(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)).h \
-		lock-obj-pub.$(GNU_TARGET_NAME).h
-endef
-LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
-
-LIBGPG_ERROR_CONF_OPTS = --disable-tests
+LIBGPG_ERROR_CONF_OPTS = --disable-tests \
+		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
 
 $(eval $(autotools-package))
