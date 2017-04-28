From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 28 Apr 2017 23:25:04 +0200
Subject: [Buildroot] [PATCH 1/1] Create 'make <pkt>-show-rrdepends'
 command
In-Reply-To: <1493305458-15309-1-git-send-email-george.redivo@datacom.ind.br>
References: <1493305458-15309-1-git-send-email-george.redivo@datacom.ind.br>
Message-ID: <47ecd969-0c92-0ddd-e647-50bbb7fe5c6e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi George,

On 27-04-17 17:04, George Redivo wrote:
> The created command shows, recursively, the reverse depends of a
> package,
> it means that the command shows not only the direct dependants (which is
> done by 'show-rdepends'), but also all indirect dependents.

 Could you explain a bit more what the use case is you are trying to solve?


> To do this it was necessary to create a new parameter '--flat-list', or
> '-f', to graph-depends.
> This parameter instructs the script to just print the name of package
> instead of the .dot syntax.

 See below for a better alternative.

> 
> Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
> ---
>  Makefile                      |  1 +
>  package/pkg-generic.mk        | 10 ++++++++++
>  support/scripts/graph-depends | 16 ++++++++++++----
>  3 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 919d589..61943d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -996,6 +996,7 @@ help:
>  	@echo '  <pkg>-build            - Build <pkg> up to the build step'
>  	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
>  	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
> +	@echo '  <pkg>-show-rrdepends   - List, recursivelly, packages which have <pkg> as a dependency'
>  	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
>  	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
>  	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 3b26e6b..c0f83b6 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -353,6 +353,13 @@ define pkg-graph-depends
>  		$$(GRAPHS_DIR)/$$(@).dot
>  endef
>  
> +define pkg-rrdepends
> +	@$$(INSTALL) -d $$(GRAPHS_DIR)
> +	@cd "$$(CONFIG_DIR)"; \
> +	$$(TOPDIR)/support/scripts/graph-depends $$(BR2_GRAPH_DEPS_OPTS) \
> +		-p $(1) --reverse -f
> +endef
> +
>  ################################################################################
>  # inner-generic-package -- generates the make targets needed to build a
>  # generic package
> @@ -737,6 +744,9 @@ $(1)-show-depends:
>  $(1)-show-rdepends:
>  			@echo $$($(2)_RDEPENDENCIES)
>  
> +$(1)-show-rrdepends:
> +	$(call pkg-rrdepends,$(1))

 It is better to use the approach like for show-build-order, i.e.:

$(1)-show-rrdepends: $$(patsubst %,%-rrdepends,$$($(2)_FINAL_ALL_DEPENDENCIES))
	@printf '%s' $$($(2)_RDEPENDENCIES)

 However, I would much prefer to rewrite graph-depends completely so it works in
a single pass, and have just pkg-show-depends that works recursively like above.
Then any filterling like depth or just a single package or reverting the arrows
can be done by the graph-depends script itself. That would work a whole lot
faster, and in addition would allow us to remove a lot of those annoying extra
rules inside inner-generic-package (cfr. my rant recently).

 But that is of course a much bigger change, so for the time being I'm OK with
adding this rrdepends.

 Regards,
 Arnout


> +
>  $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
>  	$$(info $(1))
>  
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index b258c56..f6fec09 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -69,6 +69,8 @@ parser.add_argument("--direct", dest="direct", action='store_true', default=True
>                      help="Draw direct dependencies (the default)")
>  parser.add_argument("--reverse", dest="direct", action='store_false',
>                      help="Draw reverse dependencies")
> +parser.add_argument("--flat-list", '-f', dest="flat_list", action='store_true', default=False,
> +                    help="Do not draw, just print a flat list output.")
>  args = parser.parse_args()
>  
>  check_only = args.check_only
> @@ -361,7 +363,10 @@ def print_pkg_deps(depth, pkg):
>      if pkg in done_deps:
>          return
>      done_deps.append(pkg)
> -    print_attrs(pkg)
> +    if args.flat_list:
> +        outfile.write("%s\n" % (pkg))
> +    else:
> +        print_attrs(pkg)
>      if pkg not in dict_deps:
>          return
>      for p in stop_list:
> @@ -385,13 +390,16 @@ def print_pkg_deps(depth, pkg):
>                      add = False
>                      break
>              if add:
> -                outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
> +                if not args.flat_list:
> +                    outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
>                  print_pkg_deps(depth+1, d)
>  
>  # Start printing the graph data
> -outfile.write("digraph G {\n")
> +if not args.flat_list:
> +    outfile.write("digraph G {\n")
>  
>  done_deps = []
>  print_pkg_deps(0, rootpkg)
>  
> -outfile.write("}\n")
> +if not args.flat_list:
> +    outfile.write("}\n")
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
