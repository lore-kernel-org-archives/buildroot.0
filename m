From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Aug 2016 22:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] libical: Create option to use builtin
 tzdata
In-Reply-To: <1470751327-64254-1-git-send-email-marc@khouri.ca>
References: <1470751327-64254-1-git-send-email-marc@khouri.ca>
Message-ID: <20160809205619.GG5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marc, All,

On 2016-08-09 10:02 -0400, Marc Khouri spake thusly:
> libical requires time zone data (either system or internal) in order
> to use time zone related functions. This commit adds an option to
> build libical with its internal time zone data. If no time zone data
> is present, segfaults occur in applications which use time zone functions.
> 
> Option documentation:
> https://github.com/libical/libical/blob/v1.0.1/CMakeLists.txt#L23
> 
> Signed-off-by: Marc Khouri <marc@khouri.ca>
> ---
>  package/libical/Config.in  | 12 ++++++++++++
>  package/libical/libical.mk |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/libical/Config.in b/package/libical/Config.in
> index 48170e9..e183ad0 100644
> --- a/package/libical/Config.in
> +++ b/package/libical/Config.in
> @@ -9,6 +9,18 @@ config BR2_PACKAGE_LIBICAL
>  
>  	  http://libical.github.io/libical
>  
> +if BR2_PACKAGE_LIBICAL
> +
> +config BR2_PACKAGE_LIBICAL_BUILTIN_TZDATA
> +	bool "use built-in timezone data"
> +	help
> +	  Build using libical's (instead of the system's) timezone data.
> +
> +	  libical requires either built-in or system timezone data in order
> +	  to support time zone functions.
> +
> +endif

As already discussed in other replies, we believe it is better to rely
on the existing TZ info that can be used system-wide.

A ver recent commit makes this available for all types of toolchains,
not just glibc or uClibc.

So, your change can now easily be changed to use:

    config BR2_PACKAGE_LIBICAL
        bool "libical"
        depends on exiting-blabla
        select BR2_TARGET_TZ_INFO

>  comment "libical needs a toolchain w/ C++, dynamic library, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		BR2_STATIC_LIBS
> diff --git a/package/libical/libical.mk b/package/libical/libical.mk
> index e8cb3f8..a8bcefb 100644
> --- a/package/libical/libical.mk
> +++ b/package/libical/libical.mk
> @@ -14,4 +14,8 @@ LIBICAL_LICENSE_FILES = LICENSE
>  # Gentoo/alpinelinux as well
>  LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
>  
> +ifeq ($(BR2_PACKAGE_LIBICAL_BUILTIN_TZDATA),y)
> +LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
> +endif

And of course you can now drop this change, although I would still keep
it as:

    LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=OFF

to be sure it does not get used.

Thanks!

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
> -- 
> 2.8.2
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
