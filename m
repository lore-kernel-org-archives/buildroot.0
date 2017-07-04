From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:35:09 +0200
Subject: [Buildroot] [git commit] rpm: use the new gettext logic
Message-ID: <20170704233518.F2FD17F96C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7af4033c32560594ddbd457b68f6d3713662a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - pass --with-libintl-prefix only when a separate libintl library is
   available

 - dropping BR2_PACKAGE_GETTEXT selection

 - removing a musl-specific workaround. Indeed, when NLS is enabled,
   we now have the full-blown libintl, even with the musl C library

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/Config.in |  1 -
 package/rpm/rpm.mk    | 10 ++--------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 9b4c8a7..aa857ef 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_RPM
 	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_FILE
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 317ec14..159ae72 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -11,6 +11,7 @@ RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
+RPM_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # 0001-configure-ac-use-link-instead-of-compile-for-gcc-flags-test.patch
 # 0002-configure-ac-correct-stack-protector-check.patch
@@ -42,8 +43,7 @@ RPM_CONF_OPTS += --with-beecrypt
 RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
 endif
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-RPM_DEPENDENCIES += gettext
+ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
 RPM_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
 else
 RPM_CONF_OPTS += --without-libintl-prefix
@@ -73,12 +73,6 @@ ifeq ($(BR2_PACKAGE_BINUTILS),y)
 RPM_DEPENDENCIES += binutils
 endif
 
-# RPM, when using NLS, requires GNU gettext's _nl_msg_cat_cntr, which is not
-# provided in musl.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-RPM_CONF_OPTS += --disable-nls
-endif
-
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
