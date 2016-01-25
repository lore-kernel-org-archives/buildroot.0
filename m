From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 23:40:22 +0100
Subject: [Buildroot] [PATCH] pkg-kconfig: add missing -patch dependency
 for defconfig
In-Reply-To: <1453676322-1906-1-git-send-email-arnout@mind.be>
References: <1453676322-1906-1-git-send-email-arnout@mind.be>
Message-ID: <20160125224022.GO3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-01-24 23:58 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Since the introduction of _KCONFIG_DEFCONFIG in 8ef62b99, the package's
> .config file no longer depends on anything (unless a fragment is
> defined). Therefore, there is no dependency anymore between .config
> and <pkg>-patch. Thus, it is possible that the .config file is
> attempted to be built before the package is extracted and patched.
> Usually this works out OK because <pkg>-patch will always be done
> before <pkg>-configure, but it will fail when the user calls
> <pkg>-menuconfig explicitly. It will also fail when we enable
> top-level parallel build.
> 
> To solve this, just add an explicit order-only dependency on
> <pkg>-patch. It really is only necessary when _KCONFIG_DEFCONFIG is
> defined and _KCONFIG_FRAGMENT_FILES is not, but it doesn't hurt to
> add it unconditionally.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Reported-by: FrAnKenStEiN MC <chfakht@gmail.com>
> ---
>  package/pkg-kconfig.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index eaee572..90f3f9f 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -72,6 +72,11 @@ $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)
>  	$$(Q)yes "" | $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>  		$$($(2)_KCONFIG_OPTS) oldconfig
>  
> +# If _KCONFIG_FILE or _KCONFIG_FRAGMENT_FILES exists, this dependency is
> +# already implied, but if we only have a _KCONFIG_DEFCONFIG we have to add
> +# it explicitly. It doesn't hurt to always have it though.
> +$$($(2)_DIR)/.config: | $(1)-patch

I don't understand why this is needed.

On line 65, we have;
    $$($(2)_DIR)/.config: $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES)

and on line 52;
    $$($(2)_KCONFIG_FILE) $$($(2)_KCONFIG_FRAGMENT_FILES): | $(1)-patch

So, unless I'm missing something, $$($(2)_DIR)/.config already has a
dependency on $(1)-patch via $$($(2)_KCONFIG_FILE)

Oh, damn, I see it now... Grr...

OK, so what made me understand is the comment in the code:

   [...] if we only have a _KCONFIG_DEFCONFIG [...]

Ok, so it goes thusly:

  - if using a defconfig file, we do not have a $(2)_KCONFIG_FILE

  - if at the same time, we have no fragments, we have no rule from
    .config to $(1)-patch.

OK, fine by me. Thanks!

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # In order to get a usable, consistent configuration, some fixup may be needed.
>  # The exact rules are specified by the package .mk file.
>  define $(2)_FIXUP_DOT_CONFIG
> -- 
> 2.7.0
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
