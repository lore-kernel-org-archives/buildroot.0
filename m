From: John Keeping <john@metanate.com>
Date: Thu, 25 Mar 2021 13:07:26 +0000
Subject: [Buildroot] [PATCH] package/ca-certificates: always use
 host-python3
In-Reply-To: <20210325124616.153411-1-john@metanate.com>
References: <20210325124616.153411-1-john@metanate.com>
Message-ID: <20210325130726.4d213d5c.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Mar 2021 12:46:16 +0000
John Keeping <john@metanate.com> wrote:

> When no Python package is selected for the target, ca-certificate
> defaults to host-python (as opposed to host-python3).  However, with
> many packages using the meson build system, which requires host-python3,
> it is likely that this results in both Python 2 and Python 3 being built
> for the host.
> 
> One option would be to flip the default to use host-python3 when no
> target Python package is selected, but Python 2 is no longer supported
> and the package is marked as deprecated so it makes sense to just
> require host-python3 here.

I did some extra testing after sending this (I know it's the wrong
order...) and it seems that the host-python3 support in ca-certificates
is broken.

ca-certificates does indeed build with Python 3, but mozilla/Makefile
runs the command:

	python certdata2pem.py

but host-python3 doesn't install a "python" command, so it falls back to
the system Python.

This is patched upstream by [1] which switches across to Python 3, so
it's probably best to drop this and wait for the next package bump,
unless we want to backport that change.

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/55f449b221ce215f7037507822cbd4f4b67af7b4

> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  package/ca-certificates/ca-certificates.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index 5c24d4be49..86e64f4270 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -7,11 +7,7 @@
>  CA_CERTIFICATES_VERSION = 20200601
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
>  CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20200602T145955Z/pool/main/c/ca-certificates
> -CA_CERTIFICATES_DEPENDENCIES = host-openssl
> -# ca-certificates can be built with either python 2 or python 3
> -# but it must be at least python 2.7
> -CA_CERTIFICATES_DEPENDENCIES += \
> -	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
> +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
>  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
>  
