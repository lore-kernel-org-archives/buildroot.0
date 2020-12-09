From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  9 Dec 2020 22:27:14 +0100
Subject: [Buildroot] [PATCH v1 12/14] package/gst1-python: bump version to
 1.18.2
In-Reply-To: <20201209212716.15472-1-ps.report@gmx.net>
References: <20201209212716.15472-1-ps.report@gmx.net>
Message-ID: <20201209212716.15472-12-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove 0001-fix-builds-with-python-3.8.patch
  (from upstream [1])

[1] https://gitlab.freedesktop.org/gstreamer/gst-python/-/commit/22f28155d86e27c4134de4ed2861264003fcfd23

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0001-fix-builds-with-python-3.8.patch     | 43 -------------------
 .../gstreamer1/gst1-python/gst1-python.hash   |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch

diff --git a/package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch b/package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch
deleted file mode 100644
index edff445a7a..0000000000
--- a/package/gstreamer1/gst1-python/0001-fix-builds-with-python-3.8.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 10707f437f2fc3632067c6a0efa4432f7ebaf362 Mon Sep 17 00:00:00 2001
-From: Sebastian Dr?ge <sebastian@centricular.com>
-Date: Fri, 13 Dec 2019 10:46:20 +0200
-Subject: [PATCH] backport of "fix build with Python 3.8 by also checking for
- python-3.X-embed.pc"
-
-Since Python 3.8 the normal checks don't include the Python libraries
-anymore and linking of the gst-python module would fail.
-
-See also https://github.com/mesonbuild/meson/issues/5629
-
-Fixes https://gitlab.freedesktop.org/gstreamer/gst-python/issues/28
-
-Upstream commit: 22f28155d86e27c4134de4ed2861264003fcfd23
-
-Signed-off-by: Sebastian Dr?ge <sebastian@centricular.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- meson.build | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 744b7ce..492af1a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -25,6 +25,14 @@ pygobject_dep = dependency('pygobject-3.0', fallback: ['pygobject', 'pygobject_d
- pymod = import('python')
- python = pymod.find_installation(get_option('python'))
- python_dep = python.dependency(required : true)
-+pythonver = python.language_version()
-+
-+# Workaround for https://github.com/mesonbuild/meson/issues/5629
-+# https://gitlab.freedesktop.org/gstreamer/gst-python/issues/28
-+python_dep = dependency('python- at 0@-embed'.format(pythonver), version: '>=3', required: false)
-+if not python_dep.found()
-+  python_dep = python.dependency(required : true)
-+endif
- 
- python_abi_flags = python.get_variable('ABIFLAGS', '')
- pylib_loc = get_option('libpython-dir')
--- 
-2.24.1
-
diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 1d3c687dd4..57bd198501 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.16.2.tar.xz.sha256sum
-sha256  208df3148d73d9f416d016564737585d8ea763d91201732d44b5fe688c6288a8  gst-python-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.18.2.tar.xz.sha256sum
+sha256  e19d0f760b353e88161b3712193cffbd79bf1314418da792b5fec4d8ecef389c  gst-python-1.18.2.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 122c3dd997..bf64c2c96a 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.16.2
+GST1_PYTHON_VERSION = 1.18.2
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.29.2
