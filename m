From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 23:18:13 +0200
Subject: [Buildroot] [PATCH] board/freescale: increase the vfat size
In-Reply-To: <20200526210119.6143-1-festevam@gmail.com>
References: <20200526210119.6143-1-festevam@gmail.com>
Message-ID: <20200526211813.GJ8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2020-05-26 18:01 -0300, Fabio Estevam spake thusly:
> i.MX8 targets typically use the standard ARM64 defconfig, which builds
> lots of ARM64 platforms leading to super large kernels that can easily
> not fit within the current 32MB size for vfat.
> 
> Increase the vfat size to better accomodate such large kernels.

The genimage config files we have do accomodate the needs for the
defconfigs they are used in. So, if all the in-tree defconfigs still
build with the current size,t this is OK.

That a user then tweaks it locally for their use-case, is not a reason
IMHO to carry such a change.

So, question: does this fix an actual build failure of any of the i.MX8
defconfig that we have in-tree in Buildroot? If so, then this should be
explcictly stated in the commit log.

Otherwise, there is no reason to catter for out-of-tree use-cases,
otherwise there will always be someone that come next and state "This
package makes sense for my use-case, but it does not fit in the default
size, so increase it". This is not tenable.

Still, 32M is quite low for today's standards, and we want users to be
relatively at ease to experiment on the default image anyway.

So: applied to master, with a slightly tweaked commit log. Thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/common/imx/genimage.cfg.template_imx8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
> index 84a812f986..5689205083 100644
> --- a/board/freescale/common/imx/genimage.cfg.template_imx8
> +++ b/board/freescale/common/imx/genimage.cfg.template_imx8
> @@ -14,7 +14,7 @@ image boot.vfat {
>        %FILES%
>      }
>    }
> -  size = 32M
> +  size = 64M
>  }
>  
>  image sdcard.img {
> -- 
> 2.17.1
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
