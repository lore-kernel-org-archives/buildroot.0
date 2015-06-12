From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 23:36:18 +0200
Subject: [Buildroot] [PATCH 3/4] core/pkg-kconfig: run the kconfig
 fixups after exiting configurators
In-Reply-To: <c011926dc0817e5b5685bc5519ae5cbd57b21888.1433591404.git.yann.morin.1998@free.fr>
References: <cover.1433591404.git.yann.morin.1998@free.fr>
 <c011926dc0817e5b5685bc5519ae5cbd57b21888.1433591404.git.yann.morin.1998@free.fr>
Message-ID: <20150612233618.56f1e4dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Jun 2015 13:54:25 +0200, Yann E. MORIN wrote:
> After we exit the configurators, we need to re-run the kconfig fixups to
> ensure the user is not able to override them in the configurators.
> 
> Currently, we schedule that "for later", by removing the corresponding
> stamp file, so make will run the fixups "later".
> 
> This means the user has access to the un-fixed .config file, which he
> might decide to copy and use as a reference (not too bad, since we'd run
> the fixups anyway; but not clean either).

Until now, OK.

> Furthermore, we'll need to have the .config file properly fixed-up
> without requiring the full dependency chain up to the original
> user-supplied (def)config, so we won't be able to rely on the stamp file
> in the dependency list, so we'll need to run the fixups when exiting the
> configurators anyway.

But here, I'm lost.

>  # Configuration editors (menuconfig, ...)
> +#
> +# Apply the kconfig fixups right after exiting the configurators, so
> +# that the user always sees a .config file that is clean wrt. our
> +# requirements.
> +#
> +# Because commands in $(1)_FIXUP_KCONFIG are probably using $(@D), we
> +# fake it for the configurators (otherwise it is set to just '.', i.e.
> +# the current directory where make is run, which happens to be in
> +# $(TOPDIR), because the target of the rule is not an actual file, so
> +# does not have any path component).
> +#
> +$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): @D=$$($(2)_DIR)
>  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $$($(2)_DIR)/.stamp_kconfig_fixup_done
>  	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>  		$$($(2)_KCONFIG_OPTS) $$(subst $(1)-,,$$@)
>  	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
>  	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
> +	$$(call $(1)_FIXUP_KCONFIG)

I find a bit sad that we don't manage to use make dependencies to
schedule the kconfig-fixup -> configurator -> kconfig-fixup thing
logic, and that we have to manually recall $(1)_FIXUP_CONFIG. I've put
a bit of thought into it, but I indeed don't see a simple way of
achieving that in a different way that the one you're proposing. The
hack on @D is particularly tricky.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
