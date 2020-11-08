From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 8 Nov 2020 12:06:07 -0800
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 8.0.1
In-Reply-To: <20201108154148.940813-1-angelo@amarulasolutions.com>
References: <20201108154148.940813-1-angelo@amarulasolutions.com>
Message-ID: <CAFSsvmrhsffVc2SximKS0i6c_G+2C3hh541jrE3jkLjiU7op+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

all;

Tested-by: Adam Duskett <aduskett@gmail.com>

On Sun, Nov 8, 2020 at 7:42 AM Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
>
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Bumping the package requires two fixes:
> * pillow looks for header files in paths returned by pkg-config.
>   On buildroot, pkg-config returns nothing if PKG_CONFIG_ALLOW_SYSTEM_CFLAGS
>   is disabled.
> * png is the default pillow image format and png format is working only
>   if python zlib module is available.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-pillow/Config.in          |  1 +
>  package/python-pillow/python-pillow.hash |  3 +--
>  package/python-pillow/python-pillow.mk   | 13 ++++---------
>  3 files changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
> index f98a4a9e5b..ae6d8c8346 100644
> --- a/package/python-pillow/Config.in
> +++ b/package/python-pillow/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PILLOW
>         bool "python-pillow"
>         depends on BR2_PACKAGE_PYTHON3
>         select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
> +       select BR2_PACKAGE_PYTHON3_ZLIB
>         help
>           Pillow is the "friendly" PIL fork by Alex Clark and
>           Contributors. PIL is the Python Imaging Library by Fredrik
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index f80b79fe5f..0849577f66 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,5 +1,4 @@
>  # md5, sha256 from https://pypi.org/project/Pillow/
> -md5    f1f7592c51260e5080d3cd71781ea675  Pillow-7.1.2.tar.gz
> -sha256 97f9e7953a77d5a70f49b9a48da7776dc51e9b738151b22dacf101641594a626  Pillow-7.2.0.tar.gz
> +sha256 11c5c6e9b02c9dac08af04f093eb5a2f84857df70a7d4a6a6ad461aca803fb9e  Pillow-8.0.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256 37de42abe33a247e8f03d2313657a0f174a239a198f526add6544ff3e2643b81  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 931dce53d2..60a0bb3e1b 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -PYTHON_PILLOW_VERSION = 7.2.0
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/3e/02/b09732ca4b14405ff159c470a612979acfc6e8645dc32f83ea0129709f7a
> +PYTHON_PILLOW_VERSION = 8.0.1
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/2b/06/93bf1626ef36815010e971a5ce90f49919d84ab5d2fa310329f843a74bc1
>  PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>  PYTHON_PILLOW_LICENSE = PIL Software License
>  PYTHON_PILLOW_LICENSE_FILES = LICENSE
> @@ -47,15 +47,9 @@ else
>  PYTHON_PILLOW_BUILD_OPTS += --disable-webp
>  endif
>
> -ifeq ($(BR2_PACKAGE_ZLIB),y)
> -PYTHON_PILLOW_DEPENDENCIES += zlib
> -PYTHON_PILLOW_BUILD_OPTS += --enable-zlib
> -else
> -PYTHON_PILLOW_BUILD_OPTS += --disable-zlib
> -endif
> -
>  define PYTHON_PILLOW_BUILD_CMDS
>         cd $(PYTHON_PILLOW_BUILDDIR); \
> +               PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>                 $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>                 $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>                 $(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
> @@ -63,6 +57,7 @@ endef
>
>  define PYTHON_PILLOW_INSTALL_TARGET_CMDS
>         cd $(PYTHON_PILLOW_BUILDDIR); \
> +               PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
>                 $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>                 $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>                 $(PYTHON_PILLOW_BUILD_OPTS) install \
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
