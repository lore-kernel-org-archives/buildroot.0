From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 14 Jun 2020 14:50:02 +0200
Subject: [Buildroot] [PATCH v2] package/meson: fix shared build issue due to
 --static flag always passed to pkg-config
Message-ID: <20200614125002.3476208-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since cf75d7da98596580eee5a9b5e1a3e156ad832099 we have a build failures when
building libgbm.so when valgrind package is selected because --static is always
passed to pkg-config even for shared build.

Even if -Dvalgrind=false on meson command line to build mesa, the valgrind
libraries come from pkg-config libdrm...

output/host/bin/pkg-config libdrm --libs --static
-L[...]/sysroot/usr/lib -ldrm -lm -L[...]/sysroot/usr/lib/valgrind
-lcoregrind-arm64-linux -lvex-arm64-linux -lgcc

... and break the build.

See initial discussions:
http://lists.busybox.net/pipermail/buildroot/2020-June/284543.html

This is due to a wrong condition test added by the patch
0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch.

Use None instead of False when pkg_config_static is not set, indeed
pkg_config_static is a string not a boolean. But pkg_config_static is
alsways set to 'true' or 'flase' in our meson package infra.

Before this patch, the issue can be reproduced using the following defconfig:
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_VALGRIND=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y

Fixes:
http://autobuild.buildroot.net/results/1b5/1b58d73ecbbe1af2c3e140563d696cf32d1c4a5a/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
v2: Use None instead of False since pkg_config_static is a string not a boolean (Yann).
---
 ...endencies-base.py-add-pkg_config_stati.patch | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 7bb00f3fba..4196545a96 100644
--- a/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 3a4962ede0d12bac66b38e0843f6e2ea75b03d50 Mon Sep 17 00:00:00 2001
+From 71295eec724f89ef5f5822c17cf44480335225cd Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -16,23 +16,26 @@ Fixes:
  - http://autobuild.buildroot.org/results/0d36952def63cb69628697fa6408aeb6ce10cb5b
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Romain: Fix if condition, pkg_config_static is a string not a boolean]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- mesonbuild/dependencies/base.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ mesonbuild/dependencies/base.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index a83e3d6c..913bff6b 100644
+index 5636602e..de4e87bc 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -840,7 +840,7 @@ class PkgConfigDependency(ExternalDependency):
+@@ -858,7 +858,8 @@ class PkgConfigDependency(ExternalDependency):
      def _set_libs(self):
          env = None
          libcmd = [self.name, '--libs']
 -        if self.static:
-+        if self.static or self.env.properties[self.for_machine].get('pkg_config_static', False):
++        if self.static or \
++           (self.env.properties[self.for_machine].get('pkg_config_static', None) == 'true'):
              libcmd.append('--static')
          # Force pkg-config to output -L fields even if they are system
          # paths so we can do manual searching with cc.find_library() later.
 -- 
-2.24.1
+2.25.4
 
-- 
2.25.4
