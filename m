From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 16:04:14 +0100
Subject: [Buildroot] [PATCH 15/22] package/python-treq: new package.
In-Reply-To: <1454335541-14224-16-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-16-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kv5wGSyATrLO1V=FHerWrpEzypqKYp7E7RiECgOoHXNCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                    |  1 +
>  package/python-treq/Config.in        | 13 +++++++++++++
>  package/python-treq/python-treq.hash |  3 +++
>  package/python-treq/python-treq.mk   | 17 +++++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 package/python-treq/Config.in
>  create mode 100644 package/python-treq/python-treq.hash
>  create mode 100644 package/python-treq/python-treq.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ffdba3b..c581cf8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -718,6 +718,7 @@ menu "External python modules"
>         source "package/python-spidev/Config.in"
>         source "package/python-thrift/Config.in"
>         source "package/python-tornado/Config.in"
> +       source "package/python-treq/Config.in"
>         source "package/python-twisted/Config.in"
>         source "package/python-urllib3/Config.in"
>         source "package/python-urwid/Config.in"
> diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
> new file mode 100644
> index 0000000..7c0fb14
> --- /dev/null
> +++ b/package/python-treq/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_TREQ
> +       bool "python-treq"
> +       depends on BR2_PACKAGE_PYTHON
> +       depends on BR2_PACKAGE_PYTHON_TWISTED

use select instead of depends for twisted

provide select statements for following packages:

"requests >= 2.1.0",
"service_identity >= 14.0.0",
"six"

> +       help
> +         treq is an HTTP library inspired by requests but written on top of Twisted's Agents.
> +         It provides a simple, higher level API for making HTTP requests when using Twisted.
> +
> +         https://github.com/twisted/treq
> +
> +comment "python-treq needs python-twisted"
> +       depends on BR2_PACKAGE_PYTHON
> +       depends on !BR2_PACKAGE_PYTHON_TWISTED
> diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
> new file mode 100644
> index 0000000..6c39ba8
> --- /dev/null
> +++ b/package/python-treq/python-treq.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    b1fb60759ad5a885cb8ea562553f2d4c  treq-15.1.0.tar.gz
> +sha256 425a47d5d52a993d51211028fb6ade252e5fbea094e878bb4b644096a7322de8  treq-15.1.0.tar.gz
> diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
> new file mode 100644
> index 0000000..89b5d19
> --- /dev/null
> +++ b/package/python-treq/python-treq.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-treq
> +#
> +################################################################################
> +
> +#PYTHON_TREQ_VERSION = master
> +#PYTHON_TREQ_SITE = $(call github,twisted,treq,$(PYTHON_TREQ_VERSION))
> +PYTHON_TREQ_VERSION = 15.1.0
> +PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
> +PYTHON_TREQ_SITE = http://pypi.python.org/packages/source/t/treq
> +PYTHON_TREQ_LICENSE = MIT
> +PYTHON_TREQ_LICENSE_FILES = LICENSE
> +PYTHON_TREQ_SETUP_TYPE = setuptools
> +PYTHON_TREQ_DEPENDENCIES = python-twisted
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
