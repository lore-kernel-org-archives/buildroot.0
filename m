From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 2 May 2019 10:41:11 +0200
Subject: [Buildroot] [PATCH 7/7] package/python-bcc: new package
In-Reply-To: <1556785210-18237-8-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1556785210-18237-8-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <CAGm1_kupWu3EyQWT7EkUVC0ZQ1286LFTana=i5tbkV3cfiMGpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jugurtha,

On Thu, May 2, 2019 at 10:20 AM Jugurtha BELKALEM
<jugurtha.belkalem@smile.fr> wrote:
>
> bcc python wrapper required by bcc to
> work properly.
>
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> ---
>  package/Config.in                  |  1 +
>  package/python-bcc/Config.in       | 11 +++++++++++
>  package/python-bcc/python-bcc.hash |  3 +++
>  package/python-bcc/python-bcc.mk   | 15 +++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/python-bcc/Config.in
>  create mode 100644 package/python-bcc/python-bcc.hash
>  create mode 100644 package/python-bcc/python-bcc.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 8d16a09..b2fa28d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -833,6 +833,7 @@ menu "External python modules"
>         source "package/python-backports-abc/Config.in"
>         source "package/python-backports-shutil-get-terminal-size/Config.in"
>         source "package/python-backports-ssl-match-hostname/Config.in"
> +       source "package/python-bcc/Config.in"
>         source "package/python-bcrypt/Config.in"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bitstring/Config.in"
> diff --git a/package/python-bcc/Config.in b/package/python-bcc/Config.in
> new file mode 100644
> index 0000000..d2200e8
> --- /dev/null
> +++ b/package/python-bcc/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_BCC
> +       bool "python-bcc"
> +       depends on BR2_PACKAGE_PYTHON3
> +       select BR2_PACKAGE_AUDIT # requires ausyscall
> +       select BR2_PACKAGE_PYTHON_PYTEST_RUNNER

See *.mk comments.

> +       select BR2_PACKAGE_PYTHON_TRAITLETS
> +       select BR2_PACKAGE_PYTHON_TRAITTYPES
> +       help
> +         Python3 wrappers for BPF Compiler Collection (BCC)

"." is missing at the end of the sentence.

> +
> +         https://pypi.org/project/bcc/
> diff --git a/package/python-bcc/python-bcc.hash b/package/python-bcc/python-bcc.hash
> new file mode 100644
> index 0000000..29caac9
> --- /dev/null
> +++ b/package/python-bcc/python-bcc.hash
> @@ -0,0 +1,3 @@
> +# locally calculated
> +sha256 a6f41ae67a8b697979d26bbc719fc9ea1b8bb47bdebb44b08fc0d5d308ae12b3  bcc-0.1.10.tar.gz
> +sha256 c6386f8304dfdbfc5184f2f01c9b9f45c7cef27cf4ffdf9e138372487f7a9c2b  LICENSE
> diff --git a/package/python-bcc/python-bcc.mk b/package/python-bcc/python-bcc.mk
> new file mode 100644
> index 0000000..84f894e
> --- /dev/null
> +++ b/package/python-bcc/python-bcc.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-bcc
> +#
> +################################################################################
> +
> +PYTHON_BCC_VERSION = 0.1.10
> +PYTHON_BCC_SOURCE = bcc-$(PYTHON_BCC_VERSION).tar.gz
> +PYTHON_BCC_SITE = https://files.pythonhosted.org/packages/38/dc/3ca34874926789f8df53f3c1d1c38e77ebf876f43760e8745316bb8bd1c0
> +PYTHON_BCC_LICENSE = Apache License

Apache-2.0

> +PYTHON_BCC_LICENSE_FILES = LICENSE
> +PYTHON_BCC_SETUP_TYPE = setuptools
> +PYTHON_BCC_DEPENDENCIES = host-python-pytest-runner

This should be fixed upstream. See
https://github.com/thombashi/DataProperty/pull/20

Yegor

> +
> +$(eval $(python-package))
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
