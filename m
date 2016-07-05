From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 5 Jul 2016 16:00:29 +0200
Subject: [Buildroot] [PATCH] circus: new package
In-Reply-To: <1467639187-23454-1-git-send-email-yegorslists@googlemail.com>
References: <1467639187-23454-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGduivznsbcMDSDkqRDGTFSaAvPnVOPrSt7uTH77pjww0vVs_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor, all

On Mon, Jul 4, 2016 at 3:33 PM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in          |  3 +++
>  package/circus/Config.in   | 21 +++++++++++++++++++++
>  package/circus/circus.hash |  4 ++++
>  package/circus/circus.mk   | 14 ++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 package/circus/Config.in
>  create mode 100644 package/circus/circus.hash
>  create mode 100644 package/circus/circus.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 67810b0..ba55d1d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1677,6 +1677,9 @@ menu "System tools"
>         source "package/audit/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>         source "package/bootutils/Config.in"
> +endif
> +       source "package/circus/Config.in"
> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
There's a bug here, and we don't have this kind of if in the main
'Config.in' anyway, you can remove it or it can be fixed during the
merge.
Also I am wondering, I see that circus can be used as daemon (and I
think it might be it's most common usage) it would be nice if you
could provide an init script (even better if you want to provide a
service file), but none of this is mandatory, your patch can be
applied as is and the init script can be added later on.

Other than that:

Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

>         source "package/coreutils/Config.in"
>  endif
>         source "package/cpuload/Config.in"
> diff --git a/package/circus/Config.in b/package/circus/Config.in
> new file mode 100644
> index 0000000..476a53e
> --- /dev/null
> +++ b/package/circus/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_CIRCUS
> +       bool "circus"
> +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +       depends on BR2_USE_WCHAR # zeromq
> +       depends on BR2_INSTALL_LIBSTDCPP # zeromq
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> +       select BR2_PACKAGE_PYTHON_IOWAIT # runtime
> +       select BR2_PACKAGE_PYTHON_PSUTIL # runtime
> +       select BR2_PACKAGE_PYTHON_PYZMQ # runtime
> +       select BR2_PACKAGE_PYTHON_TORNADO # runtime
> +       select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> +       help
> +         Circus is a program that will let you run and watch multiple
> +         processes and sockets.
> +
> +         https://circus.readthedocs.org/en/latest/
> +
> +comment "circus needs a toolchain w/ C++, wchar, threads and Python2/3"
> +       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
> +               BR2_TOOLCHAIN_HAS_THREADS && (BR2_PACKAGE_PYTHON || \
> +               BR2_PACKAGE_PYTHON3))
> diff --git a/package/circus/circus.hash b/package/circus/circus.hash
> new file mode 100644
> index 0000000..01994f4
> --- /dev/null
> +++ b/package/circus/circus.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/circus/json
> +md5    cddd4a8844907d8b6b402ca9c713d176  circus-0.13.0.tar.gz
> +# sha256 calculated by scanpypi
> +sha256 6201800a5fb05144b5e6c5ac9eb901b914305e8beaeb01f8edf54ab6ab1a295a  circus-0.13.0.tar.gz
> diff --git a/package/circus/circus.mk b/package/circus/circus.mk
> new file mode 100644
> index 0000000..a7693bd
> --- /dev/null
> +++ b/package/circus/circus.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# circus
> +#
> +################################################################################
> +
> +CIRCUS_VERSION = 0.13.0
> +CIRCUS_SOURCE = circus-$(CIRCUS_VERSION).tar.gz
> +CIRCUS_SITE = https://pypi.python.org/packages/source/c/circus
> +CIRCUS_SETUP_TYPE = setuptools
> +CIRCUS_LICENSE = Apache-2.0
> +CIRCUS_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.8.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
