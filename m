From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Mar 2017 13:58:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/clamav: needs libtool
Message-ID: <20170311125853.5204-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

clamav contains a copy of libltdl which is used when the libtool
package is not present, this increases the filesize of the target libs:

linked against libltdl.so:

-rwxr-xr-x 1 bernd bernd 1838528 M?r 11 13:21 output/target/usr/lib/libclamav.so.7.1.1

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libclamav.so.7.1.1 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libltdl.so.7]
 0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

not linked against libltdl.so:

-rwxr-xr-x 1 bernd bernd 1859548 M?r 11 13:21 output/target/usr/lib/libclamav.so.7.1.1

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libclamav.so.7.1.1 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Therefore this patch adds libtool as hard dependency to clamav.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/Config.in | 1 +
 package/clamav/clamav.mk | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 7ec402d9d..f832341a0 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CLAMAV
 	bool "clamav"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 36ab8be0e..86bdda49e 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -12,6 +12,7 @@ CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
 	COPYING.unrar COPYING.zlib
 CLAMAV_DEPENDENCIES = \
 	host-pkgconf \
+	libtool \
 	openssl \
 	zlib \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
@@ -24,6 +25,8 @@ CLAMAV_CONF_ENV = \
 # UCLIBC_HAS_FTS is disabled, therefore disable fanotify (missing fts.h)
 CLAMAV_CONF_OPTS = \
 	--with-dbdir=/var/lib/clamav \
+	--with-ltdl-include=$(STAGING_DIR)/usr/include \
+	--with-ltdl-lib=$(STAGING_DIR)/usr/lib \
 	--with-openssl=$(STAGING_DIR)/usr \
 	--with-zlib=$(STAGING_DIR)/usr \
 	--disable-zlib-vcheck \
-- 
2.11.0
