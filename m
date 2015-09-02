From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Sep 2015 11:26:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-kernel-module.mk: module
 build fails
In-Reply-To: <1441157873-12285-1-git-send-email-rdkehn@yahoo.com>
References: <1441157873-12285-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150902092651.GB3585@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

On 2015-09-01 20:37 -0500, Doug Kehn spake thusly:
> Observed the following when building cryptodev-linux:
> >>> cryptodev-linux 1.7 Building kernel module(s)
> grep: /.config: No such file or directory
> ERROR: Kernel does not support loadable modules
> 
> Fix LINUX_DIR reference when determining if kernel configuration
> supports loadable modules.

Dang.. I let that skip before the release...

> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

On principle:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, there's a series that did not have time to make it to master
before the release, and that is an improvement over the current
situation, which would render this patch moot:

    https://patchwork.ozlabs.org/patch/510186/
    https://patchwork.ozlabs.org/patch/510187/
    https://patchwork.ozlabs.org/patch/510188/

So, even though this patch is good, I'd prefer we aply the series
instead.

Still, the kernel-module infra is indeed broken in the release, thus
making all kernel module packages broken. I'll Oeter and Thomas decide
whether we want to put out a .1 release to fix just that.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-kernel-module.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> index 6fb7704..7628352 100644
> --- a/package/pkg-kernel-module.mk
> +++ b/package/pkg-kernel-module.mk
> @@ -60,7 +60,7 @@ $(2)_MODULE_SUBDIRS ?= .
>  # includes and other support files (Booo!)
>  define $(2)_KERNEL_MODULES_BUILD
>  	@$$(call MESSAGE,"Building kernel module(s)")
> -	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
> +	@if ! grep -Fqx 'CONFIG_MODULES=y' $$(LINUX_DIR)/.config; then \
>  		echo "ERROR: Kernel does not support loadable modules"; \
>  		exit 1; \
>  	fi
> -- 
> 2.5.0
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
