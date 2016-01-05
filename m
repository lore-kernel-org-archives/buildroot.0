From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 5 Jan 2016 16:40:12 +0100
Subject: [Buildroot] [PATCH v2 3/3] python-cffi: add host variant
In-Reply-To: <1451978244-15878-4-git-send-email-yegorslists@googlemail.com>
References: <1451978244-15878-1-git-send-email-yegorslists@googlemail.com>
 <1451978244-15878-4-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_ksVRyLz6Zi+-Lkz0NYi0ZEJMbHrP1TSY9ZnX4Mxe_gtfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Yann,

On Tue, Jan 5, 2016 at 8:17 AM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Host variant is needed to cross-compile CFFI based C library wrappers.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
>         v2: add host-libffi dependency
>
>  package/python-cffi/python-cffi.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
> index 70fbe02..02c969b 100644
> --- a/package/python-cffi/python-cffi.mk
> +++ b/package/python-cffi/python-cffi.mk
> @@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
>  PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
>  PYTHON_CFFI_LICENSE = MIT
>  PYTHON_CFFI_LICENSE_FILES = LICENSE
> +HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser host-libffi
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --

I have now following theory regarding checking dependencies in target
and host variant.

If you look at python-tornado's setup.py file [1], you see, that they
say, install_requires will be checked only for setuptools. This is
also the case for host-python-cffi. The target variant will be
installed with --single-version-externally-managed option, that
performs "old-style" install [2] [3], i.e. without checking
install_requires.

That's my understanding for now.

[1] https://github.com/tornadoweb/tornado/blob/master/setup.py#L126
[2] https://pythonhosted.org/setuptools/setuptools.html
[3] https://bitbucket.org/pypa/setuptools/src/e517fced669d54bcaf3da2d8ca468d29120fedfc/setuptools/command/install.py?at=default&fileviewer=file-view-default#install.py-58

Yegor
