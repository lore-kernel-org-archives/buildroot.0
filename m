From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 21:47:12 +0100
Subject: [Buildroot] [PATCH v2 2/2] ustr: use Debian patches to compile
 w/ GCC 5.x
In-Reply-To: <1448070305-10768-2-git-send-email-ryanbarnett3@gmail.com>
References: <1448070305-10768-1-git-send-email-ryanbarnett3@gmail.com>
 <1448070305-10768-2-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20151208204712.GU4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, all,

On 2015-11-20 19:45 -0600, Ryan Barnett spake thusly:
> To fix issues with compiling with GCC 5.x, switch to utilizing the
> Debian patches for cross compiling. Debian has been maintaining
> patches for the ustr package since it appears that the ustr project
> hasn't been active since 2008.
> 
> The Debian patches switch from a makefile based build to autotools
> based build. This also means that the patch that was being carried
> for cross compiling is no longer needed.

ustr compiles stuff at install time. :-(

> There is only one dependancy for this package - libsemange - which
> still builds fine with these patches applied.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/150/150fa803fc3b65f75dce2847907ee768fc94c7a7
>   http://autobuild.buildroot.net/results/fc9/fc97e1ac52d40ced6a5f9cd980d7f448c98e5c78
>   ...and many more
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> CC: Arnout Vandecappelle <arnout@mind.be>
[--SNIP--]
> diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> index 3144c0b..83e69e6 100644
> --- a/package/ustr/ustr.mk
> +++ b/package/ustr/ustr.mk
> @@ -9,46 +9,11 @@ USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
>  USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
>  USTR_LICENSE = BSD-2c MIT LGPLv2+
>  USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
> +USTR_AUTORECONF = YES
> +USTR_PATCH = \
> +	http://http.debian.net/debian/pool/main/u/ustr/ustr_$(USTR_VERSION)-5.debian.tar.xz
>  
>  USTR_INSTALL_STAGING = YES

I've tested adding:

    USTR_MAKE_OPTS = all all-shared

and now everything is built at build time, and nothing at install time.

Care to include it and respin, please?

Thanks! :-)

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
