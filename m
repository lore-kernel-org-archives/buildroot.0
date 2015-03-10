From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2015 20:59:37 +0100
Subject: [Buildroot] [PATCH v3 1/8] postgresql: enable uclibc build
Message-ID: <1426017584-6096-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with uclibc and locale support failes with the following error
message:

regc_pg_locale.c: In function ?pg_wc_isdigit?:
regc_pg_locale.c:312:6: error: dereferencing pointer to incomplete type
      isdigit_l((unsigned char) c, pg_regex_locale));

This can be fixed by overwriting the HAVE_LOCALE_T detection (thanks
to Alex Potapenko <opotapenko@gmail.com> for the hint [1]).

[1] http://lists.busybox.net/pipermail/buildroot/2015-March/121088.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 --> v3:
  - no changes

Tested with the following buildroot defonfig:

BR2_arm=y
BR2_arm1176jzf_s=y
BR2_JLEVEL=1
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.18"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="246530ff8a4f302b8666c6d9cf509407d8c1257a"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
BR2_PACKAGE_POSTGRESQL=y
---
 package/postgresql/Config.in     | 7 -------
 package/postgresql/postgresql.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 3ef5e6c..519b2a1 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
-	# PostgreSQL does not build against uClibc with locales
-	# enabled, due to an uClibc bug, see
-	# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
@@ -16,6 +12,3 @@ config BR2_PACKAGE_POSTGRESQL
 	  archives with pg_dump and pg_restore.
 
 	  http://www.postgresql.org
-
-comment "postgresql needs a toolchain w/ glibc"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dfef06..03154af 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,6 +13,14 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+# PostgreSQL does not build against uClibc with locales
+# enabled, due to an uClibc bug, see
+# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
+# so overwrite automatic detection and disable locale support
+POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
+endif
+
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
-- 
2.1.4
