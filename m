From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 26 Feb 2020 15:02:33 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/meson: determine
 g-ir-scanner and g-ir-compiler paths from pkgconfig
In-Reply-To: <20200224170929.8209-3-aduskett@gmail.com>
References: <20200224170929.8209-1-aduskett@gmail.com>
 <20200224170929.8209-3-aduskett@gmail.com>
Message-ID: <CA+_SqVYaLOZspOM78HZmMdnSGCRFy5Fr=8Xn913+cC4hMVgheA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 24, 2020 at 6:10 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Currently, meson hard-codes the paths of these utilities, which results in
> cross-compiled environments running the host versions of these tools instead of
> the wrappers installed in the staging directory.
>
> GObject-introspection provides the appropriate paths to these utilities via
> pkg-config, so it would be best to use the results of pkg-config instead of
> hard-coding these paths.
>
> Current upstream-status: submitted
> https://github.com/mesonbuild/meson/pull/6687
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  ...d-g-ir-compiler-paths-from-pkgconfig.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-pkgconfig.patch
>
> diff --git a/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-pkgconfig.patch b/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-pkgconfig.patch
> new file mode 100644
> index 0000000000..637f11d5e8
> --- /dev/null
> +++ b/package/meson/0004-determine-g-ir-scanner-and-g-ir-compiler-paths-from-pkgconfig.patch
> @@ -0,0 +1,39 @@
> +From 9ccaed380780178c4dab3a681f652ac7cd27452d Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 24 Feb 2020 08:56:47 +0300
> +Subject: [PATCH] determine g-ir-scanner and g-ir-compiler paths from pkgconfig
> +
> +Do not hardcode the name of those binaries; gobject-introspection
> +provides them via pkgconfig.
> +
> +Upstream-Status: submitted
> +https://github.com/mesonbuild/meson/pull/6687
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> +
> +---
> + mesonbuild/modules/gnome.py | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
> +index 7c5a363..0002498 100644
> +--- a/mesonbuild/modules/gnome.py
> ++++ b/mesonbuild/modules/gnome.py
> +@@ -744,15 +744,15 @@ class GnomeModule(ExtensionModule):
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
> ++        giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
> ++        gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
> ++
> +
> +         ns = kwargs.pop('namespace')
> +         nsversion = kwargs.pop('nsversion')
> --
> 2.21.1 (Apple Git-122.3)
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
