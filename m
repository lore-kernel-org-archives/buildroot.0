From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Sep 2020 14:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: security bump to version
 0.20.0
Message-ID: <20200906125351.2869468-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix CVE-2020-15503: LibRaw before 0.20-RC1 lacks a thumbnail size
  range check. This affects decoders/unpack_thumb.cpp,
  postprocessing/mem_image.cpp, and utils/thumb_utils.cpp. For example,
  malloc(sizeof(libraw_processed_image_t)+T.tlength) occurs without
  validating T.tlength.

- zlib is an optional dependency since
  https://github.com/LibRaw/LibRaw/commit/b63f017b063edb5e7091e3952ee20cb4d002edbe

Also update indentation in hash file (two spaces) as well as README.md
hash, no license changes:
 - https://github.com/LibRaw/LibRaw/commit/d1975cb0e055d2bfe58c9d845c9a3e57c346a2f9
 - https://github.com/LibRaw/LibRaw/commit/d38361b76e1a405a25b11165a1ee5495fc899246

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libraw/libraw.hash | 8 ++++----
 package/libraw/libraw.mk   | 9 ++++++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 3337396f5f..e8117cd1f1 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	40a262d7cc71702711a0faec106118ee004f86c86cc228281d12d16da03e02f5	LibRaw-0.19.5.tar.gz
-sha256	eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449	LICENSE.LGPL
-sha256	0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f	LICENSE.CDDL
-sha256	ed971b7f1f57fd8e7d28419ff7749cfe0f296e701687756e798a69555fd76646	README.md
+sha256  1f0a383da2ce9f409087facd28261decbf6be72cc90c78cd003b0766e4d694a3  LibRaw-0.20.0.tar.gz
+sha256  eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449  LICENSE.LGPL
+sha256  0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f  LICENSE.CDDL
+sha256  313415f7f48f6cd3cc78856626aab4bbe97dbb1e9a11db9c25396ca8d0e76cd9  README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index e786b844a9..e33674e6f5 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.19.5
+LIBRAW_VERSION = 0.20.0
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
@@ -41,4 +41,11 @@ else
 LIBRAW_CONF_OPTS += --disable-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBRAW_CONF_OPTS += --enable-zlib
+LIBRAW_DEPENDENCIES += zlib
+else
+LIBRAW_CONF_OPTS += --disable-zlib
+endif
+
 $(eval $(autotools-package))
-- 
2.28.0
