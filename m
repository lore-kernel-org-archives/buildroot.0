From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2020 18:19:20 +0100
Subject: [Buildroot] [PATCH v4,
 3/3] package/meson: determine g-ir-scanner and g-ir-compiler paths
 from pkgconfig
In-Reply-To: <20200312194632.3787015-3-aduskett@gmail.com>
References: <20200312194632.3787015-1-aduskett@gmail.com>
 <20200312194632.3787015-3-aduskett@gmail.com>
Message-ID: <20200314171920.GO705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-12 12:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently, meson hard codes the paths of these binaries which results in
> cross-compiled environments to run the host versions of these tools.
> However, GObject-introspection provides the appropriate paths to these
> utilities via pkg-config
> 
> find_program is needed in the case g-i is built as a subproject. If
> g-ir-scanner or g-ir-compiler are in the build or source directory use those.
> If they aren't found in the source directory, use the results from pkg-config.
> 
> Current upstream-status: merged
> https://github.com/mesonbuild/meson/pull/6687
> https://github.com/mesonbuild/meson/pull/6696
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v3:
>   - Use an upstream patch that fixes this issue permanently.
> 
>  ...canner-and-g-ir-compiler-paths-from-.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch
> 
> diff --git a/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch b/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch
> new file mode 100644
> index 0000000000..4f765e2157
> --- /dev/null
> +++ b/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-.patch
> @@ -0,0 +1,68 @@
> +From e8c2c21aabb4a06915b2e3a2c8e99bd74999db92 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <Aduskett@gmail.com>
> +Date: Wed, 26 Feb 2020 10:42:54 -0800
> +Subject: [PATCH] determine g-ir-scanner and g-ir-compiler paths from pkgconfig
> +
> +Currently, meson hard codes the paths of these binaries which results in
> +cross-compiled environments to run the host versions of these tools.
> +However, GObject-introspection provides the appropriate paths to these
> +utilities via pkg-config
> +
> +find_program is needed in the case g-i is built as a subproject. If
> +g-ir-scanner or g-ir-compiler are in the build or source directory use those.
> +If they aren't found in the source directory, use the results from pkg-config.
> +
> +Cherry picked from:
> +https://github.com/mesonbuild/meson/commit/f66b04b0996eae5cd7b0ad007435d5a51f28b691
> +https://github.com/mesonbuild/meson/commit/6ba034c37d8004a72d392f37f66e709c593d8983

This is backporting two commits, so should be two patches.

Regards,
Yann E. MORIN.

> +Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> +---
> + mesonbuild/modules/gnome.py | 25 ++++++++++++++++++++++---
> + 1 file changed, 22 insertions(+), 3 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index 9bd7a99..df01409 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -736,15 +736,34 @@ class GnomeModule(ExtensionModule):
> +         if kwargs.get('install_dir'):
> +             raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
> + 
> +-        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
> +-        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
> +-
> +         girtargets = [self._unwrap_gir_target(arg, state) for arg in args]
> + 
> +         if len(girtargets) > 1 and any([isinstance(el, build.Executable) for el in girtargets]):
> +             raise MesonException('generate_gir only accepts a single argument when one of the arguments is an executable')
> + 
> +         self.gir_dep, pkgargs = self._get_gir_dep(state)
> ++        # find_program is needed in the case g-i is built as subproject.
> ++        # In that case it uses override_find_program so the gobject utilities
> ++        # can be used from the build dir instead of from the system.
> ++        # However, GObject-introspection provides the appropriate paths to
> ++        # these utilities via pkg-config, so it would be best to use the
> ++        # results from pkg-config when possible.
> ++        gi_util_dirs_check = [state.environment.get_build_dir(), state.environment.get_source_dir()]
> ++        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
> ++        if giscanner.found():
> ++            giscanner_path = giscanner.get_command()[0]
> ++            if not any(x in giscanner_path for x in gi_util_dirs_check):
> ++                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> ++        else:
> ++            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> ++
> ++        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
> ++        if gicompiler.found():
> ++            gicompiler_path = gicompiler.get_command()[0]
> ++            if not any(x in gicompiler_path for x in gi_util_dirs_check):
> ++                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> ++        else:
> ++            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> + 
> +         ns = kwargs.pop('namespace')
> +         nsversion = kwargs.pop('nsversion')
> +-- 
> +2.24.1
> +
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
