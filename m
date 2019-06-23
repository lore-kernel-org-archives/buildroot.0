From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Jun 2019 16:31:18 -0400
Subject: [Buildroot] [PATCH v11 4/5] package/meson: prevent python include
 path manipulation
In-Reply-To: <20190623203119.21707-1-aduskett@gmail.com>
References: <20190623203119.21707-1-aduskett@gmail.com>
Message-ID: <20190623203119.21707-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

From: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/meson/meson/

Meson exports a bunch of PKG_CONFIG_ variables which causes a double prefix for
the staging python include directory.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v11:
  - Add this patch to the series

 ...-environment-when-calling-pkg-config.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch

diff --git a/package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch b/package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch
new file mode 100644
index 0000000000..89a6830c67
--- /dev/null
+++ b/package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch
@@ -0,0 +1,48 @@
+From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 19 Nov 2018 14:24:26 +0100
+Subject: [PATCH] python module: do not manipulate the environment when calling pkg-config
+
+From: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/meson/meson/
+
+Meson exports a bunch of PKG_CONFIG_ variables which causes a double prefix to
+the python include directory.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+
+---
+ mesonbuild/modules/python.py | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
+index 9cfbd6f..3ff687a 100644
+--- a/mesonbuild/modules/python.py
++++ b/mesonbuild/modules/python.py
+@@ -75,11 +75,6 @@ class PythonDependency(ExternalDependency):
+                 old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
+                 old_pkg_path = os.environ.get('PKG_CONFIG_PATH')
+ 
+-                os.environ.pop('PKG_CONFIG_PATH', None)
+-
+-                if pkg_libdir:
+-                    os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
+-
+                 try:
+                     self.pkgdep = PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
+                     mlog.debug('Found "python-{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_version, pkg_libdir))
+@@ -88,13 +83,6 @@ class PythonDependency(ExternalDependency):
+                     mlog.debug('"python-{}" could not be found in LIBPC ({})'.format(pkg_version, pkg_libdir))
+                     mlog.debug(e)
+ 
+-                if old_pkg_path is not None:
+-                    os.environ['PKG_CONFIG_PATH'] = old_pkg_path
+-
+-                if old_pkg_libdir is not None:
+-                    os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
+-                else:
+-                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
+             else:
+                 mlog.debug('"python-{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_version, pkg_libdir))
+ 
-- 
2.21.0
