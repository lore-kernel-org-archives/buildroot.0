From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 14 Jul 2017 08:49:50 +0200
Subject: [Buildroot] [PATCH 2/3] python-gevent: new package
In-Reply-To: <20170714053800.20007-2-alexey.roslyakov@gmail.com>
References: <20170714053800.20007-1-alexey.roslyakov@gmail.com>
 <20170714053800.20007-2-alexey.roslyakov@gmail.com>
Message-ID: <CAGm1_ktwHF8QKruJn80bWNr4pBigOsYrvdZsAjJcPbt7tat+=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Fri, Jul 14, 2017 at 7:37 AM, Alexey Roslyakov
<alexey.roslyakov@gmail.com> wrote:
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
> ---
>  package/Config.in                            |  1 +

DEVELOPERS entry missing.

>  package/python-gevent/0001-reraise-py3.patch |  8 ++++++++
>  package/python-gevent/Config.in              |  7 +++++++
>  package/python-gevent/python-gevent.hash     |  3 +++
>  package/python-gevent/python-gevent.mk       | 14 ++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/python-gevent/0001-reraise-py3.patch
>  create mode 100644 package/python-gevent/Config.in
>  create mode 100644 package/python-gevent/python-gevent.hash
>  create mode 100644 package/python-gevent/python-gevent.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e09327168b..9b4872400b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -737,6 +737,7 @@ menu "External python modules"
>         source "package/python-flask-login/Config.in"
>         source "package/python-flup/Config.in"
>         source "package/python-futures/Config.in"
> +       source "package/python-gevent/Config.in"
>         source "package/python-gobject/Config.in"
>         source "package/python-greenlet/Config.in"
>         source "package/python-gunicorn/Config.in"
> diff --git a/package/python-gevent/0001-reraise-py3.patch b/package/python-gevent/0001-reraise-py3.patch
> new file mode 100644
> index 0000000000..31c8c7d0a3
> --- /dev/null
> +++ b/package/python-gevent/0001-reraise-py3.patch

a patch needs your Signed-off-by tag and also proper description

> @@ -0,0 +1,8 @@
> +--- python-gevent-1.2.2/src/gevent/_util_py2.py.old    2017-07-13 14:18:24.328098752 +0700
> ++++ python-gevent-1.2.2/src/gevent/_util_py2.py        2017-07-13 14:18:29.008098650 +0700
> +@@ -4,4 +4,4 @@
> +
> +
> + def reraise(type, value, tb):
> +-    raise type, value, tb
> ++    raise (type, value, tb)
> diff --git a/package/python-gevent/Config.in b/package/python-gevent/Config.in
> new file mode 100644
> index 0000000000..489099c2aa
> --- /dev/null
> +++ b/package/python-gevent/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_GEVENT
> +       bool "python-gevent"
> +       select BR2_PACKAGE_PYTHON_GREENLET

requires # runtime tag

> +       help
> +         Coroutine-based network library
> +
> +         https://pypi.python.org/pypi/greenlet/

http://www.gevent.org/

> diff --git a/package/python-gevent/python-gevent.hash b/package/python-gevent/python-gevent.hash
> new file mode 100644
> index 0000000000..2ef2a2bd5f
> --- /dev/null
> +++ b/package/python-gevent/python-gevent.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=7f0baf355384fe5ff2ecf66853422554, sha256 locally computed

# md5 from https://pypi.python.org/pypi/gevent/json, sha256 locally computed

> +md5       7f0baf355384fe5ff2ecf66853422554 gevent-1.2.2.tar.gz
> +sha256 4791c8ae9c57d6f153354736e1ccab1e2baf6c8d9ae5a77a9ac90f41e2966b2d gevent-1.2.2.tar.gz
> diff --git a/package/python-gevent/python-gevent.mk b/package/python-gevent/python-gevent.mk
> new file mode 100644
> index 0000000000..b6b1a19d9c
> --- /dev/null
> +++ b/package/python-gevent/python-gevent.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-gevent
> +#
> +################################################################################
> +
> +PYTHON_GEVENT_VERSION = 1.2.2
> +PYTHON_GEVENT_SOURCE = gevent-$(PYTHON_GEVENT_VERSION).tar.gz
> +PYTHON_GEVENT_SITE = https://pypi.python.org/packages/1b/92/b111f76e54d2be11375b47b213b56687214f258fd9dae703546d30b837be
> +PYTHON_GEVENT_LICENSE = MIT
> +PYTHON_GEVENT_LICENSE_FILES = LICENSE
> +PYTHON_GEVENT_SETUP_TYPE = setuptools

Yegor
