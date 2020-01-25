From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jan 2020 21:04:57 +0100
Subject: [Buildroot] [PATCH 1/2] package/liboping: remove -Werror build
 flag
In-Reply-To: <20200124143609.14313-1-nroach44@gmail.com>
References: <20200124143609.14313-1-nroach44@gmail.com>
Message-ID: <CAPi7W81yAtkC3xJPL++Lb-ZP=5yja0KRy00t3ALdp2Q4EGFv6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel,

Le ven. 24 janv. 2020 ? 15:36, Nathaniel Roach <nroach44@gmail.com> a ?crit :
>
> Same as https://bugs.gentoo.org/675344 - when building, GCC
> will fail the build due to a truncation warning.
Can you be more specific on the build failure? For example, by
providing a link on autobuilder?
Otherwise, I would prefer an upstreamable solution such as adding a
--disable-werror option or adding a patch that fixes the issue.
There is a pending PR on a truncation error on upstream github:
https://github.com/octo/liboping/pull/50.
Is it related to your build failure? In this case, I would suggest to
retrieve this commit.
>
> Remove -Wall and -Werror from Makefile.am and run automake
> to apply the change
>
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/liboping/0002-no-werror.patch | 14 ++++++++++++++
>  package/liboping/liboping.mk          |  1 +
>  2 files changed, 15 insertions(+)
>  create mode 100644 package/liboping/0002-no-werror.patch
>
> diff --git a/package/liboping/0002-no-werror.patch b/package/liboping/0002-no-werror.patch
> new file mode 100644
> index 0000000000..febb2c0335
> --- /dev/null
> +++ b/package/liboping/0002-no-werror.patch
> @@ -0,0 +1,14 @@
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -2,10 +2,6 @@ AUTOMAKE_OPTIONS = foreign no-dependencies
> +
> + SUBDIRS = mans
> +
> +-if COMPILER_IS_GCC
> +-AM_CFLAGS = -Wall -Werror
> +-endif
> +-
> + include_HEADERS = oping.h
> + lib_LTLIBRARIES = liboping.la
> +
> +
> diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
> index 4aa3e30ee8..6e3530fdb0 100644
> --- a/package/liboping/liboping.mk
> +++ b/package/liboping/liboping.mk
> @@ -11,6 +11,7 @@ LIBOPING_INSTALL_STAGING = YES
>  LIBOPING_CONF_OPTS = --without-perl-bindings
>  LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
>  LIBOPING_LICENSE_FILES = COPYING
> +LIBOPING_AUTORECONF = YES
>
>  ifeq ($(BR2_PACKAGE_NCURSES),y)
>  LIBOPING_DEPENDENCIES += ncurses
> --
> 2.20.1
>
Best Regards,

Fabrice
