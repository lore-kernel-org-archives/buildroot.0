From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2015 00:53:53 +0200
Subject: [Buildroot] [PATCH] pkg-kernel-module: Die when kernel modules
 are disabled
In-Reply-To: <1439546322-21504-1-git-send-email-nrubinstein@aldebaran.com>
References: <1439546322-21504-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150814225353.GF4017@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No?, All,

On 2015-08-14 11:58 +0200, No? Rubinstein spake thusly:
> Test the config of the kernel to see if loadable module support is
> enabled, and error out otherwise. This makes the build failure less
> confusing.
> 
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
>  package/pkg-kernel-module.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> index 5fb19be..e7dc33e 100644
> --- a/package/pkg-kernel-module.mk
> +++ b/package/pkg-kernel-module.mk
> @@ -60,6 +60,10 @@ $(2)_MODULE_SUBDIRS ?= .
>  # includes and other support files (Booo!)
>  define $(2)_KERNEL_MODULES_BUILD
>  	@$$(call MESSAGE,"Building kernel module(s)")
> +	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
> +		echo ERROR: Kernel does not support loadable modules; \

Message should be quoted (and my presonal preference is to use printf,
but echo is OK):

    echo "ERROR: Kernel does not support loadable modules"; \

> +		false; \

I prefer we 'exit 1' instead, it's much obvious what the intent is. And
that's what we used about anywhere else when we do sanity checks (see
for example toolchain/helpers.mk, most "exit 1", while a few "exit -1").

Please use "exit 1", fix the quoting, add my acked-by, and respin:

    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	fi
>  	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
>  		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
>  			-C $$(LINUX_DIR) \
> -- 
> 2.1.4
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
