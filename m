From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:53:58 +0200
Subject: [Buildroot] [PATCH 6/9] support/graph-size: add option to
 change percentage to group in Others
In-Reply-To: <109be7cab508c2cc454c5294a86c5ac0cbb5d84b.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
 <109be7cab508c2cc454c5294a86c5ac0cbb5d84b.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <11c8f3c9-38f5-5d67-045e-6530d127dd69@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 19:18, Yann E. MORIN wrote:
> Currently, we group packages that contribute less then 1%, into the
> "Other" category.
> 
> However, in some cases, there can be a lot of very comparatively small
> packages, and they may not exceed this limit, and so only the "Others"
> category would be displayed, which is not nice.
> 
> Conversely, if there are a lot of packages, most of which only so
> slightly exceeding this limit, then we get all of them in the graph,
> which is not nice either.
> 
> Add a way for the developers to pass a different cut-off limit. As for
> the dependency graph which has BR2_GRAPH_DEPS_OPTS, add the environment
> variable BR2_GRAPH_SIZE_OPTS to carry those extra option (in preparation
> for more to come, later).
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
[snip]
> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
> index eb09e0dc60..3454acd681 100755
> --- a/support/scripts/size-stats
> +++ b/support/scripts/size-stats
> @@ -33,8 +33,11 @@ except ImportError:
>      sys.stderr.write("You need python-matplotlib to generate the size graph\n")
>      exit(1)
>  
> -colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
> -          '#0068b5', '#f28e00', '#940084', '#97c000']
> +
> +class Config():

 If there's no base class, don't add the ().

> +    size_limit = 0.01
> +    colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
> +              '#0068b5', '#f28e00', '#940084', '#97c000']
>  
>  
>  #
> @@ -145,7 +148,7 @@ def draw_graph(pkgsize, outputf):
>      other_value = 0
>      unknown_value = 0
>      for (p, sz) in sorted(pkgsize.items(), key=lambda x: x[1]):
> -        if sz < (total * 0.01):
> +        if sz < (total * Config.size_limit):
>              other_value += sz
>          elif p == "unknown":
>              unknown_value = sz
> @@ -162,7 +165,7 @@ def draw_graph(pkgsize, outputf):
>      plt.figure()
>      patches, texts, autotexts = plt.pie(values, labels=labels,
>                                          autopct='%1.1f%%', shadow=True,
> -                                        colors=colors)
> +                                        colors=Config.colors)
>      # Reduce text size
>      proptease = fm.FontProperties()
>      proptease.set_size('xx-small')
> @@ -246,8 +249,16 @@ def main():
>                          help="CSV output file with file size statistics")
>      parser.add_argument("--package-size-csv", '-p', metavar="PKG_SIZE_CSV",
>                          help="CSV output file with package size statistics")
> +    parser.add_argument("--size-limit", "-l", type=float,
> +                        help='Under this size ratio, files are accounted to ' +
> +                             'the generic "Other" package. Default: 0.01 (1%%)')
>      args = parser.parse_args()
>  
> +    if args.size_limit is not None:
> +        if args.size_limit < 0.0 or args.size_limit > 1.0:
> +            raise ValueError("--size-limit must be in [0.0..1.0]")

 ValueError is appropriate if you define an argument handler function. If you do
the checks afterwards, you should use parser.error instead.

 Fixed both and applied to next, thanks

 Regards,
 Arnout

> +        Config.size_limit = args.size_limit
> +
>      # Find out which package installed what files
>      pkgdict = build_package_dict(args.builddir)
>  
> 
