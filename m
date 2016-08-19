From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 19 Aug 2016 13:51:03 +0200
Subject: [Buildroot] [PATCH 1/1] python-requests-toolbelt: new package
In-Reply-To: <20160819113253.4953-1-develop@manuel-voegele.de>
References: <20160819113253.4953-1-develop@manuel-voegele.de>
Message-ID: <CAGm1_kvJp-wr8FPKO965z3b5E9t_8o9Juykg6G1zZNsQY_oWBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Manuel,

On Fri, Aug 19, 2016 at 1:32 PM, Manuel V?gele
<develop@manuel-voegele.de> wrote:
> Signed-off-by: Manuel V?gele <develop@manuel-voegele.de>
> ---
>  package/Config.in                                         |  1 +
>  package/python-requests-toolbelt/Config.in                |  7 +++++++
>  .../python-requests-toolbelt.hash                         |  5 +++++
>  .../python-requests-toolbelt/python-requests-toolbelt.mk  | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-requests-toolbelt/Config.in
>  create mode 100644 package/python-requests-toolbelt/python-requests-toolbelt.hash
>  create mode 100644 package/python-requests-toolbelt/python-requests-toolbelt.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1e51a45..be89af8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -752,6 +752,7 @@ menu "External python modules"
>         source "package/python-pyyaml/Config.in"
>         source "package/python-pyzmq/Config.in"
>         source "package/python-requests/Config.in"
> +       source "package/python-requests-toolbelt/Config.in"
>         source "package/python-rpi-gpio/Config.in"
>         source "package/python-rtslib-fb/Config.in"
>         source "package/python-scapy3k/Config.in"
> diff --git a/package/python-requests-toolbelt/Config.in b/package/python-requests-toolbelt/Config.in
> new file mode 100644
> index 0000000..404179b
> --- /dev/null
> +++ b/package/python-requests-toolbelt/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_REQUESTS_TOOLBELT
> +       bool "python-requests-toolbelt"
> +       depends on BR2_PACKAGE_PYTHON_REQUESTS

use 'select' keyword instead of 'depends'

> +       help
> +         A utility belt for advanced users of python-requests.
> +
> +         https://toolbelt.readthedocs.org/
> diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
> new file mode 100644
> index 0000000..eccfd48
> --- /dev/null
> +++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
> @@ -0,0 +1,5 @@
> +# From https://pypi.python.org/pypi/requests-toolbelt/0.7.0
> +md5 bfe2009905f460f4764c32cfbbf4205f requests-toolbelt-0.7.0.tar.gz
> +
> +# Locally calculated:
> +sha256 33899d4a559c3f0f5e9fbc115d337c4236febdc083755a160a4132d92fc3c91a requests-toolbelt-0.7.0.tar.gz

please stick checksum comments to the style showed in
https://git.busybox.net/buildroot/tree/package/python-prompt-toolkit/python-prompt-toolkit.hash.
i.e. all comments in one line and refer to JSON object, so that by
bumping one won't need to touch the comment.

> diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
> new file mode 100644
> index 0000000..13063d2
> --- /dev/null
> +++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-requests-toolbelt
> +#
> +################################################################################
> +
> +PYTHON_REQUESTS_TOOLBELT_VERSION = 0.7.0
> +PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
> +PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/source/r/requests-toolbelt
> +PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
> +PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
> +PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
> +PYTHON_REQUESTS_TOOLBELT_DEPENDENCIES = python-requests

remove this line as python-requests is runtime dependency only.

Have you tried to use our scanpypi tool to add Python packages? See
http://nightly.buildroot.org/manual.html#_infrastructure_for_python_packages,
section "17.8.3. Generating a python-package from a PyPI repository"

Yegor

> +
> +$(eval $(python-package))
> --
> 2.9.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
