From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:34:20 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libarchive:
 security bump to version 3.4.2
Message-ID: <20200314172134.CA1A68392E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b71ed27a55da497b4416c372fa4552251885129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

- Fix CVE-2020-9308: archive_read_support_format_rar5.c in libarchive
  before 3.4.2 attempts to unpack a RAR5 file with an invalid or
  corrupted header (such as a header size of zero), leading to a SIGSEGV
  or possibly unspecified other impact.
- use --with-nettle to enable nettle support, see
  https://github.com/libarchive/libarchive/commit/f96a71144b7725ca4a94d84bd27d7dca8c2f58d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - drop new optional dependency to mbedtsl, forced off for now
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6785c19bf5f76001b9a1237402b68fd8302e5620)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index b01d6368a5..9da4eb3baa 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  fcf87f3ad8db2e4f74f32526dee62dd1fb9894782b0a503a89c9d7a70a235191  libarchive-3.4.1.tar.gz
+sha256  b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176  libarchive-3.4.2.tar.gz
 # Locally computed:
 sha256  e1e3d4ba9d0b0ccba333b5f5539f7c6c9a3ef3d57a96cd165d2c45eaa1cd026d  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index e256b72289..60838eea0a 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.4.1
+LIBARCHIVE_VERSION = 3.4.2
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
+LIBARCHIVE_CONF_OPTS = --without-mbedtls
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -86,6 +87,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 LIBARCHIVE_DEPENDENCIES += nettle
+LIBARCHIVE_CONF_OPTS += --with-nettle
 else
 LIBARCHIVE_CONF_OPTS += --without-nettle
 endif
@@ -123,6 +125,7 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-libiconv-prefix \
 	--without-xml2 \
 	--without-lzo2 \
+	--without-mbedtls \
 	--without-nettle \
 	--without-openssl \
 	--without-lzma
