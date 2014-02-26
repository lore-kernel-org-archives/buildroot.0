From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Feb 2014 23:19:57 +0100
Subject: [Buildroot] [PATCH 1/1] ti-gfx: build with GCC 4.8
In-Reply-To: <1392391790-22941-1-git-send-email-syntheticpp@gmx.net>
References: <1392391790-22941-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20140226221957.GC16780@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-02-14 16:29 +0100, Peter K?mmel spake thusly:
> In older kernels clk_disable() is a void function.

Not only in older kernels, but in recent kernels, too.

For example, in v3.14-rc4:

    $ git grep 'void clk_disable' include
    include/linux/clk.h:void clk_disable(struct clk *clk);

> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  package/ti-gfx/ti-gfx-newclkapi.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ti-gfx/ti-gfx-newclkapi.patch b/package/ti-gfx/ti-gfx-newclkapi.patch
> index 8f50c7e..29ad20d 100644
> --- a/package/ti-gfx/ti-gfx-newclkapi.patch
> +++ b/package/ti-gfx/ti-gfx-newclkapi.patch
> @@ -14,7 +14,7 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
>  +#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
>  +int clk_disable_unprepare(struct clk *clk)
>  +{
> -+	return clk_disable(clk);
> ++	clk_disable(clk); return 0;
>  +}
>  +#elif LINUX_VERSION_CODE < KERNEL_VERSION(3,3,0)
>  +int clk_disable_unprepare(struct clk *clk)
> @@ -35,7 +35,7 @@ Index: ti-gfx-4_09_00_01/GFX_Linux_KM/services4/system/omap3630/sysutils_linux.c
>  +#if LINUX_VERSION_CODE < KERNEL_VERSION(3,2,0)
>  +int clk_prepare_enable(struct clk *clk)
>  +{
> -+	return clk_enable(clk);
> ++	clk_enable(clk); return 0;

But why did you change clk_enable too? As far as I can see, it always
returned an int, for as long as it existed. Eg. in v2.6.19:

    $ git grep 'int clk_enable' include
    include/linux/clk.h:int clk_enable(struct clk *clk);

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
