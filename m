From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 15:53:43 +0200
Subject: [Buildroot] [git commit] package/meson: bump to version 0.55.0
Message-ID: <20200718135818.8B41083A20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bb1827111704fda972957c5036bd2a572e68247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop fix rpath patch which is no longer needed.

Drop g-ir-scanner/g-ir-compiler override patch which is now upstream.

Rebase remaining patches.

Meson now requires single quotes for cross-compilation.conf, replace
double quotes with single quotes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...y-fix-RPATH-if-install_rpath-is-not-empty.patch | 36 -----------
 ...-static-libs-when-default-library-static.patch} |  8 +--
 ...ependencies-base.py-add-pkg_config_stati.patch} |  8 +--
 ...iding-g-ir-scanner-and-g-ir-compiler-bina.patch | 74 ----------------------
 package/meson/meson.hash                           |  4 +-
 package/meson/meson.mk                             |  2 +-
 package/pkg-meson.mk                               | 12 ++--
 support/misc/utils.mk                              |  4 ++
 8 files changed, 21 insertions(+), 127 deletions(-)

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
deleted file mode 100644
index 79e99adf4a..0000000000
--- a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4db4fd79d9bb2b98cea1117f22b6c97942ab2ecd Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Sat, 14 Jul 2018 11:18:45 +0200
-Subject: [PATCH] Only fix RPATH if install_rpath is not empty
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-[Fix: remove leftover from original/unconditional code]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- mesonbuild/minstall.py | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 8ac6aab1..7ef04116 100644
---- a/mesonbuild/minstall.py
-+++ b/mesonbuild/minstall.py
-@@ -489,8 +489,14 @@ class Installer:
-                         printed_symlink_error = True
-             if os.path.isfile(outname):
-                 try:
--                    depfixer.fix_rpath(outname, install_rpath, final_path,
--                                       install_name_mappings, verbose=False)
-+                    # Buildroot check-host-rpath script expects RPATH
-+                    # But if install_rpath is empty, it will stripped.
-+                    # So, preserve it in this case
-+                    if install_rpath:
-+                        depfixer.fix_rpath(outname, install_rpath, final_path,
-+                                           install_name_mappings, verbose=False)
-+                    else:
-+                        print("Skipping RPATH fixing")
-                 except SystemExit as e:
-                     if isinstance(e.code, int) and e.code == 0:
-                         pass
--- 
-2.20.1
-
diff --git a/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
similarity index 91%
rename from package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
rename to package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
index b859d8372e..2639915891 100644
--- a/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
+++ b/package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch
@@ -1,4 +1,4 @@
-From b390f29b9e0170d5bf410f4bef5a697655857633 Mon Sep 17 00:00:00 2001
+From ea85465e608178080c3b4d51af9765a8c7c0dae3 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Sat, 26 Oct 2019 09:17:29 -0500
 Subject: [PATCH] Prefer ext static libs when --default-library=static
@@ -27,10 +27,10 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/mesonbuild/compilers/mixins/clike.py b/mesonbuild/compilers/mixins/clike.py
-index 5d50b7d..8f5f1c6 100644
+index 47e97d261..729c98acc 100644
 --- a/mesonbuild/compilers/mixins/clike.py
 +++ b/mesonbuild/compilers/mixins/clike.py
-@@ -857,6 +857,9 @@ class CLikeCompiler:
+@@ -940,6 +940,9 @@ class CLikeCompiler:
          elif env.machines[self.for_machine].is_cygwin():
              shlibext = ['dll', 'dll.a']
              prefixes = ['cyg'] + prefixes
@@ -41,5 +41,5 @@ index 5d50b7d..8f5f1c6 100644
              # Linux/BSDs
              shlibext = ['so']
 -- 
-2.17.1
+2.25.1
 
diff --git a/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
similarity index 95%
rename from package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
rename to package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
index 4196545a96..eda17cadc5 100644
--- a/package/meson/0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
+++ b/package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch
@@ -1,4 +1,4 @@
-From 71295eec724f89ef5f5822c17cf44480335225cd Mon Sep 17 00:00:00 2001
+From 8622d37587169c1e4a4206a9462868ede057f0e8 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 15 Feb 2020 15:13:59 +0100
 Subject: [PATCH] mesonbuild/dependencies/base.py: add pkg_config_static
@@ -23,10 +23,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 5636602e..de4e87bc 100644
+index 23701da95..83e51626d 100644
 --- a/mesonbuild/dependencies/base.py
 +++ b/mesonbuild/dependencies/base.py
-@@ -858,7 +858,8 @@ class PkgConfigDependency(ExternalDependency):
+@@ -849,7 +849,8 @@ class PkgConfigDependency(ExternalDependency):
      def _set_libs(self):
          env = None
          libcmd = [self.name, '--libs']
@@ -37,5 +37,5 @@ index 5636602e..de4e87bc 100644
          # Force pkg-config to output -L fields even if they are system
          # paths so we can do manual searching with cc.find_library() later.
 -- 
-2.25.4
+2.25.1
 
diff --git a/package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch b/package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch
deleted file mode 100644
index c1db98f5a0..0000000000
--- a/package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 49b1c8df7e4ff3a441d831f926d87920952025bf Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 2 May 2020 20:43:36 -0600
-Subject: [PATCH] Allow overriding g-ir-scanner and g-ir-compiler binaries.
-
-This is useful when one needs to force meson to use wrappers for cross
-compilation.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1 at gmail.com: backport and largely adapt upstream commit
-1e073c4c1bd7de06bc74d84e3807c9b210e57a22, as the version in master has
-undergone haevy refactorisation]
----
- mesonbuild/modules/gnome.py | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index a00005588..b6d7cc141 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -32,7 +32,7 @@ from ..mesonlib import (
-     MachineChoice, MesonException, OrderedSet, Popen_safe, extract_as_list,
-     join_args, unholder,
- )
--from ..dependencies import Dependency, PkgConfigDependency, InternalDependency
-+from ..dependencies import Dependency, PkgConfigDependency, InternalDependency, ExternalProgram
- from ..interpreterbase import noKwargs, permittedKwargs, FeatureNew, FeatureNewKwargs
- 
- # gresource compilation is broken due to the way
-@@ -735,21 +735,29 @@ class GnomeModule(ExtensionModule):
-         # these utilities via pkg-config, so it would be best to use the
-         # results from pkg-config when possible.
-         gi_util_dirs_check = [state.environment.get_build_dir(), state.environment.get_source_dir()]
--        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
--        if giscanner.found():
--            giscanner_path = giscanner.get_command()[0]
--            if not any(x in giscanner_path for x in gi_util_dirs_check):
--                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+        giscanner_bin = state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-scanner')
-+        if giscanner_bin is not None:
-+            giscanner = ExternalProgram.from_entry('g-ir-scanner', giscanner_bin)
-         else:
--            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+            giscanner = self.interpreter.find_program_impl('g-ir-scanner')
-+            if giscanner.found():
-+                giscanner_path = giscanner.get_command()[0]
-+                if not any(x in giscanner_path for x in gi_util_dirs_check):
-+                    giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+            else:
-+                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
- 
--        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
--        if gicompiler.found():
--            gicompiler_path = gicompiler.get_command()[0]
--            if not any(x in gicompiler_path for x in gi_util_dirs_check):
--                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
-+        gicompiler_bin = state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-compiler')
-+        if gicompiler_bin is not None:
-+            gicompiler = ExternalProgram.from_entry('g-ir-compiler', gicompiler_bin)
-         else:
--            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
-+            gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
-+            if gicompiler.found():
-+                gicompiler_path = gicompiler.get_command()[0]
-+                if not any(x in gicompiler_path for x in gi_util_dirs_check):
-+                    gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
-+            else:
-+                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
- 
-         ns = kwargs.pop('namespace')
-         nsversion = kwargs.pop('nsversion')
--- 
-2.25.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index b1d230938a..c88ea8e904 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.54.2/meson-0.54.2.tar.gz.asc
-sha256  a7716eeae8f8dff002e4147642589ab6496ff839e4376a5aed761f83c1fa0455  meson-0.54.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.55.0/meson-0.55.0.tar.gz.asc
+sha256  0a1ae2bfe2ae14ac47593537f93290fb79e9b775c55b4c53c282bc3ca3745b35  meson-0.55.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d5b1e86811..f698226a45 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.54.2
+MESON_VERSION = 0.55.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 0a4ab2194c..e827bb5f3c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -71,9 +71,9 @@ define $(2)_CONFIGURE_CMDS
 	    -e 's%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
 	    -e 's%@TARGET_CPU@%$$(HOST_MESON_TARGET_CPU)%g' \
 	    -e 's%@TARGET_ENDIAN@%$$(HOST_MESON_TARGET_ENDIAN)%g' \
-	    -e 's%@TARGET_CFLAGS@%$$(call make-comma-list,$$($(2)_CFLAGS))%g' \
-	    -e 's%@TARGET_LDFLAGS@%$$(call make-comma-list,$$($(2)_LDFLAGS))%g' \
-	    -e 's%@TARGET_CXXFLAGS@%$$(call make-comma-list,$$($(2)_CXXFLAGS))%g' \
+	    -e "s%@TARGET_CFLAGS@%$$(call make-sq-comma-list,$$($(2)_CFLAGS))%g" \
+	    -e "s%@TARGET_LDFLAGS@%$$(call make-sq-comma-list,$$($(2)_LDFLAGS))%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$$(call make-sq-comma-list,$$($(2)_CXXFLAGS))%g" \
 	    -e 's%@HOST_DIR@%$$(HOST_DIR)%g' \
 	    -e 's%@STAGING_DIR@%$$(STAGING_DIR)%g' \
 	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
@@ -190,9 +190,9 @@ define PKG_MESON_INSTALL_CROSS_CONF
 	    -e 's%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g' \
 	    -e 's%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g' \
 	    -e 's%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g' \
-	    -e 's%@TARGET_CFLAGS@%$(call make-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g' \
-	    -e 's%@TARGET_LDFLAGS@%$(call make-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g' \
-	    -e 's%@TARGET_CXXFLAGS@%$(call make-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g' \
+	    -e "s%@TARGET_CFLAGS@%$(call make-sq-comma-list,$(TARGET_CFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_LDFLAGS@%$(call make-sq-comma-list,$(TARGET_LDFLAGS))@PKG_TARGET_CFLAGS@%g" \
+	    -e "s%@TARGET_CXXFLAGS@%$(call make-sq-comma-list,$(TARGET_CXXFLAGS))@PKG_TARGET_CFLAGS@%g" \
 	    -e 's%@HOST_DIR@%$(HOST_DIR)%g' \
 	    -e 's%@STAGING_DIR@%$(STAGING_DIR)%g' \
 	    -e 's%@STATIC@%$$(if $$(BR2_STATIC_LIBS),true,false)%g' \
diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index 2f00ccfdb7..dc60cad979 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -88,6 +88,10 @@ notfirstword = $(wordlist 2,$(words $(1)),$(1))
 # list of unquoted items:   a b c d  -->  "a", "b", "c", "d"
 make-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,"%",$(strip $(1))))
 
+# build a comma-separated list of single quoted items, from a space-separated
+# list of unquoted items:   a b c d  -->  'a', 'b', 'c', 'd'
+make-sq-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,'%',$(strip $(1))))
+
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
 define sep
