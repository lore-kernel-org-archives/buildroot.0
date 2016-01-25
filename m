From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 18:04:38 +0100
Subject: [Buildroot] [PATCH 01/21] libftdi: C++ bindings need boost
In-Reply-To: <1453676887-31236-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125170438.GB3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> According to libftdi configure.in:
> 
> """
> dnl libftdi C++ wrapper. Needs boost.
> [...]
>         if test "x$HAVE_BOOST" != "xyes"; then
>             AC_MSG_ERROR(Sorry, we need the boost library for the C++ wrapper)
>         fi
> """
> 
> And indeed, if you enable BR2_PACKAGE_LIBTFDI_CPP but don't have Boost
> enabled, the libfdipp library is not built. To fix this, this commit
> changes BR2_PACKAGE_LIBTFDI_CPP to select Boost.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Still, a few comments below...

> ---
>  package/libftdi/Config.in  | 9 ++++++++-
>  package/libftdi/libftdi.mk | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
> index 76b30b1..c0ab0f2 100644
> --- a/package/libftdi/Config.in
> +++ b/package/libftdi/Config.in
> @@ -12,11 +12,18 @@ config BR2_PACKAGE_LIBFTDI
>  if BR2_PACKAGE_LIBFTDI
>  
>  config BR2_PACKAGE_LIBTFDI_CPP
> -	depends on BR2_INSTALL_LIBSTDCPP
>  	bool "C++ bindings"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_BOOST

boost also has a threads dependency, but that is covered by the main
symbol, because of libusb.

I wonder if we should duplicate the dependency here, with another
comment, like:

    depends on BR2_TOOLCHAIN_HAS_THREADS # Boost

Or at least state it in a comment:

    # Boost depends on threads, but that's already accounted for
    # in the main symbol because of libusb.

>  	help
>  	  C++ bindings for libftdi
>  
> +comment "libftdi C++ bindings need a toolchain w/ wchar, C++"
> +	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
> +	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP

Ditto the threads dependency.

I'm not sure if we really want to do that, hence my reved-by tag.

Regards,
Yann E. MORIN.

>  endif # BR2_PACKAGE_LIBFTDI
>  
>  comment "libftdi needs a toolchain w/ threads"
> diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
> index 8370b0a..28f20e3 100644
> --- a/package/libftdi/libftdi.mk
> +++ b/package/libftdi/libftdi.mk
> @@ -15,6 +15,7 @@ LIBFDTI_CONF_OPTS = --without-examples
>  
>  # configure detect it automaticaly so we need to force it
>  ifeq ($(BR2_PACKAGE_LIBTFDI_CPP),y)
> +LIBFTDI_DEPENDENCIES += boost
>  LIBFDTI_CONF_OPTS += --enable-libftdipp
>  else
>  LIBFDTI_CONF_OPTS += --disable-libftdipp
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
