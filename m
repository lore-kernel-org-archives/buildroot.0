From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Nov 2017 11:09:59 +0100
Subject: [Buildroot] [PATCH] support/scripts/size-stats: avoid
 divide-by-zero
In-Reply-To: <20171128033707.15072-1-yurovsky@gmail.com>
References: <20171127220849.5f62e6fc@windsurf.home>
 <20171128033707.15072-1-yurovsky@gmail.com>
Message-ID: <20171128100959.GD2889@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrey, Thomas, All,

On 2017-11-27 19:37 -0800, Andrey Yurovsky spake thusly:
> Some packages (ex: skeleton-init-systemd) have a zero size so we cannot
> divide by the package size. In that case make their percent zero
> explicitly and avoid a ZeroDivisionError exception.
> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/size-stats | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index af45000359..3ff2a1ce18 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -178,9 +178,17 @@ def gen_files_csv(filesdict, pkgsizes, outputf):
>                       "File size in system (%)"])
>          for f, (pkgname, filesize) in filesdict.items():
>              pkgsize = pkgsizes[pkgname]
> +
> +            if pkgsize == 0:
> +                percent_pkg = 0
> +            else:
> +                percent_pkg = float(filesize) / pkgsize * 100
> +
> +            percent_total = float(filesize) / total * 100
> +
>              wr.writerow([f, pkgname, filesize, pkgsize,
> -                         "%.1f" % (float(filesize) / pkgsize * 100),
> -                         "%.1f" % (float(filesize) / total * 100)])
> +                         "%.1f" % percent_pkg,
> +                         "%.1f" % percent_total])
>  
>  
>  #
> -- 
> 2.14.3
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
