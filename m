From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 25 Aug 2020 09:41:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: new package
In-Reply-To: <20200824214857.4090659-1-joseph.kogut@gmail.com>
References: <20200824214857.4090659-1-joseph.kogut@gmail.com>
Message-ID: <CALFsTFUuBM9uJKo9Gz4jx2PV3TwwuJs5gcKySrTJih21ZHyt7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Aug 25, 2020 at 12:49 AM Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  DEVELOPERS                               |  1 +
>  package/Config.in                        |  1 +
>  package/python-pycups/Config.in          |  7 +++++++
>  package/python-pycups/python-pycups.hash |  5 +++++
>  package/python-pycups/python-pycups.mk   | 15 +++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-pycups/Config.in
>  create mode 100644 package/python-pycups/python-pycups.hash
>  create mode 100644 package/python-pycups/python-pycups.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index bba3fd6029..74e05d640a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1385,6 +1385,7 @@ F:        package/libnss/
>  F:     package/lld/
>  F:     package/llvm/
>  F:     package/python-cython/
> +F:     package/python-pycups/
>  F:     package/python-raven/
>  F:     package/python-schedule/
>  F:     package/python-sentry-sdk/
> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4795..61a5ec8dc9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1080,6 +1080,7 @@ menu "External python modules"
>         source "package/python-pycli/Config.in"
>         source "package/python-pycparser/Config.in"
>         source "package/python-pycryptodomex/Config.in"
> +       source "package/python-pycups/Config.in"
>         source "package/python-pydal/Config.in"
>         source "package/python-pydantic/Config.in"
>         source "package/python-pyelftools/Config.in"
> diff --git a/package/python-pycups/Config.in b/package/python-pycups/Config.in
> new file mode 100644
> index 0000000000..eeaf70c9e6
> --- /dev/null
> +++ b/package/python-pycups/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYCUPS
According to the README in the repository, Python3 is required for
this package so you should add:
depends on BR2_PACKAGE_PYTHON3

> +       bool "python-pycups"
> +       depends on BR2_PACKAGE_CUPS
Since this package wraps the CUPS API and uses the cups package, you
should select BR2_PACKAGE_CUPS instead of depending on it (and add the
additional "depends on" sections from cups).

> +       help
> +         Python bindings for libcups.
> +
> +         https://github.com/zdohnal/pycups
> diff --git a/package/python-pycups/python-pycups.hash b/package/python-pycups/python-pycups.hash
> new file mode 100644
> index 0000000000..d1498b61cf
> --- /dev/null
> +++ b/package/python-pycups/python-pycups.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/pycups/json
> +md5  41eef188b86d01ccfdbaaa05cf0f6ca4  pycups-2.0.1.tar.gz
> +sha256  57434ce5f62548eb12949ca8217f066f4eeb21a5d6ab8b13471dce350e380c90  pycups-2.0.1.tar.gz
> +# Locally computed sha256 checksums
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/python-pycups/python-pycups.mk b/package/python-pycups/python-pycups.mk
> new file mode 100644
> index 0000000000..7572040325
> --- /dev/null
> +++ b/package/python-pycups/python-pycups.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-pycups
> +#
> +################################################################################
> +
> +PYTHON_PYCUPS_VERSION = 2.0.1
> +PYTHON_PYCUPS_SOURCE = pycups-$(PYTHON_PYCUPS_VERSION).tar.gz
> +PYTHON_PYCUPS_SITE = https://files.pythonhosted.org/packages/0c/bb/82546806a86dc16f5eeb76f62ffdc42cce3d43aacd4e25a8b5300eec0263
> +PYTHON_PYCUPS_SETUP_TYPE = distutils
> +PYTHON_PYCUPS_LICENSE = GNU General Public License (GPL)
GPL is actually a series of licenses, so you should state the specific type.
In this case, you can do:
PYTHON_PYCUPS_LICENSE = GPL-2.0

> +PYTHON_PYCUPS_LICENSE_FILES = COPYING
> +PYTHON_PYCUPS_DEPENDENCIES = cups
> +
> +$(eval $(python-package))
> --
> 2.28.0
>
Best regards,
Asaf.
