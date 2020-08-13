From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2020 22:45:40 +0200
Subject: [Buildroot] [PATCH] libbacktrace: new package
In-Reply-To: <20200813201123.609907-1-avraham.shukron@gmail.com>
References: <20200813201123.609907-1-avraham.shukron@gmail.com>
Message-ID: <20200813204540.GJ13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avi, All,

On 2020-08-13 23:11 +0300, Avi Shukron spake thusly:
> libbacktrace is a C library that may be linked into a C/C++ program to
> produce symbolic backtraces.

Thanks for this patch. See below for some comments.

> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/libbacktrace/Config.in         |  7 +++++++
>  package/libbacktrace/libbacktrace.hash |  3 +++
>  package/libbacktrace/libbacktrace.mk   | 16 ++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/libbacktrace/Config.in
>  create mode 100644 package/libbacktrace/libbacktrace.hash
>  create mode 100644 package/libbacktrace/libbacktrace.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index d7e79f4795..cf65919091 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -179,6 +179,7 @@ menu "Development tools"
>  	source "package/subversion/Config.in"
>  	source "package/tree/Config.in"
>  	source "package/yasm/Config.in"
> +	source "package/libbacktrace/Config.in"

Keep alphabetical ordering. This can be verified with:

    $ make check-package
    package/Config.in:182: Packages in: menu "Development tools",
                           are not alphabetically ordered;
                           correct order: '-', '_', digits, capitals, lowercase;
                           first incorrect package: libbacktrace

[--SNIP--]
> diff --git a/package/libbacktrace/libbacktrace.hash b/package/libbacktrace/libbacktrace.hash
> new file mode 100644
> index 0000000000..9c73990677
> --- /dev/null
> +++ b/package/libbacktrace/libbacktrace.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  LICENSE
> +sha256 13072c499c76866c188beaf3d50f3dddbf2c27ed9fd72b33d1b857acd33b1cb5  9b7f216e867916594d81e8b6118f092ac3fcf704.tar.gz

It is customary that we put the licenses after the source archives.

> diff --git a/package/libbacktrace/libbacktrace.mk b/package/libbacktrace/libbacktrace.mk
> new file mode 100644
> index 0000000000..4179295cea
> --- /dev/null
> +++ b/package/libbacktrace/libbacktrace.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libbacktrace
> +#
> +################################################################################
> +
> +LIBBACKTRACE_VERSION = 9b7f216e867916594d81e8b6118f092ac3fcf704
> +LIBBACKTRACE_SITE = https://github.com/ianlancetaylor/libbacktrace/archive
> +LIBBACKTRACE_SOURCE = $(LIBBACKTRACE_VERSION).tar.gz

You should use the github helper macro, as this provides a better named
archive, and thus you do not need to set the _SOURCE variable either:

    LIBBACTRACE_SITE = $(call github,ianlancetaylor,libbacktrace,$(LIBBACKTRACE_VERSION))

> +LIBBACKTRACE_LICENSE = BSD

There are a lot of "BSD" license, so we want to have the exact one. The
closest would be BSD-3C, but the wording of the third bullet point is
slightly different, so it is not exactly BSD-3C.

I think we can list it as:

    LIBBACKTRACE_LICENSE = BSD-3C-like

Care to fix those and respin, please?

Regards,
Yann E. MORIN.

> +LIBBACKTRACE_LICENSE_FILES = LICENSE
> +
> +LIBBACKTRACE_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
