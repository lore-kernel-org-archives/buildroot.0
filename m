From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 9 May 2014 17:14:25 +0200
Subject: [Buildroot] [PATCH 3/7] graph-depends: handle the depth
 argument in a more pythonic way
In-Reply-To: <c7673129299755f4b0d5f309796cd4bdb55226c2.1399647182.git.yann.morin.1998@free.fr>
References: <cover.1399647182.git.yann.morin.1998@free.fr>
 <c7673129299755f4b0d5f309796cd4bdb55226c2.1399647182.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJSZsKT+jaE0VXoAzJvXmR8e6vEPR2tR988AqT7d5xXQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Fri, May 9, 2014 at 4:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Add some comment as well, enhance help text.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/graph-depends | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index 5bfbc64..dd8b549 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -33,13 +33,16 @@ FULL_MODE = 1
>  PKG_MODE  = 2
>
>  mode = 0
> +
> +# Limit drawing the dependency graph to this depth. 0 means 'no limit'.
>  max_depth = 0
>
>  parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
>  parser.add_argument("--package", '-p', metavar="PACKAGE",
>                      help="Graph the dependencies of PACKAGE")
> -parser.add_argument("--depth", '-d', metavar="DEPTH",
> -                    help="Limit the dependency graph to DEPTH levels")
> +parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth",
> +                    help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
> +parser.set_defaults(depth=0)

You can also do:

parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth",
    help="Limit the dependency graph to DEPTH levels; 0 means no limit.",
    type=int, default=0)

>  parser.add_argument("--transitive", dest="transitive", action='store_true')
>  parser.add_argument("--no-transitive", dest="transitive", action='store_false',
>                      help="Draw (do not draw) transitive dependencies")
> @@ -52,8 +55,7 @@ else:
>      mode = PKG_MODE
>      rootpkg = args.package
>
> -if args.depth is not None:
> -    max_depth = int(args.depth)
> +max_depth = int(args.depth)
>
>  transitive = args.transitive
>
> --
> 1.8.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Samuel
