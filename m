From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2015 20:26:10 +0100
Subject: [Buildroot] [PATCH v4 1/1] fftw: add compile precision option
In-Reply-To: <1426436126-23486-1-git-send-email-gwenj@trabucayre.com>
References: <1426436126-23486-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150315192610.GD4104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2015-03-15 17:15 +0100, Gwenhael Goavec-Merou spake thusly:
> fftw has options to select compile precision between single, long-double and
> quad. These options are exclusives. This patch adds choice to select precision
> option.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

So, I have tested this patch in different configurations:
  - x86, all of none, single, double and quad
  - arm, all of none single, and double

All did build successfuly.

However, I am a bit worried that we do not have a disbling condition for
'none'...

[--SNIP--]
> diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
> index 3b302df..80cc0dc 100644
> --- a/package/fftw/fftw.mk
> +++ b/package/fftw/fftw.mk
> @@ -10,4 +10,13 @@ FFTW_INSTALL_STAGING = YES
>  FFTW_LICENSE = GPLv2+
>  FFTW_LICENSE_FILES = COPYING
>  

Maybe we could have something like:

    # Disable everything, and then selectively enable what we want
    FFTW_CONF_OPTS = --disable-single --disable-long-double --disable-quad-precision

    ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
    FFTW_CONF_OPTS = --enable-single
    endif

    ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
    FFTW_CONF_OPTS = --enable-long-double
    endif

    ifeq ($(BR2_PACKAGE_FFTW_PRECISION_QUAD),y)
    FFTW_CONF_OPTS = --enable-quad-precision
    endif

When we have both --disabe/--enable, the latter wins. So we can simply
disable everything, and then enable only the one we need.

I got it that they are mutually exclusive, but if the user selects
'none', we do not have any '--enable-XXX' so what happens?

Alternatively, you could do:

    FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),--enable,--disable)-single
    FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),--enable,--disable)-long-double
    FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-quad-precision

Not sure which I prefer...

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
> +FFTW_CONF_OPTS = --enable-single
> +endif
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE),y)
> +FFTW_CONF_OPTS = --enable-long-double
> +endif
> +ifeq ($(BR2_PACKAGE_FFTW_PRECISION_QUAD),y)
> +FFTW_CONF_OPTS = --enable-quad-precision
> +endif
>  $(eval $(autotools-package))
> -- 
> 2.0.5
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
