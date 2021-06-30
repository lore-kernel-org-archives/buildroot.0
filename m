From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jun 2021 23:38:18 +0200
Subject: [Buildroot] [PATCH 1/1] boot/grub2: workaround breakage with
 -O2, -O3 build
In-Reply-To: <20210625114251.1762419-1-andreas.hilse@googlemail.com>
References: <20210625114251.1762419-1-andreas.hilse@googlemail.com>
Message-ID: <20210630213818.GC2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2021-06-25 13:42 +0200, Andreas Hilse via buildroot spake thusly:
> When grub2 (i386-pc) is built with -O2 or -O3 it is unable to boot
> and the system will reboot in a loop.
> 
> Tony Battersby has bisected [0] the error down to this security bugfix:
> boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch
> There is also a bug report by Peter Seiderer about this [1].
> 
> As discussed on the mailing list [2], this patch introduces a workaround
> in the grub2.mk overriding the global optimization settings with -Os
> which results in a booting system.
> 
> References:
> [0] https://savannah.gnu.org/bugs/?60458
> [1] https://bugs.busybox.net/show_bug.cgi?id=13586
> [2] http://lists.busybox.net/pipermail/buildroot/2021-May/311524.html
> 
> Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>

Applied to master, thanks.

Maybe we could also look at bumping the version, now that they
eventually tagged a reeleease? ;-)

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/grub2.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index af16ee91e1..52e9199ae9 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -118,9 +118,11 @@ HOST_GRUB2_CONF_ENV = \
>  GRUB2_CONF_ENV = \
>  	CPP="$(TARGET_CC) -E" \
>  	TARGET_CC="$(TARGET_CC)" \
> -	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
> -	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
> -	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
> +	CFLAGS="$(TARGET_CFLAGS) -Os" \
> +	TARGET_CFLAGS="$(TARGET_CFLAGS) -Os" \
> +	CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
> +	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
> +	TARGET_LDFLAGS="$(TARGET_LDFLAGS) -Os" \
>  	TARGET_NM="$(TARGET_NM)" \
>  	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
>  	TARGET_STRIP="$(TARGET_CROSS)strip"
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
