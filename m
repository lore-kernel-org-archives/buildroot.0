From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 22:58:20 +0200
Subject: [Buildroot] [PATCH v4 3/4] libftdi: Add dependency on atomic
 intrinsics
In-Reply-To: <1407510572-20603-3-git-send-email-Anton.Kolesov@synopsys.com>
References: <CAAXf6LURyGxEfQR+3g6xriwqUeE1E91Oav2X=r_C3YD66JzpEA@mail.gmail.com>
 <1407510572-20603-1-git-send-email-Anton.Kolesov@synopsys.com>
 <1407510572-20603-3-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140815205820.GD25897@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anton, All,

On 2014-08-08 19:09 +0400, Anton Kolesov spake thusly:
> Libftdi requires GCC built-in atomic functions which are architecture specific
> and may not be implemented.
> 
> This fixes:
> http://autobuild.buildroot.net/results/6cb25ed954840109c9d0e582e922b0ba9d07e174/
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I do have a small eye-candy comment to make, see below...

[--SNIP--]
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index 7f96ef8..e692d2d 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -14,11 +14,15 @@ comment "Adapters"
>  
>  config BR2_PACKAGE_OPENOCD_FT2XXX
>  	bool "FT2xxx/FT4xxx Based JTAG Programmer"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS # libftdi
>  	select BR2_PACKAGE_LIBFTDI
>  	help
>  	  Enable building support for FT2232 based devices
>  	  using the libftdi driver, opensource alternate of FTD2XX
>  
> +comment "FT2232 support needs a toolchain w/ atomic intrinsics"

I'd prefer we keep the same title for comment and options, such as:

    comment "FT2xxx/FT4xxx support needs a toolchain w/ atomic intrinsics"

This can be fixed by whoever commits that, I guess no need to resend.

Regards,
Yann E. MORIN.

> +        depends on !BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS
> +
>  config BR2_PACKAGE_OPENOCD_JLINK
>  	bool "Segger J-Link JTAG Programmer"
>  	help
> -- 
> 1.8.4.1
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
