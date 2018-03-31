From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 23:27:37 +0200
Subject: [Buildroot] [PATCH v2 3/5] support/scripts/graph-depends: add
 --quiet option
In-Reply-To: <20180331163543.6278-4-thomas.petazzoni@bootlin.com>
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
 <20180331163543.6278-4-thomas.petazzoni@bootlin.com>
Message-ID: <20180331212737.GS25161@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-03-31 18:35 +0200, Thomas Petazzoni spake thusly:
> This will be useful for the upcoming recursive show-depends and
> show-rdepends features.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/brpkgutil.py  | 18 ++++++++++--------
>  support/scripts/graph-depends | 22 +++++++++++++---------
>  2 files changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/support/scripts/brpkgutil.py b/support/scripts/brpkgutil.py
> index 4c99ae9110..7c70ae7cab 100644
> --- a/support/scripts/brpkgutil.py
> +++ b/support/scripts/brpkgutil.py
> @@ -6,8 +6,9 @@ import subprocess
>  
>  # Execute the "make <pkg>-show-version" command to get the version of a given
>  # list of packages, and return the version formatted as a Python dictionary.
> -def get_version(pkgs):
> -    sys.stderr.write("Getting version for %s\n" % pkgs)
> +def get_version(pkgs, quiet=False):
> +    if not quiet:
> +        sys.stderr.write("Getting version for %s\n" % pkgs)

Having all those 'quiet' being propagated everywhere is ugly... ;-)

Instead, I would have done something like:

    def verbose_trace(.....):
        sys.stderr.write(....)

    def quite_trace(......):
        pass

and then in main:

    if needs_traces:
        trace = verbose_trace
    else
        trace = quite_trace

and then everywhere you need to trace, just call trace(...)

Regards,
Yann E. MORIN.

>      cmd = ["make", "-s", "--no-print-directory"]
>      for pkg in pkgs:
>          cmd.append("%s-show-version" % pkg)
> @@ -27,8 +28,9 @@ def get_version(pkgs):
>      return version
>  
>  
> -def _get_depends(pkgs, rule):
> -    sys.stderr.write("Getting dependencies for %s\n" % pkgs)
> +def _get_depends(pkgs, rule, quiet=False):
> +    if not quiet:
> +        sys.stderr.write("Getting dependencies for %s\n" % pkgs)
>      cmd = ["make", "-s", "--no-print-directory"]
>      for pkg in pkgs:
>          cmd.append("%s-%s" % (pkg, rule))
> @@ -55,12 +57,12 @@ def _get_depends(pkgs, rule):
>  # Execute the "make <pkg>-show-depends" command to get the list of
>  # dependencies of a given list of packages, and return the list of
>  # dependencies formatted as a Python dictionary.
> -def get_depends(pkgs):
> -    return _get_depends(pkgs, 'show-depends')
> +def get_depends(pkgs, quiet=False):
> +    return _get_depends(pkgs, 'show-depends', quiet)
>  
>  
>  # Execute the "make <pkg>-show-rdepends" command to get the list of
>  # reverse dependencies of a given list of packages, and return the
>  # list of dependencies formatted as a Python dictionary.
> -def get_rdepends(pkgs):
> -    return _get_depends(pkgs, 'show-rdepends')
> +def get_rdepends(pkgs, quiet=False):
> +    return _get_depends(pkgs, 'show-rdepends', quiet)
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index dc265ae28c..3a60e478d4 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -38,8 +38,9 @@ allpkgs = []
>  # Execute the "make show-targets" command to get the list of the main
>  # Buildroot PACKAGES and return it formatted as a Python list. This
>  # list is used as the starting point for full dependency graphs
> -def get_targets():
> -    sys.stderr.write("Getting targets\n")
> +def get_targets(quiet):
> +    if not quiet:
> +        sys.stderr.write("Getting targets\n")
>      cmd = ["make", "-s", "--no-print-directory", "show-targets"]
>      p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
>      output = p.communicate()[0].strip()
> @@ -55,7 +56,7 @@ def get_targets():
>  # 'dependencies', which contains tuples of the form (pkg1 ->
>  # pkg2_on_which_pkg1_depends, pkg3 -> pkg4_on_which_pkg3_depends) and
>  # the function finally returns this list.
> -def get_all_depends(pkgs, get_depends_func):
> +def get_all_depends(pkgs, get_depends_func, quiet):
>      dependencies = []
>  
>      # Filter the packages for which we already have the dependencies
> @@ -69,7 +70,7 @@ def get_all_depends(pkgs, get_depends_func):
>      if len(filtered_pkgs) == 0:
>          return []
>  
> -    depends = get_depends_func(filtered_pkgs)
> +    depends = get_depends_func(filtered_pkgs, quiet)
>  
>      deps = set()
>      for pkg in filtered_pkgs:
> @@ -85,7 +86,7 @@ def get_all_depends(pkgs, get_depends_func):
>              deps.add(dep)
>  
>      if len(deps) != 0:
> -        newdeps = get_all_depends(deps, get_depends_func)
> +        newdeps = get_all_depends(deps, get_depends_func, quiet)
>          if newdeps is not None:
>              dependencies += newdeps
>  
> @@ -311,6 +312,8 @@ def parse_args():
>                          help="Draw direct dependencies (the default)")
>      parser.add_argument("--reverse", dest="direct", action='store_false',
>                          help="Draw reverse dependencies")
> +    parser.add_argument("--quiet", '-q', dest="quiet", action='store_true',
> +                        help="Quiet")
>      return parser.parse_args()
>  
>  
> @@ -364,7 +367,7 @@ def main():
>      # In full mode, start with the result of get_targets() to get the main
>      # targets and then use get_all_depends() for all targets
>      if mode == MODE_FULL:
> -        targets = get_targets()
> +        targets = get_targets(args.quiet)
>          dependencies = []
>          allpkgs.append('all')
>          filtered_targets = []
> @@ -374,7 +377,7 @@ def main():
>                  continue
>              dependencies.append(('all', tg))
>              filtered_targets.append(tg)
> -        deps = get_all_depends(filtered_targets, get_depends_func)
> +        deps = get_all_depends(filtered_targets, get_depends_func, args.quiet)
>          if deps is not None:
>              dependencies += deps
>          rootpkg = 'all'
> @@ -382,7 +385,7 @@ def main():
>      # In pkg mode, start directly with get_all_depends() on the requested
>      # package
>      elif mode == MODE_PKG:
> -        dependencies = get_all_depends([rootpkg], get_depends_func)
> +        dependencies = get_all_depends([rootpkg], get_depends_func, args.quiet)
>  
>      # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
>      dict_deps = {}
> @@ -397,7 +400,8 @@ def main():
>  
>      dict_deps = remove_extra_deps(dict_deps, args.transitive)
>      dict_version = brpkgutil.get_version([pkg for pkg in allpkgs
> -                                          if pkg != "all" and not pkg.startswith("root")])
> +                                          if pkg != "all" and not pkg.startswith("root")],
> +                                         args.quiet)
>  
>      # Start printing the graph data
>      outfile.write("digraph G {\n")
> -- 
> 2.14.3
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
