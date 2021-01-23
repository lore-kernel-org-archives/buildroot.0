From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:57:38 +0100
Subject: [Buildroot] [PATCH 5/6] package/mrouted: for merged usr,
 install to /usr by default, not /
In-Reply-To: <20210123103155.2599311-6-troglobit@gmail.com>
References: <20210123103155.2599311-1-troglobit@gmail.com>
 <20210123103155.2599311-6-troglobit@gmail.com>
Message-ID: <20210123205738.GD926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joachim, All,

On 2021-01-23 11:31 +0100, Joachim Wiberg spake thusly:
> - Config in /etc
> - State files in /var
> - Binaries in /usr
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/mrouted/mrouted.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
> index 9f52d1ca90..558efa946e 100644
> --- a/package/mrouted/mrouted.mk
> +++ b/package/mrouted/mrouted.mk
> @@ -10,7 +10,8 @@ MROUTED_SITE = \
>  MROUTED_DEPENDENCIES = host-bison
>  MROUTED_LICENSE = BSD-3-Clause
>  MROUTED_LICENSE_FILES = LICENSE
> -MROUTED_CONFIGURE_OPTS = --enable-rsrr
> +MROUTED_CONF_OPTS = --prefix=/usr --sysconfdir=/etc --localstatedir=/var

I don't understand why the above is needed, and how it is related to
merged-usr as stated in the commit title...

Indeed, the --prefix, --sysconfdir, and --localstatedir passed by the
autotools infra are already the values you pass above:

    https://git.buildroot.org/buildroot/tree/package/pkg-autotools.mk#n186

    ./configure \
        --target=$$(GNU_TARGET_NAME) \
        --host=$$(GNU_TARGET_NAME) \
        --build=$$(GNU_HOST_NAME) \
        --prefix=/usr \
        --exec-prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \

So I am not sure why you need to pass those explicitly.

Furthermore, I don't see what a merged-usr setup would come into play
in this situation...

In the meantime, I've marked this patch as rejected in patchwork. If you
still believe it is needed, please respin with additional explanations:
what is the problem that you encountered, and why explicitly passing
those options solves it?

Thanks!

Regards,
Yann E. MORIN.

> +MROUTED_CONF_OPTS += --enable-rsrr
>  MROUTED_CPE_ID_VENDOR = troglobit
>  
>  define MROUTED_INSTALL_INIT_SYSV
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
