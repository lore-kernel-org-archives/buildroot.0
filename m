From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Mar 2015 00:05:33 +0200
Subject: [Buildroot] [PATCH 14/35] pkg-generic: declare phony targets as
 such
In-Reply-To: <1427650429-9293-15-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-15-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329220533.GO4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> This commit improves the pkg-generic package infrastructure so that it
> declares all the <pkg>-<something> targets as PHONY, which they
> actually are.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ba24591..e1a51e4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -777,6 +777,15 @@ ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
>  DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
>  endif
>  
> +# Ensure all virtual targets are PHONY
> +.PHONY: $(1) $(1)-install $(1)-install-host $(1)-install-staging \
> +	$(1)-install-target $(1)-install-images $(1)-build \
> +	$(1)-configure $(1)-patch $(1)-extract $(1)-depends \
> +	$(1)-source $(1)-rsync $(1)-show-depends $(1)-graph-depends \
> +	$(1)-external-deps $(1)-all-source $(1)-all-external-deps \
> +	$(1)-all-legal-info $(1)-dirclean $(1)-clean-for-rebuild \
> +	$(1)-rebuild $(1)-clean-for-reconfigure $(1)-reconfigure

You're missing a few:

    $(1)-clean-for-reinstall
    $(1)-legal-info
    $(1)-reinstall
    $(1)-show-version

Noticed with:

    diff -du \
        <(sed -r -e '/^(\$\(1\)-[^:]+):.*/!d; s//\1/;' package/pkg-generic.mk |sort -u)
        <(sort -u kos_tom.list)

(kos_tom.list contains your list, obviously ;-) )

Regards,
Yann E. MORIN.

>  endif # $(2)_KCONFIG_VAR
>  endef # inner-generic-package
>  
> -- 
> 2.1.0
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
