From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Feb 2018 21:57:08 +0100
Subject: [Buildroot] [PATCH next 1/5] support/scripts/pkg-stats-new:
 rewrite in Python
In-Reply-To: <5a8a3afd87759_6e95162b0b48624@ultri3.mail>
References: <20180215220345.8532-2-thomas.petazzoni@bootlin.com>
 <5a8a3afd87759_6e95162b0b48624@ultri3.mail>
Message-ID: <20180219215708.75721513@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

First of all, thanks a lot for your review. Definitely very nice to
have someone look at this script in detail.

On Sun, 18 Feb 2018 23:48:29 -0300, Ricardo Martincoski wrote:

> > +++ b/support/scripts/pkg-stats-new
> > @@ -0,0 +1,424 @@
> > +#!/usr/bin/env python  
> 
> You removed your copyright. Well, that is your choice.

I just started with an empty script, and it remained this way, I'll add
one.

> [snip]
> > +import sys  
> 
> This is unused.
> Can you run flake8 and fix this and the other 32 warnings?

Will do.

> > +class Package:
> > +    def __init__(self, name):
> > +        self.name = name
> > +        self.path = None  
> path could be passed to constructor:
>     def __init__(self, name, path):
>         self.name = name
>         self.path = path

ACK.

> [snip]
> > +def get_pkglist():
> > +    WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
> > +    WALK_EXCLUDES = [ "boot/common.mk",
> > +                      "linux/linux-ext-.*.mk",  
> 
> Here is an improvement not mentioned in the commit log:
> linux/linux-ext-aufs.mk (and any new extension) is now ignored.

Indeed, will fix.

> > +def get_pkg_infra_info(pkgpath):
> > +    infras = list()
> > +    with open(pkgpath, 'r') as f:
> > +        lines = f.readlines()
> > +        for l in lines:
> > +            match = INFRA_RE.match(l)
> > +            if not match:
> > +                continue
> > +            infra = match.group(1)
> > +            if infra.startswith("host-"):
> > +                infras.append(("host", infra[5:]))
> > +            else:
> > +                infras.append(("target", infra))
> > +    return infras  
> Many methods like this one could become part of the class:
> class Package:
>     def get_pkg_infra_info(self):
>         infras = list()
>         with open(self.path, 'r') as f:
>             lines = f.readlines()
>             for l in lines:
>                 match = INFRA_RE.match(l)
>                 if not match:
>                     continue
>                 infra = match.group(1)
>                 if infra.startswith("host-"):
>                     infras.append(("host", infra[5:]))
>                 else:
>                     infras.append(("target", infra))
>         self.infras = infras
> 
> But that's a considerable effort with small gain.
> The script can always be refactored later.

I don't entirely agree: some of those functions don't apply to one
package object, they apply to the whole set of package objects.
Therefore, semantically, there are not methods of the Package() class,
as they don't manipulate just that object.

The main problem is with getting the license, license files and version
information. Indeed, this cannot be done as a method of a single
package, without slowing down the script significantly. Right now, we
are doing a single "make VARS=%_LICENSE printvars" invocation, and
parsing the output. This gives us the full list of licenses for all
packages, in just one make invocation. If we do this once per-package,
we pay the cost of running make + parsing time of all Buildroot
makefiles for the 2000+ packages, which isn't reasonable. One option
here would have to simply cache this value somewhere, and have the
method just use the cached value. Do you have a suggestion to handle
this in a beautiful way ?

> These 3 do not belong to this patch.

ACK.

> > +</style>
> > +<title>Statistics of Buildroot packages</title>
> > +</head>
> > +
> > +<a href=\"#results\">Results</a><br/>  
> 
> This link is broken.

I'll fix.

> [snip]
> > +html_footer = """
> > +</table>  
> 
> dump_html
>  - calls dump_html_stats that ends in f.write("</table>")
>  - then calls f.write(html_footer)
> so there will be an unneeded tag in the html.

Will fix.

> [snip]
> > +def dump_html_pkg(f, pkg):  
> 
> This method generates a line 700kB long in the html.
> I guess it was not your plan, based in the fact there are spaces to indent each
> tag passed to write().
> So you could append a newline to each write:

Yes, absolutely. I started by using print()s, but then changed to
writing to a file, and forgot to add the \n.

> > +    f.write("  <td>%s</td>" % pkg.path[2:])  
> [snip]
> > +def dump_html_all_pkgs(f, packages):  
> [snip]
> > +    for name, pkg in sorted(packages.iteritems()):  
> 
> This is sorting by the name of the .mk file, not the path, so just after the
> page is loaded, the order is:
> package/4th/4th.mk
> ...
> package/aespipe/aespipe.mk
> boot/afboot-stm32/afboot-stm32.mk
> 
> which is weird.

Right.

> The use of the name as key (duplicating the info already inside the Package
> object) also seems to serves only the purpose of sorting.
> By adding 2 methods to the class, sort by path becomes easy:
> 
> @@ class Package:
> +    def __eq__(self, other):
> +        return self.path == other.path
> +
> +    def __lt__(self, other):
> +        return self.path < other.path
> @@ def get_pkglist():
> -    packages = dict()
> +    packages = list()
> @@ def get_pkglist():
> -            packages[pkgname] = p
> +            packages.append(p)
> @@ def add_pkg_make_info(packages):
> -    for name, pkg in packages.iteritems():
> -        var = pkgname_to_pkgvar(name)
> +    for pkg in packages:
> +        var = pkgname_to_pkgvar(pkg.name)
> @@ many methods:
> -    for name, pkg in packages.iteritems():
> +    for pkg in packages:
> @@ def dump_html_all_pkgs(f, packages):
> -    for name, pkg in sorted(packages.iteritems()):
> +    for pkg in sorted(packages):

I'll have a look at the code you propose here. I understand __eq__ and
__lt__, but not (yet) the other changes.

> > +        dump_html_pkg(f, pkg)
> > +    f.write("</table>")
> > +
> > +def dump_html_stats(f, stats):
> > +    f.write("<table>")  
> 
> In this method the absence of newline for each write is less problematic. The
> line in the output html is 1.5kB long.
> Not a problem for the browser to render of course, but it seems good to have
> the newlines when debugging the script.

Sure.

> [snip]
> > +def dump_html(packages, stats, output):
> > +    with open(output, 'w') as f:
> > +        f.write(html_header)
> > +        dump_html_all_pkgs(f, packages)
> > +        dump_html_stats(f, stats)  
> 
> In the previous version of the script, after the stats table, the timestamp for
> the creation of the html and the sha1 are displayed.
> This seems useful to keep, to debug the server side because one can see quickly
> if the script is running in the expected schedule and in the correct sha1.
> For the timestamp, maybe this is enough: str(datetime.datetime.utcnow())

Totally correct, I'll re-add that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
