From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Nov 2017 07:27:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] python-raven: new package
In-Reply-To: <20171109015511.24715-1-joseph.kogut@gmail.com>
References: <20171102163022.23953-1-joseph.kogut@gmail.com>
 <20171109015511.24715-1-joseph.kogut@gmail.com>
Message-ID: <CAGm1_kv4WM_9Ko=tN6psKwAcjLzXDNvHkdcMbZxz8tsmcb2Jeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 9, 2017 at 2:55 AM, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> Changes since v1:
> - reword commit to match upstream style
> - fold the DEVELOPERS modifications into the same commit
> - add Config selections for required python core modules
> - bump version to 6.3.0
>
> Tested in a clean chroot, events are generated for exceptions, and
> reported to the server configured for the client.
>
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/python-raven/Config.in         | 15 +++++++++++++++
>  package/python-raven/python-raven.hash |  3 +++
>  package/python-raven/python-raven.mk   | 14 ++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/python-raven/Config.in
>  create mode 100644 package/python-raven/python-raven.hash
>  create mode 100644 package/python-raven/python-raven.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cfbe64b0b2..8526b2c515 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -788,6 +788,7 @@ F:  board/qemu/ppc64le-pseries/
>  F:     configs/qemu_ppc64le_pseries_defconfig
>
>  N:     Joseph Kogut <joseph.kogut@gmail.com>
> +F:     package/python-raven/
>  F:     package/python-websockets/
>
>  N:     Johan Derycke <johanderycke@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index fe5ccc434e..2fe85e927f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -874,6 +874,7 @@ menu "External python modules"
>         source "package/python-pyxb/Config.in"
>         source "package/python-pyyaml/Config.in"
>         source "package/python-pyzmq/Config.in"
> +       source "package/python-raven/Config.in"
>         source "package/python-requests/Config.in"
>         source "package/python-requests-toolbelt/Config.in"
>         source "package/python-rpi-gpio/Config.in"
> diff --git a/package/python-raven/Config.in b/package/python-raven/Config.in
> new file mode 100644
> index 0000000000..f8954e085c
> --- /dev/null
> +++ b/package/python-raven/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PYTHON_RAVEN
> +       bool "python-raven"
> +       select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
> +
> +       select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3
> +
> +       select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3

Please remove newlines between selects.

> +
> +       help
> +         Raven is a client for Sentry (https://getsentry.com).
> +
> +         https://github.com/getsentry/raven-python
> diff --git a/package/python-raven/python-raven.hash b/package/python-raven/python-raven.hash
> new file mode 100644
> index 0000000000..0e0a4f56e5
> --- /dev/null
> +++ b/package/python-raven/python-raven.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/raven/json, sha256 locally computed
> +md5    2efce7acbabe1a0f32d168736a654789  raven-6.3.0.tar.gz
> +sha256 f3e465a545dcdb6a387d1fcb199d08f786ba3732d7ce6aa681718b04da6aedf1  raven-6.3.0.tar.gz

Add LICENSE checksum.

With these changes done you can add my

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Regards,
Yegor

> diff --git a/package/python-raven/python-raven.mk b/package/python-raven/python-raven.mk
> new file mode 100644
> index 0000000000..c17aac4a3d
> --- /dev/null
> +++ b/package/python-raven/python-raven.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-raven
> +#
> +################################################################################
> +
> +PYTHON_RAVEN_VERSION = 6.3.0
> +PYTHON_RAVEN_SOURCE = raven-$(PYTHON_RAVEN_VERSION).tar.gz
> +PYTHON_RAVEN_SITE = https://pypi.python.org/packages/e8/b0/27886f69cdb4d9f6265bba1c4973bb5371b060272a5795c511d8839a6028
> +PYTHON_RAVEN_SETUP_TYPE = setuptools
> +PYTHON_RAVEN_LICENSE = BSD-3-Clause
> +PYTHON_RAVEN_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.15.0
>
