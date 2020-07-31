From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 31 Jul 2020 10:56:40 -0700
Subject: [Buildroot] [PATCH 2/2] package/setools: install for
 host-python3
In-Reply-To: <20200728092657.2354762-2-fontaine.fabrice@gmail.com>
References: <20200728092657.2354762-1-fontaine.fabrice@gmail.com>
 <20200728092657.2354762-2-fontaine.fabrice@gmail.com>
Message-ID: <CAFSsvmqoQQyPbdub2a+kud7pAxOtiLiQLh0-wwRrbUfEk=JkwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

Tested-by: Adam Duskett <Aduskett@gmail.com>

On Tue, Jul 28, 2020 at 2:27 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> setools needs python3 since version 4.2.0 and
> https://github.com/SELinuxProject/setools/commit/e292a77c52ed882707c8d165e77914837367313f
>
> However today in Buildroot, when no target python is selected, or when
> BR2_PACKAGE_PYTHON=y, all host python modules are installed for
> host-python, i.e Python 2. But this module won't install in Python 2,
> so let's force its host variant to be installed with Python 3 on the
> host. Of course, for that to work, its dependency must also be built
> for host-python3, so we change it to the newly introduced
> host-python3-cython package.
>
> Fixes:
>  - http://autobuild.buildroot.org/results/c2febcea5fbd8a21709721524ae9e9b5fc0896f9
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/setools/Config.in  | 2 +-
>  package/setools/setools.mk | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/setools/Config.in b/package/setools/Config.in
> index b26029a162..3ab7f55948 100644
> --- a/package/setools/Config.in
> +++ b/package/setools/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_SETOOLS
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_USE_WCHAR
>         depends on BR2_USE_MMU
> -       depends on BR2_PACKAGE_PYTHON3 # python-networkx
> +       depends on BR2_PACKAGE_PYTHON3
>         select BR2_PACKAGE_PYTHON_NETWORKX # runtime
>         select BR2_PACKAGE_PYTHON_SETUPTOOLS
>         select BR2_PACKAGE_LIBSELINUX
> diff --git a/package/setools/setools.mk b/package/setools/setools.mk
> index 24da3613c4..c1a3a909cb 100644
> --- a/package/setools/setools.mk
> +++ b/package/setools/setools.mk
> @@ -11,7 +11,8 @@ SETOOLS_INSTALL_STAGING = YES
>  SETOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
>  SETOOLS_LICENSE_FILES = COPYING COPYING.GPL COPYING.LGPL
>  SETOOLS_SETUP_TYPE = setuptools
> -HOST_SETOOLS_DEPENDENCIES = host-python-cython host-libselinux host-libsepol host-python-networkx
> +HOST_SETOOLS_DEPENDENCIES = host-python3-cython host-libselinux host-libsepol host-python-networkx
> +HOST_SETOOLS_NEEDS_HOST_PYTHON = python3
>
>  define SETOOLS_FIX_SETUP
>         # By default, setup.py will look for libsepol.a in the host machines
> --
> 2.27.0
>
