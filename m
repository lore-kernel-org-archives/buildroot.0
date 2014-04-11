From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Apr 2014 09:51:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-07
In-Reply-To: <CAMo8BfJrBZ4Z6M5D_F8vS3EL5g4KM8YTHCByC4qQkyFyZuLg4A@mail.gmail.com>
References: <20140408063009.EA284100CF4@stock.ovh.net>
 <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
 <20140408234145.4ed87c17@skate>
 <CAMo8BfLKSdQnr2+a-WDCj9zJAPgXyitcM42fMDYhvDkzPfeR2Q@mail.gmail.com>
 <20140410234114.6c1c72cd@skate>
 <CAMo8BfJrBZ4Z6M5D_F8vS3EL5g4KM8YTHCByC4qQkyFyZuLg4A@mail.gmail.com>
Message-ID: <20140411095149.7b9db2b2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Fri, 11 Apr 2014 10:01:07 +0400, Max Filippov wrote:

> > The problem is due to the compilation command line containing -L/lib,
> > which is wrong when cross-compiling.
> 
> Thanks for the information. I don't have /lib/libgcc_s.so.1 on my build system,
> so it doesn't break here.

Ok.

> Apparently this happens when
> 
> BR2_PACKAGE_PHP_EXT_ICONV = y and
> BR2_PACKAGE_LIBICONV is unset.
> 
> In this case buildroot calls
> 
> configure --with-iconv
> 
> for php, omitting LIBICONV dir, and php adds system dirs to -I and -L
> (though I'm not sure it does that correctly).
> 
> Looks like we need to always select BR2_PACKAGE_LIBICONV when
> BR2_PACKAGE_PHP_EXT_ICONV is selected, i.e.:
> 
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index abf4993..1a46061 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -152,7 +152,7 @@ comment "Gettext support needs a toolchain w/ wchar"
> 
>  config BR2_PACKAGE_PHP_EXT_ICONV
>         bool "iconv"
> -       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
> +       select BR2_PACKAGE_LIBICONV
>         help
>           iconv character set conversion support
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index ba1200b..8a147c5 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -108,12 +108,8 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
>  endif
> 
>  ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
> -ifeq ($(BR2_PACKAGE_LIBICONV),y)
>         PHP_CONF_OPT += --with-iconv=$(STAGING_DIR)/usr
>         PHP_DEPENDENCIES += libiconv
> -else
> -       PHP_CONF_OPT += --with-iconv
> -endif
>  endif
> 
>  ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)

I don't think this is correct, because libiconv is only needed for
toolchains built without locale support. When the toolchain has locale
support (either uClibc with locale support, or glibc/eglibc), the iconv
functionality is provided directly by the C library.

And in fact, your change is going to break the build, because at the
end of libiconv.mk, we have:

# Configurations where the toolchain supports locales and the libiconv
# package is enabled are incorrect, because the toolchain already
# provides libiconv functionality, and having both confuses packages.
ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_ENABLE_LOCALE),yy)
$(error Libiconv should never be enabled when the toolchain supports locales. Report this failure to Buildroot developers)
endif

So with your change, if the toolchain has locale support, the libiconv
package will be selected, but it should not. I believe what should be
investigated instead is how to ensure that the C library iconv
functionality is properly detected by the PHP.

I'm also puzzled as to why this doesn't seem to happen for other
architecture. I would have to see if I can reproduce it on ARM or x86
for example. Maybe it's a weird uClibc bug, or something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
