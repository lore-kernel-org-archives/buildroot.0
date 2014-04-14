From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 14 Apr 2014 21:20:28 +0200
Subject: [Buildroot] [PATCH 2/6] support/graph-depends: use argparse to
 parse argv[]
In-Reply-To: <6e53d567f4b2087188a43cb2602b4096972c8c20.1397421554.git.yann.morin.1998@free.fr>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
 <6e53d567f4b2087188a43cb2602b4096972c8c20.1397421554.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJzSH9vzEhCnQaTTLvirrY-xJVjd_7NpJUyU09DuF3Naw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Apr 13, 2014 at 10:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, we are using a crude, ad-hoc parsing of argv[].
> This is a limiting factor to adding new options.
>
> Use argparse instead, and introduce a single argument for now:
>   --package, -p PACKAGE

Is an option really needed for package? I mean it could be the
remaining argument(s); or maybe it does not fit in developments you
have in mind ;).

>
> In the (near) future, we'll be able to add more option arguments,
> such as depth-limiting for big graphs.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/pkg-generic.mk        |  2 +-
>  support/scripts/graph-depends | 23 +++++++++++++----------
>  2 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index b3a4c17..080ee56 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -495,7 +495,7 @@ $(1)-show-depends:
>  $(1)-graph-depends:
>                         @$(INSTALL) -d $(O)/graphs
>                         @cd "$(CONFIG_DIR)"; \
> -                       $(TOPDIR)/support/scripts/graph-depends $(1) \
> +                       $(TOPDIR)/support/scripts/graph-depends -p $(1) \
>                         |dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
>
>  $(1)-dirclean:         $$($(2)_TARGET_DIRCLEAN)
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index ac24086..fc3cadd 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -1,13 +1,13 @@
>  #!/usr/bin/python
>
>  # Usage (the graphviz package must be installed in your distribution)
> -#  ./support/scripts/graph-depends [package-name] > test.dot
> +#  ./support/scripts/graph-depends [-p package-name] > test.dot
>  #  dot -Tpdf test.dot -o test.pdf
>  #
>  # With no arguments, graph-depends will draw a complete graph of
> -# dependencies for the current configuration. With an argument,
> -# graph-depends will draw a graph of dependencies for the given
> -# package name.
> +# dependencies for the current configuration.
> +# If '-p <package-name>' is specified, graph-depends will draw a graph
> +# of dependencies for the given package name.
>  #
>  # Limitations
>  #
> @@ -21,6 +21,7 @@
>
>  import sys
>  import subprocess
> +import argparse
>
>  # In FULL_MODE, we draw the full dependency graph for all selected
>  # packages
> @@ -31,14 +32,16 @@ PKG_MODE  = 2
>
>  mode = 0
>
> -if len(sys.argv) == 1:
> +parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
> +parser.add_argument("--package", '-p', metavar="PACKAGE",

Any reason to mixed double and single quotes?

> +                    help="Graph the dependencies of PACKAGE")
> +args = parser.parse_args()
> +
> +if args.package == None:

In Python, None is a singleton, and it is recommended to use "is" or
"is not" for testing them [1].

>      mode = FULL_MODE
> -elif len(sys.argv) == 2:
> -    mode = PKG_MODE
> -    rootpkg  = sys.argv[1]
>  else:
> -    print "Usage: graph-depends [package-name]"
> -    sys.exit(1)
> +    mode = PKG_MODE
> +    rootpkg = args.package
>
>  allpkgs = []
>
> --
> 1.8.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

[1] http://legacy.python.org/dev/peps/pep-0008/#programming-recommendations

-- 
Samuel
