From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 00:00:56 +0100
Subject: [Buildroot] [PATCH 4/6 v2] support/graph-depends: add option to
 specify output file
In-Reply-To: <6b52c47dc2907744732cc2da7ee6f22c2b384836.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
 <6b52c47dc2907744732cc2da7ee6f22c2b384836.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <20160207000056.07f4e385@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 24 Jan 2016 17:02:39 +0100, Yann E. MORIN wrote:

> diff --git a/Makefile b/Makefile
> index 17c181b..20927de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -721,8 +721,10 @@ graph-depends: graph-depends-requirements
>  	@$(INSTALL) -d $(GRAPHS_DIR)
>  	@cd "$(CONFIG_DIR)"; \
>  	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
> -	|tee $(GRAPHS_DIR)/$(@).dot \
> -	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
> +		-o $(GRAPHS_DIR)/$(@).dot
> +	dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) \
> +		-o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT) \
> +		<$(GRAPHS_DIR)/$(@).dot

I don't think the < redirect to feed the .dot file to the dot program
is needed. You can simply pass the .dot file path as argument IIRC.

> +			$$(TOPDIR)/support/scripts/graph-depends $$(BR2_GRAPH_DEPS_OPTS) \
> +				-p $(1) -o $$(GRAPHS_DIR)/$$(@).dot
> +			dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) \
> +				-o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT) \
> +				<$$(GRAPHS_DIR)/$$(@).dot

Same comment.

>  parser = argparse.ArgumentParser(description="Graph packages dependencies")
> +parser.add_argument("--output", "-o", metavar="DOT_FILE", dest="dotfile",
> +                    help="File in which to generate the dot program")

Why do you call the dot file a "program" ? Is this really part of the
normal terminology for Graphviz/dot ?

>  parser.add_argument("--package", '-p', metavar="PACKAGE",
>                      help="Graph the dependencies of PACKAGE")
>  parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
> @@ -60,6 +62,11 @@ parser.add_argument("--no-transitive", dest="transitive", action='store_false',
>                      help="Draw (do not draw) transitive dependencies")
>  args = parser.parse_args()
>  
> +if args.dotfile is None:
> +    outfile = sys.stdout
> +else:
> +    outfile = open(args.dotfile, "wb")

This is really nitpicking, but why use args.dotfile and then outfile?
It would be better to use consistent naming here, i.e either
args.dotfile/dotfile or args.outfile/outfile, but not a mix.

Otherwise looks good, and is indeed a good idea. Note that pedantically
speaking, the graph-depends change could have been made separately from
the Makefile change, since your graph-depends change ensures that the
behavior doesn't change when the -o option is not passed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
