From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 7 Apr 2017 12:31:50 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <20170402130338.12542-1-yann.morin.1998@free.fr>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
Message-ID: <60a71a19-b86a-e9cd-5e0d-ab51388a18de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-04-17 15:03, Yann E. MORIN wrote:
> When debugging hidden dependencies, the build order is very important.
> Most notably, it is interesting to identify potential culprits.
> 
> Add a new top-level rule, show-biuld-order, that dumps all the packages
                                 build
> in the order they would get built.
> 
> Note that there are a few differences with show-targets:
> 
>   - more packages are reported, becasue show-targets does not report
                                  because
>     host packages that have no prompt;
> 
>   - the output is line-based, because we're using $(info $(1)); getting
>     a single output line like show-targets would require we use an
>     actual command, like printf '%s ' $(1); but that takes a lot of
>     time, while $(info $(1)) is almost instantaneous (the time to parse
>     the Makefiles);
> 
>   - rootfs targets are not reported.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Makefile               | 2 ++
>  package/pkg-generic.mk | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 941bf78..919d589 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -757,6 +757,8 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
>  show-targets:
>  	@echo $(PACKAGES) $(TARGETS_ROOTFS)
>  
> +show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
> +
>  graph-build: $(O)/build/build-time.log
>  	@install -d $(GRAPHS_DIR)
>  	$(foreach o,name build duration,./support/scripts/graph-build-time \
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 31dbc54..3b26e6b 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -737,6 +737,9 @@ $(1)-show-depends:
>  $(1)-show-rdepends:
>  			@echo $$($(2)_RDEPENDENCIES)
>  
> +$(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
> +	$$(info $(1))
> +
>  $(1)-graph-depends: graph-depends-requirements
>  	$(call pkg-graph-depends,$(1),--direct)
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
