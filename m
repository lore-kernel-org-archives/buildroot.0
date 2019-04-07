From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Apr 2019 08:24:40 +0200
Subject: [Buildroot] [RFC 1/1] support/kconfig: Allow to override
 'default' config property
In-Reply-To: <20190407001006.12925-1-vadim4j@gmail.com>
References: <20190407001006.12925-1-vadim4j@gmail.com>
Message-ID: <20190407062440.GG2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-04-07 03:10 +0300, Vadim Kochan spake thusly:
> Add kconfig patch which allows to apply last visible config's "default" property.
> 
> This allows to override default value for the same config symbol from
> other Config.in file, e.g.:
> 
> 	system/Config.in:
> 		config BR2_TARGET_GENERIC_GETTY_PORT
> 			string "TTY port"
> 			default "console"
> 			help
> 			  Specify a port to run a getty on.
> 
> now the same symbol value might be overriden by Config.in from external's one:
> 
> 	${external_vendor_tree}/Config.in:
> 		config BR2_TARGET_GENERIC_GETTY_PORT
> 			string
> 			default "tty1"
> 
> But why is the purpose of this if the value might be specified by the
> user in defconfig ? So, it allows for external projects to be more easy
> used w/o looking into their default defconfigs and specifying these
> default values in local defconfig, but external tree project might do
> this automatically by specifying default values like in the above
> example. And because it is the "default" property the user still can
> choose the own value.

So, I am not happy with that, for (at least) three reasons:

1) we do not want our kconfig to diverge from that of the Linux kernel.
   If you really (like, really-really) think you want that, you should
   first push that to the Linux folks.

2) Having two defaults is excesively confusing for users: "why omn Earth
   the defualt I see there is not applied?" will be a recurring issue.
   It does not follow the principle of least surprise: defaults are
   unique.

2b) Additionally, it is possible to use more than one br2-external at
    once. Consequently, you could end up with many defaults, the one
    from the Buildroot tree, and those from the br2-external trees each.
    This would become very confusing...

3) defconfig *are* the place you want to put such information. A
   br2-external is not necesarily about a single board, or even about a
   single project; each board may have various defaults, or each project
   may have theirs.

4) Buildroot has no notion of "board" or "project", by the way. This is
   mainly a mental construction, that is represented by a defconfig,
   which is the projection of a (project, board) tuple (and even then,
   that is still incorrect, as a "project" can use the same "board" in
   various configurations.

Really, the defconfig *is* the place where defaults are overriden.

For example, at work, I handle a single br2-external for two "projects"
that each have four "boards", and each have three configurations. There
is no way your proposal can cover this.

Alternatively, what you propose is just pushing the feature of a
defconfig into the language itself. I don't think this is a good idea.
Even more so, as your proposal does not address all the cases either:
it only catters for strings, but what about choices, tri-states?

So, I'll be harsh, but NAK.

Regards,
Yann E. MORIN.

> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  .../22-apply-last-visible-default-property.patch     | 20 ++++++++++++++++++++
>  support/kconfig/patches/series                       |  1 +
>  support/kconfig/symbol.c                             |  6 +++---
>  3 files changed, 24 insertions(+), 3 deletions(-)
>  create mode 100644 support/kconfig/patches/22-apply-last-visible-default-property.patch
> 
> diff --git a/support/kconfig/patches/22-apply-last-visible-default-property.patch b/support/kconfig/patches/22-apply-last-visible-default-property.patch
> new file mode 100644
> index 0000000000..c57490fe6d
> --- /dev/null
> +++ b/support/kconfig/patches/22-apply-last-visible-default-property.patch
> @@ -0,0 +1,20 @@
> +--- kconfig.orig/symbol.c	2019-04-07 03:02:49.263944705 +0300
> ++++ kconfig/symbol.c	2019-04-07 03:03:15.367944606 +0300
> +@@ -114,14 +114,14 @@
> + 
> + static struct property *sym_get_default_prop(struct symbol *sym)
> + {
> +-	struct property *prop;
> ++	struct property *prop, *found = NULL;
> + 
> + 	for_all_defaults(sym, prop) {
> + 		prop->visible.tri = expr_calc_value(prop->visible.expr);
> + 		if (prop->visible.tri != no)
> +-			return prop;
> ++			found = prop;
> + 	}
> +-	return NULL;
> ++	return found;
> + }
> + 
> + static struct property *sym_get_range_prop(struct symbol *sym)
> diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
> index e5a6f69d8f..9b3a37c4e6 100644
> --- a/support/kconfig/patches/series
> +++ b/support/kconfig/patches/series
> @@ -10,3 +10,4 @@
>  19-merge_config.sh-add-br2-external-support.patch
>  20-merge_config.sh-Allow-to-define-config-prefix.patch
>  21-Avoid-false-positive-matches-from-comment-lines.patch
> +22-apply-last-visible-default-property.patch
> diff --git a/support/kconfig/symbol.c b/support/kconfig/symbol.c
> index f0b2e3b310..337dc55b5a 100644
> --- a/support/kconfig/symbol.c
> +++ b/support/kconfig/symbol.c
> @@ -114,14 +114,14 @@ struct property *sym_get_env_prop(struct symbol *sym)
>  
>  static struct property *sym_get_default_prop(struct symbol *sym)
>  {
> -	struct property *prop;
> +	struct property *prop, *found = NULL;
>  
>  	for_all_defaults(sym, prop) {
>  		prop->visible.tri = expr_calc_value(prop->visible.expr);
>  		if (prop->visible.tri != no)
> -			return prop;
> +			found = prop;
>  	}
> -	return NULL;
> +	return found;
>  }
>  
>  static struct property *sym_get_range_prop(struct symbol *sym)
> -- 
> 2.14.1
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
