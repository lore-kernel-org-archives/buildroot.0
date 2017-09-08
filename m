From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Sep 2017 11:16:56 +0200
Subject: [Buildroot] [git commit] libzip: security bump to version 1.3.0
Message-ID: <20170908091617.8F20C7F9D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f77fb7b585b76b9c544b21fc3bf080660a54cb7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

CVE-2017-12858: Double free vulnerability in the _zip_dirent_read function
in zip_dirent.c in libzip allows attackers to have unspecified impact via
unknown vectors.

CVE-2017-14107: The _zip_read_eocd64 function in zip_open.c in libzip before
1.3.0 mishandles EOCD records, which allows remote attackers to cause a
denial of service (memory allocation failure in _zip_cdir_grow in
zip_dirent.c) via a crafted ZIP archive.

For more details, see
https://blogs.gentoo.org/ago/2017/09/01/libzip-use-after-free-in-_zip_buffer_free-zip_buffer-c/
https://blogs.gentoo.org/ago/2017/09/01/libzip-memory-allocation-failure-in-_zip_cdir_grow-zip_dirent-c/

libzip-1.3.0 also adds optional bzip2 support, so handle that.

While we're at it, add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libzip/libzip.hash | 3 ++-
 package/libzip/libzip.mk   | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 103c761..d100982 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	ffc0764395fba3d45dc5a6e32282788854618b9e9838337f8218b596007f1376	libzip-1.2.0.tar.xz
+sha256	aa936efe34911be7acac2ab07fb5c8efa53ed9bb4d44ad1fe8bff19630e0d373  libzip-1.3.0.tar.xz
+sha256  d159ae325ca0b8236c44dfd980ca99810dbcfc057b077c50dbbda1131cbd263a  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index a4012dd..5ffa1ca 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.2.0
+LIBZIP_VERSION = 1.3.0
 LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
@@ -12,4 +12,11 @@ LIBZIP_LICENSE_FILES = LICENSE
 LIBZIP_INSTALL_STAGING = YES
 LIBZIP_DEPENDENCIES = zlib
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LIBZIP_CONF_OPTS += --with-bzip2
+LIBZIP_DEPENDENCIES += bzip2
+else
+LIBZIP_CONF_OPTS += --without-bzip2
+endif
+
 $(eval $(autotools-package))
