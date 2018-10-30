From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 30 Oct 2018 21:41:57 +0100
Subject: [Buildroot] [PATCH 1/1] python-uvloop: new package
In-Reply-To: <20181012063757.10382-1-asafka7@gmail.com>
References: <20181012063757.10382-1-asafka7@gmail.com>
Message-ID: <CAGm1_kui5hA6zPaFVMcofsiDqRzAYNLRrRYyggQRu=F+v38mXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

On Fri, Oct 12, 2018 at 8:38 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Fast implementation of asyncio event loop on top of libuv.
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  DEVELOPERS                               |  1 +

DEVELOPERS entry is not needed any longer.

Other then that you can add my

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor

>  package/Config.in                        |  1 +
>  package/python-uvloop/Config.in          | 18 ++++++++++++++++++
>  package/python-uvloop/python-uvloop.hash |  6 ++++++
>  package/python-uvloop/python-uvloop.mk   | 17 +++++++++++++++++
>  5 files changed, 43 insertions(+)
>  create mode 100644 package/python-uvloop/Config.in
>  create mode 100644 package/python-uvloop/python-uvloop.hash
>  create mode 100644 package/python-uvloop/python-uvloop.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 990621fb11..9ea79bcfaf 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -233,6 +233,7 @@ F:  package/python-txtorcon/
>  F:     package/python-twisted/
>  F:     package/python-u-msgpack/
>  F:     package/python-ubjson/
> +F:     package/python-uvloop/
>  F:     package/python-yieldfrom/
>  F:     package/python-zope-interface/
>  F:     package/zeromq/
> diff --git a/package/Config.in b/package/Config.in
> index 8d995f82e6..0bdedacd53 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1045,6 +1045,7 @@ menu "External python modules"
>         source "package/python-ujson/Config.in"
>         source "package/python-urllib3/Config.in"
>         source "package/python-urwid/Config.in"
> +       source "package/python-uvloop/Config.in"
>         source "package/python-validators/Config.in"
>         source "package/python-versiontools/Config.in"
>         source "package/python-visitor/Config.in"
> diff --git a/package/python-uvloop/Config.in b/package/python-uvloop/Config.in
> new file mode 100644
> index 0000000000..17c50e6a93
> --- /dev/null
> +++ b/package/python-uvloop/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_PYTHON_UVLOOP
> +       bool "python-uvloop"
> +       depends on BR2_PACKAGE_PYTHON3
> +       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +       depends on BR2_USE_MMU # libuv
> +       depends on !BR2_STATIC_LIBS # libuv
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> +       select BR2_PACKAGE_LIBUV
> +       select BR2_PACKAGE_PYTHON3_SSL
> +       help
> +         Fast implementation of asyncio event loop on top of libuv.
> +
> +         http://github.com/MagicStack/uvloop
> +
> +comment "python-uvloop needs a toolchain w/ NPTL, dynamic library"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +       depends on BR2_USE_MMU
> +       depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
> new file mode 100644
> index 0000000000..ac65fbaaca
> --- /dev/null
> +++ b/package/python-uvloop/python-uvloop.hash
> @@ -0,0 +1,6 @@
> +# md5, sha256 from https://pypi.org/pypi/uvloop/json
> +md5    7d509d78b18a5863cc06697ccfd835ad  uvloop-0.11.2.tar.gz
> +sha256 a97bd62ebbdf7e6e84bf44afe439d9b24ce4d8661a29a639626a8c03748f6f98  uvloop-0.11.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256 2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
> +sha256 9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
> diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
> new file mode 100644
> index 0000000000..a835a9952b
> --- /dev/null
> +++ b/package/python-uvloop/python-uvloop.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-uvloop
> +#
> +################################################################################
> +
> +PYTHON_UVLOOP_VERSION = 0.11.2
> +PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
> +PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/5c/37/6daa39aac42b2deda6ee77f408bec0419b600e27b89b374b0d440af32b10
> +PYTHON_UVLOOP_SETUP_TYPE = setuptools
> +PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
> +PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
> +PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
> +PYTHON_UVLOOP_DEPENDENCIES = libuv
> +
> +$(eval $(python-package))
> --
> 2.17.1
>
