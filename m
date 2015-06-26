From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 21:26:47 +0200
Subject: [Buildroot] [git commit] libarchive: add hash and enable lzma
	support
Message-ID: <20150626192715.2C83B80DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eab1756c19c786480ff79a4a9df616c6b635ec8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add libarchive hash. Enable lzma support.
Both xz and lzma support are provided by the xz library.

[Thomas: explicitly pass --with-lzma when xz is available.]

Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libarchive/libarchive.hash |    2 ++
 package/libarchive/libarchive.mk   |    8 +++++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
new file mode 100644
index 0000000..5f96211
--- /dev/null
+++ b/package/libarchive/libarchive.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e  libarchive-3.1.2.tar.gz
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 61528d9..206de3f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,7 +9,6 @@ LIBARCHIVE_SITE = http://www.libarchive.org/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
 LIBARCHIVE_LICENSE_FILES = COPYING
-LIBARCHIVE_CONF_OPTS = --without-lzma
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -86,4 +85,11 @@ else
 LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBARCHIVE_DEPENDENCIES += xz
+LIBARCHIVE_CONF_OPTS += --with-lzma
+else
+LIBARCHIVE_CONF_OPTS += --without-lzma
+endif
+
 $(eval $(autotools-package))
