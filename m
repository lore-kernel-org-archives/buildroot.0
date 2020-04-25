From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2020 14:08:25 +0200
Subject: [Buildroot] [PATCH 1/1] fs/cpio: make initramfs init script
 survive 'console=' kernel argument
In-Reply-To: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
References: <80e3e080-0af3-99de-ff8f-9de5e3dca8a6@exertus.fi>
Message-ID: <20200425120825.GP5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Timo, All,

On 2019-09-23 10:58 +0000, Timo Ketola spake thusly:
> When booting with 'console=<empty>' in the kernel command line (as e.g.
> U-Boot does with silent flags in effect), opening /dev/console fails.
> That is fatal in the /init script and kernel will panic. It is also
> needless, because the kernel tries to open it anyway (well, as long as
> we have console node in initramfs /dev; cpio.mk creates that alright).
> 
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>

I've applied to master, after extending the commit log with all the gory
details explaininng why we can indeed safely remove those redisrections
now.

Thank you for the patience on this patch.

Thanks also to Peter for helping on IRC about this research.

Regards,
Yann E. MORIN.

> ---
>  fs/cpio/init | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fs/cpio/init b/fs/cpio/init
> index dbe09ac..72b2401 100755
> --- a/fs/cpio/init
> +++ b/fs/cpio/init
> @@ -1,7 +1,5 @@
>  #!/bin/sh
>  # devtmpfs does not get automounted for initramfs
>  /bin/mount -t devtmpfs devtmpfs /dev
> -exec 0</dev/console
> -exec 1>/dev/console
> -exec 2>/dev/console
> +
>  exec /sbin/init "$@"
> -- 
> 2.7.4
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
