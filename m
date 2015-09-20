From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Sep 2015 23:51:34 +0200
Subject: [Buildroot] [v2 1/1] make: disable guile support when static
 linking enabled
In-Reply-To: <1442783430-26199-1-git-send-email-ryanbarnett3@gmail.com>
References: <1442783430-26199-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150920215134.GA1655@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2015-09-20 16:10 -0500, Ryan Barnett spake thusly:
> When building in a static only configuration with guile package
> enabled, the following error happens:
> 
>  gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or
>  directory
>    #   include <dlfcn.h>
> 
> The file gc_pthread_redirects.h comes from bdwgc, which gets built
> before make in the autobuild test case you're pointing to. This header

Maby replace "the autobuild test case you're pointing to" with "the
autobuild test case referenced below".

> file is known to incorrectly include <dlfcn.h>, unless GC_NO_DLOPEN is
> specified.
> 
> IF GC_NO_DLOPEN is defined, another issue arises due to libguile and
> libintl both defining locale_charset.
> 
> Thus disable guile support for make.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/814/8143ae0afac139845e5016058d85c800dc8527ad
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  package/make/make.mk | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/package/make/make.mk b/package/make/make.mk
> index ebfa2f0..20702dc 100644
> --- a/package/make/make.mk
> +++ b/package/make/make.mk
> @@ -11,16 +11,11 @@ MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
>  MAKE_LICENSE = GPLv3+
>  MAKE_LICENSE_FILES = COPYING
>  
> +MAKE_CONF_OPTS = --without-guile
> +
>  # Disable the 'load' operation for static builds since it needs dlopen
>  ifeq ($(BR2_STATIC_LIBS),y)
>  MAKE_CONF_OPTS += --disable-load
>  endif
>  
> -ifeq ($(BR2_PACKAGE_GUILE),y)
> -MAKE_DEPENDENCIES += guile
> -MAKE_CONF_OPTS += --with-guile
> -else
> -MAKE_CONF_OPTS += --without-guile
> -endif

Hm.. not sure we want to unconditionally disable guile support in make.

What about:

    ifeq ($(BR2_STATIC_LIBS):$(BR2_PACKAGE_GUILE),:y)
    MAKE_DEPENDENCIES += guile
    MAKE_CONF_OPTS += --with-guile
    else
    MAKE_CONF_OPTS += --without-guile
    endif

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 1.9.1
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
