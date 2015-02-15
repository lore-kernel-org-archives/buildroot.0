From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Feb 2015 17:08:11 +0100
Subject: [Buildroot] [PATCHv3 1/5] Makefile: remove the graphs/ dir on
 'make clean'
In-Reply-To: <1423171200-24583-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423171200-24583-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150215160811.GB4211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-05 22:19 +0100, Thomas Petazzoni spake thusly:
> Currently, a 'make clean' leaves the graphs/ subdirectory in the
> output directory. This commit defines a GRAPHS_DIR variable, used by
> the different graph-generating targets, and which gets cleaned up in
> the 'clean' target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9c870d9..6d4ae38 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -161,6 +161,7 @@ TARGET_DIR := $(BASE_DIR)/target
>  # initial definition so that 'make clean' works for most users, even without
>  # .config. HOST_DIR will be overwritten later when .config is included.
>  HOST_DIR := $(BASE_DIR)/host
> +GRAPHS_DIR := $(BASE_DIR)/graphs
>  
>  LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
>  REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
> @@ -658,7 +659,7 @@ show-targets:
>  	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
>  
>  graph-build: $(O)/build/build-time.log
> -	@install -d $(O)/graphs
> +	@install -d $(GRAPHS_DIR)
>  	$(foreach o,name build duration,./support/scripts/graph-build-time \
>  					--type=histogram --order=$(o) --input=$(<) \
>  					--output=$(O)/graphs/build.hist-$(o).$(BR_GRAPH_OUT) \

While at it, maybe you could take the ooportunity to change it here,
too?

> @@ -673,7 +674,7 @@ graph-depends-requirements:
>  		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
>  
>  graph-depends: graph-depends-requirements
> -	@$(INSTALL) -d $(O)/graphs
> +	@$(INSTALL) -d $(GRAPHS_DIR)
>  	@cd "$(CONFIG_DIR)"; \
>  	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
>  	|tee $(BASE_DIR)/graphs/$(@).dot \

And here?

Also, you're missing some occurences in package/pkg-generic.mk:

  580 $(1)-graph-depends: graph-depends-requirements
  581             @$$(INSTALL) -d $$(O)/graphs
  582             @cd "$$(CONFIG_DIR)"; \
  583             $$(TOPDIR)/support/scripts/graph-depends -p $(1) $$(BR2_GRAPH_DEPS_OPTS) \
  584             |tee $$(O)/graphs/$$(@).dot \
  585             |dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(O)/graphs/$$(@).$$(BR_GRAPH_OUT)

Otherwise, looks good.

Regards,
Yann E. MORIN.

> @@ -834,7 +835,7 @@ printvars:
>  clean:
>  	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>  		$(BUILD_DIR) $(BASE_DIR)/staging \
> -		$(LEGAL_INFO_DIR)
> +		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
>  
>  distclean: clean
>  ifeq ($(DL_DIR),$(TOPDIR)/dl)
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
