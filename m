From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 09:11:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: use wrappers for
 g-ir-scanner and g-ir-compiler
In-Reply-To: <20200516205353.719366-1-james.hilliard1@gmail.com>
References: <20200516205353.719366-1-james.hilliard1@gmail.com>
Message-ID: <20200517071153.GR12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-16 14:53 -0600, James Hilliard spake thusly:
> We need to backport a commit to allow us to override the g-ir-scanner
> and g-ir-compiler binaries in the gnome module.
> 
> By default since meson looks for these binaries as native: true
> dependencies it would use the host versions instead of the wrappers
> which are not useable for target package builds. Override this behavior
> by specifying the correct wrapper binaries in cross-compilation.conf.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f49/f49bb57a6ec2890f489fbd55ced9c9249d066334/build-end.log
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master.

I just slightly expanded on why the backport does not closely match
upstream, after our little discucssion on IRC. Thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-g-ir-scanner-and-g-ir-compiler-bina.patch | 73 +++++++++++++++++++
>  package/meson/cross-compilation.conf.in       |  2 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch
> 
> diff --git a/package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch b/package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch
> new file mode 100644
> index 0000000000..710bd9acd7
> --- /dev/null
> +++ b/package/meson/0003-Allow-overriding-g-ir-scanner-and-g-ir-compiler-bina.patch
> @@ -0,0 +1,73 @@
> +From 49b1c8df7e4ff3a441d831f926d87920952025bf Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Sat, 2 May 2020 20:43:36 -0600
> +Subject: [PATCH] Allow overriding g-ir-scanner and g-ir-compiler binaries.
> +
> +This is useful when one needs to force meson to use wrappers for cross
> +compilation.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1 at gmail.com: backport from upstream commit
> +1e073c4c1bd7de06bc74d84e3807c9b210e57a22]
> +---
> + mesonbuild/modules/gnome.py | 34 +++++++++++++++++++++-------------
> + 1 file changed, 21 insertions(+), 13 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index a00005588..b6d7cc141 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -32,7 +32,7 @@ from ..mesonlib import (
> +     MachineChoice, MesonException, OrderedSet, Popen_safe, extract_as_list,
> +     join_args, unholder,
> + )
> +-from ..dependencies import Dependency, PkgConfigDependency, InternalDependency
> ++from ..dependencies import Dependency, PkgConfigDependency, InternalDependency, ExternalProgram
> + from ..interpreterbase import noKwargs, permittedKwargs, FeatureNew, FeatureNewKwargs
> + 
> + # gresource compilation is broken due to the way
> +@@ -735,21 +735,29 @@ class GnomeModule(ExtensionModule):
> +         # these utilities via pkg-config, so it would be best to use the
> +         # results from pkg-config when possible.
> +         gi_util_dirs_check = [state.environment.get_build_dir(), state.environment.get_source_dir()]
> +-        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
> +-        if giscanner.found():
> +-            giscanner_path = giscanner.get_command()[0]
> +-            if not any(x in giscanner_path for x in gi_util_dirs_check):
> +-                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> ++        giscanner_bin = state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-scanner')
> ++        if giscanner_bin is not None:
> ++            giscanner = ExternalProgram.from_entry('g-ir-scanner', giscanner_bin)
> +         else:
> +-            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> ++            giscanner = self.interpreter.find_program_impl('g-ir-scanner')
> ++            if giscanner.found():
> ++                giscanner_path = giscanner.get_command()[0]
> ++                if not any(x in giscanner_path for x in gi_util_dirs_check):
> ++                    giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> ++            else:
> ++                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> + 
> +-        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
> +-        if gicompiler.found():
> +-            gicompiler_path = gicompiler.get_command()[0]
> +-            if not any(x in gicompiler_path for x in gi_util_dirs_check):
> +-                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> ++        gicompiler_bin = state.environment.lookup_binary_entry(MachineChoice.HOST, 'g-ir-compiler')
> ++        if gicompiler_bin is not None:
> ++            gicompiler = ExternalProgram.from_entry('g-ir-compiler', gicompiler_bin)
> +         else:
> +-            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> ++            gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
> ++            if gicompiler.found():
> ++                gicompiler_path = gicompiler.get_command()[0]
> ++                if not any(x in gicompiler_path for x in gi_util_dirs_check):
> ++                    gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> ++            else:
> ++                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> + 
> +         ns = kwargs.pop('namespace')
> +         nsversion = kwargs.pop('nsversion')
> +-- 
> +2.25.1
> +
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index d80c472de6..e9344e2b2f 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -9,6 +9,8 @@ cpp = '@TARGET_CROSS at g++'
>  ar = '@TARGET_CROSS at ar'
>  strip = '@TARGET_CROSS at strip'
>  pkgconfig = '@HOST_DIR@/bin/pkgconf'
> +g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
> +g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'
>  
>  [properties]
>  needs_exe_wrapper = true
> -- 
> 2.25.1
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
