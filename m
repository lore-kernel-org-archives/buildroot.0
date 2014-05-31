From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 May 2014 21:50:39 +0200
Subject: [Buildroot] [PATCH] graph-depends: refactor with more color
In-Reply-To: <1401564012-23822-1-git-send-email-francois.perrad@gadz.org>
References: <1401564012-23822-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140531195039.GD3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-05-31 21:20 +0200, Francois Perrad spake thusly:
> target and host packages don't use the same background color

Interesting.

Since, I also have a series touching the graphs, I'll take your patch in
my series to do the appropriate transformations/adaptations.

Thanks!

Regards,
Yann E. MORIN.

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/graph-depends | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index e2a5e1e..443ac7d 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -222,15 +222,22 @@ for dep in dependencies:
>  
>  # Print the attributes of a node: label and fill-color
>  def print_attrs(pkg):
> +    name = pkg_node_name(pkg)
>      if pkg == 'all':
> -        print "all [label = \"ALL\"]"
> -        print "all [color=lightblue,style=filled]"
> -        return
> -    print "%s [label = \"%s\"]" % (pkg_node_name(pkg), pkg)
> -    if mode == PKG_MODE and pkg == rootpkg:
> -        print "%s [color=lightblue,style=filled]" % pkg_node_name(rootpkg)
> +        label = 'ALL'
> +    else:
> +        label = pkg
> +    if pkg == 'all' or (mode == PKG_MODE and pkg == rootpkg):
> +        color = 'lightblue'
>      else:
> -        print "%s [color=grey,style=filled]" % pkg_node_name(pkg)
> +        if pkg.startswith('host') \
> +        or pkg.startswith('toolchain') \
> +        or pkg.startswith('rootfs'):
> +            color = 'gainsboro'
> +        else:
> +            color = 'grey'
> +    print "%s [label = \"%s\"]" % (name, label)
> +    print "%s [color=%s,style=filled]" % (name, color)
>  
>  # Print the dependency graph of a package
>  def print_pkg_deps(depth, pkg):
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
