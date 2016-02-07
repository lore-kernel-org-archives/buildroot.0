From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 7 Feb 2016 10:26:08 +0100
Subject: [Buildroot] [PATCH v4 16/17] python-autobahn: new package
In-Reply-To: <1454799603-5474-17-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-17-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kuqJ106WRiWuD3XMdR6rr8VLhxfL4Ki7qz4_MkzunMjhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 7, 2016 at 12:00 AM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                            |  1 +
>  package/python-autobahn/Config.in            |  8 ++++++++
>  package/python-autobahn/python-autobahn.hash |  3 +++
>  package/python-autobahn/python-autobahn.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-autobahn/Config.in
>  create mode 100644 package/python-autobahn/python-autobahn.hash
>  create mode 100644 package/python-autobahn/python-autobahn.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index adb4188..0ee5577 100644
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
> index 0000000..cdb2baf
> --- /dev/null
> +++ b/package/python-autobahn/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_AUTOBAHN
> +       bool "python-autobahn"
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_TXAIO # runtime
> +       help
> +         WebSocket client Hhh server library, WAMP real-time framework.
> +
> +         https://pypi.python.org/pypi/autobahn
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

autobahn has problems being compiled to *.pyc, so also needs PYC_ONLY
dependency. This part will be invoked during pyc creation
https://github.com/crossbario/autobahn-python/blob/master/setup.py#L241
and tries to import a module, that tries to load libsodium
(cross-compikled version).

Yegor
