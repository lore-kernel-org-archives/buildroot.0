From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 11 Feb 2016 15:10:23 +0100
Subject: [Buildroot] [PATCH v5 19/20] python-autobahn: new package
In-Reply-To: <1455188328-7595-2-git-send-email-mc5686@mclink.it>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
 <1455188328-7595-2-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kuUXuWh+Sx2=vNgGuxDm1n0WCybpC2DgyV5TRwQpvXt5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 11, 2016 at 11:58 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
>
> ---
> Changes v4 -> v5
>   - added dependency from Python sources.
>
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                            |  1 +
>  package/python-autobahn/Config.in            | 11 +++++++++++
>  package/python-autobahn/python-autobahn.hash |  3 +++
>  package/python-autobahn/python-autobahn.mk   | 14 ++++++++++++++
>  4 files changed, 29 insertions(+)
>  create mode 100644 package/python-autobahn/Config.in
>  create mode 100644 package/python-autobahn/python-autobahn.hash
>  create mode 100644 package/python-autobahn/python-autobahn.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index d1d0ec7..4b92a2a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -618,6 +618,7 @@ endif
>  if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  menu "External python modules"
>         source "package/python-alsaaudio/Config.in"
> +       source "package/python-autobahn/Config.in"
>         source "package/python-backports-abc/Config.in"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bottle/Config.in"
> diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
> new file mode 100644
> index 0000000..9f5da46
> --- /dev/null
> +++ b/package/python-autobahn/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_AUTOBAHN
> +       bool "python-autobahn"
> +       depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_TXAIO # runtime
> +       help
> +         WebSocket client Hhh server library, WAMP real-time framework.
> +
> +         https://pypi.python.org/pypi/autobahn
> +comment "Currently Crossbar.io does NOT work without Python sources!"
> +       depends on BR2_PACKAGE_PYTHON_PYC_ONLY

It is actually autobahn own problem, that has nothing to do with
crossbar. It imports some python modules during setup.py and some of
them try to load arm *.so files on the host. This seems to happen only
when producing *.pyc files.

> diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
> new file mode 100644
> index 0000000..8f55ac1
> --- /dev/null
> +++ b/package/python-autobahn/python-autobahn.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b4b5445050749c1033b9b58f694f0c64, sha256 locally computed.
> +md5    b4b5445050749c1033b9b58f694f0c64  autobahn-0.12.1.tar.gz
> +sha256 664223879e159c88221f42d8d1ac6b8c4268d8b9316d8ab69a02761c5744cd79  autobahn-0.12.1.tar.gz
> diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
> new file mode 100644
> index 0000000..1d02867
> --- /dev/null
> +++ b/package/python-autobahn/python-autobahn.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-autobahn
> +#
> +################################################################################
> +
> +PYTHON_AUTOBAHN_VERSION = 0.12.1
> +PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
> +PYTHON_AUTOBAHN_SITE = http://pypi.python.org/packages/source/a/autobahn
> +PYTHON_AUTOBAHN_LICENSE = MIT
> +PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
> +PYTHON_AUTOBAHN_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
