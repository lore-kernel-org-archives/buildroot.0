From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:52 +0200
Subject: [Buildroot] [PATCH 072/100] rpm: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-73-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - pass --with-libintl-prefix only when a separate libintl library is
   available

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/Config.in | 1 -
 package/rpm/rpm.mk    | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

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
index 317ec14..c81a110 100644
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
-- 
2.9.4
