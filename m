From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 23:40:19 +0100
Subject: [Buildroot] [PATCH v2 1/3] graph-depends: fix handling of
 "virtual" in exclude_list
In-Reply-To: <1453926735-29571-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453926735-29571-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160128224019.GF7523@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-27 21:32 +0100, Thomas Petazzoni spake thusly:
> The condition to determine if a virtual package should be excluded
> from the list due to "virtual" being passed in --exclude is under a
> loop iterating over each entry of the exclude_list, but it doesn't use
> the iterator of this list.
> 
> Indeed, the condition contains:
> 
> 	"virtual" in exclude_list
> 
> which checks automatically if "virtual" was passed in the list. Due to
> this, there is no need for this check to be within the "for p in
> exclude_list" iteration. This commit fixes that by moving the check
> outside of the loop.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/graph-depends | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index fd8ad2f..cfb4f82 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -359,15 +359,14 @@ def print_pkg_deps(depth, pkg):
>          return
>      if max_depth == 0 or depth < max_depth:
>          for d in dict_deps[pkg]:
> +            if dict_version.get(d) == "virtual" \
> +               and "virtual" in exclude_list:
> +                continue
>              add = True
>              for p in exclude_list:
>                  if fnmatch(d,p):
>                      add = False
>                      break
> -                if dict_version.get(d) == "virtual" \
> -                and "virtual" in exclude_list:
> -                    add = False
> -                    break
>              if add:
>                  print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
>                  print_pkg_deps(depth+1, d)
> -- 
> 2.6.4
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
