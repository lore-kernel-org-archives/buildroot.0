From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Dec 2014 21:24:03 +0100
Subject: [Buildroot] [PATCH 6/8] ncurses: speed up host build by
 disabling static library building
In-Reply-To: <1417642895-29606-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141211202403.GH4199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-03 22:41 +0100, Thomas Petazzoni spake thusly:
> For the host variant of packages, we normally only build the shared
> libraries. However, ncurses uses non-standard options to select
> between shared/static and therefore the host variant was building both
> of them, even though the static libraries were unused.
> 
> By passing --without-normal, we disable the build of static
> libraries. It saves a bit of disk space, and on my laptop,
> host-ncurses takes 26 seconds to build instead of 40 seconds.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

There is also --with-libtool, but I guess that would mean to build both
shared and static. Anyway, --without-normal does the trick, so:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ncurses/ncurses.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 1ce3818..645c25c 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -145,7 +145,8 @@ HOST_NCURSES_CONF_OPTS = \
>  	--without-manpages \
>  	--without-cxx \
>  	--without-cxx-binding \
> -	--without-ada
> +	--without-ada \
> +	--without-normal
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.1.0
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
