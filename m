From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed,  8 Jan 2020 16:16:05 -0700
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.53.0
Message-ID: <20200108231605.76439-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ic-libs-when-default-library-static.patch} |  0
 ...dist.py-import-lzma-only-when-needed.patch | 50 -------------------
 package/meson/meson.hash                      |  4 +-
 package/meson/meson.mk                        |  2 +-
 4 files changed, 3 insertions(+), 53 deletions(-)
 rename package/meson/{0003-Prefer-ext-static-libs-when-default-library-static.patch => 0002-Prefer-ext-static-libs-when-default-library-static.patch} (100%)
 delete mode 100644 package/meson/0002-mdist.py-import-lzma-only-when-needed.patch

diff --git a/package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
similarity index 100%
rename from package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch
rename to package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
diff --git a/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch b/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
deleted file mode 100644
index 81758bc1b3..0000000000
--- a/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a3443360c8c0014638366d5bb2f5aa7683d5aec2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 19 Oct 2019 09:52:06 +0200
-Subject: [PATCH] mdist.py: import lzma only when needed
-
-Importing lzma requires that python was built with lzma support. Buildroot
-builds its own version of python, without lzma support (i.e. without
-dependency on host-xz).
-
-lzma is anyway only needed to make the dist target, which we don't do in
-Buildroot. Therefore, in the Buildroot context, everything still works
-properly without lzma support.
-
-Moving the import down to the place where it is actually needed does not
-remove any functionality but fixes the problem for Buildroot.
-
-Source of patch:
-http://lists.busybox.net/pipermail/buildroot/2019-October/262990.html
-http://code.bulix.org/gdxcu4-914360
-
-Fixes https://github.com/mesonbuild/meson/issues/6012
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- mesonbuild/mdist.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/mdist.py b/mesonbuild/mdist.py
-index 7b753826..28e2fced 100644
---- a/mesonbuild/mdist.py
-+++ b/mesonbuild/mdist.py
-@@ -13,7 +13,6 @@
- # limitations under the License.
- 
- 
--import lzma
- import gzip
- import os
- import sys
-@@ -133,6 +132,7 @@ def create_dist_hg(dist_name, archives, src_root, bld_root, dist_sub, dist_scrip
-     if dist_scripts:
-         mlog.warning('dist scripts are not supported in Mercurial projects')
-     if 'xztar' in archives:
-+        import lzma
-         with lzma.open(xzname, 'wb') as xf, open(tarname, 'rb') as tf:
-             shutil.copyfileobj(tf, xf)
-         output_names.append(xzname)
--- 
-2.20.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 461e908b4a..3039526857 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.52.1/meson-0.52.1.tar.gz.asc
-sha256 0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035 meson-0.52.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.53.0/meson-0.53.0.tar.gz.sig
+sha256 035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65c9bb6e1cc9730a9d3f6 meson-0.53.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d409ae7b52..22d7353659 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.52.1
+MESON_VERSION = 0.53.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.20.1
