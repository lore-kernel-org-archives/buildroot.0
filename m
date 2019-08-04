From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Aug 2019 00:05:14 +0200
Subject: [Buildroot] [PATCH v13 4/5] package/meson: prevent python
 include path manipulation
In-Reply-To: <20190804001429.51451-4-aduskett@gmail.com>
References: <20190804001429.51451-1-aduskett@gmail.com>
 <20190804001429.51451-4-aduskett@gmail.com>
Message-ID: <d1e87526-091f-0090-ead3-f519a7e0b962@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 04/08/2019 02:14, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> From: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/meson/meson/
> 
> Meson exports a bunch of PKG_CONFIG_ variables which causes a double prefix for
> the staging python include directory.

 For obvious reasons, I don't like patching a completely unrelated package.

 It is true that this patch is valid in the Buildroot context (though it could
be explained a little better, I'll do that below). However, since I really don't
like patching packages, I've found an alternative solution: we can do the same
environment variable hacks for meson as we do in pkg-python. I'll send a patch
later, to replace this one. Could you give that a spin an submit a v14?

 Here's the proposed addition to the commit message (in case we do need to keep
this patch):

--------
In the Buildroot context, using the PKG_CONFIG_LIBDIR from Python's sysconfig is
never appropriate. The sysconfig's LIBPC is set to $(HOST_DIR)/lib/pkgconfig,
because we use host python even when building for the target. Thus, for target
builds, using that value is clearly wrong. For host builds, it is correct, but
for host builds we anyway already pass PKG_CONFIG_LIBDIR in the environment.

Meson uses the following order of evaluation for pkg-config (taken from meson's
commit ab01db177):
  1. use `pkg-config` with `PKG_CONFIG_LIBDIR=LIBPC` from python
  2. use plain `PKG_CONFIG_{LIBDIR,PATH}` from the environment
  3. try to extract the information from SYSCONFIG

It could be argued that 1 and 2 should be swapped (if PKG_CONFIG_* is passed in
the environment, it should override whatever preconfigured defaults are set
somewhere). However, that still wouldn't save us in Buildroot, because we don't
set PKG_CONFIG_LIBDIR in the environment for target builds; we only do that for
host builds.

Therefore, the only solution is patch meson in a non-upstreamable way to ignore
the LIBPC value from Python's sysconfig.
-------

> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v11 -> v12:
>   - Remove accidental copy and paste in the commit message.
> 
> Changes v1 -> v11:
>   - Add this patch to the series
> 
>  ...-environment-when-calling-pkg-config.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch
> 
> diff --git a/package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch b/package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch
> new file mode 100644
> index 0000000000..a72be80bae
> --- /dev/null
> +++ b/package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch
> @@ -0,0 +1,48 @@
> +From 3cb2c811dc6d4890342afa5b709cd30cf7b8f3ca Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 19 Nov 2018 14:24:26 +0100
> +Subject: [PATCH] python module: do not manipulate the environment when calling pkg-config
> +
> +From: https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-devtools/meson/meson/
> +
> +Meson exports a bunch of PKG_CONFIG_ variables which causes a double prefix to
> +the python include directory.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +
> +---
> + mesonbuild/modules/python.py | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
> +index 9cfbd6f..3ff687a 100644
> +--- a/mesonbuild/modules/python.py
> ++++ b/mesonbuild/modules/python.py
> +@@ -76,11 +76,6 @@ class PythonDependency(ExternalDependency):
> +                 old_pkg_libdir = os.environ.get('PKG_CONFIG_LIBDIR')
> +                 old_pkg_path = os.environ.get('PKG_CONFIG_PATH')

 These are not used any more so they can also be removed.


 Regards,
 Arnout

> + 
> +-                os.environ.pop('PKG_CONFIG_PATH', None)
> +-
> +-                if pkg_libdir:
> +-                    os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
> +-
> +                 try:
> +                     self.pkgdep = PkgConfigDependency('python-{}'.format(pkg_version), environment, kwargs)
> +                     mlog.debug('Found "python-{}" via pkgconfig lookup in LIBPC ({})'.format(pkg_version, pkg_libdir))
> +@@ -89,13 +84,6 @@ class PythonDependency(ExternalDependency):
> +                     mlog.debug('"python-{}" could not be found in LIBPC ({})'.format(pkg_version, pkg_libdir))
> +                     mlog.debug(e)
> + 
> +-                if old_pkg_path is not None:
> +-                    os.environ['PKG_CONFIG_PATH'] = old_pkg_path
> +-
> +-                if old_pkg_libdir is not None:
> +-                    os.environ['PKG_CONFIG_LIBDIR'] = old_pkg_libdir
> +-                else:
> +-                    os.environ.pop('PKG_CONFIG_LIBDIR', None)
> +             else:
> +                 mlog.debug('"python-{}" could not be found in LIBPC ({}), this is likely due to a relocated python installation'.format(pkg_version, pkg_libdir))
> + 
> 
