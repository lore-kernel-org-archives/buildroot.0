From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 14 Mar 2020 20:13:57 -0700
Subject: [Buildroot] [PATCH v5 2/3] package/meson: determine g-ir-scanner
 and g-ir-compiler paths from pkgconfig
In-Reply-To: <20200315031359.365637-1-aduskett@gmail.com>
References: <20200315031359.365637-1-aduskett@gmail.com>
Message-ID: <20200315031359.365637-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, meson hard codes the paths of these binaries which results in
cross-compiled environments to run the host versions of these tools.
However, GObject-introspection provides the appropriate paths to these
utilities via pkg-config

find_program is needed in the case g-i is built as a subproject. If
g-ir-scanner or g-ir-compiler are in the build or source directory use those.
If they aren't found in the source directory, use the results from pkg-config.

Current upstream-status: merged
https://github.com/mesonbuild/meson/pull/6687
https://github.com/mesonbuild/meson/pull/6696

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Use an upstream patch that fixes this issue permanently.

Changes v4 -> v5:
  - Split the patches into two seperate patches. (Yann)

 ...canner-and-g-ir-compiler-paths-from-.patch | 61 +++++++++++++++++++
 ...nome.py-Fix-giscanner-and-gicompiler.patch | 40 ++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch
 create mode 100644 package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicompiler.patch

diff --git a/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch b/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch
new file mode 100644
index 0000000000..b0cdd3af1c
--- /dev/null
+++ b/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch
@@ -0,0 +1,61 @@
+From f66b04b0996eae5cd7b0ad007435d5a51f28b691 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Mon, 24 Feb 2020 06:29:26 -0800
+Subject: [PATCH] gobject-introspection: determine g-ir-scanner and
+ g-ir-compiler paths from pkgconfig
+
+Currently, meson hard codes the paths of these binaries which results in
+cross-compiled environments to run the host versions of these tools.
+However, GObject-introspection provides the appropriate paths to these
+utilities via pkg-config
+
+find_program is needed in the case g-i is built as a subproject. If
+g-ir-scanner or g-ir-compiler are in the build or source directory use those.
+If they aren't found in the source directory, use the results from pkg-config.
+
+Current upstream-status: merged
+https://github.com/mesonbuild/meson/pull/6687
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ mesonbuild/modules/gnome.py | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 3d5d718136..0ea4b273e5 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -736,15 +736,30 @@ def generate_gir(self, state, args, kwargs):
+         if kwargs.get('install_dir'):
+             raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
+ 
+-        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
+-        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
+-
+         girtargets = [self._unwrap_gir_target(arg, state) for arg in args]
+ 
+         if len(girtargets) > 1 and any([isinstance(el, build.Executable) for el in girtargets]):
+             raise MesonException('generate_gir only accepts a single argument when one of the arguments is an executable')
+ 
+         self.gir_dep, pkgargs = self._get_gir_dep(state)
++        # find_program is needed in the case g-i is built as subproject.
++        # In that case it uses override_find_program so the gobject utilities
++        # can be used from the build dir instead of from the system.
++        # However, GObject-introspection provides the appropriate paths to
++        # these utilities via pkg-config, so it would be best to use the
++        # results from pkg-config when possible.
++        gi_util_dirs_check = [state.environment.get_build_dir(), state.environment.get_source_dir()]
++        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
++        if giscanner.found():
++            giscanner_path = giscanner.get_command()[0]
++            if not any(x in giscanner_path for x in gi_util_dirs_check):
++                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
++
++        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
++        if gicompiler.found():
++            gicompiler_path = gicompiler.get_command()[0]
++            if not any(x in gicompiler_path for x in gi_util_dirs_check):
++                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
+ 
+         ns = kwargs.pop('namespace')
+         nsversion = kwargs.pop('nsversion')
diff --git a/package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicompiler.patch b/package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicompiler.patch
new file mode 100644
index 0000000000..23fc461a95
--- /dev/null
+++ b/package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicompiler.patch
@@ -0,0 +1,40 @@
+From 1b059c974989ef36567454fa3b0034acb2db3691 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Wed, 26 Feb 2020 05:51:28 -0800
+Subject: [PATCH] mesonbuild/modules/gnome.py: Fix giscanner and gicompiler
+ logic
+
+Currently, giscanner and the gicompiler paths are only scanned via pkg-config
+if they are first found in the host path.
+
+Add a else statement to fix this oversite.
+
+Current upstream-status: merged
+https://github.com/mesonbuild/meson/pull/6696
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ mesonbuild/modules/gnome.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
+index 0ea4b273e5..1743b59c97 100644
+--- a/mesonbuild/modules/gnome.py
++++ b/mesonbuild/modules/gnome.py
+@@ -754,12 +754,16 @@ def generate_gir(self, state, args, kwargs):
+             giscanner_path = giscanner.get_command()[0]
+             if not any(x in giscanner_path for x in gi_util_dirs_check):
+                 giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
++        else:
++            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
+ 
+         gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
+         if gicompiler.found():
+             gicompiler_path = gicompiler.get_command()[0]
+             if not any(x in gicompiler_path for x in gi_util_dirs_check):
+                 gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
++        else:
++            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
+ 
+         ns = kwargs.pop('namespace')
+         nsversion = kwargs.pop('nsversion')
-- 
2.24.1
