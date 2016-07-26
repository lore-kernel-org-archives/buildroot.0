From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jul 2016 23:31:16 +0200
Subject: [Buildroot] [PATCH] asciidoc: use absolute path for resources
In-Reply-To: <1469567242-49978-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1469567242-49978-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160726213116.GA3354@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, Atul, Brandon, All,

On 2016-07-26 16:07 -0500, Matt Weber spake thusly:
> From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> 
> One of the "features" of a2x is that the '-r|--resource' flag imports
> resources relative to the [SOURCE_FILE], not the CWD. The current
> implementation tries to import resources from the destination dir $(D),
> which works fine for out-of-tree builds because $(D) is an absolute
> path, however in-tree builds treat $(D) as a relative path, which breaks
> because a2x treats $(D) relative to SOURCE_FILE.

You meant $(@D), right?

I can see the problem, and indeed a2x' man page is explicit about it.
So I'm Ok with the change, but I could not observe the breakage with
the current master.

> Use the make command $(abspath names...) to convert the dest dir to an
> absolute path before passing it as a resource.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> Signed-off-by: Atul Singh Mandla <atul.singh.mandla@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/doc-asciidoc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
> index 6ab5ad2..c5ff2ae 100644
> --- a/package/doc-asciidoc.mk
> +++ b/package/doc-asciidoc.mk
> @@ -117,7 +117,8 @@ $$(O)/docs/$(1)/$(1).$(6): $$($(2)_SOURCES) \
>  	$$(Q)$$(call MESSAGE,"Generating $(7) $(1)...")
>  	$$(Q)mkdir -p $$(@D)
>  	$$(Q)a2x $(8) -f $(4) -d book -L \
> -		$$(foreach r,$$($(2)_RESOURCES),-r $$(r)) -r $$(@D) \
> +		 $$(foreach r,$$($(2)_RESOURCES) $$(@D), \
> +			 --resource="$$(abspath $$(r))") \

There's a space added just before the $$(foreach and just before the
--resource.

Otherwise, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

when you respin.

Regards,
Yann E. MORIN.

>  		$$($(2)_$(4)_A2X_OPTS) \
>  		--asciidoc-opts="$$($(2)_$(4)_ASCIIDOC_OPTS)" \
>  		$$(BUILD_DIR)/docs/$(1)/$(1).txt
> -- 
> 1.9.1
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
