From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 20 Jun 2014 17:36:26 -0400 (EDT)
Subject: [Buildroot] [PATCH] graph-depends.py: support python3
In-Reply-To: <1403296447-24706-1-git-send-email-arnout@mind.be>
Message-ID: <1133175477.273342.1403300186442.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reviewed-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

But there's also support/scripts/graph-build-time and support/scripts/xorg-release.
There are some calls to the Python executable in docs/manual as well.

Vivien

----- Mail original -----
> De: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> ?: buildroot at buildroot.org
> Cc: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>, "Vivien Didelot" <vivien.didelot@savoirfairelinux.com>
> Envoy?: Vendredi 20 Juin 2014 16:34:07
> Objet: [PATCH] graph-depends.py: support python3
> 
> This patch is the result of 2to3.
> 
> In addition, universal_newlines=True is added to the Popen calls. In
> python3, this makes sure that the output is decoded so that we get a
> string instead of a buffer object.
> 
> Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/scripts/graph-depends | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/support/scripts/graph-depends
> b/support/scripts/graph-depends
> index 29f271a..58401a2 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -82,7 +82,7 @@ allpkgs = []
>  def get_targets():
>      sys.stderr.write("Getting targets\n")
>      cmd = ["make", "-s", "show-targets"]
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE,
> stderr=subprocess.PIPE)
> +    p = subprocess.Popen(cmd, stdout=subprocess.PIPE,
> stderr=subprocess.PIPE, universal_newlines=True)
>      output = p.communicate()[0].strip()
>      if p.returncode != 0:
>          return None
> @@ -98,7 +98,7 @@ def get_depends(pkgs):
>      cmd = ["make", "-s" ]
>      for pkg in pkgs:
>          cmd.append("%s-show-depends" % pkg)
> -    p = subprocess.Popen(cmd, stdout=subprocess.PIPE,
> stderr=subprocess.PIPE)
> +    p = subprocess.Popen(cmd, stdout=subprocess.PIPE,
> stderr=subprocess.PIPE, universal_newlines=True)
>      output = p.communicate()[0]
>      if p.returncode != 0:
>          sys.stderr.write("Error getting dependencies %s\n" % pkgs)
> @@ -203,7 +203,7 @@ elif mode == MODE_PKG:
>  # Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
>  dict_deps = {}
>  for dep in dependencies:
> -    if not dict_deps.has_key(dep[0]):
> +    if dep[0] not in dict_deps:
>          dict_deps[dep[0]] = []
>      dict_deps[dep[0]].append(dep[1])
>  
> @@ -211,7 +211,7 @@ for dep in dependencies:
>  # transitive) of pkg2, dependencies being listed in the deps
>  # dictionary. Returns False otherwise.
>  def is_dep(pkg,pkg2,deps):
> -    if deps.has_key(pkg2):
> +    if pkg2 in deps:
>          for p in deps[pkg2]:
>              if pkg == p:
>                  return True
> @@ -248,10 +248,10 @@ def remove_toolchain_deps(pkg,deps):
>  # This functions trims down the dependency list of all packages.
>  # It applies in sequence all the dependency-elimination methods.
>  def remove_extra_deps(deps):
> -    for pkg in deps.keys():
> +    for pkg in list(deps.keys()):
>          if not pkg == 'all':
>              deps[pkg] = remove_toolchain_deps(pkg,deps)
> -    for pkg in deps.keys():
> +    for pkg in list(deps.keys()):
>          if not transitive or pkg == 'all':
>              deps[pkg] = remove_transitive_deps(pkg,deps)
>      return deps
> @@ -274,8 +274,8 @@ def print_attrs(pkg):
>              color = host_colour
>          else:
>              color = target_colour
> -    print "%s [label = \"%s\"]" % (name, label)
> -    print "%s [color=%s,style=filled]" % (name, color)
> +    print("%s [label = \"%s\"]" % (name, label))
> +    print("%s [color=%s,style=filled]" % (name, color))
>  
>  # Print the dependency graph of a package
>  def print_pkg_deps(depth, pkg):
> @@ -283,17 +283,17 @@ def print_pkg_deps(depth, pkg):
>          return
>      done_deps.append(pkg)
>      print_attrs(pkg)
> -    if not dict_deps.has_key(pkg):
> +    if pkg not in dict_deps:
>          return
>      if max_depth == 0 or depth < max_depth:
>          for d in dict_deps[pkg]:
> -            print "%s -> %s" % (pkg_node_name(pkg),
> pkg_node_name(d))
> +            print("%s -> %s" % (pkg_node_name(pkg),
> pkg_node_name(d)))
>              print_pkg_deps(depth+1, d)
>  
>  # Start printing the graph data
> -print "digraph G {"
> +print("digraph G {")
>  
>  done_deps = []
>  print_pkg_deps(0, rootpkg)
>  
> -print "}"
> +print("}")
> --
> 2.0.0
> 
> 
