From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Feb 2017 22:13:09 +0100
Subject: [Buildroot] [PATCH 2/3] graph-depends: split off
 get_version/get_depends into pkgutil.py
In-Reply-To: <20170203205745.14488-4-patrickdepinguin@gmail.com>
References: <20170203205745.14488-1-patrickdepinguin@gmail.com>
 <20170203205745.14488-4-patrickdepinguin@gmail.com>
Message-ID: <20170205211308.GA3562@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2017-02-03 21:57 +0100, Thomas De Schampheleire spake thusly:
[--SNIP--]
> +import pkgutil

So, I always claimed I was not a Python expoert, but should we not do:

    from okgutil import get_versions get_depends

of something similar?

[--SNIP--]
> @@ -204,7 +157,7 @@ def get_all_depends(pkgs):
>      if len(filtered_pkgs) == 0:
>          return []
>  
> -    depends = get_depends(filtered_pkgs, rule)
> +    depends = pkgutil.get_depends(filtered_pkgs, rule)

And then just use get_depends here?

>      deps = set()
>      for pkg in filtered_pkgs:
> @@ -377,7 +330,7 @@ if check_only:
>      sys.exit(0)
>  
>  dict_deps = remove_extra_deps(dict_deps)
> -dict_version = get_version([pkg for pkg in allpkgs
> +dict_version = pkgutil.get_version([pkg for pkg in allpkgs

Ditto?

>                                  if pkg != "all" and not pkg.startswith("root")])
>  
>  # Print the attributes of a node: label and fill-color
> diff --git a/support/scripts/pkgutil.py b/support/scripts/pkgutil.py
> new file mode 100644
> index 0000000..a911123
> --- /dev/null
> +++ b/support/scripts/pkgutil.py
> @@ -0,0 +1,55 @@
> +#!/usr/bin/env python

As I understand it, this file is not supposed to be standalone, but just
a "library" of functions?

So it should not need to have the sha-bang line, yes?

Otherwise, I'm not opposed to this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
