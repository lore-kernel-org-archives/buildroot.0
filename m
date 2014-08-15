From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Aug 2014 00:23:53 +0200
Subject: [Buildroot] [PATCH 3 of 5 v4 for 2014.08] gendoc infra: add
 support for asciidoc configuration files
In-Reply-To: <81d40b841073724e161c.1408110036@localhost>
References: <patchbomb.1408110033@localhost>
 <81d40b841073724e161c.1408110036@localhost>
Message-ID: <20140815222353.GD27341@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-15 15:40 +0200, Thomas De Schampheleire spake thusly:
> This patch introduces support for asciidoc configuration files, specific for
> each output format (html, text, pdf, ...). This is useful to make certain
> tweaks in the document generation.
> 
> If a file docs/manual/asciidoc-<format>.conf is present, it is passed to
> asciidoc as configuration file. If no file for the current format is
> present, the options passed to asciidoc are empty.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v4: no changes
> v3: no changes
> v2: no changes
> 
>  docs/manual/manual.mk |  8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)
> 
> diff -r 9d9af165df7b -r 81d40b841073 docs/manual/manual.mk
> --- a/docs/manual/manual.mk	Sat Aug 09 18:18:58 2014 +0200
> +++ b/docs/manual/manual.mk	Sat Aug 09 12:20:16 2014 +0200
> @@ -56,6 +56,11 @@
>  
>  manual-check-dependencies-$(3):
>  
> +MANUAL_$(2)_ASCIIDOC_CONF = docs/$(1)/asciidoc-$(2).conf
> +ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
> +MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
> +endif
> +
>  $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>  			   $$($$(call UPPERCASE,$(1))_SOURCES) \
>  			   manual-check-dependencies \
> @@ -65,7 +70,8 @@
>  	$$(Q)mkdir -p $$(@D)/.build
>  	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
>  	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
> -	        -D $$(@D) $$(@D)/.build/$(1).txt
> +	        -D $$(@D) $$(@D)/.build/$(1).txt \
> +	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
>  	-$$(Q)rm -rf $$(@D)/.build
>  endef
>  

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
