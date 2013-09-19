From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Sep 2013 21:30:44 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
 dependencies first
In-Reply-To: <246bed054da59d6508dc.1379587635@argentina>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
Message-ID: <523B50E4.6020906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/09/13 12:47, Thomas De Schampheleire wrote:
> To generate the manual, you need asciidoc and w3m. If these are not present,
> pretty cryptic error messages are given.
> This patch adds a simple check for these dependencies, before attempting to
> build the manual.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>   docs/manual/manual.mk |  11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)
>
> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> --- a/docs/manual/manual.mk
> +++ b/docs/manual/manual.mk
> @@ -3,6 +3,16 @@ manual-update-lists:
>   	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
>   		$(TOPDIR)/support/scripts/gen-manual-lists.py
>
> +manual-check-dependencies:
> +	$(Q)if [ -z "`which a2x 2>/dev/null`" ]; then \
> +		echo "You need asciidoc on your host to generate the manual"; \
> +		false; \

  I don't think this works. I think you need "exit 1;".

  Regards,
  Arnout

> +	fi
> +	$(Q)if [ -z "`which w3m 2>/dev/null`" ]; then \
> +		echo "You need w3m on your host to generate the manual"; \
> +		false; \
> +	fi
> +
>   ################################################################################
>   # GENDOC -- generates the make targets needed to build a specific type of
>   #           asciidoc documentation.
> @@ -24,6 +34,7 @@ define GENDOC_INNER
>
>   $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
>   			   $$($(call UPPERCASE,$(1))_SOURCES) \
> +			   manual-check-dependencies \
>   			   manual-update-lists
>   	$(Q)$(call MESSAGE,"Generating $(5) $(1)...")
>   	$(Q)mkdir -p $$(@D)/.build
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
