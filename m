From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2019 22:58:27 +0200
Subject: [Buildroot] [PATCH] linux-tools/perf: Respect TARGET_CFLAGS
In-Reply-To: <20190418093902.41835-1-abrodkin@synopsys.com>
References: <20190418093902.41835-1-abrodkin@synopsys.com>
Message-ID: <20190718205827.GA31829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2019-04-18 12:39 +0300, Alexey Brodkin spake thusly:
> perf uses its own build-system and doesn't respect externally set flags.
> Let's force it to use target flags as perf utility is nothing but
> an ordinary user-space application.
> 
> This among other things is required to build perf for ARC700 for which
> we pass "-matomic" via TARGET_ABI, see [1] for more details.

As was discussed in the thread, the proper option is now passed in via
the wrapper and arch-specific CFLAGS:
    https://git.buildroot.org/buildroot/commit/?id=4281288d2d568d5ce748a0e66e0872f54fbe956c
    https://git.buildroot.org/buildroot/commit/?id=c568b4f37fa6d7f51e6d14d33d7eb75dfe26d7bf

Thanks!

Regards,
Yann E. MORIN.

> [1] https://patchwork.ozlabs.org/patch/1087471/
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 80e00c3c56..e7565773c4 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -19,6 +19,7 @@ PERF_MAKE_FLAGS = \
>  	JOBS=$(PARALLEL_JOBS) \
>  	ARCH=$(PERF_ARCH) \
>  	DESTDIR=$(TARGET_DIR) \
> +	EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
>  	prefix=/usr \
>  	WERROR=0 \
>  	NO_LIBAUDIT=1 \
> -- 
> 2.16.2
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
